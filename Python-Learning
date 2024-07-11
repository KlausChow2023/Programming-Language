import my_utils.str_util

print("Hello World 世界你好!!")    #print 可以打印多个变量到屏幕上，中间用 , 隔开
    # 字面量：代码中被写下来的固定值。
    # Python 常见有6种数据类型：数字（Number），字符串（String），列表（List），元组（Tuple），集合（Set），字典（Dictionary）
        # 其中数字（Number）分为：
            # 整数（int）：比如 2，3，10，-4
            # 浮点数（float）：比如 1.45，-44.2
            # 复数（complex）: 比如 2+1j,复数以j结尾
            # 布尔（bool）: 表示现实生活中的真与假，True为真记作1，False为假记作0
        # 字符串（String）是由任意数量的字符组成，比如："5df454fg", "%$^#", "的算法对"------字符串要加""
        # 列表（List）是有序的可变序列，可以有序记录一堆数据，最常用
        # 元组（Tuple）是有序的不可变序列
        # 集合（Set）是无序不重复的数据集合
        # 字典（Dictionary）可以无序记录一堆 Key-Value型的Python数据集合

"""
    注释分为单行注释和多行注释
    单行注释 在语句前加 #，快捷键 Ctrl + /
    多行注释 在语句块前后加 三个双引号
"""

    # 变量：在程序运行中，用来记录数据，让我们能重复使用它
    # 变量格式：变量名 = 变量值
        # 变量名就是变量本身，它的代号
        # “=”是赋值，表示把 = 右侧的值赋予给左侧的变量，注意！！！ 右侧赋予左侧
        # 变量值就是变量储存的内容
# Money = 100
# print("钱包里有",Money,"元")
# Money = Money - 10
# print("买东西花了1 0元")
# print("钱包里还有",Money,"元")

# a = type("dgfadgag")    #type 语句用来查看字面量和变量存储的数据的类型,有结果（返回值）

# print(type(Money))
# print(a)

    # 变量没有类型，我们说的字符串变量并不是说这个变量是字符串，而是这个变量储存了字符串

    # 转换语句：有结果（返回值）
        # int(x) 将x转换成一个整数
        # float(x) 将x转换成一个浮点数
        # str(x) 将x对象转换成字符串

    # 标识符 是名字，只允许英文，数字和下划线。数字不可用在开头，大小写要区分且不可使用关键字

    # 运算符：
        # + 加
        # - 减
        # * 乘
        # / 除
        # // 取整除，结果为向下取整的整数
        # %  取余数，
        # ** 计算乘方，比如 2**9 就是2的9次方
    # a += b 是 a = a + b, 同理 -=, *=, /=, %=, **=, //=

# a = 2
# b = 3
# print("ragagafga234*/-ds\"jgjjhgjghj")

    # 字符串的三种定义方法：
        # 单引号 a = 'ragagafga234*/-ds'
        # 双引号 a = "ragagafga234*/-ds"
        # 三引号 a = """ragagafga234*/-ds""" ，也可以用作多行注释
    # 如果字符串里含有引号，可能会引发混淆，可以用 转义字符\ 放在符号前可以解除引号作用
    # 字符串的拼接：可以用 + 拼接，只能与字符串拼接
        # 字面量和字面量直接可以拼接
# print("123" + "abc")
        # 字面量和变量直接可以拼接
# name = "Klaus"
# print("123" + name)

    # 字符串格式化，"%占位符" %变量
# year = 2024
# month =5
# sum = "现在是%s年，%s月" %(year,month)
# print(sum)
    # 用%s来占位。其中 % 表示我要占位， s 表示将内容变成字符串放入应该占位的地方
    # 用%d来占位。其中 % 表示我要占位， d 表示将内容变成整数放入应该占位的地方
    # 用%f来占位。其中 % 表示我要占位， f 表示将内容变成浮点数放入应该占位的地方

    # 数字精度控制，可以用辅助符号 m.n 来控制数据的宽带和精度
        # %5d 说明将整数的宽度控制在5位。如果是12，控制后变成 [][][]12, 在前面用三个空格补足宽度
        # %7.2f 说明将浮点数宽度控制在7位，小数点精度在2位。如果是11.345，控制后变成 [][]11.35。
            # 为什么只有两个空格，因为小数点和小数部分都算入宽度计算，小数部分四舍五入
            # m 部分比数字本身宽度小的话，则没反应不生效

    # 第二种字符串格式化的方法，用 f"{变量} {变量}" 进行快速格式化
