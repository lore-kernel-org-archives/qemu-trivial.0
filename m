Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WFzSG-0000Pi-NK
	for mharc-qemu-trivial@gnu.org; Wed, 19 Feb 2014 00:12:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38181)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1WFzSA-0000CX-G7
	for qemu-trivial@nongnu.org; Wed, 19 Feb 2014 00:12:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1WFzS5-0005Bx-JX
	for qemu-trivial@nongnu.org; Wed, 19 Feb 2014 00:12:14 -0500
Received: from qemu.weilnetz.de ([37.221.198.45]:42887
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1WFzRo-0004x2-40; Wed, 19 Feb 2014 00:11:52 -0500
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id DA1941802B2; Wed, 19 Feb 2014 06:11:49 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org
Date: Wed, 19 Feb 2014 06:11:45 +0100
Message-Id: <1392786705-9730-3-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1392786705-9730-1-git-send-email-sw@weilnetz.de>
References: <1392786705-9730-1-git-send-email-sw@weilnetz.de>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.198.45
Cc: Stefan Weil <sw@weilnetz.de>, Laszlo Ersek <lersek@redhat.com>,
	qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH 2/2] bswap: Modify prototypes of st[wl]_{le,
	be}_p (avoid type conversions)
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
X-List-Received-Date: Wed, 19 Feb 2014 05:12:19 -0000

The function use uint16_t or uint32_t values, so show this in the function
prototypes. Non-optimizing compilers will avoid unnecessary type
conversions when generating calls of these inline function.

stq_le_p, stq_be_p already use similar prototypes.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 include/qemu/bswap.h |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/qemu/bswap.h b/include/qemu/bswap.h
index 0cc11a5..0cb7c05 100644
--- a/include/qemu/bswap.h
+++ b/include/qemu/bswap.h
@@ -300,12 +300,12 @@ static inline uint64_t ldq_le_p(const void *ptr)
     return le_bswap(ldq_p(ptr), 64);
 }
 
-static inline void stw_le_p(void *ptr, int v)
+static inline void stw_le_p(void *ptr, uint16_t v)
 {
     stw_p(ptr, le_bswap(v, 16));
 }
 
-static inline void stl_le_p(void *ptr, int v)
+static inline void stl_le_p(void *ptr, uint32_t v)
 {
     stl_p(ptr, le_bswap(v, 32));
 }
@@ -365,12 +365,12 @@ static inline uint64_t ldq_be_p(const void *ptr)
     return be_bswap(ldq_p(ptr), 64);
 }
 
-static inline void stw_be_p(void *ptr, int v)
+static inline void stw_be_p(void *ptr, uint16_t v)
 {
     stw_p(ptr, be_bswap(v, 16));
 }
 
-static inline void stl_be_p(void *ptr, int v)
+static inline void stl_be_p(void *ptr, uint32_t v)
 {
     stl_p(ptr, be_bswap(v, 32));
 }
-- 
1.7.10.4


