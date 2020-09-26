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

# 发表

[`Mask`工具使用示例](https://huzhenghui.blog.csdn.net/article/details/108812328)

# 任务

## mask-choose

> 使用交互选择工具 `choose-gui` 选择本文档中可以执行的命令

```bash
choose_recipe=$(mask mask-SubCommands-visible | /usr/local/opt/choose-gui/bin/choose)
echo "Choose Recipe: ${choose_recipe}"
task=$(echo "${choose_recipe}" | mask mask-SubCommand-names-extractor)
echo "Task : ${task}"
mask "${task}"
```

## mask-SubCommands

> 提取本文档中的子命令

```bash
mask --help | mask mask-SubCommands-extractor
```

## mask-SubCommands-visible

> 提取本文档中交互选择可见的子命令，描述的开头使用 `(hidden)` 标记交互选择中不可见的子命令，在 `mask-SubCommand-visible-filter` 中过滤

```bash
mask mask-SubCommands | mask mask-SubCommand-visible-filter
```

## mask-SubCommand-names

> 本文档中的子命令的名称列表

```bash
mask mask-SubCommands | mask mask-SubCommand-names-extractor
```

## mask-SubCommand-visible-names

> 本文档中交互选择可见的子命令的名称列表

```bash
mask mask-SubCommands-visible | mask mask-SubCommand-names-extractor
```

## mask-SubCommands-extractor

> (hidden) 从 `mask` 的帮助中提取子命令的 `awk` 脚本，在交互选择列表中不可见

```awk
{
    if ("SubCommands" == section)
    {
        sub(/^[ ]+/, "");
        print;
    }
}
{
    if ("SUBCOMMANDS:" == $0)
        section = "SubCommands"
}
```

## mask-SubCommand-visible-filter

> (hidden) 过滤描述的开头使用 `(hidden)` 标记交互选择中不可见的子命令的 `awk` 脚本，在交互选择列表中不可见

```awk
{
    if ("(hidden)" != $2)
        print;
}
```

## mask-SubCommand-names-extractor

> (hidden) 提取子命令名称的 `awk` 脚本

```awk
{
    print $1;
}
```

## mask-draft-dir

> 个人本地使用的脚本，读者请忽略

```bash
jump cd mask-draft
```

## code

> 个人本地使用的脚本，读者请忽略

```bash
    root_dir=`pwd`
    code_workspace="${root_dir}/mask.code-workspace"
    if [ -f "${code_workspace}" ]; then
        code "${code_workspace}";
    else
        code "${root_dir}";
    fi
```
