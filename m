Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SCZiu-00018v-NL
	for mharc-qemu-trivial@gnu.org; Tue, 27 Mar 2012 12:58:20 -0400
Received: from eggs.gnu.org ([208.118.235.92]:41925)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1SCZil-0000hM-Kt
	for qemu-trivial@nongnu.org; Tue, 27 Mar 2012 12:58:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1SCZig-0007vQ-Sw
	for qemu-trivial@nongnu.org; Tue, 27 Mar 2012 12:58:11 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:53582)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1SCZib-0007uG-NN; Tue, 27 Mar 2012 12:58:01 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	C9CC572800B0; Tue, 27 Mar 2012 18:57:55 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id rbRR-W6by0X3; Tue, 27 Mar 2012 18:57:55 +0200 (CEST)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 9203072800B2; Tue, 27 Mar 2012 18:57:50 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Tue, 27 Mar 2012 18:57:50 +0200
Message-Id: <1332867470-29780-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.9
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Andreas Faerber <andreas.faerber@web.de>,
	Emre Ersin <emre.ersin@gmail.com>, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH] Fix conversion from lower to upper case with
	Turkish locale
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
X-List-Received-Date: Tue, 27 Mar 2012 16:58:17 -0000

Some locale settings let make fail or create wrong results
because tr '[:lower:]' '[:upper:]' which is used to convert
from lower to upper case depends on the locale.

With locale tr_TR.UTF-8, lower case 'i' is not converted to 'I'.
This results in wrong entries in config-host.h like these ones:

  #define CONFIG_QEMU_PREFiX "/usr/local"
  #define CONFIG_QEMU_BiNDiR "/usr/local/bin"

This problem was reported by Emre Ersin.

The same problem occurs when configure creates the target specific
files config-target.mak. They get wrong declarations:

TARGET_CRiS=y
TARGET_i386=y
TARGET_MiCROBLAZE=y
TARGET_MiPS64=y
TARGET_MiPS=y
TARGET_UNiCORE32=y

It is sufficient to restrict the conversion to the characters a-z.

Using this explicit range avoids the dependency on the locale
settings and is also shorter.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 configure             |    6 +++---
 scripts/create_config |    6 +++---
 scripts/tracetool     |    4 ++--
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/configure b/configure
index 14ef738..39a78dd 100755
--- a/configure
+++ b/configure
@@ -3052,12 +3052,12 @@ if test "$cap_ng" = "yes" ; then
   echo "CONFIG_LIBCAP=y" >> $config_host_mak
 fi
 for card in $audio_card_list; do
-    def=CONFIG_`echo $card | tr '[:lower:]' '[:upper:]'`
+    def=CONFIG_`echo $card | tr '[a-z]' '[A-Z]'`
     echo "$def=y" >> $config_host_mak
 done
 echo "CONFIG_AUDIO_DRIVERS=$audio_drv_list" >> $config_host_mak
 for drv in $audio_drv_list; do
-    def=CONFIG_`echo $drv | tr '[:lower:]' '[:upper:]'`
+    def=CONFIG_`echo $drv | tr '[a-z]' '[A-Z]'`
     echo "$def=y" >> $config_host_mak
     if test "$drv" = "fmod"; then
         echo "FMOD_CFLAGS=-I$fmod_inc" >> $config_host_mak
@@ -3618,7 +3618,7 @@ echo "TARGET_INT_ALIGNMENT=$target_int_alignment" >> $config_target_mak
 echo "TARGET_LONG_ALIGNMENT=$target_long_alignment" >> $config_target_mak
 echo "TARGET_LLONG_ALIGNMENT=$target_llong_alignment" >> $config_target_mak
 echo "TARGET_ARCH=$TARGET_ARCH" >> $config_target_mak
-target_arch_name="`echo $TARGET_ARCH | tr '[:lower:]' '[:upper:]'`"
+target_arch_name="`echo $TARGET_ARCH | tr '[a-z]' '[A-Z]'`"
 echo "TARGET_$target_arch_name=y" >> $config_target_mak
 echo "TARGET_ARCH2=$target_arch2" >> $config_target_mak
 # TARGET_BASE_ARCH needs to be defined after TARGET_ARCH
diff --git a/scripts/create_config b/scripts/create_config
index 0098e68..ee4737e 100755
--- a/scripts/create_config
+++ b/scripts/create_config
@@ -16,7 +16,7 @@ case $line in
  prefix=* | [a-z]*dir=*) # directory configuration
     name=${line%=*}
     value=${line#*=}
-    define_name=`echo $name | tr '[:lower:]' '[:upper:]'`
+    define_name=`echo $name | tr '[a-z]' '[A-Z]'`
     eval "define_value=\"$value\""
     echo "#define CONFIG_QEMU_$define_name \"$define_value\""
     # save for the next definitions
@@ -48,7 +48,7 @@ case $line in
     ;;
  ARCH=*) # configuration
     arch=${line#*=}
-    arch_name=`echo $arch | tr '[:lower:]' '[:upper:]'`
+    arch_name=`echo $arch | tr '[a-z]' '[A-Z]'`
     echo "#define HOST_$arch_name 1"
     ;;
  HOST_USB=*)
@@ -73,7 +73,7 @@ case $line in
  TARGET_BASE_ARCH=*) # configuration
     target_base_arch=${line#*=}
     if [ "$target_base_arch" != "$target_arch" ]; then
-      base_arch_name=`echo $target_base_arch | tr '[:lower:]' '[:upper:]'`
+      base_arch_name=`echo $target_base_arch | tr '[a-z]' '[A-Z]'`
       echo "#define TARGET_$base_arch_name 1"
     fi
     ;;
diff --git a/scripts/tracetool b/scripts/tracetool
index 65bd0a1..ddd0ec5 100755
--- a/scripts/tracetool
+++ b/scripts/tracetool
@@ -410,7 +410,7 @@ linetoh_dtrace()
     args=$(get_args "$1")
     argnames=$(get_argnames "$1", ",")
 
-    nameupper=`echo $name | tr '[:lower:]' '[:upper:]'`
+    nameupper=`echo $name | tr '[a-z]' '[A-Z]'`
 
     # Define an empty function for the trace event
     cat <<EOF
@@ -539,7 +539,7 @@ convert()
         fi
         if [ "$1" = "h" ]; then
             name=$(get_name "$str")
-            NAME=$(echo $name | tr '[:lower:]' '[:upper:]')
+            NAME=$(echo $name | tr '[a-z]' '[A-Z]')
             echo "#define TRACE_${NAME}_ENABLED ${enabled}"
         fi
     done
-- 
1.7.9


