Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hC6aG-0003bW-21
	for mharc-qemu-trivial@gnu.org; Thu, 04 Apr 2019 13:55:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59394)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jaydevjha123@gmail.com>) id 1hC6Jb-0006Sv-BC
	for qemu-trivial@nongnu.org; Thu, 04 Apr 2019 13:38:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jaydevjha123@gmail.com>) id 1hC6JX-0005ma-Vy
	for qemu-trivial@nongnu.org; Thu, 04 Apr 2019 13:38:13 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:34975)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <jaydevjha123@gmail.com>)
	id 1hC6JX-0005lT-IS
	for qemu-trivial@nongnu.org; Thu, 04 Apr 2019 13:38:11 -0400
Received: by mail-pf1-x42c.google.com with SMTP id t21so1719427pfe.2
	for <qemu-trivial@nongnu.org>; Thu, 04 Apr 2019 10:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=qitfG0lTbgKlXFOHHnQ0grWSU09oOGmd8Usvl3rJ9gU=;
	b=V/QM8+O9QwZRt2+HYNK7cX94huvuCmxNzFve/YZOH9rHBldbhpFMJwG/qO4Tf+5LAt
	n2zOPj3ML2OF/FYEHm0T4blOZxvk0hSqFXu6NfUU0BzvCoXlVl2FvXaGNulE+yo5RM6W
	XqHkScHnqCiGDTZ+gafyZOK4Z4/WxRFI/nYB2yGy5vrxSeNQ5iodyKDB88UjS3DUJDtL
	1itAr7eeBxBcK26C0vVfecxSeDO6crLyrCnGeVTyhNlBwVsDuz+4t3XNSv1fYirnwzLG
	fvjPM7pkzNNsj12PH3gd3FGDvLpggJhy0PM3x+6ioWOStjQrdGdM6cm55NWzKZTmtPeJ
	C1NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=qitfG0lTbgKlXFOHHnQ0grWSU09oOGmd8Usvl3rJ9gU=;
	b=ugYDdXKtvDQtInGiUEZNWtwijnSrUN8CRmRtUCsIeSKX7tuMBUl3m4GP8pm274iqPT
	J/LzfQH50SOQoHDOqD3D+68UliaNXmA0xrfCfm1avpxyBUeeiFUt+lK2uvjAr4WQ6UUV
	ULGwLbxmeB8WKmLh0qh0RFgI7pjU61zM9s+viTuI49EYRT9T+aVgBeymF+Pl5EX0HV0l
	NXmit0DBs/DKYYpaWJiC15abIgHt+zFEncV4+q+urK+V1T7+JdrSE7iPgzTUhL2CDJux
	UVrLfXVfoMSqHJdN0fV6k1iUdpUS6F7eId5VXraCs8SrdcqZ3kEI25in8oUYNsOC4atQ
	/1mQ==
X-Gm-Message-State: APjAAAUMQ/iym+qnNQ1XqusfUtCDLOg+jVGzOMLcpoii86QE6JAI09uM
	IHPcMWgQ3AOcI3dW8p7r757U9/6skCIpJMKv8+kl/0cV
X-Google-Smtp-Source: APXvYqwFlfIARix86GAZlYxyZAU1AabmnhdZSLZ/CPrHQgIiLPTJNalG1oO89xDbwKARta1mdvSBjUhG8dO4ZXAynXc=
X-Received: by 2002:a65:6108:: with SMTP id z8mr7200919pgu.106.1554399489831; 
	Thu, 04 Apr 2019 10:38:09 -0700 (PDT)
MIME-Version: 1.0
From: Jay dev Jha <jaydevjha123@gmail.com>
Date: Thu, 4 Apr 2019 23:09:35 +0530
Message-ID: <CAG+6neuY31yO2NaPY5Rk1hYLYnnCPb12kc+QgsYeN-gZwK48ZQ@mail.gmail.com>
To: qemu-trivial@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000006e36ea0585b7d59a"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::42c
X-Mailman-Approved-At: Thu, 04 Apr 2019 13:55:27 -0400
Subject: [Qemu-trivial] PATCH : Live Migration Support for PVRDMA Device
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Apr 2019 17:38:17 -0000

--0000000000006e36ea0585b7d59a
Content-Type: text/plain; charset="UTF-8"

1. Sample host scripts1.1. reset_vf_on_212_46.sh

