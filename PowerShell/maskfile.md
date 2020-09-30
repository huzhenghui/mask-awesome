# 安装：核心工具

主要使用工具
[mask](https://github.com/jakedeichert/mask/)

在 `Windows` 中使用 `Rust` 的 `Cargo` 命令安装

```PowerShell
cargo install mask
```

# 安装：实现默认任务效果所需工具

[mask](https://github.com/jakedeichert/mask/)
[0.9.0](https://github.com/jakedeichert/mask/releases/tag/v0.9.0)
不支持默认任务，所以暂时使用
[Just](https://github.com/casey/just)
。

在 `Windows` 中使用 `scoop` 安装

```PowerShell
scoop install just
```

相关代码为

```yaml
set shell := ['pwsh', '-c']

_default:
    mask mask-fzf
```

运行方式为

```PowerShell
just
```

# 安装：交互选择工具

示例代码中使用了交互选择工具 `fzf`，在 `Windows` 中的安装方式为

```PowerShell
scoop install fzf
```

# 代码位置

[本页面]

[实现默认任务效果代码]

# 发表

[`Mask`工具在`Windows`中使用示例]

[`Mask`工具在`Mac`中使用示例](https://huzhenghui.blog.csdn.net/article/details/108812328)

# 任务

## mask-fzf

> 使用交互选择工具 `fzf` 选择本文档中可以执行的命令

```PowerShell
$OutputEncoding = [System.Text.Encoding]::UTF8
[char[]][int[]]$TrimChars = @(32,65279)
$SubCommandRegExp = "[^" + ($TrimChars -Join "") + "]+"
mask --help |
    mask mask-SubCommands-section-extractor |
    mask mask-SubCommands-section-Json-Parser |
    ConvertFrom-Json | Set-Variable -Name SubCommandsJson
Write-Output $SubCommandsJson |
    Where-Object { $_.Visible -eq $true } |
    ForEach-Object {
        (-Join ($_.NamePart, $_.Description)).Trim($TrimChars -Join "")
    } |
    fzf |
    Set-Variable -Name Recipe
Write-Host "Choose Recipe :" $Recipe
$Recipe |
    Select-String -Pattern $SubCommandRegExp |
    Where-Object {$_.Matches.Length -eq 1} |
    ForEach-Object { $_.Matches[0].Value } |
    Foreach-Object {
        Write-Host "Task :" $_
        mask $_
    }
```

## mask-SubCommands-section-Json

> 以 `JSON` 格式输出 `mask` 的帮助中的 `SubCommands` 子命令部分

```PowerShell
$OutputEncoding = [System.Text.Encoding]::UTF8
mask --help |
    mask mask-SubCommands-section-extractor |
    mask mask-SubCommands-section-Json-Parser
```

## mask-SubCommands-section-Json-Parser

> (hidden) 将 `mask` 的帮助中的 `SubCommands` 子命令部分解析成 `JSON` 格式的 `PowerShell` 脚本，在交互选择列表中不可见

```PowerShell
[char[]][int[]]$TrimChars = @(32,65279)
@($input) | Set-Variable -Name inputArray
$HelpCommandRegExp = " +help +"
$inputArray | ForEach-Object {
    Write-Output $_ |
        Where-Object { $_ -Match $HelpCommandRegExp } |
        Select-String -Pattern $HelpCommandRegExp |
        Where-Object {$_.Matches.Length -eq 1} |
        Foreach-Object { $_.Matches[0].Value.Length } |
        Set-Variable -Name SubCommandNameLength
}
Set-Variable -Name CurrentCommand
$inputArray |
    ForEach-Object {
        $Line = $_
        $NamePart = $Line.Substring(0, $SubCommandNameLength)
        $NamePart.Trim($TrimChars -Join "") |
            Where-Object { $_.Length -gt 0 } |
            ForEach-Object {
                @{
                    Name = $_ 
                    Visible = $true
                    Description = ""
                    NamePart = $NamePart
                }
            } |
            ForEach-Object {
                New-Object -TypeName psobject -Property $_ |
                    Set-Variable -Name CurrentCommand -PassThru |
                    Select-Object -ExpandProperty Value |
                    Write-Output 
            }
        if ( $Line.Length -gt $SubCommandNameLength ) {
            $CurrentCommand.Description += $Line.Substring($SubCommandNameLength)
        }
    } |
    Set-Variable -Name SubCommandObjects
Write-Output $SubCommandObjects |
    ForEach-Object {
        if ( $_.Description -Match "^\(hidden\) " ) {
            $_.Visible = $false
        }
        Write-Output $_
    } |
    ConvertTo-Json
```

## mask-SubCommands-section-extractor

> (hidden) 从 `mask` 的帮助中提取 `SUBCOMMANDS:` 子命令部分的 `PowerShell` 脚本，在交互选择列表中不可见

```PowerShell
foreach($l in $input)
{
    if ("SUBCOMMANDS:" -eq $section)
    {
        Write-Output $l

    }
    if ("SUBCOMMANDS:" -eq $l)
    {
        $section = "SUBCOMMANDS:"
    }
}
```

## mask-draft-dir

> 个人本地使用的脚本，读者请忽略

```PowerShell
jump cd mask-draft
```

## code

> 个人本地使用的脚本，读者请忽略

```PowerShell
$(Set-Location "$(git rev-parse --show-toplevel)"; Get-Location) |
    Set-Variable -Name RootDir
$CodeWorkspace = -Join ($RootDir, "\mask.code-workspace")
if (Test-Path $CodeWorkspace) {
    code $CodeWorkspace
} else {
    code $RootDir
}
```