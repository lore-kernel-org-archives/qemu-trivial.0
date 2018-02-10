Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ekQ7w-0000FQ-61
	for mharc-qemu-trivial@gnu.org; Sat, 10 Feb 2018 03:03:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51380)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ekQ7s-00008c-26
	for qemu-trivial@nongnu.org; Sat, 10 Feb 2018 03:03:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ekQ7q-0000ef-Gb
	for qemu-trivial@nongnu.org; Sat, 10 Feb 2018 03:03:12 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:60771)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ekQ7k-0000VD-7u; Sat, 10 Feb 2018 03:03:04 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 7DB5E40C56;
	Sat, 10 Feb 2018 11:03:03 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 0142A7BA;
	Sat, 10 Feb 2018 10:55:17 +0300 (MSK)
Received: (nullmailer pid 22820 invoked by uid 1000);
	Sat, 10 Feb 2018 07:55:14 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Date: Sat, 10 Feb 2018 10:55:11 +0300
Message-Id: <9a6555e21a80498aeac28d3276bbde61ddb30c05.1518249254.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1518249254.git.mjt@msgid.tls.msk.ru>
References: <cover.1518249254.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1518249254.git.mjt@msgid.tls.msk.ru>
References: <cover.1518249254.git.mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 16/17] tests/qapi: use QEMU_IS_ALIGNED macro
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
X-List-Received-Date: Sat, 10 Feb 2018 08:03:14 -0000

From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Applied using the Coccinelle semantic patch scripts/coccinelle/use_osdep.=
cocci

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 tests/test-qobject-output-visitor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/test-qobject-output-visitor.c b/tests/test-qobject-out=
put-visitor.c
index 3cf942414c..11e8c5aa40 100644
--- a/tests/test-qobject-output-visitor.c
+++ b/tests/test-qobject-output-visitor.c
@@ -572,7 +572,7 @@ static void init_native_list(UserDefNativeListUnion *=
cvalue)
         boolList **list =3D &cvalue->u.boolean.data;
         for (i =3D 0; i < 32; i++) {
             *list =3D g_new0(boolList, 1);
-            (*list)->value =3D (i % 3 =3D=3D 0);
+            (*list)->value =3D QEMU_IS_ALIGNED(i, 3);
             (*list)->next =3D NULL;
             list =3D &(*list)->next;
         }
--=20
2.11.0