#!/bin/sh# This script is run on the host 10.237.212.46 to reset SRIOV
# BDF for Fortville NIC is 0000:02:00.0
cat /sys/bus/pci/devices/0000\:02\:00.0/max_vfsecho 0 >
/sys/bus/pci/devices/0000\:02\:00.0/max_vfs
cat /sys/bus/pci/devices/0000\:02\:00.0/max_vfs
# BDF for Niantic NIC is 0000:09:00.0
cat /sys/bus/pci/devices/0000\:09\:00.0/max_vfsecho 0 >
/sys/bus/pci/devices/0000\:09\:00.0/max_vfs
cat /sys/bus/pci/devices/0000\:09\:00.0/max_vfs

1.2. vm_virtio_vhost_user.sh

#/bin/sh# Script for use with vhost_user sample application# The host
system has 8 cpu's (0-7)
# Path to KVM toolKVM_PATH="/usr/bin/qemu-system-x86_64"
# Guest Disk imageDISK_IMG="/home/user/disk_image/virt1_sml.disk"
# Number of guest cpusVCPUS_NR="6"
# MemoryMEM=1024
VIRTIO_OPTIONS="csum=off,gso=off,guest_tso4=off,guest_tso6=off,guest_ecn=off"
# Socket PathSOCKET_PATH="/root/dpdk/host_scripts/usvhost"

taskset -c 2-7 $KVM_PATH \
 -enable-kvm \
 -m $MEM \
 -smp $VCPUS_NR \
 -object memory-backend-file,id=mem,size=1024M,mem-path=/mnt/huge,share=on \
 -numa node,memdev=mem,nodeid=0 \
 -cpu host \
 -name VM1 \
 -no-reboot \
 -net none \
 -vnc none \
 -nographic \
 -hda $DISK_IMG \
 -chardev socket,id=chr0,path=$SOCKET_PATH \
 -netdev type=vhost-user,id=net1,chardev=chr0,vhostforce \
 -device virtio-net-pci,netdev=net1,mac=CC:BB:BB:BB:BB:BB,$VIRTIO_OPTIONS \
 -chardev socket,id=chr1,path=$SOCKET_PATH \
 -netdev type=vhost-user,id=net2,chardev=chr1,vhostforce \
 -device virtio-net-pci,netdev=net2,mac=DD:BB:BB:BB:BB:BB,$VIRTIO_OPTIONS \
 -monitor telnet::3333,server,nowait

1.3. connect_to_qemu_mon_on_host.sh

#!/bin/sh# This script is run on both hosts when the VM is up,# to
connect to the Qemu Monitor.

telnet 0 3333

1.4. reset_vf_on_212_131.sh

#!/bin/sh# This script is run on the host 10.237.212.131 to reset SRIOV
# BDF for Ninatic NIC is 0000:06:00.0
cat /sys/bus/pci/devices/0000\:06\:00.0/max_vfsecho 0 >
/sys/bus/pci/devices/0000\:06\:00.0/max_vfs
cat /sys/bus/pci/devices/0000\:06\:00.0/max_vfs
# BDF for Fortville NIC is 0000:03:00.0
cat /sys/bus/pci/devices/0000\:03\:00.0/max_vfsecho 0 >
/sys/bus/pci/devices/0000\:03\:00.0/max_vfs
cat /sys/bus/pci/devices/0000\:03\:00.0/max_vfs

1.5. vm_virtio_vhost_user_migrate.sh

#/bin/sh# Script for use with vhost user sample application# The host
system has 8 cpu's (0-7)
# Path to KVM toolKVM_PATH="/usr/bin/qemu-system-x86_64"
# Guest Disk imageDISK_IMG="/home/user/disk_image/virt1_sml.disk"


# Number of guest cpusVCPUS_NR="6"
# MemoryMEM=1024
VIRTIO_OPTIONS="csum=off,gso=off,guest_tso4=off,guest_tso6=off,guest_ecn=off"
# Socket PathSOCKET_PATH="/root/dpdk/host_scripts/usvhost"

