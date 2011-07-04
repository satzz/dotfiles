yum -y install ntp
ntpdate -u ntp.nict.jp
hwclock --systohc    
service ntpd start
chkconfig ntpd on
date
