Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XFr2G-0003Rt-21
	for mharc-qemu-trivial@gnu.org; Fri, 08 Aug 2014 16:45:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56349)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XFr29-0003F4-B1
	for qemu-trivial@nongnu.org; Fri, 08 Aug 2014 16:45:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XFr24-0005uK-BM
	for qemu-trivial@nongnu.org; Fri, 08 Aug 2014 16:45:05 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:38111)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XFr1s-0005m5-Rg; Fri, 08 Aug 2014 16:44:49 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 72A9341A1B;
	Sat,  9 Aug 2014 00:44:47 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 1ECB86F4;
	Sat,  9 Aug 2014 00:39:07 +0400 (MSK)
Received: (nullmailer pid 10326 invoked by uid 1000);
	Fri, 08 Aug 2014 20:39:05 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Sat,  9 Aug 2014 00:39:02 +0400
Message-Id: <1407530342-10259-10-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1407530342-10259-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1407530342-10259-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Fam Zheng <famz@redhat.com>
Subject: [Qemu-trivial] [PULL 9/9] build-sys: Move qapi-{types, visit,
	event}.o into util-obj-y
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
X-List-Received-Date: Fri, 08 Aug 2014 20:45:10 -0000

From: Fam Zheng <famz@redhat.com>

These three objects are repeated in multiple times in Makefiles. Let's
just add them to libqemuutil.a, and don't list explicitly elsewhere.

Signed-off-by: Fam Zheng <famz@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 Makefile       |    2 +-
 Makefile.objs  |   10 ++--------
 tests/Makefile |    2 +-
 3 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/Makefile b/Makefile
index d6b9dc1..c5751b8 100644
--- a/Makefile
+++ b/Makefile
@@ -202,7 +202,7 @@ Makefile: $(version-obj-y) $(version-lobj-y)
 # Build libraries
 
 libqemustub.a: $(stub-obj-y)
-libqemuutil.a: $(util-obj-y) qapi-types.o qapi-visit.o qapi-event.o
+libqemuutil.a: $(util-obj-y)
 
 block-modules = $(foreach o,$(block-obj-m),"$(basename $(subst /,-,$o))",) NULL
 util/module.o-cflags = -D'CONFIG_BLOCK_MODULES=$(block-modules)'
diff --git a/Makefile.objs b/Makefile.objs
index 1f76cea..efd9768 100644
--- a/Makefile.objs
+++ b/Makefile.objs
@@ -1,7 +1,7 @@
 #######################################################################
 # Common libraries for tools and emulators
 stub-obj-y = stubs/
-util-obj-y = util/ qobject/ qapi/ trace/
+util-obj-y = util/ qobject/ qapi/ trace/ qapi-types.o qapi-visit.o qapi-event.o
 
 #######################################################################
 # block-obj-y is code used by both qemu system emulation and qemu-img
@@ -12,7 +12,6 @@ block-obj-y += main-loop.o iohandler.o qemu-timer.o
 block-obj-$(CONFIG_POSIX) += aio-posix.o
 block-obj-$(CONFIG_WIN32) += aio-win32.o
 block-obj-y += block/
-block-obj-y += qapi-types.o qapi-visit.o qapi-event.o
 block-obj-y += qemu-io-cmds.o
 
 block-obj-y += qemu-coroutine.o qemu-coroutine-lock.o qemu-coroutine-io.o
@@ -88,11 +87,6 @@ common-obj-y += qmp-marshal.o
 common-obj-y += qmp.o hmp.o
 endif
 
-######################################################################
-# some qapi visitors are used by both system and user emulation:
-
-common-obj-y += qapi-visit.o qapi-types.o
-
 #######################################################################
 # Target-independent parts used in system and user emulation
 common-obj-y += qemu-log.o
@@ -111,5 +105,5 @@ version-lobj-$(CONFIG_WIN32) += $(BUILD_DIR)/version.lo
 
 # FIXME: a few definitions from qapi-types.o/qapi-visit.o are needed
 # by libqemuutil.a.  These should be moved to a separate .json schema.
-qga-obj-y = qga/ qapi-types.o qapi-visit.o
+qga-obj-y = qga/
 qga-vss-dll-obj-y = qga/
diff --git a/tests/Makefile b/tests/Makefile
index 4b2e1bb..837e9c8 100644
--- a/tests/Makefile
+++ b/tests/Makefile
@@ -282,7 +282,7 @@ tests/test-qmp-event$(EXESUF): tests/test-qmp-event.o $(test-qapi-obj-y) libqemu
 tests/test-qmp-output-visitor$(EXESUF): tests/test-qmp-output-visitor.o $(test-qapi-obj-y) libqemuutil.a libqemustub.a
 tests/test-qmp-input-visitor$(EXESUF): tests/test-qmp-input-visitor.o $(test-qapi-obj-y) libqemuutil.a libqemustub.a
 tests/test-qmp-input-strict$(EXESUF): tests/test-qmp-input-strict.o $(test-qapi-obj-y) libqemuutil.a libqemustub.a
-tests/test-qmp-commands$(EXESUF): tests/test-qmp-commands.o tests/test-qmp-marshal.o $(test-qapi-obj-y) qapi-types.o qapi-visit.o libqemuutil.a libqemustub.a
+tests/test-qmp-commands$(EXESUF): tests/test-qmp-commands.o tests/test-qmp-marshal.o $(test-qapi-obj-y) libqemuutil.a libqemustub.a
 tests/test-visitor-serialization$(EXESUF): tests/test-visitor-serialization.o $(test-qapi-obj-y) libqemuutil.a libqemustub.a
 tests/test-opts-visitor$(EXESUF): tests/test-opts-visitor.o $(test-qapi-obj-y) libqemuutil.a libqemustub.a
 
-- 
1.7.10.4


