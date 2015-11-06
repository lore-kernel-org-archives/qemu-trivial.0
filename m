Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZugNW-0007AN-KS
	for mharc-qemu-trivial@gnu.org; Fri, 06 Nov 2015 07:44:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58363)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZugNN-0006t8-49
	for qemu-trivial@nongnu.org; Fri, 06 Nov 2015 07:44:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZugNM-00009i-2t
	for qemu-trivial@nongnu.org; Fri, 06 Nov 2015 07:44:17 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:60264)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZugNC-00005X-Od; Fri, 06 Nov 2015 07:44:06 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id D00C340DD0;
	Fri,  6 Nov 2015 15:44:03 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id B8459AB9;
	Fri,  6 Nov 2015 15:44:03 +0300 (MSK)
Received: (nullmailer pid 31674 invoked by uid 1000);
	Fri, 06 Nov 2015 12:44:03 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri,  6 Nov 2015 15:43:38 +0300
Message-Id: <3c15d3a45045de82c744c49ff471d4c7ba405187.1446813769.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1446813768.git.mjt@msgid.tls.msk.ru>
References: <cover.1446813768.git.mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 01/24] hw/acpi/aml-build: remove useless glib
	version check
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
X-List-Received-Date: Fri, 06 Nov 2015 12:44:22 -0000

From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

2.22 is the minimum version required

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/acpi/aml-build.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index 0d4b324..a00a0ab 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -1163,9 +1163,7 @@ void *acpi_data_push(GArray *table_data, unsigned s=
ize)
=20
 unsigned acpi_data_len(GArray *table)
 {
-#if GLIB_CHECK_VERSION(2, 22, 0)
     assert(g_array_get_element_size(table) =3D=3D 1);
-#endif
     return table->len;
 }
=20
--=20
2.1.4


