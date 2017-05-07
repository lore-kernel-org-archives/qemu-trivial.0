Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d7GDR-0003ue-VB
	for mharc-qemu-trivial@gnu.org; Sun, 07 May 2017 03:02:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53266)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1d7GDP-0003sa-K7
	for qemu-trivial@nongnu.org; Sun, 07 May 2017 03:02:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1d7GDO-00067j-QV
	for qemu-trivial@nongnu.org; Sun, 07 May 2017 03:02:47 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:38943)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1d7GDK-0005uM-Cz; Sun, 07 May 2017 03:02:42 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 4444140480;
	Sun,  7 May 2017 10:02:30 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 2F0283F8;
	Sun,  7 May 2017 10:02:29 +0300 (MSK)
Received: (nullmailer pid 26554 invoked by uid 1000);
	Sun, 07 May 2017 07:02:29 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Date: Sun,  7 May 2017 10:02:11 +0300
Message-Id: <9879f5ac62c1e0c92a5ff2f4a0ada1b66d43da90.1494140528.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1494140527.git.mjt@msgid.tls.msk.ru>
References: <cover.1494140527.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1494140527.git.mjt@msgid.tls.msk.ru>
References: <cover.1494140527.git.mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 08/23] qga: fix compiler warnings (clang 5)
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 07 May 2017 07:02:48 -0000

From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

static code analyzer complain:

qga/commands-posix.c:2127:9: warning: Null pointer passed as an argument =
to a 'nonnull' parameter
        closedir(dp);
        ^~~~~~~~~~~~

Reported-by: Clang Static Analyzer
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Michael Roth <mdroth@linux.vnet.ibm.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qga/commands-posix.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index ba06be4c86..284ecc6d7e 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -2125,9 +2125,11 @@ static void transfer_memory_block(GuestMemoryBlock=
 *mem_blk, bool sys2memblk,
          * we think this VM does not support online/offline memory block=
,
          * any other solution?
          */
-        if (!dp && errno =3D=3D ENOENT) {
-            result->response =3D
-                GUEST_MEMORY_BLOCK_RESPONSE_TYPE_OPERATION_NOT_SUPPORTED=
;
+        if (!dp) {
+            if (errno =3D=3D ENOENT) {
+                result->response =3D
+                    GUEST_MEMORY_BLOCK_RESPONSE_TYPE_OPERATION_NOT_SUPPO=
RTED;
+            }
             goto out1;
         }
         closedir(dp);
--=20
2.11.0