# name = "Klaus"
# age = 24
# bir = 5.23
# print(f"我叫{name}，我今年{age}岁，生日是{bir}。")
        # 这种方法适用于任何数据类型，但是不会控制精度

    # 表达式就是一个有明确结果的代码语句，适用于格式化

# 小练习：
# name = 'Samsumg'
# s_price = 19.99
# s_code = "003032"
# s_p_d_g_f = 1.2
# growth_day = 7
#
# print(f"公司名称：{name}，股票代码：{s_code}，当前股价{s_price}元。")
# s_price *= s_p_d_g_f ** growth_day
# print("每日增长系数是：%.1f,经过 %d 天的增长后，股价为%.2f" %(s_p_d_g_f, growth_day,s_price))

    # input() 输入语句 () 中可以直接打印出来
# you = input("你的代号是？")
# print("代号为%s" %you)
    # 无论键盘输入什么类型的数据，获得到的数据都是字符串

# 小练习：
# name = input("您的用户名是？")
# user_type = input("您的会员等级是？")
# print(f"{name}您好，你是尊贵的{user_type}级会员，欢迎光临！")

    # 布尔运算，只有两个字面量：True(1) 和 False(0),还可以通过比较运算来得到布尔结果
    # == 判断是否相等，!= 判断是否不相等
# bl1 = True
# bl2 = False
# print(bl1 != bl2)

    # 判断语句，if 语句格式为: （注意缩进 和 ：）
"""
    if (要判断的条件):
        条件成立，则执行此条1
        条件成立，则执行此条2
        ...
"""

    # if else 语句
"""
    if (要判断的条件):
        条件成立，则执行此条1
        条件成立，则执行此条2
    else:
        条件不成立，则执行此条1
        条件不成立，则执行此条2
        ...
"""


# if elif else 语句
"""
    if (要判断的条件1):
        条件成立，则执行此条1
        条件成立，则执行此条2
    elif (条件2):   
        条件2成立，则执行此条1
        条件2成立，则执行此条2
    elif (条件3):   
        条件3成立，则执行此条1
        条件3成立，则执行此条2
    
    ...
    
    else:
        所有条件不成立，则执行此条1
        所有条件不成立，则执行此条2
"""

# age = int(input("欢迎来到这里，你的年龄是"))
# if (age >18):
#     print("很好，你可以进去了")
# elif (age == 18):
#     print("刚好成年，你可以进去了")
# else:
#     print("未成年，不允许进入")

# 小练习
# a = 3
# num = input("1，2，3，4，5三个数字，猜猜我心里的数字是多少")
# num = int(num)
# if (num == 3):
#     print("厉害，一次就猜对了")
# elif (int(input("不对，再猜一次") ) == 3):
#     print("猜对了")
# elif (int(input("不对，再猜一次") ) == 3):
#     print("猜对了")
# else:
#     print("机会用完，数字是3")

# 小练习
# age = int(input("请输入你的年龄："))
# if (age < 18):
#     print("年龄太小了，不可以领取礼物！")
# else :
#     if (age < 30) :
#         t = int(input("请输入你的入职时间："))
#         r = int(input("请输入你的级别："))
#         if (t > 2) :
#             print("年龄达标，入职时间达标，可以领取礼物")
#         elif (r > 3) :
#             print("年龄达标，级别达标，可以领取礼物")
#         else :
#             print("必须要入职时间大于2年或者等级大于3，你不满足不可以领取礼物！")
#     else :
#         print("年龄太大了，不可以领取礼物！")

# 小练习
# import random
# num = random.randint(1,10)  #用来产生一个可以储存随机数的变量
# print(num)
# print("你有3次机会，从1 - 10之中猜一个数字")
# g = int(input("你猜的是："))
# if (g < num) :
#     g = int(input("这个数有点小，再猜一次："))
#     if (g > num) :
#         g = int(input("这个数有点大，再猜一次："))
#         if (g != num ) :
#             print("三次都没有猜对，这个数是%d" %num)
#         else :
#             print("猜对了，这个数是%d" %num)
#     elif (g < num) :
#         g = int(input("这个数有点小，再猜一次："))
#         if (g != num):
#             print("三次都没有猜对，这个数是%d" % num)
#         else:
#             print("猜对了，这个数是%d" % num)
#     else :
#             print("猜对了，这个数是%d" % num)
#
# if (g > num) :
#     g = int(input("这个数有点大，再猜一次："))
#     if (g > num) :
#         g = int(input("这个数有点大，再猜一次："))
#         if (g != num ) :
#             print("三次都没有猜对，这个数是%d" %num)
#         else :
#             print("猜对了，这个数是%d" %num)
#     elif (g < num) :
#         g = int(input("这个数有点小，再猜一次："))
#         if (g != num):
#             print("三次都没有猜对，这个数是%d" % num)
#         else:
#             print("猜对了，这个数是%d" % num)
#     else :
#             print("猜对了，这个数是%d" % num)
#
# else:
#     print("猜对了，这个数是%d" % num)

    # while 循环语句,只有条件满足就会无限循环执行,可以嵌套
