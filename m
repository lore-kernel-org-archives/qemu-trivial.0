Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VSkoF-0006so-QY
	for mharc-qemu-trivial@gnu.org; Sun, 06 Oct 2013 05:39:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47664)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VSko9-0006de-7C
	for qemu-trivial@nongnu.org; Sun, 06 Oct 2013 05:39:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VSko4-0003OI-OS
	for qemu-trivial@nongnu.org; Sun, 06 Oct 2013 05:39:25 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:36837)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VSknv-0003LN-MC; Sun, 06 Oct 2013 05:39:11 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 28A2840D05;
	Sun,  6 Oct 2013 13:39:10 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 7BBDE512;
	Sun,  6 Oct 2013 13:33:03 +0400 (MSK)
Received: (nullmailer pid 25810 invoked by uid 1000);
	Sun, 06 Oct 2013 09:33:02 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@us.ibm.com
Date: Sun,  6 Oct 2013 13:32:51 +0400
Message-Id: <1381051979-25742-7-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1381051979-25742-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1381051979-25742-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 06/14] target-i386: Fix compiler warning
	(integer constant is too large)
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
X-List-Received-Date: Sun, 06 Oct 2013 09:39:29 -0000

From: Stefan Weil <sw@weilnetz.de>

From buildbot default_i386_rhel61:

  CC    i386-softmmu/target-i386/arch_memory_mapping.o
target-i386/arch_memory_mapping.c: In function 'walk_pde':
target-i386/arch_memory_mapping.c:110: warning:
 integer constant is too large for 'long' type

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 target-i386/arch_memory_mapping.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target-i386/arch_memory_mapping.c b/target-i386/arch_memory_mapping.c
index 2566a04..462f984 100644
--- a/target-i386/arch_memory_mapping.c
+++ b/target-i386/arch_memory_mapping.c
@@ -75,7 +75,7 @@ static void walk_pte2(MemoryMappingList *list,
 }
 
 /* PAE Paging or IA-32e Paging */
-#define PLM4_ADDR_MASK 0xffffffffff000 /* selects bits 51:12 */
+#define PLM4_ADDR_MASK 0xffffffffff000ULL /* selects bits 51:12 */
 
 static void walk_pde(MemoryMappingList *list, hwaddr pde_start_addr,
                      int32_t a20_mask, target_ulong start_line_addr)
-- 
1.7.10.4