taskset -c 2-7 $KVM_PATH \
 -enable-kvm \
 -m $MEM \
 -smp $VCPUS_NR \
 -object memory-backend-file,id=mem,size=1024M,mem-path=/mnt/huge,share=on \
 -numa node,memdev=mem,nodeid=0 \
 -cpu host \
 -name VM1 \
 -no-reboot \
 -net none \
 -vnc none \
 -nographic \
 -hda $DISK_IMG \
 -chardev socket,id=chr0,path=$SOCKET_PATH \
 -netdev type=vhost-user,id=net1,chardev=chr0,vhostforce \
 -device virtio-net-pci,netdev=net1,mac=CC:BB:BB:BB:BB:BB,$VIRTIO_OPTIONS \
 -chardev socket,id=chr1,path=$SOCKET_PATH \
 -netdev type=vhost-user,id=net2,chardev=chr1,vhostforce \
 -device virtio-net-pci,netdev=net2,mac=DD:BB:BB:BB:BB:BB,$VIRTIO_OPTIONS \
 -incoming tcp:0:5555 \
 -monitor telnet::3333,server,nowait

2. Sample VM scripts
2.1. setup_dpdk_virtio_in_vm.sh

#!/bin/sh# this script matches the vm_virtio_vhost_user script# virtio
port is 03# virtio port is 04

cat  /sys/kernel/mm/hugepages/hugepages-2048kB/nr_hugepagesecho 1024 >
/sys/kernel/mm/hugepages/hugepages-2048kB/nr_hugepages
cat  /sys/kernel/mm/hugepages/hugepages-2048kB/nr_hugepages

ifconfig -a
/root/dpdk/usertools/dpdk-devbind.py --status

rmmod virtio-pci

modprobe uio
insmod /root/dpdk/x86_64-default-linuxapp-gcc/kmod/igb_uio.ko

/root/dpdk/usertools/dpdk-devbind.py -b igb_uio 0000:00:03.0
/root/dpdk/usertools/dpdk-devbind.py -b igb_uio 0000:00:04.0

/root/dpdk/usertools/dpdk-devbind.py --status

2.2. run_testpmd_in_vm.sh

#!/bin/sh# Run testpmd for use with vhost_user sample app.# test
system has 8 cpus (0-7), use cpus 2-7 for VM

/root/dpdk/x86_64-default-linuxapp-gcc/app/testpmd \
-l 0-5 -n 4 --socket-mem 350 -- --burst=64 --i

--0000000000006e36ea0585b7d59a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail-section" id=3D"gmail-reset-vf-on-212-4=
6-sh">
<h3><br></h3><h2><font size=3D"4">1. Sample host scripts</font></h2><h3><fo=
nt size=3D"4">1.1. reset_vf_on_212_46.sh</font></h3><font size=3D"4">
</font><div class=3D"gmail-highlight-sh"><div class=3D"gmail-highlight"><pr=
e><font size=3D"4"><span class=3D"gmail-c">#!/bin/sh</span>
<span class=3D"gmail-c"># This script is run on the host 10.237.212.46 to r=
eset SRIOV</span>

<span class=3D"gmail-c"># BDF for Fortville NIC is 0000:02:00.0</span>
cat /sys/bus/pci/devices/0000<span class=3D"gmail-se">\:</span>02<span clas=
s=3D"gmail-se">\:</span>00.0/max_vfs
<span class=3D"gmail-nb">echo </span><span class=3D"gmail-m">0</span> &gt; =
/sys/bus/pci/devices/0000<span class=3D"gmail-se">\:</span>02<span class=3D=
"gmail-se">\:</span>00.0/max_vfs
cat /sys/bus/pci/devices/0000<span class=3D"gmail-se">\:</span>02<span clas=
s=3D"gmail-se">\:</span>00.0/max_vfs

<span class=3D"gmail-c"># BDF for Niantic NIC is 0000:09:00.0</span>
cat /sys/bus/pci/devices/0000<span class=3D"gmail-se">\:</span>09<span clas=
s=3D"gmail-se">\:</span>00.0/max_vfs
<span class=3D"gmail-nb">echo </span><span class=3D"gmail-m">0</span> &gt; =
/sys/bus/pci/devices/0000<span class=3D"gmail-se">\:</span>09<span class=3D=
"gmail-se">\:</span>00.0/max_vfs
cat /sys/bus/pci/devices/0000<span class=3D"gmail-se">\:</span>09<span clas=
s=3D"gmail-se">\:</span>00.0/max_vfs
</font></pre></div>
</div><font size=3D"4">
</font></div><font size=3D"4">
</font><div class=3D"gmail-section" id=3D"gmail-vm-virtio-vhost-user-sh">
<h3><font size=3D"4">1.2. vm_virtio_vhost_user.sh</font></h3>
<div class=3D"gmail-highlight-sh"><div class=3D"gmail-highlight"><pre><font=
 size=3D"4"><span class=3D"gmail-c">#/bin/sh</span>