"""
    while (条件) :
        条件满足时，做的事情1
        条件满足时，做的事情2
        条件满足时，做的事情3
        ...
"""
# 小练习
# i = 1
# sum = 0
# while (i <= 100) :
#     sum = sum + i
#     print(sum)
#     i += 1
# print(sum)

# 小练习
# import random
# r_num = random.randint(1,100)
# # print("请从1 - 100 之中猜一个数字%d" %r_num)
# g = int(input("请输入你猜的数字"))
# i = 0
# while (g != r_num) :
#     i += 1
#     if (g > r_num) :
#         print("猜大了")
#     else :
#         print("猜小了")
#     print("这是你猜的第%d次" %i)
#     g = int(input("再猜一次："))
# print("猜中了，你一共猜了%d次" %i)

    # print 语句输出默认换行，使用 end = '',即可使输出不换行
    # 制表符： \t,可以使我们的字符串在多行之间对其，相当于按下tab键

# 小练习
# r = 1
# while ( r <= 9 ) :
#     i = 1
#     while (i < r):
#         print(f"{i} * {r} = {i * r} \t", end= '')
#         i += 1
#     print(f"{r} * {i} = {i * r}")
#     r += 1

    # for 循环语句，把被处理数据集里的数据拿出来依次的执行,无法定义循环条件
    # 待处理数据集就是序列：字符串，列表，元组等
    # for 循环中的临时变量，其作用域限定在循环内
"""
for 临时变量 in (待处理数据集) :
    执行的语句
"""
# 小练习
# name = 'fhfkadytuh54jaa'
# i = 0
# for x in (name) :
#     if (x == 'a'):
#         i += 1
# print(i)

    # range(num) 获取一个从0 开始，到 num 结束的数字序列
    # range(num1, num2) 获取一个从 num1 开始，到 num2 结束的数字序列,且不包含 num2 本身100
    # range(num1, num2, step) 获取一个从 num1 开始，到 num2 结束的数字序列,且不包含 num2 本身，其中 step 是步长（间隔）
        # 比如 range(1, 10, 2)就是从 1 开始每隔 2 取一个数，结果是 1 3 5 7 9
# 小练习
# num = int(input("请输入一个数"))
# i = 0
# for x in range(1, num) :
#     print(x, end=' ')
#     if (x % 2 == 0) :
#         i += 1
# print()
# print("有%d个偶数" %i)

    # continue 关键字，可以用于中断本次循环直接进入下一次循环，可用与 for 和 while
    # break 直接结束所在的循环
    # 在嵌套循环中， break 和 continue 无法对上层循环作用

    # 函数是组织好的可重复使用的代码段
    # 函数语句：没有传入参数和返回值也可以，但是传入参数的位置必须有括号
    # 函数定义好后必须要调用才能使用，调用直接用: 函数名(传入参数)
    # def关键字用于定义带有名称的函数，可以重复使用
"""
    def 函数名 (传入参数) :
        函数体
        ...
        return 返回值
"""

    # lambda 关键字用于定义匿名函数，无名称，只能临时使用一次，只能写一行代码
"""
    lambda 传入参数: 函数体
"""
# 小练习
# def str_lent(data) :
#     i = 0
#     for x in data:
#         i += 1
#     print(i)
#
# str1 = '6tshtzfhzhz'
# str2 = '6'
# str3 = '6tshthzzhz'
#
# str_lent(str1)
# str_lent(str2)
# str_lent(str3)
# print(type(str_lent(str1)))

    # 函数定义中的参数是形式参数,函数调用中的参数是实际参数，参数数量不限用逗号隔开
