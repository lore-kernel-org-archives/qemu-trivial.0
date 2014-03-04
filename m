Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WKiwR-0004jW-6Y
	for mharc-qemu-trivial@gnu.org; Tue, 04 Mar 2014 01:35:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35171)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WKiwF-0004Np-GB
	for qemu-trivial@nongnu.org; Tue, 04 Mar 2014 01:34:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WKiwB-0007kQ-3z
	for qemu-trivial@nongnu.org; Tue, 04 Mar 2014 01:34:51 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:50465)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WKivv-0007dR-RD; Tue, 04 Mar 2014 01:34:32 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id A7E794084F;
	Tue,  4 Mar 2014 10:34:30 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 2BD0E64F;
	Tue,  4 Mar 2014 10:16:04 +0400 (MSK)
Received: (nullmailer pid 16577 invoked by uid 1000);
	Tue, 04 Mar 2014 06:16:03 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue,  4 Mar 2014 10:15:52 +0400
Message-Id: <1393913761-16516-5-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1393913761-16516-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1393913761-16516-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 04/13] bswap: Modify prototypes of st[wl]_{le,
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
X-List-Received-Date: Tue, 04 Mar 2014 06:34:57 -0000

From: Stefan Weil <sw@weilnetz.de>

The functions use uint16_t or uint32_t values, so show this in the function
prototypes. Non-optimizing compilers will avoid unnecessary type
conversions when generating calls of these inline functions.

stq_le_p, stq_be_p already use similar prototypes.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Laszlo Ersek <lersek@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
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


