Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cibfx-0007GI-Qo
	for mharc-qemu-trivial@gnu.org; Tue, 28 Feb 2017 01:54:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45199)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cibft-0007A9-5S
	for qemu-trivial@nongnu.org; Tue, 28 Feb 2017 01:54:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cibfs-0005uT-AB
	for qemu-trivial@nongnu.org; Tue, 28 Feb 2017 01:54:17 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:54252)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1cibfn-0005sU-IN; Tue, 28 Feb 2017 01:54:11 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 8480943587;
	Tue, 28 Feb 2017 09:54:10 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id F0D8A3DF;
	Tue, 28 Feb 2017 09:45:01 +0300 (MSK)
Received: (nullmailer pid 19633 invoked by uid 1000);
	Tue, 28 Feb 2017 06:44:59 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Tue, 28 Feb 2017 09:44:52 +0300
Message-Id: <6b591ad613010f136dec4657f3c8ed6b051802c8.1488264243.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1488264243.git.mjt@msgid.tls.msk.ru>
References: <cover.1488264243.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1488264243.git.mjt@msgid.tls.msk.ru>
References: <cover.1488264243.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 09/14] tests/prom-env: Enable the test for the
 sun4u machine, too
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
X-List-Received-Date: Tue, 28 Feb 2017 06:54:18 -0000

From: Thomas Huth <thuth@redhat.com>

The 32-bit TCG bug has been fixed a while ago, so we can enable
this test for sparc64 now, too. Unfortunately, OpenBIOS does not
work with the sun4v machine anymore (it needs to catch up with the
improved emulation), so we can only enable this test for the sun4u
machine right now.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 tests/Makefile.include | 3 +--
 tests/prom-env-test.c  | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index e60bb6c..3310c17 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -308,8 +308,7 @@ check-qtest-sparc-y = tests/prom-env-test$(EXESUF)
 check-qtest-sparc64-y = tests/endianness-test$(EXESUF)
 #check-qtest-sparc64-y += tests/m48t59-test$(EXESUF)
 #gcov-files-sparc64-y += hw/timer/m48t59.c
-#Disabled for now, triggers a TCG bug on 32-bit hosts
-#check-qtest-sparc64-y += tests/prom-env-test$(EXESUF)
+check-qtest-sparc64-y += tests/prom-env-test$(EXESUF)
 
 check-qtest-arm-y = tests/tmp105-test$(EXESUF)
 check-qtest-arm-y += tests/ds1338-test$(EXESUF)
diff --git a/tests/prom-env-test.c b/tests/prom-env-test.c
index bd33bc3..eac207b 100644
--- a/tests/prom-env-test.c
+++ b/tests/prom-env-test.c
@@ -76,7 +76,7 @@ static void add_tests(const char *machines[])
 int main(int argc, char *argv[])
 {
     const char *sparc_machines[] = { "SPARCbook", "Voyager", "SS-20", NULL };
-    const char *sparc64_machines[] = { "sun4u", "sun4v", NULL };
+    const char *sparc64_machines[] = { "sun4u", NULL };
     const char *ppc_machines[] = { "mac99", "g3beige", NULL };
     const char *ppc64_machines[] = { "mac99", "g3beige", "pseries", NULL };
     const char *arch = qtest_get_arch();
-- 
2.1.4


