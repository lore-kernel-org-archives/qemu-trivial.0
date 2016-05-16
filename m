Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b2If6-0001vk-0H
	for mharc-qemu-trivial@gnu.org; Mon, 16 May 2016 09:34:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59691)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1b2If2-0001nl-2C
	for qemu-trivial@nongnu.org; Mon, 16 May 2016 09:34:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1b2Iex-0006MB-ND
	for qemu-trivial@nongnu.org; Mon, 16 May 2016 09:34:14 -0400
Received: from qemu.weilnetz.de ([2a03:4000:2:362::1]:52891)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1b2IeS-00068c-4N; Mon, 16 May 2016 09:33:40 -0400
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id 4B8C917F522; Mon, 16 May 2016 15:23:34 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: QEMU Developer <qemu-devel@nongnu.org>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Stefan Weil <sw@weilnetz.de>
Date: Mon, 16 May 2016 15:23:33 +0200
Message-Id: <1463405013-7062-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a03:4000:2:362::1
Subject: [Qemu-trivial] [PATCH] scripts: Use $(..) instead of deprecated `..`
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
X-List-Received-Date: Mon, 16 May 2016 13:34:17 -0000

This fixes these warnings from shellcheck:

    ^-- SC2006: Use $(..) instead of deprecated `..`

Update also a comment using the same pattern.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 scripts/clean-includes          | 2 +-
 scripts/create_config           | 6 +++---
 scripts/feature_to_c.sh         | 6 +++---
 scripts/make_device_config.sh   | 4 ++--
 scripts/qemu-binfmt-conf.sh     | 2 +-
 scripts/update-linux-headers.sh | 2 +-
 6 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/scripts/clean-includes b/scripts/clean-includes
index 72b47f1..adffedd 100755
--- a/scripts/clean-includes
+++ b/scripts/clean-includes
@@ -39,7 +39,7 @@
 # However some caution is required regarding files that might be part
 # of the guest agent or standalone tests.
 
-# for i in `git ls-tree --name-only HEAD`  ; do test -f $i && \
+# for i in $(git ls-tree --name-only HEAD) ; do test -f $i && \
 #   grep -E '^# *include' $i | head -1 | grep 'osdep.h' ; test $? != 0 && \
 #   echo $i ; done
 
diff --git a/scripts/create_config b/scripts/create_config
index 9cb176f..5dd53c5 100755
--- a/scripts/create_config
+++ b/scripts/create_config
@@ -16,7 +16,7 @@ case $line in
  qemu_*dir=*) # qemu-specific directory configuration
     name=${line%=*}
     value=${line#*=}
-    define_name=`echo $name | LC_ALL=C tr '[a-z]' '[A-Z]'`
+    define_name=$(echo $name | LC_ALL=C tr '[a-z]' '[A-Z]')
     eval "define_value=\"$value\""
     echo "#define CONFIG_$define_name \"$define_value\""
     # save for the next definitions
@@ -72,7 +72,7 @@ case $line in
     ;;
  ARCH=*) # configuration
     arch=${line#*=}
-    arch_name=`echo $arch | LC_ALL=C tr '[a-z]' '[A-Z]'`
+    arch_name=$(echo $arch | LC_ALL=C tr '[a-z]' '[A-Z]')
     echo "#define HOST_$arch_name 1"
     ;;
  HOST_USB=*)
@@ -92,7 +92,7 @@ case $line in
     ;;
  TARGET_BASE_ARCH=*) # configuration
     target_base_arch=${line#*=}
-    base_arch_name=`echo $target_base_arch | LC_ALL=C tr '[a-z]' '[A-Z]'`
+    base_arch_name=$(echo $target_base_arch | LC_ALL=C tr '[a-z]' '[A-Z]')
     echo "#define TARGET_$base_arch_name 1"
     ;;
  TARGET_XML_FILES=*)
diff --git a/scripts/feature_to_c.sh b/scripts/feature_to_c.sh
index fb1f336..cdfdd4b 100644
--- a/scripts/feature_to_c.sh
+++ b/scripts/feature_to_c.sh
@@ -33,7 +33,7 @@ if test -e "$output"; then
 fi
 
 for input; do
-  arrayname=xml_feature_`echo $input | sed 's,.*/,,; s/[-.]/_/g'`
+  arrayname=xml_feature_$(echo $input | sed 's,.*/,,; s/[-.]/_/g')
 
   ${AWK:-awk} 'BEGIN { n = 0
       printf "#include \"qemu/osdep.h\"\n"
@@ -69,8 +69,8 @@ echo >> $output
 echo "const char *const xml_builtin[][2] = {" >> $output
 
 for input; do
-  basename=`echo $input | sed 's,.*/,,'`
-  arrayname=xml_feature_`echo $input | sed 's,.*/,,; s/[-.]/_/g'`
+  basename=$(echo $input | sed 's,.*/,,')
+  arrayname=xml_feature_$(echo $input | sed 's,.*/,,; s/[-.]/_/g')
   echo "  { \"$basename\", $arrayname }," >> $output
 done
 
diff --git a/scripts/make_device_config.sh b/scripts/make_device_config.sh
index c1afb3f..354af31 100644
--- a/scripts/make_device_config.sh
+++ b/scripts/make_device_config.sh
@@ -7,7 +7,7 @@
 src=$1
 dep=$2
 target=$3
-src_dir=`dirname $src`
+src_dir=$(dirname $src)
 all_includes=
 
 process_includes () {
@@ -20,7 +20,7 @@ process_includes () {
 
 f=$src
 while [ -n "$f" ] ; do
-  f=`cat $f | tr -d '\r' | awk '/^include / {printf "'$src_dir'/%s ", $2}'`
+  f=$(cat $f | tr -d '\r' | awk '/^include / {printf "'$src_dir'/%s ", $2}')
   [ $? = 0 ] || exit 1
   all_includes="$all_includes $f"
 done
diff --git a/scripts/qemu-binfmt-conf.sh b/scripts/qemu-binfmt-conf.sh
index 289b1a3..f5bba70 100644
--- a/scripts/qemu-binfmt-conf.sh
+++ b/scripts/qemu-binfmt-conf.sh
@@ -10,7 +10,7 @@ if [ ! -f /proc/sys/fs/binfmt_misc/register ]; then
 fi
 
 # probe cpu type
-cpu=`uname -m`
+cpu=$(uname -m)
 case "$cpu" in
   i386|i486|i586|i686|i86pc|BePC|x86_64)
     cpu="i386"
diff --git a/scripts/update-linux-headers.sh b/scripts/update-linux-headers.sh
index f7d62d9..08c4c4a 100755
--- a/scripts/update-linux-headers.sh
+++ b/scripts/update-linux-headers.sh
@@ -10,7 +10,7 @@
 # This work is licensed under the terms of the GNU GPL version 2.
 # See the COPYING file in the top-level directory.
 
-tmpdir=`mktemp -d`
+tmpdir=$(mktemp -d)
 linux="$1"
 output="$2"
 
-- 
2.1.4


