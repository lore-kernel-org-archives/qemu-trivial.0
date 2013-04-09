Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UPOIr-0002jZ-Ur
	for mharc-qemu-trivial@gnu.org; Mon, 08 Apr 2013 22:28:57 -0400
Received: from eggs.gnu.org ([208.118.235.92]:59705)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>) id 1UPOIp-0002jS-NX
	for qemu-trivial@nongnu.org; Mon, 08 Apr 2013 22:28:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>) id 1UPOIo-0000wu-S1
	for qemu-trivial@nongnu.org; Mon, 08 Apr 2013 22:28:55 -0400
Received: from [222.73.24.84] (port=50184 helo=song.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>)
	id 1UPOIo-0000vG-HP; Mon, 08 Apr 2013 22:28:54 -0400
X-IronPort-AV: E=Sophos;i="4.87,435,1363104000"; 
   d="scan'208";a="7018297"
Received: from unknown (HELO tang.cn.fujitsu.com) ([10.167.250.3])
	by song.cn.fujitsu.com with ESMTP; 09 Apr 2013 10:26:10 +0800
Received: from fnstmail02.fnst.cn.fujitsu.com (tang.cn.fujitsu.com [127.0.0.1])
	by tang.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id r392Sluq022008;
	Tue, 9 Apr 2013 10:28:47 +0800
Received: from liguang.fnst.cn.fujitsu.com ([10.167.233.147])
	by fnstmail02.fnst.cn.fujitsu.com (Lotus Domino Release 8.5.3)
	with ESMTP id 2013040910273883-389332 ;
	Tue, 9 Apr 2013 10:27:38 +0800 
From: liguang <lig.fnst@cn.fujitsu.com>
To: Stefan Hajnoczi <stefanha@gmail.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Date: Tue, 9 Apr 2013 10:27:41 +0800
Message-Id: <1365474461-17474-1-git-send-email-lig.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.2.5
X-MIMETrack: Itemize by SMTP Server on mailserver/fnst(Release 8.5.3|September
	15, 2011) at 2013/04/09 10:27:39,
	Serialize by Router on mailserver/fnst(Release 8.5.3|September 15,
	2011) at 2013/04/09 10:27:39,
	Serialize complete at 2013/04/09 10:27:39
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 222.73.24.84
Cc: liguang <lig.fnst@cn.fujitsu.com>
Subject: [Qemu-trivial] [Qemu-devel][PATCH v3] hw/i386/pc: prompt not
	multboot or morden kernel image
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
X-List-Received-Date: Tue, 09 Apr 2013 02:28:56 -0000

if head magic is missing or wrong unexpectedly, we'd
better to prompt memssage for this.
e.g.
I make a mistake to boot a vmlinuz for MIPS(which
I think it's for x86) like this:
qemu-system-x86_64 -kernel vmlinuz -initrd demord
then qemu report:
"qemu: linux kernel too old to load a ram disk"
that's misleading.

Signed-off-by: liguang <lig.fnst@cn.fujitsu.com>
---
 hw/i386/pc.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index ebbf059..6b29c3f 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -686,6 +686,8 @@ static void load_linux(void *fw_cfg,
         if (load_multiboot(fw_cfg, f, kernel_filename, initrd_filename,
                            kernel_cmdline, kernel_size, header)) {
             return;
+        } else {
+            fprintf(stderr, "warn: invalid multiboot or modern kernel image\n");
         }
         protocol = 0;
     }
-- 
1.7.2.5


