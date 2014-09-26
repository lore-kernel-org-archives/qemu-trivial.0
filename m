Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XXZRt-0005v0-DN
	for mharc-qemu-trivial@gnu.org; Fri, 26 Sep 2014 13:36:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35230)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XXZRn-0005ja-NX
	for qemu-trivial@nongnu.org; Fri, 26 Sep 2014 13:36:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XXZRj-0003p4-MP
	for qemu-trivial@nongnu.org; Fri, 26 Sep 2014 13:36:47 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:41653)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XXZRQ-0003hC-4E; Fri, 26 Sep 2014 13:36:24 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 7DF1946F62;
	Fri, 26 Sep 2014 21:36:18 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 6FCF76C6;
	Fri, 26 Sep 2014 21:36:18 +0400 (MSK)
Received: (nullmailer pid 29105 invoked by uid 1000);
	Fri, 26 Sep 2014 17:36:18 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri, 26 Sep 2014 21:36:05 +0400
Message-Id: <1411752976-29051-2-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1411752976-29051-1-git-send-email-mjt@tls.msk.ru>
References: <1411752976-29051-1-git-send-email-mjt@tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-stable@nongnu.org
Subject: [Qemu-trivial] [PULL 01/12] tests: avoid running duplicate qom-tests
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
X-List-Received-Date: Fri, 26 Sep 2014 17:36:52 -0000

From: Michael Roth <mdroth@linux.vnet.ibm.com>

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
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Andreas F=C3=A4rber <afaerber@suse.de>
Cc: qemu-stable@nongnu.org
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 tests/Makefile |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/Makefile b/tests/Makefile
index f5de29c..e8bdd1a 100644
--- a/tests/Makefile
+++ b/tests/Makefile
@@ -193,7 +193,8 @@ check-qtest-xtensaeb-y =3D $(check-qtest-xtensa-y)
=20
 # qom-test works for all sysemu architectures:
 $(foreach target,$(SYSEMU_TARGET_LIST), \
-    $(eval check-qtest-$(target)-y +=3D tests/qom-test$(EXESUF)))
+	$(if $(findstring tests/qom-test$(EXESUF), $(check-qtest-$(target)-y)),=
, \
+		$(eval check-qtest-$(target)-y +=3D tests/qom-test$(EXESUF))))
=20
 check-qapi-schema-y :=3D $(addprefix tests/qapi-schema/, \
         comments.json empty.json funny-char.json indented-expr.json \
--=20
1.7.10.4


