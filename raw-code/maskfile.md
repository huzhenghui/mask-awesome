# 安装：核心工具 `Mask`

主要使用工具
[mask](https://github.com/jakedeichert/mask/)

在 `Mac` 中的安装方式为

```bash
brew install mask
```

核心工具 `Mask` 相关文档

- [`Mask`工具使用示例](https://github.com/huzhenghui/mask-awesome/blob/master/maskfile.md)

  - [`Mask`工具使用示例](https://huzhenghui.blog.csdn.net/article/details/108812328)

# 代码位置

[本页面]
[`fake` 模拟的代码]
[通用的 `shims` 的代码]

# 发表

[借助`shims`方式获取`mask`中的源代码]

# 任务

## echo-path

> 显示 `PATH` 环境变量

```bash
echo "${PATH}"
```

## which-bash

> 显示 `bash` 路径

```bash
which bash
```

## bash-version

> 显示 `bash` 版本

```bash
bash --version
```

## bin-bash

> 使用 `/bin` 路径中的 `bash`

```bash
export PATH="/bin:${PATH}"
mask echo-path
mask which-bash
mask bash-version
```

### 运行后输出

```
/bin:......
/bin/bash
GNU bash, version 3.2.57(1)-release (x86_64-apple-darwin19)
Copyright (C) 2007 Free Software Foundation, Inc.
```

## usr-bash

> 使用 `/usr/local/bin` 路径中的 `bash`

```bash
export PATH="/usr/local/bin:${PATH}"
mask echo-path
mask which-bash
mask bash-version
```

### 运行后输出

```
/usr/local/bin:......
/usr/local/bin/bash
GNU bash，版本 5.0.18(1)-release (x86_64-apple-darwin19.5.0)
Copyright (C) 2019 Free Software Foundation, Inc.
许可证 GPLv3+: GNU GPL 许可证第三版或者更新版本 <http://gnu.org/licenses/gpl.html>

本软件是自由软件，您可以自由地更改和重新发布。
在法律许可的情况下特此明示，本软件不提供任何担保。
```

## fake-bash

> 使用模拟的 `bash` 回显代码

```bash
fake="$(cd fake; pwd)"
echo "${fake}"
export PATH="${fake}:${PATH}"
mask echo-path
mask which-bash
mask bash-version
```

### 模拟的 `bash` 的代码

```bash
echo '$# = '${#}
for i in "$@"
do
    echo $i
done
```

### 运行后输出

```
./fake
$# = 2
-c
echo "${PATH}"
$# = 2
-c
which bash
$# = 2
-c
bash --version
```

## raw-code

> 使用通用的 `shims` 回显代码

```bash
raw_shims="$(cd raw-shims; pwd)"
echo "${raw_shims}"
export PATH="${raw_shims}:${PATH}"
mask echo-path
mask which-bash
mask bash-version
mask raw-code
```

### 通用的 `shims` 的代码

```bash
if [ "${#}" -ne 2 ];
then
    exit 1;
fi
if [ "${1}" != "-c" ];
then
    exit 2;
fi
echo "${2}"
```

### 运行后输出

```
/Users/huzhenghui/OneDrive/mask-draft/raw-code/raw-shims
echo "${PATH}"

which bash

bash --version

raw_shims="$(cd raw-shims; pwd)"
echo "${raw_shims}"
export PATH="${raw_shims}:${PATH}"
mask echo-path
mask which-bash
mask bash-version
mask raw-code
```