<span class=3D"gmail-c"># Script for use with vhost_user sample application=
</span>
<span class=3D"gmail-c"># The host system has 8 cpu&#39;s (0-7)</span>

<span class=3D"gmail-c"># Path to KVM tool</span>
<span class=3D"gmail-nv">KVM_PATH</span><span class=3D"gmail-o">=3D</span><=
span class=3D"gmail-s2">&quot;/usr/bin/qemu-system-x86_64&quot;</span>

<span class=3D"gmail-c"># Guest Disk image</span>
<span class=3D"gmail-nv">DISK_IMG</span><span class=3D"gmail-o">=3D</span><=
span class=3D"gmail-s2">&quot;/home/user/disk_image/virt1_sml.disk&quot;</s=
pan>

<span class=3D"gmail-c"># Number of guest cpus</span>
<span class=3D"gmail-nv">VCPUS_NR</span><span class=3D"gmail-o">=3D</span><=
span class=3D"gmail-s2">&quot;6&quot;</span>

<span class=3D"gmail-c"># Memory</span>
<span class=3D"gmail-nv">MEM</span><span class=3D"gmail-o">=3D</span>1024

<span class=3D"gmail-nv">VIRTIO_OPTIONS</span><span class=3D"gmail-o">=3D</=
span><span class=3D"gmail-s2">&quot;csum=3Doff,gso=3Doff,guest_tso4=3Doff,g=
uest_tso6=3Doff,guest_ecn=3Doff&quot;</span>

<span class=3D"gmail-c"># Socket Path</span>
<span class=3D"gmail-nv">SOCKET_PATH</span><span class=3D"gmail-o">=3D</spa=
n><span class=3D"gmail-s2">&quot;/root/dpdk/host_scripts/usvhost&quot;</spa=
n>

taskset -c 2-7 <span class=3D"gmail-nv">$KVM_PATH</span> <span class=3D"gma=
il-se">\</span>
 -enable-kvm <span class=3D"gmail-se">\</span>
 -m <span class=3D"gmail-nv">$MEM</span> <span class=3D"gmail-se">\</span>
 -smp <span class=3D"gmail-nv">$VCPUS_NR</span> <span class=3D"gmail-se">\<=
/span>
 -object memory-backend-file,id<span class=3D"gmail-o">=3D</span>mem,size<s=
pan class=3D"gmail-o">=3D</span>1024M,mem-path<span class=3D"gmail-o">=3D</=
span>/mnt/huge,share<span class=3D"gmail-o">=3D</span>on <span class=3D"gma=
il-se">\</span>
 -numa node,memdev<span class=3D"gmail-o">=3D</span>mem,nodeid<span class=
=3D"gmail-o">=3D</span><span class=3D"gmail-m">0</span> <span class=3D"gmai=
l-se">\</span>
 -cpu host <span class=3D"gmail-se">\</span>
 -name VM1 <span class=3D"gmail-se">\</span>
 -no-reboot <span class=3D"gmail-se">\</span>
 -net none <span class=3D"gmail-se">\</span>
 -vnc none <span class=3D"gmail-se">\</span>
 -nographic <span class=3D"gmail-se">\</span>
 -hda <span class=3D"gmail-nv">$DISK_IMG</span> <span class=3D"gmail-se">\<=
/span>
 -chardev socket,id<span class=3D"gmail-o">=3D</span>chr0,path<span class=
=3D"gmail-o">=3D</span><span class=3D"gmail-nv">$SOCKET_PATH</span> <span c=
lass=3D"gmail-se">\</span>
 -netdev <span class=3D"gmail-nb">type</span><span class=3D"gmail-o">=3D</s=
pan>vhost-user,id<span class=3D"gmail-o">=3D</span>net1,chardev<span class=
=3D"gmail-o">=3D</span>chr0,vhostforce <span class=3D"gmail-se">\</span>
 -device virtio-net-pci,netdev<span class=3D"gmail-o">=3D</span>net1,mac<sp=
an class=3D"gmail-o">=3D</span>CC:BB:BB:BB:BB:BB,<span class=3D"gmail-nv">$=
VIRTIO_OPTIONS</span> <span class=3D"gmail-se">\</span>
 -chardev socket,id<span class=3D"gmail-o">=3D</span>chr1,path<span class=
