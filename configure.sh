#!/bin/sh

# Download and install xray
mkdir /tmp/xray
curl -L -H "Cache-Control: no-cache" -o /tmp/xray/xray.zip https://github.com/XTLS/Xray-core/releases/download/v1.2.4/Xray-linux-64.zip
unzip /tmp/xray/xray.zip -d /tmp/xray
install -m 755 /tmp/xray/xray /usr/local/bin/xray

# Remove temporary directory
rm -rf /tmp/xray

# xray new configuration
install -d /usr/local/etc/xray
cat << EOF > /usr/local/etc/xray/config.json
{
    "inbounds": [
        {
            "port": $PORT,
            "protocol": "vmess",
            "settings": {
                "clients": [
                    {
                        "id": "$UUID"
                    }
                ],
                "disableInsecureEncryption": true
            },
            "streamSettings": {
                "network": "ws"
            }
        }
    ],
  "outbounds": [
    {
      "tag":"INTERNET_OUT",
      "protocol": "freedom",
      "settings": {
        "domainStrategy": "UseIP"
      }
    }
  ],
  "routing": {
    "rules": [
      {
        "type": "field",
        "outboundTag": "INTERNET_OUT",
        "network": "udp,tcp"
      }
    ]
  },
  "dns": {
    "servers": [
      "1.1.1.1",
      "1.0.0.1"
]
}
}
EOF

# Run xray
/usr/local/bin/xray -config /usr/local/etc/xray/config.json
