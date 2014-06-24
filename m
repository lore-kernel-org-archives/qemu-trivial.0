Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WzTbH-0000MY-91
	for mharc-qemu-trivial@gnu.org; Tue, 24 Jun 2014 12:29:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58958)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WzTbB-0000BX-Oq
	for qemu-trivial@nongnu.org; Tue, 24 Jun 2014 12:29:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WzTb7-0006gH-Av
	for qemu-trivial@nongnu.org; Tue, 24 Jun 2014 12:29:33 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:54579)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WzTav-0006Xd-KX; Tue, 24 Jun 2014 12:29:17 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 930F544084;
	Tue, 24 Jun 2014 20:29:16 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 639BA6BC;
	Tue, 24 Jun 2014 20:09:23 +0400 (MSK)
Received: (nullmailer pid 15628 invoked by uid 1000);
	Tue, 24 Jun 2014 16:09:21 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 24 Jun 2014 20:09:15 +0400
Message-Id: <1403626160-15546-10-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1403626160-15546-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1403626160-15546-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 09/14] build-sys: introduce install-prog macro
	to install&strip binaries and use it
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
X-List-Received-Date: Tue, 24 Jun 2014 16:29:38 -0000

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
index 7d0c8ec..145adb6 100644
--- a/Makefile
+++ b/Makefile
@@ -385,12 +385,8 @@ install-sysconfig: install-datadir install-confdir
 
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
@@ -401,11 +397,7 @@ ifneq ($(CONFIG_MODULES),)
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


