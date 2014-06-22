Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wybkw-0003NX-DZ
	for mharc-qemu-trivial@gnu.org; Sun, 22 Jun 2014 03:00:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51088)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Wybkq-0003Df-9E
	for qemu-trivial@nongnu.org; Sun, 22 Jun 2014 03:00:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Wybkl-0004yA-R1
	for qemu-trivial@nongnu.org; Sun, 22 Jun 2014 02:59:56 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:44594)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Wybkc-0004u9-MA; Sun, 22 Jun 2014 02:59:42 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 376B6438A0;
	Sun, 22 Jun 2014 10:59:41 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 23187671;
	Sun, 22 Jun 2014 10:59:41 +0400 (MSK)
Received: (nullmailer pid 26972 invoked by uid 1000);
	Sun, 22 Jun 2014 06:59:41 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Sun, 22 Jun 2014 10:59:31 +0400
Message-Id: <1403420371-26906-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Michael Tokarev <mjt@tls.msk.ru>, Sam Bobroff <sam.bobroff@au1.ibm.com>
Subject: [Qemu-trivial] [PATCH] build-sys: introduce install-prog macro to
	install&strip binaries and use it
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
X-List-Received-Date: Sun, 22 Jun 2014 07:00:00 -0000

Use common rule (macro) to install and strip binaries, and use
it in all places where we install binaries, instead of fixing
bugs like 1319493 in every place.
(This fixes https://bugs.launchpad.net/bugs/1319493)

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 Makefile        |   12 ++----------
 Makefile.target |    5 +----
 rules.mak       |    7 +++++++
 3 files changed, 10 insertions(+), 14 deletions(-)

diff --git a/Makefile b/Makefile
index 3c8f19c..4cbc26c 100644
--- a/Makefile
+++ b/Makefile
@@ -376,12 +376,8 @@ install-sysconfig: install-datadir install-confdir
 
 install: all $(if $(BUILD_DOCS),install-doc) install-sysconfig \
 install-datadir install-localstatedir
-	$(INSTALL_DIR) "$(DESTDIR)$(bindir)"
 ifneq ($(TOOLS),)
-	$(INSTALL_PROG) $(TOOLS) "$(DESTDIR)$(bindir)"
-ifneq ($(STRIP),)
-	$(STRIP) $(TOOLS:%="$(DESTDIR)$(bindir)/%")
-endif
+	$(call install-prog,$(TOOLS),$(DESTDIR)$(bindir))
 endif
 ifneq ($(CONFIG_MODULES),)
 	$(INSTALL_DIR) "$(DESTDIR)$(qemu_moddir)"
@@ -392,11 +388,7 @@ ifneq ($(CONFIG_MODULES),)
 	done
 endif
 ifneq ($(HELPERS-y),)
-	$(INSTALL_DIR) "$(DESTDIR)$(libexecdir)"
-	$(INSTALL_PROG) $(HELPERS-y) "$(DESTDIR)$(libexecdir)"
-ifneq ($(STRIP),)
-	$(STRIP) $(HELPERS-y:%="$(DESTDIR)$(libexecdir)/%")
-endif
+	$(call install-prog,$(HELPERS-y),$(DESTDIR)$(libexecdir))
 endif
 ifneq ($(BLOBS),)
 	set -e; for x in $(BLOBS); do \
diff --git a/Makefile.target b/Makefile.target
index fc5827c..6089d29 100644
--- a/Makefile.target
+++ b/Makefile.target
@@ -190,10 +190,7 @@ endif
 
 install: all
 ifneq ($(PROGS),)
-	$(INSTALL_PROG) $(PROGS) "$(DESTDIR)$(bindir)"
-ifneq ($(STRIP),)
-	$(STRIP) $(PROGS:%="$(DESTDIR)$(bindir)/%")
-endif
+	$(call install-prog,$(PROGS),$(DESTDIR)$(bindir))
 endif
 ifdef CONFIG_TRACE_SYSTEMTAP
 	$(INSTALL_DIR) "$(DESTDIR)$(qemu_datadir)/../systemtap/tapset"
diff --git a/rules.mak b/rules.mak
index 945484e..ba2f4c1 100644
--- a/rules.mak
+++ b/rules.mak
@@ -101,6 +101,13 @@ cc-option = $(if $(shell $(CC) $1 $2 -S -o /dev/null -xc /dev/null \
 VPATH_SUFFIXES = %.c %.h %.S %.cc %.cpp %.m %.mak %.texi %.sh %.rc
 set-vpath = $(if $1,$(foreach PATTERN,$(VPATH_SUFFIXES),$(eval vpath $(PATTERN) $1)))
 
+# install-prog list, dir
+define install-prog
+	$(INSTALL_DIR) "$2"
+	$(INSTALL_PROG) $1 "$2"
+	$(if $(STRIP),$(STRIP) $(foreach T,$1,"$2/$(notdir $T)"),)
+endef
+
 # find-in-path
 # Usage: $(call find-in-path, prog)
 # Looks in the PATH if the argument contains no slash, else only considers one
-- 
1.7.10.4


