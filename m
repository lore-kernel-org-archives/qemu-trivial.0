Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Vw2xj-0006kK-3B
	for mharc-qemu-trivial@gnu.org; Wed, 25 Dec 2013 23:54:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58524)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1Vw2xb-0006Qt-Sy
	for qemu-trivial@nongnu.org; Wed, 25 Dec 2013 23:54:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1Vw2xV-0007Su-UD
	for qemu-trivial@nongnu.org; Wed, 25 Dec 2013 23:54:15 -0500
Received: from mx1.redhat.com ([209.132.183.28]:8718)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>)
	id 1Vw2xJ-0007SK-Mo; Wed, 25 Dec 2013 23:53:57 -0500
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id rBQ4rsjo011628
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 25 Dec 2013 23:53:55 -0500
Received: from ad.nay.redhat.com ([10.66.6.190])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id rBQ4rkhD015576; Wed, 25 Dec 2013 23:53:47 -0500
From: Fam Zheng <famz@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 26 Dec 2013 12:53:39 +0800
Message-Id: <1388033619-6294-1-git-send-email-famz@redhat.com>
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>, Marcel Apfelbaum <marcel.a@redhat.com>
Subject: [Qemu-trivial] [PATCH] acpi unit-test: Remove temporary disk after
	test
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
X-List-Received-Date: Thu, 26 Dec 2013 04:54:22 -0000

Signed-off-by: Fam Zheng <famz@redhat.com>
---
 tests/acpi-test.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/acpi-test.c b/tests/acpi-test.c
index ca83b1d6..df1af83 100644
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
1.8.5.1


