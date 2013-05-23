Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UfPT1-0004lp-Hl
	for mharc-qemu-trivial@gnu.org; Thu, 23 May 2013 02:57:39 -0400
Received: from eggs.gnu.org ([208.118.235.92]:39624)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>) id 1UfPSz-0004jE-SO
	for qemu-trivial@nongnu.org; Thu, 23 May 2013 02:57:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>) id 1UfPSy-0005n0-S5
	for qemu-trivial@nongnu.org; Thu, 23 May 2013 02:57:37 -0400
Received: from [222.73.24.84] (port=58130 helo=song.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>)
	id 1UfPSv-0005l9-Rd; Thu, 23 May 2013 02:57:34 -0400
X-IronPort-AV: E=Sophos;i="4.87,726,1363104000"; 
   d="scan'208";a="7342559"
Received: from unknown (HELO tang.cn.fujitsu.com) ([10.167.250.3])
	by song.cn.fujitsu.com with ESMTP; 23 May 2013 14:54:39 +0800
Received: from fnstmail02.fnst.cn.fujitsu.com (tang.cn.fujitsu.com [127.0.0.1])
	by tang.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id r4N6vScc017351;
	Thu, 23 May 2013 14:57:28 +0800
Received: from liguang.fnst.cn.fujitsu.com ([10.167.233.147])
	by fnstmail02.fnst.cn.fujitsu.com (Lotus Domino Release 8.5.3)
	with ESMTP id 2013052314560904-1464698 ;
	Thu, 23 May 2013 14:56:09 +0800 
From: liguang <lig.fnst@cn.fujitsu.com>
To: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Date: Thu, 23 May 2013 14:57:19 +0800
Message-Id: <1369292241-31712-1-git-send-email-lig.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.2.5
X-MIMETrack: Itemize by SMTP Server on mailserver/fnst(Release 8.5.3|September
	15, 2011) at 2013/05/23 14:56:09,
	Serialize by Router on mailserver/fnst(Release 8.5.3|September 15,
	2011) at 2013/05/23 14:56:09,
	Serialize complete at 2013/05/23 14:56:09
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 222.73.24.84
Cc: liguang <lig.fnst@cn.fujitsu.com>
Subject: [Qemu-trivial] [PATCH][v4 1/3] debugcon: fix always print "addr=0x0,
	val=0x0" bug
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
X-List-Received-Date: Thu, 23 May 2013 06:57:39 -0000

when use DEBUG_DEBUGCON, screen spits:
debugcon: write addr=0x0000 val=0x00
Rdebugcon: write addr=0x0000 val=0x00
udebugcon: write addr=0x0000 val=0x00
ndebugcon: write addr=0x0000 val=0x00
ndebugcon: write addr=0x0000 val=0x00
idebugcon: write addr=0x0000 val=0x00
ndebugcon: write addr=0x0000 val=0x00
gdebugcon: write addr=0x0000 val=0x00
 debugcon: write addr=0x0000 val=0x00
odebugcon: write addr=0x0000 val=0x00
pdebugcon: write addr=0x0000 val=0x00
tdebugcon: write addr=0x0000 val=0x00
idebugcon: write addr=0x0000 val=0x00
odebugcon: write addr=0x0000 val=0x00
ndebugcon: write addr=0x0000 val=0x00
 debugcon: write addr=0x0000 val=0x00
rdebugcon: write addr=0x0000 val=0x00
odebugcon: write addr=0x0000 val=0x00
mdebugcon: write addr=0x0000 val=0x00
 debugcon: write addr=0x0000 val=0x00
adebugcon: write addr=0x0000 val=0x00
tdebugcon: write addr=0x0000 val=0x00
 debugcon: write addr=0x0000 val=0x00

Oh, that's wrong, val is not always be 0.
this bug caused by lack of length modifier
for specifier 'x'.

Signed-off-by: liguang <lig.fnst@cn.fujitsu.com>
---
v4: fix misleading subject
---
 hw/char/debugcon.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/hw/char/debugcon.c b/hw/char/debugcon.c
index 02c9577..7e41c90 100644
--- a/hw/char/debugcon.c
+++ b/hw/char/debugcon.c
@@ -55,7 +55,7 @@ static void debugcon_ioport_write(void *opaque, hwaddr addr, uint64_t val,
     unsigned char ch = val;
 
 #ifdef DEBUG_DEBUGCON
-    printf("debugcon: write addr=0x%04x val=0x%02x\n", addr, val);
+    printf("debugcon: write addr=0x%04" HWADDR_PRIx " val=0x%02x\n", addr, val);
 #endif
 
     qemu_chr_fe_write(s->chr, &ch, 1);
-- 
1.7.2.5


