Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Vl27Z-00055e-Ik
	for mharc-qemu-trivial@gnu.org; Mon, 25 Nov 2013 14:47:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35118)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vl27T-0004wn-P9
	for qemu-trivial@nongnu.org; Mon, 25 Nov 2013 14:47:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vl27P-0007X4-Ae
	for qemu-trivial@nongnu.org; Mon, 25 Nov 2013 14:46:55 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:59945)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Vl278-0007TH-Vi; Mon, 25 Nov 2013 14:46:35 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 4173D43359;
	Mon, 25 Nov 2013 23:41:08 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 1AE86207;
	Mon, 25 Nov 2013 23:41:08 +0400 (MSK)
Received: (nullmailer pid 13237 invoked by uid 1000);
	Mon, 25 Nov 2013 19:41:08 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: Anthony Liguori <aliguori@amazon.com>
Date: Mon, 25 Nov 2013 23:41:05 +0400
Message-Id: <1385408466-13183-3-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1385408466-13183-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1385408466-13183-1-git-send-email-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 2/3] acpi-build: Fix compiler warning (missing
	gnu_printf format attribute)
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
X-List-Received-Date: Mon, 25 Nov 2013 19:47:00 -0000

From: Stefan Weil <sw@weilnetz.de>

gcc 4.8.2 reports this warning when extra warnings are enabled (-Wextra):

  CC    m68k-softmmu/hw/m68k/mcf5206.o
hw/i386/acpi-build.c: In function =E2=80=98build_append_nameseg=E2=80=99:
hw/i386/acpi-build.c:294:5: error:
 function might be possible candidate for =E2=80=98gnu_printf=E2=80=99 fo=
rmat attribute [-Werror=3Dsuggest-attribute=3Dformat]
     g_string_vprintf(s, format, args);
     ^

When this warning is fixed, there is a new compiler warning:

  CC    i386-softmmu/hw/i386/acpi-build.o
hw/i386/acpi-build.c: In function =E2=80=98build_append_notify=E2=80=99:
hw/i386/acpi-build.c:632:5: error:
 format not a string literal and no format arguments [-Werror=3Dformat-se=
curity]
     build_append_nameseg(method, name);
     ^

This is fixed here, too.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/i386/acpi-build.c |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 5f36e7e..4d2e641 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -285,7 +285,8 @@ static inline void build_append_array(GArray *array, =
GArray *val)
     g_array_append_vals(array, val->data, val->len);
 }
=20
-static void build_append_nameseg(GArray *array, const char *format, ...)
+static void GCC_FMT_ATTR(2, 3)
+build_append_nameseg(GArray *array, const char *format, ...)
 {
     /* It would be nicer to use g_string_vprintf but it's only there in =
2.22 */
     char s[] =3D "XXXX";
@@ -632,7 +633,7 @@ build_append_notify(GArray *device, const char *name,
     GArray *method =3D build_alloc_array();
     uint8_t op =3D 0x14; /* MethodOp */
=20
-    build_append_nameseg(method, name);
+    build_append_nameseg(method, "%s", name);
     build_append_byte(method, 0x02); /* MethodFlags: ArgCount */
     for (i =3D skip; i < count; i++) {
         GArray *target =3D build_alloc_array();
--=20
1.7.10.4


