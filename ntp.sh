which ntpd
if [ `which ntpd | wc -l `  -eq  0 ] ; then
echo "ntpd NOT FOUND"
ln -sf /usr/share/zoneinfo/Japan /etc/localtime
yum -y install ntp
echo "INSTALLED ntpd"
fi
ntpdate -u ntp.nict.jp
hwclock --systohc    
service ntpd restart
chkconfig ntpd on
date
