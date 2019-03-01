Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gzkpq-0003Mm-WE
	for mharc-qemu-trivial@gnu.org; Fri, 01 Mar 2019 11:16:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59205)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gzkpo-0003Kx-Gv
	for qemu-trivial@nongnu.org; Fri, 01 Mar 2019 11:16:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gzkpl-0000LE-E3
	for qemu-trivial@nongnu.org; Fri, 01 Mar 2019 11:16:26 -0500
Received: from mx1.redhat.com ([209.132.183.28]:49224)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gzkpj-0000IQ-1f; Fri, 01 Mar 2019 11:16:23 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2F5AC30EBE66;
	Fri,  1 Mar 2019 16:16:21 +0000 (UTC)
Received: from thuth.com (ovpn-116-112.ams2.redhat.com [10.36.116.112])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 120165C1B4;
	Fri,  1 Mar 2019 16:16:16 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Laurent Vivier <lvivier@redhat.com>
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Corey Minyard <minyard@acm.org>, John Snow <jsnow@redhat.com>
Date: Fri,  1 Mar 2019 17:16:10 +0100
Message-Id: <1551456970-463-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Fri, 01 Mar 2019 16:16:21 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] tests: Remove (mostly) useless architecture
 checks
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
X-List-Received-Date: Fri, 01 Mar 2019 16:16:29 -0000

These checks at the beginning of some of the tests are mostly useless:
We only run the tests on x86 anyway, and g_test_message() does not
print anything unless you call g_test_init() first.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/fdc-test.c      | 7 -------
 tests/ide-test.c      | 7 -------
 tests/ipmi-bt-test.c  | 7 -------
 tests/ipmi-kcs-test.c | 7 -------
 4 files changed, 28 deletions(-)

diff --git a/tests/fdc-test.c b/tests/fdc-test.c
index 88f1abf..31cd329 100644
--- a/tests/fdc-test.c
+++ b/tests/fdc-test.c
@@ -548,16 +548,9 @@ static void fuzz_registers(void)
 
 int main(int argc, char **argv)
 {
-    const char *arch = qtest_get_arch();
     int fd;
     int ret;
 
-    /* Check architecture */
-    if (strcmp(arch, "i386") && strcmp(arch, "x86_64")) {
-        g_test_message("Skipping test for non-x86\n");
-        return 0;
-    }
-
     /* Create a temporary raw image */
     fd = mkstemp(test_image);
     g_assert(fd >= 0);
diff --git a/tests/ide-test.c b/tests/ide-test.c
index f0280e6..300d64e 100644
--- a/tests/ide-test.c
+++ b/tests/ide-test.c
@@ -1009,16 +1009,9 @@ static void test_cdrom_dma(void)
 
 int main(int argc, char **argv)
 {
-    const char *arch = qtest_get_arch();
     int fd;
     int ret;
 
-    /* Check architecture */
-    if (strcmp(arch, "i386") && strcmp(arch, "x86_64")) {
-        g_test_message("Skipping test for non-x86\n");
-        return 0;
-    }
-
     /* Create temporary blkdebug instructions */
     fd = mkstemp(debug_path);
     g_assert(fd >= 0);
diff --git a/tests/ipmi-bt-test.c b/tests/ipmi-bt-test.c
index f4a81b5..fc4c83b 100644
--- a/tests/ipmi-bt-test.c
+++ b/tests/ipmi-bt-test.c
@@ -400,15 +400,8 @@ static void open_socket(void)
 
 int main(int argc, char **argv)
 {
-    const char *arch = qtest_get_arch();
     int ret;
 
-    /* Check architecture */
-    if (strcmp(arch, "i386") && strcmp(arch, "x86_64")) {
-        g_test_message("Skipping test for non-x86\n");
-        return 0;
-    }
-
     open_socket();
 
     /* Run the tests */
diff --git a/tests/ipmi-kcs-test.c b/tests/ipmi-kcs-test.c
index 178ffc1..a2354c1 100644
--- a/tests/ipmi-kcs-test.c
+++ b/tests/ipmi-kcs-test.c
@@ -263,16 +263,9 @@ static void test_enable_irq(void)
 
 int main(int argc, char **argv)
 {
-    const char *arch = qtest_get_arch();
     char *cmdline;
     int ret;
 
-    /* Check architecture */
-    if (strcmp(arch, "i386") && strcmp(arch, "x86_64")) {
-        g_test_message("Skipping test for non-x86\n");
-        return 0;
-    }
-
     /* Run the tests */
     g_test_init(&argc, &argv, NULL);
 
-- 
1.8.3.1


