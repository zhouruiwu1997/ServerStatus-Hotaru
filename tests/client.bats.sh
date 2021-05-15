#!/usr/bin/env bats

<<'COMMENT'
stdin demo
1. 安装 服务端
请输入 ServerStatus 服务端的 IP/域名[server]，请注意，如果你的域名使用了CDN，请直接填写IP
127.0.0.1
请输入 ServerStatus 服务端监听的端口[1-65535]（用于服务端接收客户端消息的端口，客户端要填写这个端口）
35601
请输入 ServerStatus 服务端中对应配置的用户名[username]（字母/数字，不可与其他账号重复）
username
请输入 ServerStatus 服务端中对应配置的密码[password]（字母/数字）
doub.io
对于流量计算是否使用Vnstat每月自动清零？ [y/N]
n
COMMENT

@test "Check Install_ServerStatus_client" {
  echo -e "10\n1\n127.0.0.1\n35601\nusername\ndoub.io\nn\n" | bash "./status.sh"
  echo -e "" | source "./status.sh"
  [ -d ${client_file} ]
  [ -n "$(pgrep -f "status-client.py")" ]
}
