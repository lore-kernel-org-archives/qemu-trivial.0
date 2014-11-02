Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xktwh-0005yL-Cj
	for mharc-qemu-trivial@gnu.org; Sun, 02 Nov 2014 07:07:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52849)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xktwc-0005oZ-8l
	for qemu-trivial@nongnu.org; Sun, 02 Nov 2014 07:07:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XktwY-0004gx-7H
	for qemu-trivial@nongnu.org; Sun, 02 Nov 2014 07:07:42 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:44053)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XktwK-0004e4-Vk; Sun, 02 Nov 2014 07:07:25 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id EA257402BE;
	Sun,  2 Nov 2014 15:07:23 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id B039171F;
	Sun,  2 Nov 2014 14:58:49 +0300 (MSK)
Received: (nullmailer pid 14997 invoked by uid 1000);
	Sun, 02 Nov 2014 11:58:47 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Sun,  2 Nov 2014 14:57:35 +0300
Message-Id: <f18a768efb990d9cd02911159de02e8ff5475239.1414929285.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1414929284.git.mjt@msgid.tls.msk.ru>
References: <cover.1414929284.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1414929284.git.mjt@msgid.tls.msk.ru>
References: <cover.1414929284.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	SeokYeon Hwang <syeon.hwang@samsung.com>
Subject: [Qemu-trivial] [PULL 23/23] vdi: wrapped uuid_unparse() in #ifdef
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
X-List-Received-Date: Sun, 02 Nov 2014 12:07:43 -0000

From: SeokYeon Hwang <syeon.hwang@samsung.com>

Wrapped uuid_unparse() in #ifdef to avoid "-Wunused-function"
on clang 3.4 or later.

Signed-off-by: SeokYeon Hwang <syeon.hwang@samsung.com>
Reviewed-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 block/vdi.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/block/vdi.c b/block/vdi.c
index 19701ee..e1d211c 100644
--- a/block/vdi.c
+++ b/block/vdi.c
@@ -137,12 +137,14 @@ static inline int uuid_is_null(const uuid_t uu)
     return memcmp(uu, null_uuid, sizeof(uuid_t)) == 0;
 }
 
+# if defined(CONFIG_VDI_DEBUG)
 static inline void uuid_unparse(const uuid_t uu, char *out)
 {
     snprintf(out, 37, UUID_FMT,
             uu[0], uu[1], uu[2], uu[3], uu[4], uu[5], uu[6], uu[7],
             uu[8], uu[9], uu[10], uu[11], uu[12], uu[13], uu[14], uu[15]);
 }
+# endif
 #endif
 
 typedef struct {
-- 
1.7.10.4


