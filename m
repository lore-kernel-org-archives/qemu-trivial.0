Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RVion-0002AA-Cx
	for mharc-qemu-trivial@gnu.org; Wed, 30 Nov 2011 06:59:17 -0500
Received: from eggs.gnu.org ([140.186.70.92]:56903)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1RVioj-0001u2-E5
	for qemu-trivial@nongnu.org; Wed, 30 Nov 2011 06:59:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1RViof-0002UU-CU
	for qemu-trivial@nongnu.org; Wed, 30 Nov 2011 06:59:13 -0500
Received: from mnementh.archaic.org.uk ([81.2.115.146]:45670)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1RVioc-0002T7-O6; Wed, 30 Nov 2011 06:59:06 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.72)
	(envelope-from <pm215@archaic.org.uk>)
	id 1RVioa-0003a4-Js; Wed, 30 Nov 2011 11:59:04 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 30 Nov 2011 11:59:04 +0000
Message-Id: <1322654344-13741-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 81.2.115.146
Cc: qemu-trivial@nongnu.org, patches@linaro.org
Subject: [Qemu-trivial] [PATCH] configure: Pull linux-headers/asm symlink
	creation out of loop
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
X-List-Received-Date: Wed, 30 Nov 2011 11:59:14 -0000

Pull the creation of the linux-headers/asm symlink out of the loop
so we don't pointlessly delete and recreate it once for each target.
Also move the setting of the includes variable up so that it is
in the same place as the other code which sets this variable.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 configure |   37 ++++++++++++++++++++-----------------
 1 files changed, 20 insertions(+), 17 deletions(-)

diff --git a/configure b/configure
index 5fbd812..cc6c6d9 100755
--- a/configure
+++ b/configure
@@ -3281,6 +3281,22 @@ for d in libdis libdis-user; do
     echo > $d/config.mak
 done
 
+# use included Linux headers
+if test "$linux" = "yes" ; then
+  mkdir -p linux-headers
+  case "$cpu" in
+  i386|x86_64)
+    symlink $source_path/linux-headers/asm-x86 linux-headers/asm
+    ;;
+  ppcemb|ppc|ppc64)
+    symlink $source_path/linux-headers/asm-powerpc linux-headers/asm
+    ;;
+  s390x)
+    symlink $source_path/linux-headers/asm-s390 linux-headers/asm
+    ;;
+  esac
+fi
+
 for target in $target_list; do
 target_dir="$target"
 config_target_mak=$target_dir/config-target.mak
@@ -3606,6 +3622,10 @@ else
 fi
 includes="-I\$(SRC_PATH)/tcg $includes"
 
+if test "$linux" = "yes" ; then
+  includes="-I\$(SRC_PATH)/linux-headers $includes"
+fi
+
 if test "$target_user_only" = "yes" ; then
     libdis_config_mak=libdis-user/config.mak
 else
@@ -3737,23 +3757,6 @@ if test "$target_linux_user" = "yes" -o "$target_bsd_user" = "yes" ; then
   esac
 fi
 
-# use included Linux headers
-if test "$linux" = "yes" ; then
-  includes="-I\$(SRC_PATH)/linux-headers $includes"
-  mkdir -p linux-headers
-  case "$cpu" in
-  i386|x86_64)
-    symlink $source_path/linux-headers/asm-x86 linux-headers/asm
-    ;;
-  ppcemb|ppc|ppc64)
-    symlink $source_path/linux-headers/asm-powerpc linux-headers/asm
-    ;;
-  s390x)
-    symlink $source_path/linux-headers/asm-s390 linux-headers/asm
-    ;;
-  esac
-fi
-
 echo "LDFLAGS+=$ldflags" >> $config_target_mak
 echo "QEMU_CFLAGS+=$cflags" >> $config_target_mak
 echo "QEMU_INCLUDES+=$includes" >> $config_target_mak
-- 
1.7.1


