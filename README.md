# README

## Requirement

```sh
# ubuntu
sudo apt install -y fontconfig xfonts-utils
```


## 安装

## Prepare Requirement

* tags
  * `GNU tags` 
  * `ctags`
* c/cpp
  * `cppcheck`

### 使用 curl

```sh
curl -sLf https://raw.githubusercontent.com/shangzongyu/vimrc/master/install.sh | bash
```

### 使用 git

```sh
git clone https://github.com/shangzongyu/vimrc.git ~/.ShangVim
cd ~/.ShangVim
bash install.sh
```

### 配置

然后在 `~/.vimrc` 文件添加如下：

 ```sh
source ~/.ShangVim/init.vim
```

## 结构

本配置按顺序，由如下几个主要模块组成：

* `init.vim`: 配置入口，设置 runtimepath 检测脚本路径，加载其他脚本
* `init-basic.vim` : 所有人都能同意的基础配置，去除任何按键和样式定义，保证能用于 `tiny` 模式（没有 `+eval`）
* `init-config.vim` : 支持 `+eval` 的非 tiny 配置，初始化 ALT 键支持，功能键键盘码，备份，终端兼容等
* `init-tabsize.vim` : 制表符宽度，是否展开空格等，因为个人差异太大，单独一个文件好更改
* `init-plugin.vim` : 插件，使用 `vim-plug`，按照设定的插件分组进行配置
* `init-style.vim` : 色彩主题，高亮优化，状态栏，更紧凑的标签栏文字等和显示相关的东西
* `init-keymaps.vim` : 快捷键定义
