Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XUkgh-0002h9-9X
	for mharc-qemu-trivial@gnu.org; Thu, 18 Sep 2014 19:00:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36517)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdroth@linux.vnet.ibm.com>) id 1XUkgW-0002fn-MR
	for qemu-trivial@nongnu.org; Thu, 18 Sep 2014 19:00:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mdroth@linux.vnet.ibm.com>) id 1XUkgJ-0001Is-L6
	for qemu-trivial@nongnu.org; Thu, 18 Sep 2014 19:00:20 -0400
Received: from e9.ny.us.ibm.com ([32.97.182.139]:54646)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdroth@linux.vnet.ibm.com>) id 1XUkgJ-000155-HG
	for qemu-trivial@nongnu.org; Thu, 18 Sep 2014 19:00:07 -0400
Received: from /spool/local
	by e9.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <mdroth@linux.vnet.ibm.com>;
	Thu, 18 Sep 2014 19:00:00 -0400
Received: from d01dlp03.pok.ibm.com (9.56.250.168)
	by e9.ny.us.ibm.com (192.168.1.109) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Thu, 18 Sep 2014 18:59:58 -0400
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
	[9.57.198.27])
	by d01dlp03.pok.ibm.com (Postfix) with ESMTP id 7B3E4C9003E;
	Thu, 18 Sep 2014 18:48:42 -0400 (EDT)
Received: from d01av02.pok.ibm.com (d01av02.pok.ibm.com [9.56.224.216])
	by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
	s8IMxvnq3801414; Thu, 18 Sep 2014 22:59:57 GMT
Received: from d01av02.pok.ibm.com (localhost [127.0.0.1])
	by d01av02.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
	s8IMxvTI003391; Thu, 18 Sep 2014 18:59:57 -0400
Received: from localhost (morrigu.austin.ibm.com [9.41.105.45])
	by d01av02.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
	s8IMxv9n003358; Thu, 18 Sep 2014 18:59:57 -0400
From: Michael Roth <mdroth@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Date: Thu, 18 Sep 2014 17:59:33 -0500
Message-Id: <1411081173-14618-1-git-send-email-mdroth@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.9.1
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 14091822-7182-0000-0000-0000007DBB1E
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 32.97.182.139
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org, afaerber@suse.de
Subject: [Qemu-trivial] [PATCH] tests: avoid running duplicate qom-tests
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
X-List-Received-Date: Thu, 18 Sep 2014 23:00:30 -0000

Since 3687d532 we've been unconditionally adding qom-test to our qtests
for every arch. However, some archs inherit their tests from Makefile
variables for other archs, such as i386/x86_64,
microblaze/microblazeel, and xtensa/xtensaeb. Since these are evaluated
in a lazy manner, we ultimately end up adding qom-test twice.

In the case x86_64, where we have a large number of machine types that
we rerun qom-test for, this has lead to a fairly noticeable increase
in the overall run-time of `make check` (78s vs. 42s on my machine).
Similar speed-ups are visible for other such archs, but not nearly as
significant.

Fix this by only adding qom-test to an arch's test list if it's not
already present.

Signed-off-by: Michael Roth <mdroth@linux.vnet.ibm.com>
---
 tests/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/Makefile b/tests/Makefile
index a5e3d0c..9f2a35c 100644
--- a/tests/Makefile
+++ b/tests/Makefile
@@ -192,7 +192,8 @@ check-qtest-xtensaeb-y = $(check-qtest-xtensa-y)
 
 # qom-test works for all sysemu architectures:
 $(foreach target,$(SYSEMU_TARGET_LIST), \
-    $(eval check-qtest-$(target)-y += tests/qom-test$(EXESUF)))
+	$(if $(findstring tests/qom-test$(EXESUF), $(check-qtest-$(target)-y)),, \
+		$(eval check-qtest-$(target)-y += tests/qom-test$(EXESUF))))
 
 check-qapi-schema-y := $(addprefix tests/qapi-schema/, \
         comments.json empty.json funny-char.json indented-expr.json \
-- 
1.9.1