# 小练习
# def tem_test (t) :
#     """
#     函数要有说明文档，方便阅读。在Pycharm环境下，用3引号会自动补全注释
#     :param t:
#     :return:
#     """
#     if (t > 37.5) :
#         print(f"您的体温是{t}度，体温过高，需要隔离！")
#     elif (t <= 36) :
#         print(f"您的体温是{t}度，体温过低，不正常！")
#     else :
#         print(f"您的体温是{t}度，体温正常，请进")
#     return t
#
# while (1 != 0) :
#     t = int(input("请输入您的体温："))
#     t = tem_test(t)
#     if ( t>37.5 ) :
#         print("你发烧了")
#     else :
#         print("ok")
    # 返回值，return 一个 返回值 之后在函数调用是就可以用一个变量接受这个数据，return 代表函数结束
    # 当函数没有 return 时，也有返回值：None ，类型是 NoneType
    # 如果一个函数有多个返回值，返回值之间用逗号分割，返回值的类型不受限制。可以用如下方法：
"""
def function() :
    ...
    ...
    return 1, 2
    
x , y = function()       
"""

    # 局部变量只存在函数内部，不可以在外部调用
    # 全局变量是在函数内外都可以使用的，定义在函数外面即可
    # global 局部变量， 可以把局部变量变为全局变量
    
    # 位置参数，调用函数时根据函数定义的参数位置来传递参数，调用的时候根据参数的位置顺序
    # 关键字参数，指函数调用时通过 键=值 的形式传递参数，这种方式不要求顺序
        # 可以和位置参数混用，但是位置参数必须在前面
    # 缺省参数，也叫默认参数。当没有传入参数的时候就默认用这个参数
    # 不定长参数，也叫可变参数。用于不确定传递多少个参数的时候，一般用变量名 args
        # 位置传递：变量用 (*i) 表示，传进的所有参数都会被 i变量 收集，然后根据传进参数的位置合并成一个元组
        # 关键字传递：变量用 (**i) 表示，传进的所有参数要写成 键=值 的形式，然后被 i变量 接收，然后根据 键=值 组成字典
    # 函数本身也可以作为参数传入另一个函数，这是一种计算逻辑的传递，而不是想普通函数一样的传递数据

# b = 1000
# def menu () :
#     """
#     主菜单
#     :return:
#     """
#     print("\n")
#
#     print("欢迎来到私人银行\n")
#     print("查询余额\t【输入1】")
#     print("存款\t【输入2】")
#     print("取款\t【输入3】")
#     print("退出\t【输入4】")
#
# def add (b, m) :
#     """
#     存款
#     :param b:
#     :param m:
#     :return:
#     """
#     b += m
#     return b
# def sub (b, m) :
#     """
#     取款
#     :param b:
#     :param m:
#     :return:
#     """
#     if (m <= b) :
#         b -= m
#         print(f"取款成功，您的余额为{b}元")
#     else :
#         print("余额不足，无法操作！\n")
#
# while (1 != 0) :
#     menu()
#     o = int(input('请选择你的操作：'))
#     if (o == 1):
#         print(f"您好，您的余额为{b}元")
#     elif (o == 2):
#         m = int(input('请输入您想存款金额：'))
#         b = add(b, m)
#         print(f"存款成功，您的余额为{b}元")
#     elif (o == 3):
#         m = int(input('请输入您想取款金额：'))
#         b = sub(b, m)
#     else:
#         print("谢谢使用，您已经退出")

    # 数据容器，一个可以容纳多个数据的数据类型，容纳的每个数据称为元素，每个元素可以是任意类型的数据
        # 数据容器分为5类：列表（list），元组（tuple），字符串（str），集合（set），字典（dict）

        # 列表（list）：
"""
定义字面量： 
[元素1,元素2,元素3...]
定义变量：
变量名称 = [元素1,元素2,元素3...]
定义空列表：
变量名称 = []
变量名称 = list()
"""
        # 如果想取出列表中的数据，用下标索引，从左边第一个元素0开始递增，也可以反向下标索引，从右边第一个-1开始递减
