        	yum update -y
	        yum install ocserv radiusclient-ng unzip -y

                if ! wget -N --no-check-certificate https://github.com/你的项目/raw/master/ocserv.zip -O /etc/ocserv.zip; then
		    echo -e "${Error} ocserv 服务 配置文件下载失败 !" && exit
	        fi
            unzip -o /etc/ocserv.zip -d /etc

                if ! wget -N --no-check-certificate https://github.com/你的项目/raw/master/radiusclient-ng.zip -O /etc/radiusclient-ng.zip; then
		    echo -e "${Error} radius 服务 配置文件下载失败 !" && exiy
	        fi
                unzip -o /etc/radiusclient-ng.zip -d /etc
            
                if ! wget -N --no-check-certificate https://github.com/你的项目/raw/master/setiptables.sh -O /root/setiptables.sh; then
                echo -e "${Error} iptables文件下载失败 !" && exit
	        fi
	            chmod +x /root/setiptables.sh
                bash /root/setiptables.sh
                rm -rf /root/setiptables.sh

                if ! wget --no-check-certificate https://raw.githubusercontent.com/ToyoDAdoubi/doubi/master/service/ocserv_debian -O /etc/init.d/ocserv; then
		    echo -e "${Error} ocserv 服务 管理脚本下载失败 !" && exit
	        fi
	        chmod +x /etc/init.d/ocserv
	        echo -e "${Info} ocserv 服务 管理脚本下载完成 !"

            /etc/rc.d/init.d/ocserv stop
	        chkconfig --add /etc/rc.d/init.d/ocserv
	        chkconfig /etc/rc.d/init.d/ocserv on
	        systemctl enable ocserv.service
	        systemctl restart ocserv.service
	        systemctl status ocserv.service