Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XLXtH-0004D2-UG
	for mharc-qemu-trivial@gnu.org; Sun, 24 Aug 2014 09:31:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45211)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XLXtC-00042Z-TZ
	for qemu-trivial@nongnu.org; Sun, 24 Aug 2014 09:31:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XLXt8-0004HF-Mn
	for qemu-trivial@nongnu.org; Sun, 24 Aug 2014 09:31:22 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:45079)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XLXsw-0004Ft-T9; Sun, 24 Aug 2014 09:31:07 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id AFE9F44A05;
	Sun, 24 Aug 2014 17:31:05 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 506B56D3;
	Sun, 24 Aug 2014 17:31:04 +0400 (MSK)
Received: (nullmailer pid 30077 invoked by uid 1000);
	Sun, 24 Aug 2014 13:31:03 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Sun, 24 Aug 2014 17:30:54 +0400
Message-Id: <1408887062-30022-4-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1408887062-30022-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1408887062-30022-1-git-send-email-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Li Liu <john.liuli@huawei.com>,
	Michael Tokarev <mjt@tls.msk.ru>,
	zhanghailiang <zhang.zhanghailiang@huawei.com>
Subject: [Qemu-trivial] [PULL 03/11] tests/bios-tables-test: check the value
	returned by fopen()
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
X-List-Received-Date: Sun, 24 Aug 2014 13:31:27 -0000

From: zhanghailiang <zhang.zhanghailiang@huawei.com>

The function fopen() may fail, so check its return value.

Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
Signed-off-by: Li Liu <john.liuli@huawei.com>
Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 tests/bios-tables-test.c |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/bios-tables-test.c b/tests/bios-tables-test.c
index 045eb27..602932b 100644
--- a/tests/bios-tables-test.c
+++ b/tests/bios-tables-test.c
@@ -790,6 +790,11 @@ int main(int argc, char *argv[])
     const char *arch =3D qtest_get_arch();
     FILE *f =3D fopen(disk, "w");
     int ret;
+
+    if (!f) {
+        fprintf(stderr, "Couldn't open \"%s\": %s", disk, strerror(errno=
));
+        return 1;
+    }
     fwrite(boot_sector, 1, sizeof boot_sector, f);
     fclose(f);
=20
--=20
1.7.10.4


