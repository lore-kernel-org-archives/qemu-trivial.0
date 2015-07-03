Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZAxdG-000132-8F
	for mharc-qemu-trivial@gnu.org; Fri, 03 Jul 2015 05:51:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46383)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1ZAxdD-0000xU-Ql
	for qemu-trivial@nongnu.org; Fri, 03 Jul 2015 05:51:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1ZAxdA-0005XR-Js
	for qemu-trivial@nongnu.org; Fri, 03 Jul 2015 05:51:39 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:38542)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1ZAxd9-0005Uf-VW; Fri, 03 Jul 2015 05:51:36 -0400
Received: from 172.24.2.119 (EHLO szxeml431-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id COA60258; Fri, 03 Jul 2015 17:51:30 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml431-hub.china.huawei.com
	(10.82.67.208) with Microsoft SMTP Server id 14.3.158.1; Fri, 3 Jul 2015
	17:51:03 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Fri, 3 Jul 2015 17:50:57 +0800
Message-ID: <1435917057-9396-1-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>
Subject: [Qemu-trivial] [PATCH] qemu-doc: fix typos
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
X-List-Received-Date: Fri, 03 Jul 2015 09:51:41 -0000

From: Gonglei <arei.gonglei@huawei.com>

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
---
 qemu-doc.texi   | 2 +-
 qemu-options.hx | 2 +-
 qemu-tech.texi  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/qemu-doc.texi b/qemu-doc.texi
index 0125bc7..94af8c0 100644
--- a/qemu-doc.texi
+++ b/qemu-doc.texi
@@ -1061,7 +1061,7 @@ type is assumed.
 @var{server} specifies the server where the volume file specification for
 the given volume resides. This can be either hostname, ipv4 address
 or ipv6 address. ipv6 address needs to be within square brackets [ ].
-If transport type is unix, then @var{server} field should not be specifed.
+If transport type is unix, then @var{server} field should not be specified.
 Instead @var{socket} field needs to be populated with the path to unix domain
 socket.
 
diff --git a/qemu-options.hx b/qemu-options.hx
index 7b8efbf..5bfa7a3 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -206,7 +206,7 @@ STEXI
 @item -boot [order=@var{drives}][,once=@var{drives}][,menu=on|off][,splash=@var{sp_name}][,splash-time=@var{sp_time}][,reboot-timeout=@var{rb_timeout}][,strict=on|off]
 @findex -boot
 Specify boot order @var{drives} as a string of drive letters. Valid
-drive letters depend on the target achitecture. The x86 PC uses: a, b
+drive letters depend on the target architecture. The x86 PC uses: a, b
 (floppy 1 and 2), c (first hard disk), d (first CD-ROM), n-p (Etherboot
 from network adapter 1-4), hard disk boot is the default. To apply a
 particular boot order only on the first startup, specify it via
diff --git a/qemu-tech.texi b/qemu-tech.texi
index 8aefa74..b6fcb2d 100644
--- a/qemu-tech.texi
+++ b/qemu-tech.texi
@@ -440,7 +440,7 @@ translator cannot deduce statically).
 @section Direct block chaining
 
 After each translated basic block is executed, QEMU uses the simulated
-Program Counter (PC) and other cpu state informations (such as the CS
+Program Counter (PC) and other cpu state information (such as the CS
 segment base value) to find the next basic block.
 
 In order to accelerate the most common cases where the new simulated PC
-- 
1.7.12.4



