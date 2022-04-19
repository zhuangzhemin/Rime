# 流星追月的[Rime输入法](https://rime.im)配置

## 小鹤音形配置
### 特点
  - 采用[小鹤音形](https://www.flypy.com)方案，码表来自[酥梨小鹤](https://github.com/zodensu/FlyPY-zodensu)和[开源小鹤](https://github.com/amorphobia/openfly)，单字字频来自[Google拼音]()(我把字频做了一些运算，最大值改到100)
  - 以小鹤双拼为主，输入过程中可添加小鹤形码过滤候选字/词(Tab移动光标到第2个编码位置，输入第1个汉字形码，向右键/Ctrl+L将光标移到后一个汉字形码位置，向左键/Ctrl+H将光标移到前一个汉字形码位置)。思路来自[知乎@zecy和@SleepyBag的回答](https://www.zhihu.com/question/27121962?from=profile_question_card)
    > ![1](https://user-images.githubusercontent.com/20674069/163939739-cd24af9a-aff1-456d-b58d-85bcb076c442.gif)
  - 添加形码可以直接输入，不需要引导键
  - 音形输入兼容AB(纯音码)、ABC(音码+形码首码)、ABCD(音码+形码全码)几种模式
  - "\`"作为万能键使用，用ABC\`、AB\`D、AB\`\`、\`\`CD等格式输入
    > ![2](https://user-images.githubusercontent.com/20674069/163940553-814d5c13-430c-41b0-acc4-5ca9fc573c14.gif)
  - 短语可以添加首字和尾字的形码首码过滤候选词(词库文件中未注音的词语按此规则编码，思路来自[鹭输入法](https://github.com/ledao/lufly-im))
    > ![3](https://user-images.githubusercontent.com/20674069/163940864-6db15a0b-8637-4a16-bab3-de5188131e45.gif)
  - 兼容全拼拼音词库(按小鹤双拼规则转换，没有添加形码)
  - 兼容全拼拼音输入(可以用"uurufa"或者"shurufa"得到"输入法")
  - 添加[现代汉语常用词表](https://github.com/alswl/Rime/blob/master/luna_pinyin.xiandaihanyuchangyongcibiao.dict.yaml)、[清华大学开放中文词库](http://thuocl.thunlp.org)、[维基中文词条](https://dumps.wikimedia.org/zhwiki/latest)等词库
  - 添加[ECDict词库](https://github.com/skywind3000/ECDICT)，通过反查方式在输入英文单词/词组时显示对应的中文释义提示（方法来自[oniondelta的github issue答复](https://github.com/rime/librime/issues/538)）
  - 通过lua脚本支持中英文混合输入以及纯英文输入(lua插件参考自[shewer](https://github.com/shewer/librime-lua-script))
    > ![4](https://user-images.githubusercontent.com/20674069/163941324-63481de4-4d5f-4917-8699-77f6e8409eee.gif)
  - 支持用户自定义短语，区分自动补全(个人常用短语，custom_phrase_completion.txt)和不自动补全(邮箱、手机、地址等隐私信息，custom_phrase_no_completion.txt)两个文件
  - 包含Android平台trime[同文输入法](https://github.com/osfans/trime)的个人36键主题文件，在手机上配合termux、VIM使用，输入各种符号基本不需要切换面板
    ![trime](https://user-images.githubusercontent.com/20674069/163942371-ccfe81de-22eb-430a-8200-81eef7522a7e.png)

### 安装
  1. 从[小狼毫Github Releases](https://github.com/rime/weasel/releases)下载安装小狼毫
  2. 从[librime Github Releases](https://github.com/rime/librime/releases)下载编译好的带插件的新版本librime补丁
  3. 如果正在使用小狼毫的话，先“退出算法服务”，以便更新补丁
  4. 把补丁包解压出来的rime\dist\bin\rime_patch.exe文件复制到weasel-0.14.3安装目录，双击执行
  5. 把补丁包解压出来的rime\dist\lib\rime.lib和rime\dist\lib\rime.dll复制到weasel-0.14.3安装目录
  6. 下载我的配置到Rime用户目录
  7. 自定义custom_phrase_completion.txt和custom_phrase_no_completion.txt文件（可选）
  8. 输入法设定选择“流星追月”方案，重新部署

