Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eQm3B-0005wb-0B
	for mharc-qemu-trivial@gnu.org; Sun, 17 Dec 2017 22:25:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41431)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1eQm34-0005pu-S2
	for qemu-trivial@nongnu.org; Sun, 17 Dec 2017 22:25:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1eQm33-00016z-Oa
	for qemu-trivial@nongnu.org; Sun, 17 Dec 2017 22:25:02 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:51693)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1eQm2y-00013Y-U5; Sun, 17 Dec 2017 22:24:57 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id A7BB6411BA;
	Mon, 18 Dec 2017 06:24:55 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 8D4BACD0;
	Mon, 18 Dec 2017 00:25:46 +0300 (MSK)
Received: (nullmailer pid 30905 invoked by uid 1000);
	Sun, 17 Dec 2017 21:28:08 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Date: Mon, 18 Dec 2017 00:27:16 +0300
Message-Id: <b7f6cf3a80a318b218e6b4ae3bfb323d2cc612d3.1513545944.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1513545944.git.mjt@msgid.tls.msk.ru>
References: <cover.1513545944.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1513545944.git.mjt@msgid.tls.msk.ru>
References: <cover.1513545944.git.mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 11/61] Makefile: use $(MAKE) variable
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
X-List-Received-Date: Mon, 18 Dec 2017 03:25:04 -0000

From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

For some systems (i.e. FreeBSD) the default 'make' is not compatible with=
 the
GNU extensions used by QEMU makefiles.

Calling the GNU make (gmake) works, however the help displayed refers to =
the
host 'make' and copy/paste leads to lot of unobvious errors:

  $ gmake check-help
  [...]
   make check                Run all tests

  $ make check
  make: "Makefile" line 28: Missing dependency operator
  make: "Makefile" line 37: Need an operator
  make: "Makefile" line 41: warning: duplicate script for target "git-sub=
module-update" ignored
  make: "rules.mak" line 70: warning: duplicate script for target "%.o" i=
gnored
  make: Unknown modifier ' '
  make: Unclosed substitution for eval modules (=3D missing)
  make: "tests/Makefile.include" line 24: Variable/Value missing from "ex=
port"
  make: "tests/" line 1: warning: Zero byte read from file, skipping rest=
 of line.
  make: "tests/" line 1: Need an operator
  make: "Makefile" line 660: warning: duplicate script for target "ifneq"=
 ignored
  make: "Makefile" line 78: warning: using previous script for "ifneq" de=
fined here
  make: Fatal errors encountered -- cannot continue

Using the $(MAKE) variable, the help displayed is consistent with the 'ma=
ke'
program used.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 Makefile               |  6 +++---
 tests/Makefile.include | 20 ++++++++++----------
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/Makefile b/Makefile
index 0331c182ed..1f93515677 100644
--- a/Makefile
+++ b/Makefile
@@ -50,7 +50,7 @@ ifneq ($(realpath $(SRC_PATH)),$(realpath .))
 ifneq ($(wildcard $(SRC_PATH)/config-host.mak),)
 $(error This is an out of tree build but your source tree ($(SRC_PATH)) =
\
 seems to have been used for an in-tree build. You can fix this by runnin=
g \
-"make distclean && rm -rf *-linux-user *-softmmu" in your source tree)
+"$(MAKE) distclean && rm -rf *-linux-user *-softmmu" in your source tree=
)
 endif
 endif
=20
@@ -304,7 +304,7 @@ endif
 	    else \
 	      echo "WARNING: $@ out of date.";\
 	    fi; \
-	    echo "Run \"make defconfig\" to regenerate."; \
+	    echo "Run \"$(MAKE) defconfig\" to regenerate."; \
 	    rm $@.tmp; \
 	  fi; \
 	 else \
@@ -934,4 +934,4 @@ ifdef QEMU_GA_MSI_ENABLED
 endif
 	@echo  ''
 endif
-	@echo  '  make V=3D0|1 [targets] 0 =3D> quiet build (default), 1 =3D> v=
erbose build'
+	@echo  '  $(MAKE) V=3D0|1 [targets] 0 =3D> quiet build (default), 1 =3D=
> verbose build'
diff --git a/tests/Makefile.include b/tests/Makefile.include
index c002352134..b4bcc872f2 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -3,21 +3,21 @@
 check-help:
 	@echo "Regression testing targets:"
 	@echo
-	@echo " make check                Run all tests"
-	@echo " make check-qtest-TARGET   Run qtest tests for given target"
-	@echo " make check-qtest          Run qtest tests"
-	@echo " make check-unit           Run qobject tests"
-	@echo " make check-speed          Run qobject speed tests"
-	@echo " make check-qapi-schema    Run QAPI schema tests"
-	@echo " make check-block          Run block tests"
-	@echo " make check-report.html    Generates an HTML test report"
-	@echo " make check-clean          Clean the tests"
+	@echo " $(MAKE) check                Run all tests"
+	@echo " $(MAKE) check-qtest-TARGET   Run qtest tests for given target"
+	@echo " $(MAKE) check-qtest          Run qtest tests"
+	@echo " $(MAKE) check-unit           Run qobject tests"
+	@echo " $(MAKE) check-speed          Run qobject speed tests"
+	@echo " $(MAKE) check-qapi-schema    Run QAPI schema tests"
+	@echo " $(MAKE) check-block          Run block tests"
+	@echo " $(MAKE) check-report.html    Generates an HTML test report"
+	@echo " $(MAKE) check-clean          Clean the tests"
 	@echo
 	@echo "Please note that HTML reports do not regenerate if the unit test=
s"
 	@echo "has not changed."
 	@echo
 	@echo "The variable SPEED can be set to control the gtester speed setti=
ng."
-	@echo "Default options are -k and (for make V=3D1) --verbose; they can =
be"
+	@echo "Default options are -k and (for $(MAKE) V=3D1) --verbose; they c=
an be"
 	@echo "changed with variable GTESTER_OPTIONS."
=20
 ifneq ($(wildcard config-host.mak),)
--=20
2.11.0


