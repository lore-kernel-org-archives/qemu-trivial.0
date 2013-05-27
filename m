Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UgnRK-0001wg-9U
	for mharc-qemu-trivial@gnu.org; Sun, 26 May 2013 22:45:38 -0400
Received: from eggs.gnu.org ([208.118.235.92]:39406)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>) id 1UgnRI-0001tx-2Y
	for qemu-trivial@nongnu.org; Sun, 26 May 2013 22:45:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>) id 1UgnRG-0006WA-IA
	for qemu-trivial@nongnu.org; Sun, 26 May 2013 22:45:36 -0400
Received: from [222.73.24.84] (port=38826 helo=song.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>)
	id 1UgnRC-0006UX-W0; Sun, 26 May 2013 22:45:31 -0400
X-IronPort-AV: E=Sophos;i="4.87,747,1363104000"; 
   d="scan'208";a="7374474"
Received: from unknown (HELO tang.cn.fujitsu.com) ([10.167.250.3])
	by song.cn.fujitsu.com with ESMTP; 27 May 2013 10:42:38 +0800
Received: from fnstmail02.fnst.cn.fujitsu.com (tang.cn.fujitsu.com [127.0.0.1])
	by tang.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id r4R2jSMO021014;
	Mon, 27 May 2013 10:45:28 +0800
Received: from liguang.fnst.cn.fujitsu.com ([10.167.233.147])
	by fnstmail02.fnst.cn.fujitsu.com (Lotus Domino Release 8.5.3)
	with ESMTP id 2013052710440201-1547476 ;
	Mon, 27 May 2013 10:44:02 +0800 
From: liguang <lig.fnst@cn.fujitsu.com>
To: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Date: Mon, 27 May 2013 10:42:56 +0800
Message-Id: <1369622578-27443-2-git-send-email-lig.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1369622578-27443-1-git-send-email-lig.fnst@cn.fujitsu.com>
References: <1369622578-27443-1-git-send-email-lig.fnst@cn.fujitsu.com>
X-MIMETrack: Itemize by SMTP Server on mailserver/fnst(Release 8.5.3|September
	15, 2011) at 2013/05/27 10:44:02,
	Serialize by Router on mailserver/fnst(Release 8.5.3|September 15,
	2011) at 2013/05/27 10:44:03,
	Serialize complete at 2013/05/27 10:44:03
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 222.73.24.84
Cc: Paolo Bonzini <pbonzini@redhat.com>, Anthony Liguori <aliguori@us.ibm.com>,
	Gerd Hoffmann <kraxel@redhat.com>, liguang <lig.fnst@cn.fujitsu.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [Qemu-trivial] [PATCH 1/3] debugcon: fix debug format specifiers
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
X-List-Received-Date: Mon, 27 May 2013 02:45:37 -0000

some specifiers of printing format for debugcon
debug were wrong, either always print 0 for any
values wrote to debugcon or spit compiler warnings,
so fix them.

Signed-off-by: liguang <lig.fnst@cn.fujitsu.com>
---
 hw/char/debugcon.c |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/char/debugcon.c b/hw/char/debugcon.c
index 02c9577..cb31544 100644
--- a/hw/char/debugcon.c
+++ b/hw/char/debugcon.c
@@ -55,7 +55,8 @@ static void debugcon_ioport_write(void *opaque, hwaddr addr, uint64_t val,
     unsigned char ch = val;
 
 #ifdef DEBUG_DEBUGCON
-    printf("debugcon: write addr=0x%04x val=0x%02x\n", addr, val);
+    printf("debugcon: write addr=0x%04" HWADDR_PRIx " val=0x%02"
+           PRIx64 "\n", addr, val);
 #endif
 
     qemu_chr_fe_write(s->chr, &ch, 1);
@@ -67,7 +68,7 @@ static uint64_t debugcon_ioport_read(void *opaque, hwaddr addr, unsigned width)
     DebugconState *s = opaque;
 
 #ifdef DEBUG_DEBUGCON
-    printf("debugcon: read addr=0x%04x\n", addr);
+    printf("debugcon: read addr=0x%04" HWADDR_PRIx "\n", addr);
 #endif
 
     return s->readback;
-- 
1.7.2.5