=3D"gmail-o">=3D</span><span class=3D"gmail-nv">$SOCKET_PATH</span> <span c=
lass=3D"gmail-se">\</span>
 -netdev <span class=3D"gmail-nb">type</span><span class=3D"gmail-o">=3D</s=
pan>vhost-user,id<span class=3D"gmail-o">=3D</span>net2,chardev<span class=
=3D"gmail-o">=3D</span>chr1,vhostforce <span class=3D"gmail-se">\</span>
 -device virtio-net-pci,netdev<span class=3D"gmail-o">=3D</span>net2,mac<sp=
an class=3D"gmail-o">=3D</span>DD:BB:BB:BB:BB:BB,<span class=3D"gmail-nv">$=
VIRTIO_OPTIONS</span> <span class=3D"gmail-se">\</span>
 -monitor telnet::3333,server,nowait
</font></pre></div>
</div>
</div><font size=3D"4">
</font><div class=3D"gmail-section" id=3D"gmail-connect-to-qemu-mon-on-host=
-sh">
<h3><font size=3D"4">1.3. connect_to_qemu_mon_on_host.sh</font></h3>
<div class=3D"gmail-highlight-sh"><div class=3D"gmail-highlight"><pre><font=
 size=3D"4"><span class=3D"gmail-c">#!/bin/sh</span>
<span class=3D"gmail-c"># This script is run on both hosts when the VM is u=
p,</span>
<span class=3D"gmail-c"># to connect to the Qemu Monitor.</span>

telnet <span class=3D"gmail-m">0</span> 3333
</font></pre></div>
</div>
</div><font size=3D"4">
</font><div class=3D"gmail-section" id=3D"gmail-reset-vf-on-212-131-sh">
<h3><font size=3D"4">1.4. reset_vf_on_212_131.sh</font></h3>
<div class=3D"gmail-highlight-sh"><div class=3D"gmail-highlight"><pre><font=
 size=3D"4"><span class=3D"gmail-c">#!/bin/sh</span>
<span class=3D"gmail-c"># This script is run on the host 10.237.212.131 to =
reset SRIOV</span>

<span class=3D"gmail-c"># BDF for Ninatic NIC is 0000:06:00.0</span>
cat /sys/bus/pci/devices/0000<span class=3D"gmail-se">\:</span>06<span clas=
s=3D"gmail-se">\:</span>00.0/max_vfs
<span class=3D"gmail-nb">echo </span><span class=3D"gmail-m">0</span> &gt; =
/sys/bus/pci/devices/0000<span class=3D"gmail-se">\:</span>06<span class=3D=
"gmail-se">\:</span>00.0/max_vfs
cat /sys/bus/pci/devices/0000<span class=3D"gmail-se">\:</span>06<span clas=
s=3D"gmail-se">\:</span>00.0/max_vfs

<span class=3D"gmail-c"># BDF for Fortville NIC is 0000:03:00.0</span>
cat /sys/bus/pci/devices/0000<span class=3D"gmail-se">\:</span>03<span clas=
s=3D"gmail-se">\:</span>00.0/max_vfs
<span class=3D"gmail-nb">echo </span><span class=3D"gmail-m">0</span> &gt; =
/sys/bus/pci/devices/0000<span class=3D"gmail-se">\:</span>03<span class=3D=
"gmail-se">\:</span>00.0/max_vfs
cat /sys/bus/pci/devices/0000<span class=3D"gmail-se">\:</span>03<span clas=
s=3D"gmail-se">\:</span>00.0/max_vfs
</font></pre></div>
</div>
</div><font size=3D"4">
</font><div class=3D"gmail-section" id=3D"gmail-vm-virtio-vhost-user-migrat=
e-sh">
<h3><font size=3D"4">1.5. vm_virtio_vhost_user_migrate.sh</font></h3>
<div class=3D"gmail-highlight-sh"><div class=3D"gmail-highlight"><pre><font=
 size=3D"4"><span class=3D"gmail-c">#/bin/sh</span>
<span class=3D"gmail-c"># Script for use with vhost user sample application=
</span>
<span class=3D"gmail-c"># The host system has 8 cpu&#39;s (0-7)</span>

