Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z70II-0006fv-VM
	for mharc-qemu-trivial@gnu.org; Mon, 22 Jun 2015 07:53:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60801)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z70IB-0006S7-QK
	for qemu-trivial@nongnu.org; Mon, 22 Jun 2015 07:53:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z70I9-0000RV-Rx
	for qemu-trivial@nongnu.org; Mon, 22 Jun 2015 07:53:35 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:59165)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Z70I2-0000No-7t; Mon, 22 Jun 2015 07:53:26 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id E4DFF40C2D;
	Mon, 22 Jun 2015 14:53:24 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id C4877A5A;
	Mon, 22 Jun 2015 14:16:31 +0300 (MSK)
Received: (nullmailer pid 9272 invoked by uid 1000);
	Mon, 22 Jun 2015 11:16:30 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 22 Jun 2015 14:16:23 +0300
Message-Id: <8f573e9d64caebb3a1ad0092cb9d3aeea52f2af6.1434971627.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1434971627.git.mjt@msgid.tls.msk.ru>
References: <cover.1434971627.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Markus Armbruster <armbru@redhat.com>
Subject: [Qemu-trivial] [PULL 16/21] qemu-options: Use @itemx where
	appropriate
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 22 Jun 2015 11:53:40 -0000

From: Markus Armbruster <armbru@redhat.com>

Doesn't appear to make a difference, but let's use it consistently.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qemu-options.hx | 52 ++++++++++++++++++++++++++--------------------------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 39a472e..55d8ca9 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -118,7 +118,7 @@ DEF("numa", HAS_ARG, QEMU_OPTION_numa,
     "-numa node[,memdev=id][,cpus=cpu[-cpu]][,nodeid=node]\n", QEMU_ARCH_ALL)
 STEXI
 @item -numa node[,mem=@var{size}][,cpus=@var{cpu[-cpu]}][,nodeid=@var{node}]
-@item -numa node[,memdev=@var{id}][,cpus=@var{cpu[-cpu]}][,nodeid=@var{node}]
+@itemx -numa node[,memdev=@var{id}][,cpus=@var{cpu[-cpu]}][,nodeid=@var{node}]
 @findex -numa
 Simulate a multi node NUMA system. If @samp{mem}, @samp{memdev}
 and @samp{cpus} are omitted, resources are split equally. Also, note
