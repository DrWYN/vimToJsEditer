参考
1.[将你的Vim 打造成轻巧强大的IDE](http://yuez.me/jiang-ni-de-vim-da-zao-cheng-qing-qiao-qiang-da-de-ide/)
2.[从零搭建和配置OSX开发环境](http://yuez.me/cong-ling-da-jian-he-pei-zhi-osxkai-fa-huan-jing/)
3.[Using Vim as a JavaScript IDE](http://www.dotnetsurfers.com/blog/2016/02/08/using-vim-as-a-javascript-ide)
4.[ vim 树形目录插件NERDTree安装及简单用法](http://blog.csdn.net/love__coder/article/details/6659103)
5.[vim配置及实现](http://blog.csdn.net/neighbor1000/article/details/8707450)
6.[Tern＋YouCompleteMe实现vim中JS自动补全](http://www.jianshu.com/p/4a8b0e3503fa)
7.[vim中的杀手级插件: vundle](http://zuyunfei.com/2013/04/12/killer-plugin-of-vim-vundle/)
8.[强大的vim配置](http://www.cnblogs.com/ma6174/archive/2011/12/10/2283393.html)
9.[Vim配置、插件和使用技巧](http://www.jianshu.com/p/a0b452f8f720)
10[vim——打开多个文件、同时显示多个文件、在文件之间切换 & vimdiff](http://fghjk.blog.51cto.com/4359709/804336)
11[所需即所获：像 IDE 一样使用 vim](https://github.com/yangyangwithgnu/use_vim_as_ide)

vim 的经常使用命令
# 效率
.        # 反复近期的文本操作

# 文件
:q       # 退出 q->quit
:w       # 保存 w->write
:q!      # 强制退出不保存
:wq      # 保存后退出   
ZZ       # 保存后退出，同 :wq   

# 光标移动
hjkl     # 最主要的左下上右。移动一个字符
zz       # 光标做在行移动到屏幕中间
w        # 向前移动一个单词。光标停在单词首部
b        # 向后移动一个单词, 光标停在单词首部
e        # 同 w, 光标停在单词尾部
ge       # 同 b, 光标停在单词尾部
0        # 本行第一个字符 (同 <HOME> 键)
^        # 本行第一个非空白字符
$        # 移动到行尾 (同 <END> 键)
gg       # 移动到文件头
G        # 移动到文件尾
:n       # 跳转到第 n 行
fx       # 移动到光标后第一个为 x 的字符 find  
Fx       # 同 f，反向移     
Ctrl+d   # 向下滚动半屏
Ctrl+u   # 向上滚动半屏
Ctrl+f   # 向下滚动半屏
Ctrl+b   # 向上滚动半屏
%        # 跳转到配对的括号 (经常使用)
(        # 移动到当前句子開始
)        # 移动到下一句子開始
H        # 移动页面顶部  H->High
M        # 移动页面中部  M->Middle
L        # 移动页面底部  L->Low

# 查找
/test           # 查找 text ，(记得用正則表達式), 然后 n 向下。 N 向上 n->next
?test           # 查找 text 。反向
*               # 向下查找和光标所在单词一样的词
#               # 向上查找和光标所在单词一样的词
:nohlsearch     # 关闭当前高亮显示的结果 （输入 :noh 按下 <Tab> 键 就可以自己主动补全）

# 替换
ra              # 当前字符替换为 a , r->replace
:%s/old/new/g   # 替换全文的全部的匹配  g->global
:%s/old/new/    # 替换全部行第一个匹配
:s/old/new/g    # 替换当前行全部匹配
:s/old/new/     # 替换当前行第一个匹配

# 插入
a        # 在当前位置后插入 a->append
A        # 在当前行尾插入 
i        # 在当前位置插入   i->insert
I        # 在当前行首插入
o        # 在当前行之后插之中的一个行
O        # 在当前行之前插入一行
s        # 删除光标所在字符，并进入插入模式
S        # 删除光标所在的行，并进入插入模式

# 选中
v        # 从光标当前位置開始，光标所经过的地方会被选中，再按一下 v 结束  (相似 <shift>+方向建) v->view 可视模式
V        # 从光标当前行開始，光标经过的行都会被选中，再按一下 Ｖ 结束 

# 删除
d        # 删除选中 (删除内容到了缓冲区能够被粘贴，相当于剪切) d->delete
x        # 删除当前字符
3x       # 删除当前光标向后三个字符 (vim 经经常使用 <数字>+<命令> 组合)
dd       # 删除当前行
dw       # 删除光标所在字符至下个单词开头 dw -> delete word
d$       # 删除当前字符到行尾   %->正则中就是行尾
3d       # 删除当前行開始三行
J        # 合并两行 (即删除当行尾换行符) J->join

# 撤销
u        # 撤销  u->undo
U        # 撤销对正行的操作
Ctrl+r   # 恢复撤销

# 复制粘贴
y        # 复制选中
yy       # 复制当前行
p        # 在当前光标后粘贴。假设复制了一行则粘贴到下一行 p-paste
P        # 在当前光标前粘贴
ddp      # 交换当前行和下一行 (巧妙运用了剪切粘贴)
xp       # 交换当前字符和下一个
