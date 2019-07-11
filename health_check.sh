#!/bin/bash
# 检测Node进程是否存在
ps aux | grep -v grep | grep node && exit 0
exit 1