@@ -421,7 +421,7 @@ DEF("fda", HAS_ARG, QEMU_OPTION_fda,
 DEF("fdb", HAS_ARG, QEMU_OPTION_fdb, "", QEMU_ARCH_ALL)
 STEXI
 @item -fda @var{file}
-@item -fdb @var{file}
+@itemx -fdb @var{file}
 @findex -fda
 @findex -fdb
 Use @var{file} as floppy disk 0/1 image (@pxref{disk_images}).
@@ -435,9 +435,9 @@ DEF("hdc", HAS_ARG, QEMU_OPTION_hdc,
 DEF("hdd", HAS_ARG, QEMU_OPTION_hdd, "", QEMU_ARCH_ALL)
 STEXI
 @item -hda @var{file}
-@item -hdb @var{file}
-@item -hdc @var{file}
-@item -hdd @var{file}
+@itemx -hdb @var{file}
+@itemx -hdc @var{file}
+@itemx -hdd @var{file}
 @findex -hda
 @findex -hdb
 @findex -hdc
@@ -1009,8 +1009,8 @@ Set the TCP port spice is listening on for plaintext channels.
 Set the IP address spice is listening on.  Default is any address.
 
 @item ipv4
-@item ipv6
-@item unix
+@itemx ipv6
+@itemx unix
 Force using the specified IP version.
 
 @item password=<secret>
@@ -1045,17 +1045,17 @@ Set the TCP port spice is listening on for encrypted channels.
 Set the x509 file directory. Expects same filenames as -vnc $display,x509=$dir
 
 @item x509-key-file=<file>
-@item x509-key-password=<file>
-@item x509-cert-file=<file>
-@item x509-cacert-file=<file>
-@item x509-dh-key-file=<file>
+@itemx x509-key-password=<file>
+@itemx x509-cert-file=<file>
+@itemx x509-cacert-file=<file>
+@itemx x509-dh-key-file=<file>
 The x509 file names can also be configured individually.
 
 @item tls-ciphers=<list>
 Specify which ciphers to use.
 
 @item tls-channel=[main|display|cursor|inputs|record|playback]
-@item plaintext-channel=[main|display|cursor|inputs|record|playback]
+@itemx plaintext-channel=[main|display|cursor|inputs|record|playback]
 Force specific channel to be used with or without TLS encryption.  The
 options can be specified multiple times to configure multiple
 channels.  The special name "default" can be used to set the default
@@ -1067,7 +1067,7 @@ Configure image compression (lossless).
 Default is auto_glz.
 
 @item jpeg-wan-compression=[auto|never|always]
-@item zlib-glz-wan-compression=[auto|never|always]
+@itemx zlib-glz-wan-compression=[auto|never|always]
 Configure wan image compression (lossy for slow links).
 Default is auto.
 
@@ -1605,7 +1605,7 @@ privilege to run. Valid options are:
 Connect user mode stack to VLAN @var{n} (@var{n} = 0 is the default).
 
 @item id=@var{id}
-@item name=@var{name}
+@itemx name=@var{name}
 Assign symbolic name for use in monitor commands.
 
 @item net=@var{addr}[/@var{mask}]
@@ -1712,7 +1712,7 @@ Then when you use on the host @code{telnet localhost 5555}, you
 connect to the guest telnet server.
 
 @item guestfwd=[tcp]:@var{server}:@var{port}-@var{dev}
-@item guestfwd=[tcp]:@var{server}:@var{port}-@var{cmd:command}
+@itemx guestfwd=[tcp]:@var{server}:@var{port}-@var{cmd:command}
 Forward guest TCP connections to the IP address @var{server} on port @var{port}
 to the character device @var{dev} or to a program executed by @var{cmd:command}
 which gets spawned for each connection. This option can be given multiple times.
@@ -1743,7 +1743,7 @@ syntax gives undefined results. Their use for new applications is discouraged
 as they will be removed from future versions.
 
 @item -netdev tap,id=@var{id}[,fd=@var{h}][,ifname=@var{name}][,script=@var{file}][,downscript=@var{dfile}][,helper=@var{helper}]
-@item -net tap[,vlan=@var{n}][,name=@var{name}][,fd=@var{h}][,ifname=@var{name}][,script=@var{file}][,downscript=@var{dfile}][,helper=@var{helper}]
+@itemx -net tap[,vlan=@var{n}][,name=@var{name}][,fd=@var{h}][,ifname=@var{name}][,script=@var{file}][,downscript=@var{dfile}][,helper=@var{helper}]
 Connect the host TAP network interface @var{name} to VLAN @var{n}.
 
 Use the network script @var{file} to configure it and the network script
@@ -1783,7 +1783,7 @@ qemu-system-i386 linux.img \
 @end example
 
 @item -netdev bridge,id=@var{id}[,br=@var{bridge}][,helper=@var{helper}]
-@item -net bridge[,vlan=@var{n}][,name=@var{name}][,br=@var{bridge}][,helper=@var{helper}]
+@itemx -net bridge[,vlan=@var{n}][,name=@var{name}][,br=@var{bridge}][,helper=@var{helper}]
 Connect a host TAP network interface to a host bridge device.
 
 Use the network helper @var{helper} to configure the TAP interface and
@@ -1806,7 +1806,7 @@ qemu-system-i386 linux.img -net bridge,br=qemubr0 -net nic,model=virtio
 @end example
 
 @item -netdev socket,id=@var{id}[,fd=@var{h}][,listen=[@var{host}]:@var{port}][,connect=@var{host}:@var{port}]
-@item -net socket[,vlan=@var{n}][,name=@var{name}][,fd=@var{h}] [,listen=[@var{host}]:@var{port}][,connect=@var{host}:@var{port}]
+@itemx -net socket[,vlan=@var{n}][,name=@var{name}][,fd=@var{h}] [,listen=[@var{host}]:@var{port}][,connect=@var{host}:@var{port}]
 
 Connect the VLAN @var{n} to a remote VLAN in another QEMU virtual
 machine using a TCP socket connection. If @option{listen} is
@@ -1829,7 +1829,7 @@ qemu-system-i386 linux.img \
 @end example
 
 @item -netdev socket,id=@var{id}[,fd=@var{h}][,mcast=@var{maddr}:@var{port}[,localaddr=@var{addr}]]
-@item -net socket[,vlan=@var{n}][,name=@var{name}][,fd=@var{h}][,mcast=@var{maddr}:@var{port}[,localaddr=@var{addr}]]
+@itemx -net socket[,vlan=@var{n}][,name=@var{name}][,fd=@var{h}][,mcast=@var{maddr}:@var{port}[,localaddr=@var{addr}]]
 
 Create a VLAN @var{n} shared with another QEMU virtual
 machines using a UDP multicast socket, effectively making a bus for
@@ -1881,7 +1881,7 @@ qemu-system-i386 linux.img \
 @end example
 
 @item -netdev l2tpv3,id=@var{id},src=@var{srcaddr},dst=@var{dstaddr}[,srcport=@var{srcport}][,dstport=@var{dstport}],txsession=@var{txsession}[,rxsession=@var{rxsession}][,ipv6][,udp][,cookie64][,counter][,pincounter][,txcookie=@var{txcookie}][,rxcookie=@var{rxcookie}][,offset=@var{offset}]
-@item -net l2tpv3[,vlan=@var{n}][,name=@var{name}],src=@var{srcaddr},dst=@var{dstaddr}[,srcport=@var{srcport}][,dstport=@var{dstport}],txsession=@var{txsession}[,rxsession=@var{rxsession}][,ipv6][,udp][,cookie64][,counter][,pincounter][,txcookie=@var{txcookie}][,rxcookie=@var{rxcookie}][,offset=@var{offset}]
+@itemx -net l2tpv3[,vlan=@var{n}][,name=@var{name}],src=@var{srcaddr},dst=@var{dstaddr}[,srcport=@var{srcport}][,dstport=@var{dstport}],txsession=@var{txsession}[,rxsession=@var{rxsession}][,ipv6][,udp][,cookie64][,counter][,pincounter][,txcookie=@var{txcookie}][,rxcookie=@var{rxcookie}][,offset=@var{offset}]
 Connect VLAN @var{n} to L2TPv3 pseudowire. L2TPv3 (RFC3391) is a popular
 protocol to transport Ethernet (and other Layer 2) data frames between
 two systems. It is present in routers, firewalls and the Linux kernel
@@ -1902,7 +1902,7 @@ This transport allows a VM to communicate to another VM, router or firewall dire
 @item ipv6
     force v6, otherwise defaults to v4.
 @item rxcookie=@var{rxcookie}
-@item txcookie=@var{txcookie}
+@itemx txcookie=@var{txcookie}
     Cookies are a weak form of security in the l2tpv3 specification.
 Their function is mostly to prevent misconfiguration. By default they are 32
 bit.
@@ -1940,7 +1940,7 @@ qemu-system-i386 linux.img -net nic -net l2tpv3,src=4.2.3.1,dst=1.2.3.4,udp,srcp
 @end example
 
 @item -netdev vde,id=@var{id}[,sock=@var{socketpath}][,port=@var{n}][,group=@var{groupname}][,mode=@var{octalmode}]
-@item -net vde[,vlan=@var{n}][,name=@var{name}][,sock=@var{socketpath}] [,port=@var{n}][,group=@var{groupname}][,mode=@var{octalmode}]
+@itemx -net vde[,vlan=@var{n}][,name=@var{name}][,sock=@var{socketpath}] [,port=@var{n}][,group=@var{groupname}][,mode=@var{octalmode}]
 Connect VLAN @var{n} to PORT @var{n} of a vde switch running on host and
 listening for incoming connections on @var{socketpath}. Use GROUP @var{groupname}
 and MODE @var{octalmode} to change default ownership and permissions for
@@ -2239,7 +2239,7 @@ DragonFlyBSD hosts.  It is an alias for @option{serial}.
 @option{path} specifies the path to the tty. @option{path} is required.
 
 @item -chardev parallel ,id=@var{id} ,path=@var{path}
-@item -chardev parport ,id=@var{id} ,path=@var{path}
+@itemx -chardev parport ,id=@var{id} ,path=@var{path}
 
 @option{parallel} is only available on Linux, FreeBSD and DragonFlyBSD hosts.
 
@@ -3212,7 +3212,7 @@ Examples:
 
 @table @code
 @item -watchdog i6300esb -watchdog-action pause
-@item -watchdog ib700
+@itemx -watchdog ib700
 @end table
 ETEXI
 
@@ -3232,7 +3232,7 @@ instance you could use the either of the following to change the escape
 character to Control-t.
 @table @code
 @item -echr 0x14
-@item -echr 20
+@itemx -echr 20
 @end table
 ETEXI
 
@@ -3280,7 +3280,7 @@ DEF("incoming", HAS_ARG, QEMU_OPTION_incoming, \
     QEMU_ARCH_ALL)
 STEXI
 @item -incoming tcp:[@var{host}]:@var{port}[,to=@var{maxport}][,ipv4][,ipv6]
-@item -incoming rdma:@var{host}:@var{port}[,ipv4][,ipv6]
+@itemx -incoming rdma:@var{host}:@var{port}[,ipv4][,ipv6]
 @findex -incoming
 Prepare for incoming migration, listen on a given tcp port.
 
-- 
2.1.4