# a = ['dsfa',[1,2,3,4],7]
# print(a[0])
# print(a[-2])
# print(a.index('dsfa'))
# a[0] = [111111]
# print(a)
# a.insert(0,'dsfa')
# print(a)
# a.append('aaaaa')
# print(a)
# b = ['bbbbb','ccccc','ddddd']
# a.extend(b)
# print(a)
# del a[0]
# print(a)
# e = a.pop(0)
# print(e)
# print(a)
# a.remove(7)
# print(a)
# print(a.count('bbbbb'))
# print(len(a))
# a.clear()
# print(a)

        # 列表也可以：
            # 查询元素，语法：列表. index(元素)
            # 修改元素，语法：列表[下标] = 值
            # 插入元素，语法：列表. insert(下标,元素)
            # 删除元素：
                # 语法1：del 列表[下标]
                # 语法2：列表. pop[下标]。这种方法是把元素取出来，有返回值
                # 语法3：列表. remove(元素)。在列表中搜寻这个元素然后移除
                # 语法4：列表. clear()。把整个列表清空
            # 追加元素:
                # 单个元素追加， 语法1：列表. append(元素),这种方法只把元素追加到列表的尾部
                # 多个元素追加， 语法2：列表. extend(其它数据容器),这种方法把其它数据容器的一批元素追加到列表的尾部
            # 统计元素个数：
                # 语法1：列表. count(元素1)。统计列表中元素1的数量
                # 语法2：len(列表) 。统计列表所有元素的数量，得到一个int值
    # 如果把函数定义在 class 下，函数会称为方法

# 小练习
# age = [21,25,21,23,22,20]
# age. append(31)
# nw_age = [29,33,30]
# age.extend(nw_age)
# print(age[0])
# print(age[-1])
# print(age.index(31))
# print(age)

    # 把列表中的元素依次取出叫做：遍历
"""
方法1(while): 可以自定条件，灵活控制
index = 0
while (index < len(列表)) :
    元素 = 列表[index]
    处理语句
    ...
    index += 1 ， 很重要

方法2(for): 只能一个个从容器中取出数据
for 临时变量 in 数据容器 :
    处理语句
    ...
"""
# 小练习
# num = [1,2,3,4,5,6,7,8,9,10]
# i = 0
# while (i < len(num)) :
#     odd_num = num[i]
#     if (odd_num % 2 != 0) :
#         print(odd_num)
#     i += 1
# print(num,end='\n')
# for x in num :
#     if (x % 2 == 0):
#         print(x,end=' ')

    # 元组和列表特性操作一样，但是不可被修改，相当于只读的列表。但如果在元组内嵌套一个列表，还是可以修改这个列表的
    # 注意！！如果定义的元组只有一个元素，还是要在元素后面加逗号，要不然就会识别成字符串
    # t = ("abcde", )
"""
定义元组字面量： 
(元素1,元素2,元素3...)
定义元组变量：
变量名称 = (元素1,元素2,元素3...)
定义空元组：
变量名称 = ()
变量名称 = tuple()
"""
# 小练习
# infor = ('Klaus',24,['Judo','Archery'])
# print(infor)
# print(infor.index(24))
# print(infor[0])
# del infor[2][1]
# print(infor)
# infor[2].append('Judo')
# print(infor)

    # 字符串也算是一种数据类型和列表特性操作一样，但是不可被修改，相当于只读的列表。
        # 字符串的替换，语法：字符串. replace(字符串1，字符串2)，将字符串内的全部 字符串1 替换成 字符串2
# str1 = "aaaaabbbbb"
# print(str1)
# n_str1 = str1. replace("a","b")
# print(n_str1)
# print(str1)

    # 注意，这种替换实际上是得到了新字符串，不会修改原本的字符串

        # 字符串的分割，语法：字符串. split(分隔符字符串)，按照指定的分隔符字符串将原本字符串划分为多个字符串，并存入列表对象中
# str2 = "aaa0bbb0ccc0ddd0eee0"
# print(str2)
# n_str2 = str2. split("0")
# print(n_str2)
# print(str2)
    # 注意，这种分割实际上是得到了新字符串，不会修改原本的字符串

        # 字符串的规整操作：
            # 去除首尾空格，语法：字符串. strip()
            # 去除前后指定字符串，语法：字符串. strip(指定字符串)

    # 序列是指内容连续，有序，可使用下标索引的一类数据容器，比如列表，元组，字符串
    # 切片是指从一个序列中，取出一个子序列，语法：序列[起始下标: 结束下标: 步长]
        # 表示从序列中指定起始位置开始，以指定步长依次取出元素，到指定位置结束，等到一个新序列
        # 起始下标可以留空，表示从头开始。结束下标可以留空，表示到结尾为止
        # 步长表示依次取元素的间隔，默认是1，可以省略不写，此外：
            # 步长1 表示依次一个一个取元素
            # 步长2 表示每次隔一个元素取元素
            # 步长N 表示每次隔 N-1 个元素取元素
            # 步长负数表示反向取，此时起始下标和结束下标也要为负数
                # 可以反转

    # 集合 不支持元素重复，且无序,不支持下标索引，可被修改
