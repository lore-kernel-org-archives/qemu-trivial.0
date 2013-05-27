Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UgnRQ-00025n-QA
	for mharc-qemu-trivial@gnu.org; Sun, 26 May 2013 22:45:44 -0400
Received: from eggs.gnu.org ([208.118.235.92]:39441)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>) id 1UgnRN-000213-5s
	for qemu-trivial@nongnu.org; Sun, 26 May 2013 22:45:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>) id 1UgnRM-0006X6-8H
	for qemu-trivial@nongnu.org; Sun, 26 May 2013 22:45:41 -0400
Received: from [222.73.24.84] (port=38826 helo=song.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>)
	id 1UgnRE-0006UX-5a; Sun, 26 May 2013 22:45:32 -0400
X-IronPort-AV: E=Sophos;i="4.87,747,1363104000"; 
   d="scan'208";a="7374475"
Received: from unknown (HELO tang.cn.fujitsu.com) ([10.167.250.3])
	by song.cn.fujitsu.com with ESMTP; 27 May 2013 10:42:39 +0800
Received: from fnstmail02.fnst.cn.fujitsu.com (tang.cn.fujitsu.com [127.0.0.1])
	by tang.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id r4R2jSMP021014;
	Mon, 27 May 2013 10:45:29 +0800
Received: from liguang.fnst.cn.fujitsu.com ([10.167.233.147])
	by fnstmail02.fnst.cn.fujitsu.com (Lotus Domino Release 8.5.3)
	with ESMTP id 2013052710440266-1547477 ;
	Mon, 27 May 2013 10:44:02 +0800 
From: liguang <lig.fnst@cn.fujitsu.com>
To: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Date: Mon, 27 May 2013 10:42:57 +0800
Message-Id: <1369622578-27443-3-git-send-email-lig.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1369622578-27443-1-git-send-email-lig.fnst@cn.fujitsu.com>
References: <1369622578-27443-1-git-send-email-lig.fnst@cn.fujitsu.com>
X-MIMETrack: Itemize by SMTP Server on mailserver/fnst(Release 8.5.3|September
	15, 2011) at 2013/05/27 10:44:02,
	Serialize by Router on mailserver/fnst(Release 8.5.3|September 15,
	2011) at 2013/05/27 10:44:04,
	Serialize complete at 2013/05/27 10:44:04
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 222.73.24.84
Cc: Paolo Bonzini <pbonzini@redhat.com>, Anthony Liguori <aliguori@us.ibm.com>,
	Gerd Hoffmann <kraxel@redhat.com>, liguang <lig.fnst@cn.fujitsu.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [Qemu-trivial] [PATCH 2/3] debugcon: beautify debugcon debug output
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
X-List-Received-Date: Mon, 27 May 2013 02:45:42 -0000

use '[...msg...]' to separate debug console output
from device debug output

Signed-off-by: liguang <lig.fnst@cn.fujitsu.com>
---
 hw/char/debugcon.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/char/debugcon.c b/hw/char/debugcon.c
index cb31544..de73f1b 100644
--- a/hw/char/debugcon.c
+++ b/hw/char/debugcon.c
@@ -55,8 +55,8 @@ static void debugcon_ioport_write(void *opaque, hwaddr addr, uint64_t val,
     unsigned char ch = val;
 
 #ifdef DEBUG_DEBUGCON
-    printf("debugcon: write addr=0x%04" HWADDR_PRIx " val=0x%02"
-           PRIx64 "\n", addr, val);
+    printf(" [debugcon: write addr=0x%04" HWADDR_PRIx " val=0x%02"
+           PRIx64 "]\n", addr, val);
 #endif
 
     qemu_chr_fe_write(s->chr, &ch, 1);
-- 
1.7.2.5


