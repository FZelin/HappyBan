#!/bin/sh

chmod 755 /jffs/scripts/entware.gz  #给压缩包权限
tar -xzvf /jffs/scripts/entware.gz -C /jffs/scripts/  #解压
chmod 755 /jffs/scripts/entware #给文件夹权限
rm -rf /tmp/opt #删除原有的软连接
ln -s /jffs/scripts/entware /tmp/opt #创建新的软连接
mount --bind /jffs/scripts/entware/bin/wget /jffs/.koolshare/bin/wget #将新版本wget挂载到系统

[ ! -e "/jffs/scripts/init-start" ] && echo "#!/bin/sh" > /jffs/scripts/init-start
echo "ln -s /jffs/scripts/entware /tmp/opt" >>/jffs/scripts/init-start
echo "mount --bind /jffs/scripts/entware/bin/wget /jffs/.koolshare/bin/wget" >>/jffs/scripts/init-start
chmod 755 /jffs/scripts/init-start