Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RWQFo-00074Q-A4
	for mharc-qemu-trivial@gnu.org; Fri, 02 Dec 2011 05:22:04 -0500
Received: from eggs.gnu.org ([140.186.70.92]:55342)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ncopa@alpinelinux.org>) id 1RWQFi-00070x-6v
	for qemu-trivial@nongnu.org; Fri, 02 Dec 2011 05:22:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ncopa@alpinelinux.org>) id 1RWQFd-0005QS-5F
	for qemu-trivial@nongnu.org; Fri, 02 Dec 2011 05:21:58 -0500
Received: from [74.117.189.114] (port=37712 helo=mail.alpinelinux.org)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ncopa@alpinelinux.org>) id 1RWQFd-0005Pt-0y
	for qemu-trivial@nongnu.org; Fri, 02 Dec 2011 05:21:53 -0500
Received: from ncdev.alpinelinux.org (build.alpinelinux.org [91.220.88.20])
	by mail.alpinelinux.org (Postfix) with ESMTP id 8DA34DC0A12;
	Fri,  2 Dec 2011 09:45:50 +0000 (UTC)
From: Natanael Copa <ncopa@alpinelinux.org>
To: qemu-trivial@nongnu.org
Date: Fri,  2 Dec 2011 09:45:47 +0000
Message-Id: <1322819147-20385-1-git-send-email-ncopa@alpinelinux.org>
X-Mailer: git-send-email 1.7.7.4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.117.189.114
Cc: Natanael Copa <ncopa@alpinelinux.org>
Subject: [Qemu-trivial] [PATCH] configure: check if -lm is needed for libm
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
X-List-Received-Date: Fri, 02 Dec 2011 10:22:02 -0000

Some systems, like uClibc, needs -lm linker flag. Check and add if
needed.

This fixes building on Alpine Linux.

Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
---
 Makefile  |    4 ++--
 configure |   19 +++++++++++++++++++
 2 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 301c75e..f3a291a 100644
--- a/Makefile
+++ b/Makefile
@@ -34,7 +34,7 @@ configure: ;
 
 $(call set-vpath, $(SRC_PATH):$(SRC_PATH)/hw)
 
-LIBS+=-lz $(LIBS_TOOLS)
+LIBS+=-lz $(LIBS_TOOLS) $(LIBM)
 
 ifdef BUILD_DOCS
 DOCS=qemu-doc.html qemu-tech.html qemu.1 qemu-img.1 qemu-nbd.8 QMP/qmp-commands.txt
@@ -170,7 +170,7 @@ test-coroutine: test-coroutine.o qemu-timer-common.o async.o $(coroutine-obj-y)
 $(qapi-obj-y): $(GENERATED_HEADERS)
 qapi-dir := $(BUILD_DIR)/qapi-generated
 test-visitor.o test-qmp-commands.o qemu-ga$(EXESUF): QEMU_CFLAGS += -I $(qapi-dir)
-qemu-ga$(EXESUF): LIBS = $(LIBS_QGA)
+qemu-ga$(EXESUF): LIBS = $(LIBS_QGA) $(LIBM)
 
 $(qapi-dir)/test-qapi-types.c $(qapi-dir)/test-qapi-types.h :\
 $(SRC_PATH)/qapi-schema-test.json $(SRC_PATH)/scripts/qapi-types.py
diff --git a/configure b/configure
index ac4840d..faa64bd 100755
--- a/configure
+++ b/configure
@@ -1287,6 +1287,24 @@ EOF
 fi
 
 ##########################################
+# libm check
+
+cat > $TMPC << EOF
+#include <math.h>
+int main(void) { return isnan(0.0); }
+EOF
+if compile_prog "" "" ; then
+    LIBM=
+elif compile_prog "" "-lm" ; then
+    LIBM="-lm"
+else
+    echo
+    echo "Error: libm check failed"
+    echo
+    exit 1
+fi
+
+##########################################
 # zlib check
 
 if test "$zlib" != "no" ; then
@@ -3264,6 +3282,7 @@ echo "LIBS+=$LIBS" >> $config_host_mak
 echo "LIBS_TOOLS+=$libs_tools" >> $config_host_mak
 echo "EXESUF=$EXESUF" >> $config_host_mak
 echo "LIBS_QGA+=$libs_qga" >> $config_host_mak
+echo "LIBM=$LIBM" >> $config_host_mak
 
 # generate list of library paths for linker script
 
-- 
1.7.7.4


