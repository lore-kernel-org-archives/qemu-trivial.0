Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VQJLo-0001IZ-P0
	for mharc-qemu-trivial@gnu.org; Sun, 29 Sep 2013 11:56:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36971)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VQJLm-0001H2-UD
	for qemu-trivial@nongnu.org; Sun, 29 Sep 2013 11:56:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VQJLm-0006D3-44
	for qemu-trivial@nongnu.org; Sun, 29 Sep 2013 11:56:02 -0400
Received: from qemu.weilnetz.de ([2a03:4000:2:362::1]:50571
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VQJLk-0006Ca-8o; Sun, 29 Sep 2013 11:56:00 -0400
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id 8D17C1808A5; Sun, 29 Sep 2013 17:55:57 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel <qemu-devel@nongnu.org>
Date: Sun, 29 Sep 2013 17:55:56 +0200
Message-Id: <1380470156-22381-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:2:362::1
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH] target-i386: Fix compiler warning (integer
	constant is too large)
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
X-List-Received-Date: Sun, 29 Sep 2013 15:56:03 -0000

From buildbot default_i386_rhel61:

  CC    i386-softmmu/target-i386/arch_memory_mapping.o
target-i386/arch_memory_mapping.c: In function 'walk_pde':
target-i386/arch_memory_mapping.c:110: warning:
 integer constant is too large for 'long' type

Signed-off-by: Stefan Weil <sw@weilnetz.de>
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


