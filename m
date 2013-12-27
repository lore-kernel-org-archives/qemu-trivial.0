Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Vwfqv-0000OU-D4
	for mharc-qemu-trivial@gnu.org; Fri, 27 Dec 2013 17:25:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35417)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vwfqo-000075-0w
	for qemu-trivial@nongnu.org; Fri, 27 Dec 2013 17:25:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vwfqj-0000Nq-TN
	for qemu-trivial@nongnu.org; Fri, 27 Dec 2013 17:25:49 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:43943)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VwfqW-0000LI-Kp; Fri, 27 Dec 2013 17:25:32 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 7C63A438A7;
	Sat, 28 Dec 2013 02:25:32 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 682285E0;
	Sat, 28 Dec 2013 02:07:35 +0400 (MSK)
Received: (nullmailer pid 10333 invoked by uid 1000);
	Fri, 27 Dec 2013 22:07:34 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@amazon.com
Date: Sat, 28 Dec 2013 02:07:17 +0400
Message-Id: <1388182050-10270-5-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1388182050-10270-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1388182050-10270-1-git-send-email-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <andreas.faerber@web.de>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 04/17] ui/cocoa: Use macro ARRAY_SIZE where
	possible
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
X-List-Received-Date: Fri, 27 Dec 2013 22:25:54 -0000

From: Stefan Weil <sw@weilnetz.de>

This improves readability and simplifies the code.

Cc: Andreas F=C3=A4rber <andreas.faerber@web.de>
Cc: Anthony Liguori <aliguori@amazon.com>
Signed-off-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 ui/cocoa.m |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index be49179..2524f18 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -240,9 +240,8 @@ int keymap[] =3D
=20
 static int cocoa_keycode_to_qemu(int keycode)
 {
-    if((sizeof(keymap)/sizeof(int)) <=3D keycode)
-    {
-        printf("(cocoa) warning unknow keycode 0x%x\n", keycode);
+    if (ARRAY_SIZE(keymap) <=3D keycode) {
+        printf("(cocoa) warning unknown keycode 0x%x\n", keycode);
         return 0;
     }
     return keymap[keycode];
--=20
1.7.10.4


