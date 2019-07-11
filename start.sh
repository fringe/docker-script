#!/bin/bash

# 切换到工作目录
cd $BASE_PATH/$APP_NAME

file ~/.bashrc && source ~/.bashrc

# 如果tnpm不存在，则安装tnpm
# npm install @tencent/tnpm -g --registry=http://r.tnpm.oa.com --proxy=http://r.tnpm.oa.com:80 --verbose

# 安装npm依赖包
npm install
# touch  $LOG_PATH/nohub.log

# 启动服务，是否开启调试模式
if [ $DEBUG ];then
	$EXEC_FILE --inspect=0.0.0.0:9229 app.js
else
	$EXEC_FILE app.js
fi
