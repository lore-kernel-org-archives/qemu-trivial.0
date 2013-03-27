Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UKjbU-00036T-So
	for mharc-qemu-trivial@gnu.org; Wed, 27 Mar 2013 02:12:56 -0400
Received: from eggs.gnu.org ([208.118.235.92]:43435)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>) id 1UKjbT-00036M-6h
	for qemu-trivial@nongnu.org; Wed, 27 Mar 2013 02:12:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>) id 1UKjbS-0008Sr-9G
	for qemu-trivial@nongnu.org; Wed, 27 Mar 2013 02:12:55 -0400
Received: from [222.73.24.84] (port=34634 helo=song.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>)
	id 1UKjbR-0008Qt-V0; Wed, 27 Mar 2013 02:12:54 -0400
X-IronPort-AV: E=Sophos;i="4.87,357,1363104000"; 
   d="scan'208";a="6953392"
Received: from unknown (HELO tang.cn.fujitsu.com) ([10.167.250.3])
	by song.cn.fujitsu.com with ESMTP; 27 Mar 2013 14:10:13 +0800
Received: from fnstmail02.fnst.cn.fujitsu.com (tang.cn.fujitsu.com [127.0.0.1])
	by tang.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id r2R6Ch0r026015;
	Wed, 27 Mar 2013 14:12:44 +0800
Received: from liguang.fnst.cn.fujitsu.com ([10.167.233.147])
	by fnstmail02.fnst.cn.fujitsu.com (Lotus Domino Release 8.5.3)
	with ESMTP id 2013032714115285-93382 ;
	Wed, 27 Mar 2013 14:11:52 +0800 
From: liguang <lig.fnst@cn.fujitsu.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Wed, 27 Mar 2013 14:10:31 +0800
Message-Id: <1364364631-24665-1-git-send-email-lig.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.2.5
X-MIMETrack: Itemize by SMTP Server on mailserver/fnst(Release 8.5.3|September
	15, 2011) at 2013/03/27 14:11:53,
	Serialize by Router on mailserver/fnst(Release 8.5.3|September 15,
	2011) at 2013/03/27 14:11:57,
	Serialize complete at 2013/03/27 14:11:57
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 222.73.24.84
Cc: liguang <lig.fnst@cn.fujitsu.com>
Subject: [Qemu-trivial] [Qemu-devel][PATCH] hw/i386/pc: reject to boot a
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
X-List-Received-Date: Wed, 27 Mar 2013 06:12:56 -0000

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
 hw/i386/pc.c |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index b1e06fa..2b78dfc 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -683,8 +683,10 @@ static void load_linux(void *fw_cfg,
         if (load_multiboot(fw_cfg, f, kernel_filename, initrd_filename,
                            kernel_cmdline, kernel_size, header)) {
             return;
+        } else {
+            fprintf(stderr, "please assure specicified kernel is for x86!\n");
+            exit(1);
         }
-        protocol = 0;
     }
 
     if (protocol < 0x200 || !(header[0x211] & 0x01)) {
-- 
1.7.2.5


