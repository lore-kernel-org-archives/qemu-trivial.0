Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W2x3H-0001i9-St
	for mharc-qemu-trivial@gnu.org; Tue, 14 Jan 2014 01:00:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55732)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1W2x3F-0001fw-5K
	for qemu-trivial@nongnu.org; Tue, 14 Jan 2014 01:00:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1W2x3E-0000UI-56
	for qemu-trivial@nongnu.org; Tue, 14 Jan 2014 01:00:36 -0500
Received: from qemu.weilnetz.de ([2a03:4000:2:362::1]:46064
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1W2x3C-0000Tq-3b; Tue, 14 Jan 2014 01:00:34 -0500
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id F2FC217FB92; Tue, 14 Jan 2014 07:00:28 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Tue, 14 Jan 2014 07:00:28 +0100
Message-Id: <1389679228-15870-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:2:362::1
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH] exec: Exclude non portable function for MinGW
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
X-List-Received-Date: Tue, 14 Jan 2014 06:00:38 -0000

cpu_physical_memory_set_dirty_lebitmap calls getpageaddr and ffsl which are
unavailable for MinGW. As the function is unused for MinGW, it can simply
be excluded from compilation.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 include/exec/ram_addr.h |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
index 33c8acc..481a447 100644
--- a/include/exec/ram_addr.h
+++ b/include/exec/ram_addr.h
@@ -79,6 +79,7 @@ static inline void cpu_physical_memory_set_dirty_range(ram_addr_t start,
     xen_modified_memory(start, length);
 }
 
+#if !defined(_WIN32)
 static inline void cpu_physical_memory_set_dirty_lebitmap(unsigned long *bitmap,
                                                           ram_addr_t start,
                                                           ram_addr_t pages)
@@ -127,6 +128,7 @@ static inline void cpu_physical_memory_set_dirty_lebitmap(unsigned long *bitmap,
         }
     }
 }
+#endif /* not _WIN32 */
 
 static inline void cpu_physical_memory_clear_dirty_range(ram_addr_t start,
                                                          ram_addr_t length,
-- 
1.7.10.4


