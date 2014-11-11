Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XoCpR-0000wg-NK
	for mharc-qemu-trivial@gnu.org; Tue, 11 Nov 2014 09:53:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34583)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XoCpL-0000jp-5n
	for qemu-trivial@nongnu.org; Tue, 11 Nov 2014 09:53:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XoCpF-0002A6-3y
	for qemu-trivial@nongnu.org; Tue, 11 Nov 2014 09:53:51 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:35829)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XoCp0-00026j-Er; Tue, 11 Nov 2014 09:53:30 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 6641741DF9;
	Tue, 11 Nov 2014 17:53:29 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 733B16D9;
	Tue, 11 Nov 2014 17:46:35 +0300 (MSK)
Received: (nullmailer pid 14569 invoked by uid 1000);
	Tue, 11 Nov 2014 14:46:34 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 11 Nov 2014 17:46:28 +0300
Message-Id: <c21fd2c79e1fcaf45582f2dd4deb491c257aa9f2.1415716845.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1415716845.git.mjt@msgid.tls.msk.ru>
References: <cover.1415716845.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Chen Gang <gang.chen.5i5j@gmail.com>
Subject: [Qemu-trivial] [PULL 06/11] pc-bios: petalogix-s3adsp1800.dtb: Use
	'xlnx, xps-ethernetlite-2.00.a' instead of 'xlnx,
	xps-ethernetlite-2.00.b'
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
X-List-Received-Date: Tue, 11 Nov 2014 14:53:56 -0000

From: Chen Gang <gang.chen.5i5j@gmail.com>

For Linux upstream kernel (e.g. 3.17-rc7), the related compatible string
'xlnx,xps-ethernetlite-2.00.a' is supported, but 'b' is not supported,
so change qemu dtb file to match kernel driver.

The related operation for qemu (after this patch):

   yum install libvirt
   yum install tunctl
   tunctl -b
   ip link set tap0 up
   brctl addif virbr0 tap0

   ./configure
   make
   ./microblaze-softmmu/qemu-system-microblaze -M petalogix-s3adsp1800 \
     -kernel ../linux-stable.microblaze/arch/microblaze/boot/linux.bin \
     -no-reboot -append "console=ttyUL0,115200 doreboot" -nographic \
     -net nic,vlan=0,model=xlnx.xps-ethernetlite,macaddr=00:16:35:AF:94:00 \
     -net tap,vlan=0,ifname=tap0,script=no,downscript=no

   in microblaze qemu bash (guest machine):

     ifconfig eth0 add 192.168.122.2 netmask 255.255.255.0
     ifconfig eth0 up

   Then can telnet 192.168.122.2 directly without password from the host
   machine.

The related operation for generating new dtb:

   building Linux kernel firstly, then get dts tool "./scripts/dts/dts".
   "./scripts/dtc/dtc -I dtb -O dts  -o ../work.dts ../qemu/petalogix-s3adsp1800.dtb"
   edit work.dts (replace 'xlnx,xps-ethernetlite-2.00.b')
   "./scripts/dtc/dtc -I dts -O dtb  -o ..qemu/petalogix-s3adsp1800.dtb ../work.dts"

(Since I am not quite sure whether can read this patch or not, I put the
related dtb file in attachment, please check, thanks).

Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 pc-bios/petalogix-s3adsp1800.dtb |  Bin 8259 -> 8259 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)

diff --git a/pc-bios/petalogix-s3adsp1800.dtb b/pc-bios/petalogix-s3adsp1800.dtb
index 93c5973fd81244268aace6e5e6006ad6fb4d6199..8ac80f2f2d191a8491b71182be50b3df2989551d 100644
GIT binary patch
delta 14
VcmX@?aM)pkI6GtFW(js}NdPEw1Wf<{

delta 14
VcmX@?aM)pkI6Gs~W(js}NdPE$1Wo_|

-- 
1.7.10.4