"""
定义集合字面量： 
{元素,元素,元素...}
定义集合变量：
变量名称 = {元素,元素,元素...}
定义空集合：
变量名称 = set()
"""
    # 向集合添加新元素，语法：集合. add(元素)。集合本身被修改
    # 从集合里移除元素，语法：集合. remove(元素)。集合本身被修改
    # 从集合里随机取一个元素，语法：集合. pop()。会有一个返回值，同时集合本身被修改，元素被移除
    # 清空集合，语法：集合. clear()。集合本身被清空
    # 取两个集合的差集，语法：集合1. difference(集合2)。为了取出 集合1 有而 集合2 没有的元素
        # 结果会得到一个新集合，原本集合1，2不变
# set1 = {1,2,3,4}
# print(set1)
# set2 = {2,4,6,8}
# print(set2)
# d_set = set1.difference(set2)
# print(' ')
# print(d_set)
# print(set1)
# print(set2)

    # 消除两个集合的差集，语法：集合1. difference_uptdate(集合2)。先对比两个集合，然后在 集合1 内删除和 集合2 相同的元素
        # 结果集合1被修改，集合2不变
# set1 = {1,2,3,4}
# print(set1)
# set2 = {2,4,6,8}
# print(set2)
# d_set = set1.difference_update(set2)
# print(' ')
# print(set1)
# print(set2)

    # 两个集合的合并，语法：集合1. union(集合2)。 集合1 和 集合2 组成新集合
        # 结果会得到一个新集合，原本集合1，2不变

    # 字典(dict)，可以通过 key 取出 value，字典储存的元素是一个个的 键值对
        # 不可以重复，不可以使用下标索引, key 不可以为字典
        # 只可以用 for 循环来遍历
"""
定义字典字面量： 
{key1: value1, key2: value2, ......}
定义字典变量：
变量名称 = {key1: value1, key2: value2, ......}
定义空字典：
变量名称 = {}
变量名称 = dict{}
"""
# wang_dict = {"语文": 77, "数学": 66, "英语": 33}
# zhou_dict = {"语文": 88, "数学": 86, "英语": 55}
# lin_dict = {"语文": 99, "数学": 96, "英语": 66}
# info_dict = {"王": wang_dict, "周": zhou_dict, "林": lin_dict}
# print(info_dict["林"]["数学"])
# print(wang_dict.keys())

    # 向字典新增元素，语法：字典[key] = value，如果key已经存在与字典中，那么就会更新 value
    # 从字典删除元素，语法：字典. pop(key)。从字典中移除指定key,同时获得指定key的value
    # 清空字典，语法：字典. clear()
    # 获取字典中全部的key，语法：字典. keys()

# 小练习
# info_dict = {
#     "王": {'部门': '科技部', '工资': 3000, '级别': 1},
#     "周": {'部门': '市场部', '工资': 5000, '级别': 2},
#     "林": {'部门': '市场部', '工资': 7000, '级别': 3},
#     "张": {'部门': '科技部', '工资': 4000, '级别': 1},
#     "刘": {'部门': '市场部', '工资': 6000, '级别': 2}
#             }
# for x in info_dict :
#     if (info_dict[x]['级别'] == 1) :
#         info_dict[x]['工资'] += 1000
#         info_dict[x]['级别'] += 1
#     print(info_dict[x])

    # 数据容器的通用方法：
        # max(数据容器)，用来统计容器最大元素
        # min(数据容器)，用来统计容器最小元素
        # list(数据容器)，将容器转换为列表
        # str(数据容器)，将容器转换为字符串
            # 这种方法字符串是单个分开的，使用 ''. join(数据容器) 语句能得到相连的字符串
        # tuple(数据容器)，将容器转换为元组
        # set(数据容器)，将容器转换为集合

    # 在程序中，每个字符都有对应的ASCII码表值。字符串的大小比较就是基于ASCII码值的大小进行比较的。
    # 字符串的比较是 按位比较， 一位位的对比，只要有1位大，那么整体就大

    # 文件编码，即翻译的规则，把内容翻译成2进制
        # 编码有很多种，比如 UTF-8(最通用格式),GBK，Big5, 不同编码翻译内容不同
    # 文件的操作有：打开，读写，关闭
        # 文件对象. close() 关闭文件
            # 用 with open(name, mode, encoding=" ") as 文件名
                # 文件会在使用后自动关闭，防止占用
        # open() 打开函数，可以打开一个存在的文件
