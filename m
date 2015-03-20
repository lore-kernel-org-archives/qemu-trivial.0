Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YZ0Sv-0004Jv-09
	for mharc-qemu-trivial@gnu.org; Fri, 20 Mar 2015 13:12:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52721)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1YZ0Ss-0004Gb-7Y
	for qemu-trivial@nongnu.org; Fri, 20 Mar 2015 13:12:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1YZ0Sr-0002pn-CX
	for qemu-trivial@nongnu.org; Fri, 20 Mar 2015 13:12:06 -0400
Received: from qemu.weilnetz.de ([2a03:4000:2:362::1]:33717)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1YZ0Sp-0002pL-KB; Fri, 20 Mar 2015 13:12:03 -0400
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id 9EDAD17F629; Fri, 20 Mar 2015 18:11:59 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: QEMU Trivial <qemu-trivial@nongnu.org>
Date: Fri, 20 Mar 2015 18:11:58 +0100
Message-Id: <1426871518-2761-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:2:362::1
Cc: Stefan Weil <sw@weilnetz.de>, QEMU Developer <qemu-devel@nongnu.org>,
	"Michael S. Tsirkin" <mst@redhat.com>
Subject: [Qemu-trivial] [PATCH] acpi: Add missing GCC_FMT_ATTR to local
	function
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
X-List-Received-Date: Fri, 20 Mar 2015 17:12:07 -0000

This fixes these gcc warnings (not enabled in default build):

hw/acpi/aml-build.c:83:5: warning:
 function might be possible candidate for =E2=80=98gnu_printf=E2=80=99 fo=
rmat attribute [-Wsuggest-attribute=3Dformat]
hw/acpi/aml-build.c:88:5: warning:
 function might be possible candidate for =E2=80=98gnu_printf=E2=80=99 fo=
rmat attribute [-Wsuggest-attribute=3Dformat]

Cc: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 hw/acpi/aml-build.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index 6242908..d7945f6 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -68,7 +68,7 @@ build_append_nameseg(GArray *array, const char *seg)
     g_array_append_vals(array, "____", ACPI_NAMESEG_LEN - len);
 }
=20
-static void
+static void GCC_FMT_ATTR(2, 0)
 build_append_namestringv(GArray *array, const char *format, va_list ap)
 {
     /* It would be nicer to use g_string_vprintf but it's only there in =
2.22 */
--=20
2.1.4


