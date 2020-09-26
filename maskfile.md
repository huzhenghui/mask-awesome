# 安装：核心工具

主要使用工具
[mask](https://github.com/jakedeichert/mask/)

在 `Mac` 中的安装方式为

```bash
brew install mask
```

# 安装：实现默认任务效果所需工具

[mask](https://github.com/jakedeichert/mask/)
[0.9.0](https://github.com/jakedeichert/mask/releases/tag/v0.9.0)
不支持默认任务，所以暂时使用
[Just](https://github.com/casey/just)
。

在 `Mac` 中的安装方式为

```bash
brew install just
```

相关代码为

```yaml
_default:
    mask mask-choose
```

运行方式为

```bash
just
```

# 安装：交互选择工具

示例代码中使用了交互选择工具 `choose-gui`，在 `Mac` 中的安装方式为

```bash
brew install choose-gui
```

# 安装：文本处理工具

示例代码中使用 `awk` 处理文本，在 `Mac` 中的安装方式为

```bash
brew install gawk
```

# 代码位置

[本页面](https://github.com/huzhenghui/mask-awesome/blob/master/maskfile.md)

[实现默认任务效果代码](https://github.com/huzhenghui/mask-awesome/blob/master/Justfile)

# 任务

## mask-choose

```bash
choose_recipe=$(mask mask-SubCommand-visible-names | /usr/local/opt/choose-gui/bin/choose)
echo "Choose Recipe: ${choose_recipe}"
mask "${choose_recipe}"
```

## mask-SubCommands

```bash
mask --help | mask mask-SubCommands-extractor
```

## mask-SubCommand-names

```bash
mask mask-SubCommands | mask mask-SubCommand-names-extractor
```

## mask-SubCommand-visible-names

```bash
mask mask-SubCommands | mask mask-SubCommand-visible-filter | mask mask-SubCommand-names-extractor
```

## mask-SubCommands-extractor

> (hidden)

```awk
{
    if ("SubCommands" == section)
        print;
}
{
    if ("SUBCOMMANDS:" == $0)
        section = "SubCommands"
}
```

## mask-SubCommand-visible-filter

> (hidden)

```awk
{
    if ("(hidden)" != $2)
        print;
}
```

## mask-SubCommand-names-extractor

> (hidden)

```awk
{
    print $1;
}
```

## mask-draft-dir

```bash
jump cd mask-draft
```

## code

```bash
    root_dir=`pwd`
    code_workspace="${root_dir}/mask.code-workspace"
    if [ -f "${code_workspace}" ]; then
        code "${code_workspace}";
    else
        code "${root_dir}";
    fi
```