"""
open(name, mode, encoding=" ")

name: 要打开目标名字的字符串，可以包含文件具体路径 
mode: 设置打开文件的操作(访问模式)，只读，写入，追加等
    r, 只读方式打开文件，文件指针会放在开头，默认方式
    w, 打开一个文件只用于写入。如果文件已经存在，则删除原有内容，从头开始编辑。如果文件不存在，则创建新文件。
    a, 打开一个文件用于追加，如果文件已经存在，新内容会追加到已有内容之后，如果文件不存在，则创建新文件。
encoding: 编码格式
"""
        # 读操作方法：
"""
文件对象. read(num)
num 表示要从文件中读取的数据的长度，单位是字节。如果没有 num ，那就读取文件的所有数据

文件对象. readline()
一次读取一行文件

for line in 文件名:
用for循环读取每一行文件数据

文件对象. readlines()
可以把整个文件全部读取，然后返回一个列表
"""
# import time
# f = open("C:\\Users\\Klaus\\Desktop\\123.txt", "a", encoding="UTF-8")
# f.write("11111\n22222\n33333\n")
# f.flush()
#
# # print(f.read()) 因为每一次操作都是续接上一次操作，光标会移动。如果读取了全部，意味着光标移动到末尾，所以接下来的操作无法读取
# l1 = f.readline()
# l2 = f.readline()
# l3 = f.readline()
# while True :
#     print(l1)
#     print(l2)
#     print(l3)
#     time.sleep(5)

# f.close()

"""
time.sleep(num)   这个语句让程序睡眠
用之前,要先 import time
"""

        # 写操作方法
"""
文件名. write(写入的内容)  执行这一条后，其实内容并没有真正写入文件，而是会积攒在程序缓冲区中
文件名. flush             执行这一条后，内容才会真正写入文件。这样避免频繁操作硬盘
"""

# f1 = open("C:\\Users\\Klaus\\Desktop\\ori.txt", "r", encoding="UTF-8")
# l = f1.readlines()
# print(l)
# f2 = open("C:\\Users\\Klaus\\Desktop\\odd.txt", "w", encoding="UTF-8")
# for x in l :
#     if (int(x) % 2 != 0) :
#         f2.write(x)
# f1.close()
# f2.close()

    # 捕获异常，异常会传递
"""
try :
    可能发生错误的代码
except :
    如果出现异常执行的代码
else :
    如果没有异常要执行的代码
finally :
    无论如何都要执行的代码
"""

    # 模块(mode) 是一个python函数，以 .py 结尾。能帮助我们快速实现一些功能
    # 模块 使用前需要导入,常用导入方法语法如下：
"""
import 模块名
模块名. 功能名()    # 这种办法可以使用模块中的所有功能
"""
"""
from 模块名 import 功能名
功能名()     # 这种办法只可以导入模块中指定的一种功能
"""
"""
from 模块名 import *
功能名()       #这种办法表示导入模块中所有功能
"""
"""
import 模块名 as 别名        #给模块改名
from 模块名 import 功能名 as 别名       #给功能改名
"""
    # 导入后的模块和功能通过 . 来确定层级关系
    # 按住 ctrl 键然后点击模块名，可以查看模块内部文件

    # 自定义模块时如果有重名的功能名，则最新的会把之前的覆盖掉
    # 在实际开发中，开发人员编写完一个模块后，为了验证会加上测试语句。但是这样我们在导入模块时，就会自动执行测试语句并输出结果
        #如果要避免这种情况，可以在测试语句之前加上：
"""
if __name__ == '__main__':
"""
    # 如果一个模块中有 __all__ 变量，当使用 from 模块名 import * 时，只能用 __all__ 这个列表里的元素
        # 但是如果用其它 import 方式就不受限制

    # 如果Python模块太多了，可能会造成混乱。这时可以用 Package 包
        # 本质上，包就是一个文件夹，包含一个__init__.py。这个文件包含多个模块文件，所以其实包也是模块
        # 直接右键 就可以创建 package，新创建的包文件内部自带__init__.py
            # 导入包：
"""
import 包名. 模块名
包名. 模块名. 目标
"""
# import my_mod.my_trans
#
# a = '15'
# b = -14
# try :
#     print(a + b)
# except :
#     a = my_mod.my_trans.int_trans(a)
#     print(a + b)

    # 第三方包，是别人编写好的包。可以极大提高开发效率
        # 可以用内置的 pip 程序，从网络上下载包。打开 CMD，用如下语句安装(也可以用Pycharm安装)
"""
>pip install 包名称
"""

