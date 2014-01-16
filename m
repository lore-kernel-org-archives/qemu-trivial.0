Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W3qy6-0000Qt-Vw
	for mharc-qemu-trivial@gnu.org; Thu, 16 Jan 2014 12:43:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58935)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1W3qxy-000096-1K
	for qemu-trivial@nongnu.org; Thu, 16 Jan 2014 12:42:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1W3qxt-00016S-Lj
	for qemu-trivial@nongnu.org; Thu, 16 Jan 2014 12:42:53 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:50409)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1W3qxj-0000xE-Ih; Thu, 16 Jan 2014 12:42:39 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 17CCE415D5;
	Thu, 16 Jan 2014 21:42:38 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id CD2855FC;
	Thu, 16 Jan 2014 21:35:24 +0400 (MSK)
Received: (nullmailer pid 16394 invoked by uid 1000);
	Thu, 16 Jan 2014 17:35:24 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@amazon.com
Date: Thu, 16 Jan 2014 21:35:12 +0400
Message-Id: <1389893719-16336-5-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1389893719-16336-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1389893719-16336-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 04/11] exec: Exclude non portable function for
	MinGW
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
X-List-Received-Date: Thu, 16 Jan 2014 17:42:59 -0000

From: Stefan Weil <sw@weilnetz.de>

cpu_physical_memory_set_dirty_lebitmap calls getpageaddr and ffsl which are
unavailable for MinGW. As the function is unused for MinGW, it can simply
be excluded from compilation.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
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


