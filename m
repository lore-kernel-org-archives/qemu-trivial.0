Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ccFqc-0007JP-SG
	for mharc-qemu-trivial@gnu.org; Fri, 10 Feb 2017 13:23:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53938)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ccFqa-0007Hv-Qe
	for qemu-trivial@nongnu.org; Fri, 10 Feb 2017 13:23:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ccFqZ-0002S8-SL
	for qemu-trivial@nongnu.org; Fri, 10 Feb 2017 13:23:04 -0500
Received: from mx1.redhat.com ([209.132.183.28]:55292)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1ccFqV-0002Ph-KQ; Fri, 10 Feb 2017 13:22:59 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BE0837FB8B;
	Fri, 10 Feb 2017 18:22:59 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-48.ams2.redhat.com [10.36.116.48])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id v1AIMvQ5031779; Fri, 10 Feb 2017 13:22:58 -0500
From: Thomas Huth <thuth@redhat.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
Cc: Artyom Tarasenko <atar4qemu@gmail.com>, qemu-trivial@nongnu.org
Date: Fri, 10 Feb 2017 19:22:57 +0100
Message-Id: <1486750977-15211-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Fri, 10 Feb 2017 18:22:59 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] tests/prom-env: Enable the test for the
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
X-List-Received-Date: Fri, 10 Feb 2017 18:23:06 -0000

The 32-bit TCG bug has been fixed a while ago, so we can enable
this test for sparc64 now, too. Unfortunately, OpenBIOS does not
work with the sun4v machine anymore (it needs to catch up with the
improved emulation), so we can only enable this test for the sun4u
machine right now.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/Makefile.include | 3 +--
 tests/prom-env-test.c  | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index 634394a..af99696 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -304,8 +304,7 @@ check-qtest-sparc-y = tests/prom-env-test$(EXESUF)
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
1.8.3.1