# 小练习
# import my_utils
# s = input()
#
# print(my_utils.str_util.str_rev(s))
#
# s = input()
# x = input()
# y = input()
# print(my_utils.str_util.substr(s, x, y))

    # JSON 是一种轻量级的数据交互格式，本质上是一个带有特定格式的字符串。可以按照指定的格式去组织和封装数据。负责各个编程语言之间数据的交互
        # python和Json的相互转换：
        # ensure_ascii = False 用这个语句防止中文被乱码
"""
先导入json模块
import json

准备符合jason格式的数据，就是python里的 字典(dict) 类型 {k: v, k: v, k: v, k: v}

json数据 = json. dumps(python数据)      # 把python数据转换成json

python数据 = json.load(json数据)        # 把json数据转换成python
"""

    # 用 pyecharts 构建可视化图表
        # 折线图
# from pyecharts.charts import Line
#
# l_graph = Line()
#     # 创建一个折线图对象
# l_graph.add_xaxis(['Klaus','Jason','Tomas','Ryan'])
#     # 给x轴添加数据
# l_graph.add_yaxis('柔道等级',[3,8,6,9])
#     # 给y轴一个名字，并添加数据
# l_graph.reversal_axis()     # 反转 x,y 轴
#     # 设置全局配置项
# l_graph.set_global_opts(
#     # 可以美化图标，加标题工具栏等
# )
# l_graph.render()
#     # 生产 .html文件 图像

        # 地图可视化
# from pyecharts.charts import Map
# from pyecharts.options import VisualMapOpts
#
# map_1 = Map()
# data = [
#     ("北京市", 105),
#     ("内蒙古自治区", 10546),
#     ("甘肃省", 15),
#     ("江西省", 105),
#     ("湖北省", 1880),
#         ]
# map_1.add("地图", data, "china")      # china 要小写

# 这里可以设置全局选项，具体代码参考帮助文档

# map_1.render()

    # 绘制时间线柱状图
# from pyecharts.charts import Bar
# from pyecharts.charts import Timeline
#
# bar1 = Bar()
# bar1.add_xaxis(["China", "Japan", "Spain"])
# bar1.add_yaxis("GDP", [10, 30, 20])
#
# bar2 = Bar()
# bar2.add_xaxis(["China", "Japan", "Spain"])
# bar2.add_yaxis("GDP", [40, 90, 60])
#
# bar3 = Bar()
# bar3.add_xaxis(["China", "Japan", "Spain"])
# bar3.add_yaxis("GDP", [100, 130, 90])
#
# bar4 = Bar()
# bar4.add_xaxis(["China", "Japan", "Spain"])
# bar4.add_yaxis("GDP", [290, 260, 180])
#
# timeline = Timeline()
# timeline.add(bar1,'1990')
# timeline.add(bar2,'2000')
# timeline.add(bar3,'2010')
# timeline.add(bar4,'2020')
#
# timeline.add_schema(
#     play_interval = 1000,
#     is_timeline_show= True,
#     is_auto_play= True,
#     is_loop_play= True
# )       # 设置自动播放参数
#
# timeline.render()

# 小练习, 给列表 按照 递增或递减排序
# m_list = [['a', 4], ['d', 44], ['e', 444], ['b', 4444], ['c', 44444]]
# def fun_sort (e) :
#     return e[1]
# m_list.sort(key= fun_sort , reverse= False)
# print(m_list)


    # 使用对象组织数据：设计类，创建对象，对象属性赋值
        # 在类中定义方法的语句：
"""
def 方法名(self, 形参1, 形参2, 形参3, ... , 形参 N) :
    方法体
    # 这里的 self 必须要有，但是它不会被当成传入参数，可以当成不存在
        # 如果想访问 类 内的成员变量，这在调用时必须以 self.成员变量 的格式
"""
# 小练习
# class Student:  # 设计一个类：包含属性(数据)，称为成员变量和行为(函数)称为成员方法
#     name = None
#     gender = None
#     weight = None
#     height = None
#     age = None
#
# stu_info = Student()    # 创建一个对象
#
# stu_info.weight = 86
# stu_info.gender = 'Male'
# stu_info.name = 'Klaus'
# stu_info.age = 24
# stu_info.height = 185   # 为对象赋值
#
# print(stu_info.height)
# print(stu_info.age)
# print(stu_info.weight)
# print(stu_info.gender)
# print(stu_info.name)

# class Judo_r :
#     Kyu = None
#     def ran(self,):
#         print(self.Kyu)
#
# my_r = Judo_r()
# my_r.Kyu = 4
#
# my_r.ran()

