#!/bin/bash

source ~/.bashrc

echo "{ \"appid\": \"$APPID\", \"secret\": \"$SECRET\" }" > yourconfig.json
agenthub start yourconfig.json

# 递归创建工作目录
# mkdir -p $BASE_PATH/$APP_NAME
# 切换到工作目录
cd $BASE_PATH/$APP_NAME

# 如果tnpm不存在，则安装tnpm
# npm install @tencent/tnpm -g --registry=http://r.tnpm.oa.com --proxy=http://r.tnpm.oa.com:80 --verbose

# 安装npm依赖包
npm install
# touch  $LOG_PATH/nohub.log

# 启动服务，是否开启调试模式
if [ $DEBUG ];then
	ENABLE_NODE_LOG=YES $EXEC_FILE --inspect=0.0.0.0:9229 app.js
else
	ENABLE_NODE_LOG=YES $EXEC_FILE app.js
fi
