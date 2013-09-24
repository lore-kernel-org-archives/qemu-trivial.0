Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VONIC-00081V-VN
	for mharc-qemu-trivial@gnu.org; Tue, 24 Sep 2013 03:44:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55096)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1VONI7-0007sT-0d
	for qemu-trivial@nongnu.org; Tue, 24 Sep 2013 03:44:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1VONI2-0002Oe-NT
	for qemu-trivial@nongnu.org; Tue, 24 Sep 2013 03:44:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:31449)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1VONHd-0002JD-F5; Tue, 24 Sep 2013 03:43:45 -0400
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r8O7hhap022717
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 24 Sep 2013 03:43:43 -0400
Received: from blackfin.pond.sub.org (ovpn-116-38.ams2.redhat.com
	[10.36.116.38])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r8O7heGe026591
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 24 Sep 2013 03:43:42 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 593E0200BE; Tue, 24 Sep 2013 09:43:40 +0200 (CEST)
From: armbru@redhat.com
To: qemu-devel@nongnu.org
Date: Tue, 24 Sep 2013 09:43:39 +0200
Message-Id: <1380008620-13796-2-git-send-email-armbru@redhat.com>
In-Reply-To: <1380008620-13796-1-git-send-email-armbru@redhat.com>
References: <1380008620-13796-1-git-send-email-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx1.redhat.com id
	r8O7hhap022717
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, lersek@redhat.com, afaerber@suse.de,
	anthony@codemonkey.ws, qemu-stable@nongnu.org
Subject: [Qemu-trivial] [PATCH v3 1/2] tests: Fix schema parser test for
	in-tree build
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
X-List-Received-Date: Tue, 24 Sep 2013 07:44:19 -0000

From: Markus Armbruster <armbru@redhat.com>

Commit 4f193e3 added the test, but screwed up in-tree builds
(SRCDIR=3D.): the tests's output overwrites the expected output, and is
thus compared to itself.

Cc: qemu-stable@nongnu.org
Reported-by: Laszlo Ersek <lersek@redhat.com>
Reviewed-by: Andreas F=C3=A4rber <afaerber@suse.de>
Reviewed-by: Laszlo Ersek <lersek@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 tests/.gitignore | 1 +
 tests/Makefile   | 8 ++++----
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/tests/.gitignore b/tests/.gitignore
index ae5280e..75f06a1 100644
--- a/tests/.gitignore
+++ b/tests/.gitignore
@@ -21,3 +21,4 @@ test-thread-pool
 test-x86-cpuid
 test-xbzrle
 *-test
+qapi-schema/*.test.*
diff --git a/tests/Makefile b/tests/Makefile
index 994fef1..915ae5e 100644
--- a/tests/Makefile
+++ b/tests/Makefile
@@ -261,10 +261,10 @@ check-tests/test-qapi.py: tests/test-qapi.py
=20
 .PHONY: $(patsubst %, check-%, $(check-qapi-schema-y))
 $(patsubst %, check-%, $(check-qapi-schema-y)): check-%.json: $(SRC_PATH=
)/%.json
-	$(call quiet-command, PYTHONPATH=3D$(SRC_PATH)/scripts $(PYTHON) $(SRC_=
PATH)/tests/qapi-schema/test-qapi.py <$^ >$*.out 2>$*.err; echo $$? >$*.e=
xit, "  TEST  $*.out")
-	@diff -q $(SRC_PATH)/$*.out $*.out
-	@diff -q $(SRC_PATH)/$*.err $*.err
-	@diff -q $(SRC_PATH)/$*.exit $*.exit
+	$(call quiet-command, PYTHONPATH=3D$(SRC_PATH)/scripts $(PYTHON) $(SRC_=
PATH)/tests/qapi-schema/test-qapi.py <$^ >$*.test.out 2>$*.test.err; echo=
 $$? >$*.test.exit, "  TEST  $*.out")
+	@diff -q $(SRC_PATH)/$*.out $*.test.out
+	@diff -q $(SRC_PATH)/$*.err $*.test.err
+	@diff -q $(SRC_PATH)/$*.exit $*.test.exit
=20
 # Consolidated targets
=20
--=20
1.8.1.4


