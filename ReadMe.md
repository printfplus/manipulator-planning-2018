### 运筹学2018大作业

>这个项目是2018运筹学大作业的代码合集

#### 表示动作的类设计

##### 动作类的组成元素

* 动作对象action_agent：'R1','R2','12'(其中12代表该动作需要两个机械手完成)
* 起始点begin_point：即起始的腔室
* 终止点finish_point：即中止的腔室
* 动作时间action_time：完成该动作所需要的整体时间

##### 动作类当前的方法：

1. 计算动作时间 calculate_time()
2. 展示类的属性(即上述四种属性) display_member()

##### 动作类具体使用方法示例

```matlab
action1 = action('12','Pre','P5'); %混合动作，从Pre腔室转换到'P5'腔室
action1.display_member(); %展示类的属性
```