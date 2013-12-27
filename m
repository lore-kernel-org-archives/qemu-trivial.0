Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Vwfqt-0000J5-3h
	for mharc-qemu-trivial@gnu.org; Fri, 27 Dec 2013 17:25:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35411)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vwfqm-0008VB-I3
	for qemu-trivial@nongnu.org; Fri, 27 Dec 2013 17:25:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vwfqh-0000NX-Ip
	for qemu-trivial@nongnu.org; Fri, 27 Dec 2013 17:25:48 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:45942)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VwfqW-0000LH-Kv; Fri, 27 Dec 2013 17:25:32 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 8D531438A8;
	Sat, 28 Dec 2013 02:25:32 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 66D21610;
	Sat, 28 Dec 2013 02:07:36 +0400 (MSK)
Received: (nullmailer pid 10364 invoked by uid 1000);
	Fri, 27 Dec 2013 22:07:35 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@amazon.com
Date: Sat, 28 Dec 2013 02:07:30 +0400
Message-Id: <1388182050-10270-18-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1388182050-10270-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1388182050-10270-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Fam Zheng <famz@redhat.com>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 17/17] acpi unit-test: Remove temporary disk
	after test
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
X-List-Received-Date: Fri, 27 Dec 2013 22:25:53 -0000

From: Fam Zheng <famz@redhat.com>

Signed-off-by: Fam Zheng <famz@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 tests/acpi-test.c |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/acpi-test.c b/tests/acpi-test.c
index ca83b1d..df1af83 100644
--- a/tests/acpi-test.c
+++ b/tests/acpi-test.c
@@ -382,6 +382,7 @@ int main(int argc, char *argv[])
 {
     const char *arch = qtest_get_arch();
     FILE *f = fopen(disk, "w");
+    int ret;
     fwrite(boot_sector, 1, sizeof boot_sector, f);
     fclose(f);
 
@@ -390,5 +391,7 @@ int main(int argc, char *argv[])
     if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
         qtest_add_func("acpi/tcg", test_acpi_tcg);
     }
-    return g_test_run();
+    ret = g_test_run();
+    unlink(disk);
+    return ret;
 }
-- 
1.7.10.4


