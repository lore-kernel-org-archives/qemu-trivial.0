Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Vi6eP-0005rU-PV
	for mharc-qemu-trivial@gnu.org; Sun, 17 Nov 2013 13:00:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55021)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1Vi6eK-0005lG-Ie
	for qemu-trivial@nongnu.org; Sun, 17 Nov 2013 13:00:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1Vi6eF-0001y5-Nk
	for qemu-trivial@nongnu.org; Sun, 17 Nov 2013 13:00:44 -0500
Received: from qemu.weilnetz.de ([37.221.198.45]:43942
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1Vi6e3-0001wI-Go; Sun, 17 Nov 2013 13:00:27 -0500
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id 77623180136; Sun, 17 Nov 2013 19:00:23 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: Anthony Liguori <aliguori@amazon.com>
Date: Sun, 17 Nov 2013 19:00:22 +0100
Message-Id: <1384711222-8916-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.198.45
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: [Qemu-trivial] [PATCH for 1.7] acpi-build: Fix compiler warning
	(missing gnu_printf format attribute)
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
X-List-Received-Date: Sun, 17 Nov 2013 18:00:49 -0000

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
---

Note: checkpatch.pl wrongly reports an error.

 hw/i386/acpi-build.c |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 486e705..9fff5ba 100644
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
     GString *s =3D g_string_new("");
     va_list args;
@@ -628,7 +629,7 @@ build_append_notify(GArray *device, const char *name,
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


