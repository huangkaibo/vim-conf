# vim-conf
个人vim配置



# 使用方法

1. 将.vimrc拷贝到`/root`下或者`~`下
2. 安装vim-plug: `curl -fLo ~/.vim/autoload/plug.vim --create-dirs https:*//raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`

3. 打开vim
4. 输入`:PlugInstall`, 会看到插件安装界面, 自动安装, 安装完成后会显示`- Finishing ... Done!`
5. `:q`退出vim
6. 再次打开vim可以看到基本界面已完成, 只有下方状态栏字体混乱
7. 安装字体库

```bash
# clone
git clone https://github.com/powerline/fonts.git --depth=1
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts
```

8. 一般就好了(有2/3个小地方还是乱码, 不好搞), 如果还不行, 那就是系统locale不对