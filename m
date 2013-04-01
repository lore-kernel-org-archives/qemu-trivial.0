Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UMTU9-00017r-5P
	for mharc-qemu-trivial@gnu.org; Sun, 31 Mar 2013 21:24:33 -0400
Received: from eggs.gnu.org ([208.118.235.92]:57835)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>) id 1UMTU3-00017h-1J
	for qemu-trivial@nongnu.org; Sun, 31 Mar 2013 21:24:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>) id 1UMTTy-0000ka-8h
	for qemu-trivial@nongnu.org; Sun, 31 Mar 2013 21:24:26 -0400
Received: from [222.73.24.84] (port=3103 helo=song.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>)
	id 1UMTTx-0000kN-U8; Sun, 31 Mar 2013 21:24:22 -0400
X-IronPort-AV: E=Sophos;i="4.87,384,1363104000"; 
   d="scan'208";a="6979804"
Received: from unknown (HELO tang.cn.fujitsu.com) ([10.167.250.3])
	by song.cn.fujitsu.com with ESMTP; 01 Apr 2013 09:21:46 +0800
Received: from fnstmail02.fnst.cn.fujitsu.com (tang.cn.fujitsu.com [127.0.0.1])
	by tang.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id r311OJdU012725;
	Mon, 1 Apr 2013 09:24:19 +0800
Received: from liguang.fnst.cn.fujitsu.com ([10.167.233.147])
	by fnstmail02.fnst.cn.fujitsu.com (Lotus Domino Release 8.5.3)
	with ESMTP id 2013040109232423-189315 ;
	Mon, 1 Apr 2013 09:23:24 +0800 
From: liguang <lig.fnst@cn.fujitsu.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, stefanha@gmail.com
Date: Mon, 1 Apr 2013 09:21:57 +0800
Message-Id: <1364779317-3963-1-git-send-email-lig.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.2.5
X-MIMETrack: Itemize by SMTP Server on mailserver/fnst(Release 8.5.3|September
	15, 2011) at 2013/04/01 09:23:24,
	Serialize by Router on mailserver/fnst(Release 8.5.3|September 15,
	2011) at 2013/04/01 09:23:24,
	Serialize complete at 2013/04/01 09:23:24
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 222.73.24.84
Cc: liguang <lig.fnst@cn.fujitsu.com>
Subject: [Qemu-trivial] [Qemu-devel][PATCH v2] hw/i386/pc: reject to boot a
	wrong header magic kernel
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
X-List-Received-Date: Mon, 01 Apr 2013 01:24:32 -0000

if head magic is missing or wrong unexpectedly, we'd
better to reject booting.
e.g.
I make a mistake to boot a vmlinuz for MIPS(which
I think it's for x86) like this:
qemu-system-x86_64 -kernel vmlinuz -initrd demord
then qemu report:
"qemu: linux kernel too old to load a ram disk"
that's misleading.

Signed-off-by: liguang <lig.fnst@cn.fujitsu.com>
---
 hw/i386/pc.c |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index b1e06fa..bfbb5fe 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -683,6 +683,9 @@ static void load_linux(void *fw_cfg,
         if (load_multiboot(fw_cfg, f, kernel_filename, initrd_filename,
                            kernel_cmdline, kernel_size, header)) {
             return;
+        } else {
+            fprintf(stderr, "not a valid multiboot image!\n");
+            exit(1);
         }
         protocol = 0;
     }
-- 
1.7.2.5