<span class=3D"gmail-c"># Path to KVM tool</span>
<span class=3D"gmail-nv">KVM_PATH</span><span class=3D"gmail-o">=3D</span><=
span class=3D"gmail-s2">&quot;/usr/bin/qemu-system-x86_64&quot;</span>

<span class=3D"gmail-c"># Guest Disk image</span>
<span class=3D"gmail-nv">DISK_IMG</span><span class=3D"gmail-o">=3D</span><=
span class=3D"gmail-s2">&quot;/home/user/disk_image/virt1_sml.disk&quot;</s=
pan></font></pre></div></div></div><div class=3D"gmail-document"><div><div =
class=3D"gmail-section" id=3D"gmail-live-migration-of-vm-with-virtio-on-hos=
t-running-vhost-user"><div class=3D"gmail-section" id=3D"gmail-sample-host-=
scripts"><div class=3D"gmail-section" id=3D"gmail-vm-virtio-vhost-user-migr=
ate-sh"><div class=3D"gmail-highlight-sh"><div class=3D"gmail-highlight"><p=
re><font size=3D"4"><span class=3D"gmail-s2"></span>

<span class=3D"gmail-c"># Number of guest cpus</span>
<span class=3D"gmail-nv">VCPUS_NR</span><span class=3D"gmail-o">=3D</span><=
span class=3D"gmail-s2">&quot;6&quot;</span>

<span class=3D"gmail-c"># Memory</span>
<span class=3D"gmail-nv">MEM</span><span class=3D"gmail-o">=3D</span>1024

<span class=3D"gmail-nv">VIRTIO_OPTIONS</span><span class=3D"gmail-o">=3D</=
span><span class=3D"gmail-s2">&quot;csum=3Doff,gso=3Doff,guest_tso4=3Doff,g=
uest_tso6=3Doff,guest_ecn=3Doff&quot;</span>

<span class=3D"gmail-c"># Socket Path</span>
<span class=3D"gmail-nv">SOCKET_PATH</span><span class=3D"gmail-o">=3D</spa=
n><span class=3D"gmail-s2">&quot;/root/dpdk/host_scripts/usvhost&quot;</spa=
n>

taskset -c 2-7 <span class=3D"gmail-nv">$KVM_PATH</span> <span class=3D"gma=
il-se">\</span>
 -enable-kvm <span class=3D"gmail-se">\</span>
 -m <span class=3D"gmail-nv">$MEM</span> <span class=3D"gmail-se">\</span>
 -smp <span class=3D"gmail-nv">$VCPUS_NR</span> <span class=3D"gmail-se">\<=
/span>
 -object memory-backend-file,id<span class=3D"gmail-o">=3D</span>mem,size<s=
pan class=3D"gmail-o">=3D</span>1024M,mem-path<span class=3D"gmail-o">=3D</=
span>/mnt/huge,share<span class=3D"gmail-o">=3D</span>on <span class=3D"gma=
il-se">\</span>
 -numa node,memdev<span class=3D"gmail-o">=3D</span>mem,nodeid<span class=
=3D"gmail-o">=3D</span><span class=3D"gmail-m">0</span> <span class=3D"gmai=
l-se">\</span>
 -cpu host <span class=3D"gmail-se">\</span>
 -name VM1 <span class=3D"gmail-se">\</span>
 -no-reboot <span class=3D"gmail-se">\</span>
 -net none <span class=3D"gmail-se">\</span>
 -vnc none <span class=3D"gmail-se">\</span>
 -nographic <span class=3D"gmail-se">\</span>
 -hda <span class=3D"gmail-nv">$DISK_IMG</span> <span class=3D"gmail-se">\<=
/span>
 -chardev socket,id<span class=3D"gmail-o">=3D</span>chr0,path<span class=
=3D"gmail-o">=3D</span><span class=3D"gmail-nv">$SOCKET_PATH</span> <span c=
lass=3D"gmail-se">\</span>
 -netdev <span class=3D"gmail-nb">type</span><span class=3D"gmail-o">=3D</s=
pan>vhost-user,id<span class=3D"gmail-o">=3D</span>net1,chardev<span class=
=3D"gmail-o">=3D</span>chr0,vhostforce <span class=3D"gmail-se">\</span>
 -device virtio-net-pci,netdev<span class=3D"gmail-o">=3D</span>net1,mac<sp=
