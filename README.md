# ScheduleSystem
毕业设计-基于mybatis的时间日程管理系统

在线预览地址:
后台：http://guns.a3r.top/admin   账号密码：admin 1 
网站前台：http://guns.a3r.top/admin/api/web/home

环境配置：jdk1.8.151 tomcat8.5 maven 3.5


系统初始化
1 导入maven项目，选定perant项目，导入。
2 导入数据库 admin 项目下sql目录，先后导入guns.sql 和 guns_update.sql

启动方式
1 编译器启动：
admin项目,目录下 guns-admin\src\main\java\com\stylefeng\guns\GunsApplication.java文件中有main方法
2打war包：
选中perant项目 run as ->maven bluing,命令填
clean package -Dmaven.test.skip=true

访问地址
后台：localhost
网站前台：localhost/api/web/home