Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WFzRz-0008H7-9j
	for mharc-qemu-trivial@gnu.org; Wed, 19 Feb 2014 00:12:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37962)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1WFzRw-0008Ea-TT
	for qemu-trivial@nongnu.org; Wed, 19 Feb 2014 00:12:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1WFzRw-00056k-3n
	for qemu-trivial@nongnu.org; Wed, 19 Feb 2014 00:12:00 -0500
Received: from qemu.weilnetz.de ([2a03:4000:2:362::1]:36916
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1WFzRo-0004vZ-8n; Wed, 19 Feb 2014 00:11:52 -0500
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id 5362F180102; Wed, 19 Feb 2014 06:11:49 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org
Date: Wed, 19 Feb 2014 06:11:44 +0100
Message-Id: <1392786705-9730-2-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1392786705-9730-1-git-send-email-sw@weilnetz.de>
References: <1392786705-9730-1-git-send-email-sw@weilnetz.de>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:2:362::1
Cc: Stefan Weil <sw@weilnetz.de>, Laszlo Ersek <lersek@redhat.com>,
	qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH 1/2] bswap: Modify prototype of stb_p (avoid
	type conversions)
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
X-List-Received-Date: Wed, 19 Feb 2014 05:12:01 -0000

The function uses an uint8_t value, so show this in the function
prototype. Non-optimizing compilers will avoid unnecessary type
conversions from (u)int8_t to int and back to uint8_t when generating
calls of this inline function.

stw_p, stl_p and stq_p already use similar prototypes.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 include/qemu/bswap.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/qemu/bswap.h b/include/qemu/bswap.h
index 437b8e0..0cc11a5 100644
--- a/include/qemu/bswap.h
+++ b/include/qemu/bswap.h
@@ -228,7 +228,7 @@ static inline int ldsb_p(const void *ptr)
     return *(int8_t *)ptr;
 }
 
-static inline void stb_p(void *ptr, int v)
+static inline void stb_p(void *ptr, uint8_t v)
 {
     *(uint8_t *)ptr = v;
 }
-- 
1.7.10.4


