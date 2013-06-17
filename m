Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UoiY4-0000g0-Ns
	for mharc-qemu-trivial@gnu.org; Mon, 17 Jun 2013 19:09:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39370)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1UoiY2-0000d3-LH
	for qemu-trivial@nongnu.org; Mon, 17 Jun 2013 19:09:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1UoiY1-0000QS-NU
	for qemu-trivial@nongnu.org; Mon, 17 Jun 2013 19:09:18 -0400
Received: from cantor2.suse.de ([195.135.220.15]:36579 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1UoiXy-0000OY-7k; Mon, 17 Jun 2013 19:09:14 -0400
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 8C203A41E0;
	Tue, 18 Jun 2013 01:09:13 +0200 (CEST)
From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
To: qemu-devel@nongnu.org
Date: Tue, 18 Jun 2013 01:09:06 +0200
Message-Id: <1371510546-28585-1-git-send-email-afaerber@suse.de>
X-Mailer: git-send-email 1.8.1.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [Qemu-trivial] [PATCH] configure: Fix "ERROR: ERROR: " for
	missing/incompatible DTC
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
X-List-Received-Date: Mon, 17 Jun 2013 23:09:19 -0000

error_exit already prepends "ERROR: ", so no need to print it manually.

Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index ad32f87..bb126e8 100755
--- a/configure
+++ b/configure
@@ -2529,7 +2529,7 @@ EOF
     fdt_libs=3D"-L\$(BUILD_DIR)/dtc/libfdt $fdt_libs"
   elif test "$fdt" =3D "yes" ; then
     # have neither and want - prompt for system/submodule install
-    error_exit "ERROR: DTC not present. Your options:" \
+    error_exit "DTC not present. Your options:" \
         "  (1) Preferred: Install the DTC devel package" \
         "  (2) Fetch the DTC submodule, using:" \
         "      git submodule update --init dtc"
--=20
1.8.1.4


