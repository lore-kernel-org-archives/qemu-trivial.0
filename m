Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z6zpK-0003rm-DC
	for mharc-qemu-trivial@gnu.org; Mon, 22 Jun 2015 07:23:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52621)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z6zpF-0003jm-Og
	for qemu-trivial@nongnu.org; Mon, 22 Jun 2015 07:23:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z6zpE-000565-QF
	for qemu-trivial@nongnu.org; Mon, 22 Jun 2015 07:23:41 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:42358)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Z6zoz-00052s-AI; Mon, 22 Jun 2015 07:23:25 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 8323541E4B;
	Mon, 22 Jun 2015 14:23:24 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id BAD49A6F;
	Mon, 22 Jun 2015 14:16:32 +0300 (MSK)
Received: (nullmailer pid 9274 invoked by uid 1000);
	Mon, 22 Jun 2015 11:16:30 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 22 Jun 2015 14:16:24 +0300
Message-Id: <f994a9cd67edb0b47fa914fc7b6a16a419032a5e.1434971627.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1434971627.git.mjt@msgid.tls.msk.ru>
References: <cover.1434971627.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Fam Zheng <famz@redhat.com>
Subject: [Qemu-trivial] [PULL 17/21] Makefile: Fix "make cscope TAGS"
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
X-List-Received-Date: Mon, 22 Jun 2015 11:23:43 -0000

From: Fam Zheng <famz@redhat.com>

Cscope and TAGS files work in source directory rather than the build
directory, also, don't ask users to run configure first, because they
may have an out of tree build.

Signed-off-by: Fam Zheng <famz@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 Makefile | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index 3f97904..8d36076 100644
--- a/Makefile
+++ b/Makefile
@@ -3,6 +3,11 @@
 # Always point to the root of the build tree (needs GNU make).
 BUILD_DIR=$(CURDIR)
 
+# Before including a proper config-host.mak, assume we are in the source tree
+SRC_PATH=.
+
+UNCHECKED_GOALS := %clean TAGS cscope
+
 # All following code might depend on configuration variables
 ifneq ($(wildcard config-host.mak),)
 # Put the all: rule here so that config-host.mak can contain dependencies.
@@ -38,7 +43,7 @@ config-host.mak: $(SRC_PATH)/configure
 	fi
 else
 config-host.mak:
-ifneq ($(filter-out %clean,$(MAKECMDGOALS)),$(if $(MAKECMDGOALS),,fail))
+ifneq ($(filter-out $(UNCHECKED_GOALS),$(MAKECMDGOALS)),$(if $(MAKECMDGOALS),,fail))
 	@echo "Please call configure before running make!"
 	@exit 1
 endif
@@ -433,9 +438,9 @@ TAGS:
 	find "$(SRC_PATH)" -name '*.[hc]' -exec etags --append {} +
 
 cscope:
-	rm -f ./cscope.*
-	find "$(SRC_PATH)" -name "*.[chsS]" -print | sed 's,^\./,,' > ./cscope.files
-	cscope -b
+	rm -f "$(SRC_PATH)"/cscope.*
+	find "$(SRC_PATH)/" -name "*.[chsS]" -print | sed 's,^\./,,' > "$(SRC_PATH)/cscope.files"
+	cscope -b -i"$(SRC_PATH)/cscope.files"
 
 # opengl shader programs
 ui/shader/%-vert.h: $(SRC_PATH)/ui/shader/%.vert $(SRC_PATH)/scripts/shaderinclude.pl
@@ -578,7 +583,7 @@ endif # CONFIG_WIN
 
 # Add a dependency on the generated files, so that they are always
 # rebuilt before other object files
-ifneq ($(filter-out %clean,$(MAKECMDGOALS)),$(if $(MAKECMDGOALS),,fail))
+ifneq ($(filter-out $(UNCHECKED_GOALS),$(MAKECMDGOALS)),$(if $(MAKECMDGOALS),,fail))
 Makefile: $(GENERATED_HEADERS)
 endif
 
-- 
2.1.4