an class=3D"gmail-o">=3D</span>CC:BB:BB:BB:BB:BB,<span class=3D"gmail-nv">$=
VIRTIO_OPTIONS</span> <span class=3D"gmail-se">\</span>
 -chardev socket,id<span class=3D"gmail-o">=3D</span>chr1,path<span class=
=3D"gmail-o">=3D</span><span class=3D"gmail-nv">$SOCKET_PATH</span> <span c=
lass=3D"gmail-se">\</span>
 -netdev <span class=3D"gmail-nb">type</span><span class=3D"gmail-o">=3D</s=
pan>vhost-user,id<span class=3D"gmail-o">=3D</span>net2,chardev<span class=
=3D"gmail-o">=3D</span>chr1,vhostforce <span class=3D"gmail-se">\</span>
 -device virtio-net-pci,netdev<span class=3D"gmail-o">=3D</span>net2,mac<sp=
an class=3D"gmail-o">=3D</span>DD:BB:BB:BB:BB:BB,<span class=3D"gmail-nv">$=
VIRTIO_OPTIONS</span> <span class=3D"gmail-se">\</span>
 -incoming tcp:0:5555 <span class=3D"gmail-se">\</span>
 -monitor telnet::3333,server,nowait
</font></pre></div>
</div>
</div>
</div><font size=3D"4">
</font><div class=3D"gmail-section" id=3D"gmail-sample-vm-scripts"><font si=
ze=3D"4">
<span id=3D"gmail-lm-virtio-vhost-user-vm-scripts"></span></font><h2><font =
size=3D"4">2. Sample VM scripts</font></h2><font size=3D"4">
</font><div class=3D"gmail-section" id=3D"gmail-setup-dpdk-virtio-in-vm-sh"=
>
<h3><font size=3D"4">2.1. setup_dpdk_virtio_in_vm.sh</font></h3>
<div class=3D"gmail-highlight-sh"><div class=3D"gmail-highlight"><pre><font=
 size=3D"4"><span class=3D"gmail-c">#!/bin/sh</span>
<span class=3D"gmail-c"># this script matches the vm_virtio_vhost_user scri=
pt</span>
<span class=3D"gmail-c"># virtio port is 03</span>
<span class=3D"gmail-c"># virtio port is 04</span>

cat  /sys/kernel/mm/hugepages/hugepages-2048kB/nr_hugepages
<span class=3D"gmail-nb">echo </span><span class=3D"gmail-m">1024</span> &g=
t; /sys/kernel/mm/hugepages/hugepages-2048kB/nr_hugepages
cat  /sys/kernel/mm/hugepages/hugepages-2048kB/nr_hugepages

ifconfig -a
/root/dpdk/usertools/dpdk-devbind.py --status

rmmod virtio-pci

modprobe uio
insmod /root/dpdk/x86_64-default-linuxapp-gcc/kmod/igb_uio.ko

/root/dpdk/usertools/dpdk-devbind.py -b igb_uio 0000:00:03.0
/root/dpdk/usertools/dpdk-devbind.py -b igb_uio 0000:00:04.0

/root/dpdk/usertools/dpdk-devbind.py --status
</font></pre></div>
</div>
</div><font size=3D"4">
</font><div class=3D"gmail-section" id=3D"gmail-run-testpmd-in-vm-sh"><font=
 size=3D"4">
</font><h3><font size=3D"4">2.2. run_testpmd_in_vm.sh</font></h3><font size=
=3D"4">
</font><div class=3D"gmail-highlight-sh"><div class=3D"gmail-highlight"><pr=
e><font size=3D"4"><span class=3D"gmail-c">#!/bin/sh</span>
<span class=3D"gmail-c"># Run testpmd for use with vhost_user sample app.</=
span>
<span class=3D"gmail-c"># test system has 8 cpus (0-7), use cpus 2-7 for VM=
</span>

/root/dpdk/x86_64-default-linuxapp-gcc/app/testpmd <span class=3D"gmail-se"=
>\</span>
-l 0-5 -n <span class=3D"gmail-m">4</span> --socket-mem <span class=3D"gmai=
l-m">350</span> -- --burst<span class=3D"gmail-o">=3D</span><span class=3D"=
gmail-m">64</span> --i
</font></pre></div>
</div>
</div>
</div>
</div>


           </div>
          </div>
         =20
 =20
    <div class=3D"gmail-rst-footer-buttons">
     =20
        </div>
     =20
     =20
        </div>

--0000000000006e36ea0585b7d59a--

