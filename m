Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UcUq0-0005Dr-3g
	for mharc-qemu-trivial@gnu.org; Wed, 15 May 2013 02:05:20 -0400
Received: from eggs.gnu.org ([208.118.235.92]:49782)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hutao@cn.fujitsu.com>) id 1UcUpw-0005Cm-U7
	for qemu-trivial@nongnu.org; Wed, 15 May 2013 02:05:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hutao@cn.fujitsu.com>) id 1UcUpv-0005sH-M4
	for qemu-trivial@nongnu.org; Wed, 15 May 2013 02:05:16 -0400
Received: from [222.73.24.84] (port=25961 helo=song.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hutao@cn.fujitsu.com>)
	id 1UcUpv-0005rC-BP; Wed, 15 May 2013 02:05:15 -0400
X-IronPort-AV: E=Sophos;i="4.87,675,1363104000"; 
   d="scan'208";a="7273547"
Received: from unknown (HELO tang.cn.fujitsu.com) ([10.167.250.3])
	by song.cn.fujitsu.com with ESMTP; 15 May 2013 14:02:13 +0800
Received: from fnstmail02.fnst.cn.fujitsu.com (tang.cn.fujitsu.com [127.0.0.1])
	by tang.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id r4F651k5000318;
	Wed, 15 May 2013 14:05:01 +0800
Received: from localhost.localdomain ([10.167.233.156])
	by fnstmail02.fnst.cn.fujitsu.com (Lotus Domino Release 8.5.3)
	with ESMTP id 2013051514035503-1244316 ;
	Wed, 15 May 2013 14:03:55 +0800 
From: Hu Tao <hutao@cn.fujitsu.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Wed, 15 May 2013 14:04:29 +0800
Message-Id: <1368597869-30405-1-git-send-email-hutao@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.1.4
X-MIMETrack: Itemize by SMTP Server on mailserver/fnst(Release 8.5.3|September
	15, 2011) at 2013/05/15 14:03:55,
	Serialize by Router on mailserver/fnst(Release 8.5.3|September 15,
	2011) at 2013/05/15 14:03:55,
	Serialize complete at 2013/05/15 14:03:55
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 222.73.24.84
Cc: Anthony Green <green@moxielogic.com>
Subject: [Qemu-trivial] [PATCH] target-moxie: replace target_phys_addr_t
	with hwaddr
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
X-List-Received-Date: Wed, 15 May 2013 06:05:18 -0000

target_phys_addr_t has been already replaced by hwaddr, but this
one is introduced after.

Signed-off-by: Hu Tao <hutao@cn.fujitsu.com>
---
 target-moxie/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target-moxie/helper.c b/target-moxie/helper.c
index 6e0ac2a..5cfe889 100644
--- a/target-moxie/helper.c
+++ b/target-moxie/helper.c
@@ -116,7 +116,7 @@ int cpu_moxie_handle_mmu_fault(CPUMoxieState *env, target_ulong address,
     return 1;
 }
 
-target_phys_addr_t cpu_get_phys_page_debug(CPUState *env, target_ulong addr)
+hwaddr cpu_get_phys_page_debug(CPUState *env, target_ulong addr)
 {
     return addr;
 }
-- 
1.8.1.4


