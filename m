Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S9bak-0000tl-FA
	for mharc-qemu-trivial@gnu.org; Mon, 19 Mar 2012 08:21:38 -0400
Received: from eggs.gnu.org ([208.118.235.92]:50832)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1S9baY-0000K7-SA
	for qemu-trivial@nongnu.org; Mon, 19 Mar 2012 08:21:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1S9baT-0008FV-Ru
	for qemu-trivial@nongnu.org; Mon, 19 Mar 2012 08:21:26 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:34031)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1S9ba1-0008C6-14; Mon, 19 Mar 2012 08:20:53 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	39713728009E; Mon, 19 Mar 2012 13:20:51 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id FjkOM000pzFB; Mon, 19 Mar 2012 13:20:50 +0100 (CET)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 381E7728009F; Mon, 19 Mar 2012 13:20:50 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Mon, 19 Mar 2012 13:20:47 +0100
Message-Id: <1332159647-9456-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.9
In-Reply-To: <20120319113006.GC30033@stefanha-thinkpad.localdomain>
References: <20120319113006.GC30033@stefanha-thinkpad.localdomain>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.47.199.172
Cc: qemu-trivial <qemu-trivial@nongnu.org>, peter.maydell@linaro.org,
	Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH v2] configure: Fix creation of symbolic links
	for MinGW toolchain
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
X-List-Received-Date: Mon, 19 Mar 2012 12:21:37 -0000

The MinGW toolchain on w32/w64 hosts does not create symbolic links,
but implements 'ln -s' similar to 'cp -r'.

In incremental out of tree builds, this resulted in files which
were not updated when their counterparts in the QEMU source tree
changed. Especially for Makefile* this happened very often.

With this patch, the 'symlinked' files are now always updated for
out of tree builds. Similar code was already used for the symbolic
link of libcacard/Makefile.

The symlink macro always removes the target before it is created
again, therefore the rm command for libcacard/Makefile was redundant
and is removed now.

Macro symlink is also used with directories. To remove them on w32
hosts, a recursive rm is needed.

v2:
Quote arguments in shell function symlink, and also quote any argument
which is passed to symlink and which contains macros. This should reduce
the chance of accidents caused by rm -rf.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 configure |   21 ++++++++++-----------
 1 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/configure b/configure
index afe7395..53a8174 100755
--- a/configure
+++ b/configure
@@ -41,8 +41,8 @@ compile_prog() {
 
 # symbolically link $1 to $2.  Portable version of "ln -sf".
 symlink() {
-  rm -f $2
-  ln -s $1 $2
+  rm -rf "$2"
+  ln -s "$1" "$2"
 }
 
 # check whether a command is available to this shell (may be either an
@@ -3373,7 +3373,7 @@ fi
 
 for d in libdis libdis-user; do
     mkdir -p $d
-    symlink $source_path/Makefile.dis $d/Makefile
+    symlink "$source_path/Makefile.dis" "$d/Makefile"
     echo > $d/config.mak
 done
 
@@ -3382,13 +3382,13 @@ if test "$linux" = "yes" ; then
   mkdir -p linux-headers
   case "$cpu" in
   i386|x86_64)
-    symlink $source_path/linux-headers/asm-x86 linux-headers/asm
+    symlink "$source_path/linux-headers/asm-x86" linux-headers/asm
     ;;
   ppcemb|ppc|ppc64)
-    symlink $source_path/linux-headers/asm-powerpc linux-headers/asm
+    symlink "$source_path/linux-headers/asm-powerpc" linux-headers/asm
     ;;
   s390x)
-    symlink $source_path/linux-headers/asm-s390 linux-headers/asm
+    symlink "$source_path/linux-headers/asm-s390" linux-headers/asm
     ;;
   esac
 fi
@@ -3453,7 +3453,7 @@ mkdir -p $target_dir/kvm
 if test "$target" = "arm-linux-user" -o "$target" = "armeb-linux-user" -o "$target" = "arm-bsd-user" -o "$target" = "armeb-bsd-user" ; then
   mkdir -p $target_dir/nwfpe
 fi
-symlink $source_path/Makefile.target $target_dir/Makefile
+symlink "$source_path/Makefile.target" "$target_dir/Makefile"
 
 
 echo "# Automatically generated by configure - do not modify" > $config_target_mak
@@ -3883,7 +3883,7 @@ do
 done
 mkdir -p $DIRS
 for f in $FILES ; do
-    if [ -e "$source_path/$f" ] && ! [ -e "$f" ]; then
+    if [ -e "$source_path/$f" ] && [ "$source_path" != `pwd` ]; then
         symlink "$source_path/$f" "$f"
     fi
 done
@@ -3906,7 +3906,7 @@ for hwlib in 32 64; do
   mkdir -p $d
   mkdir -p $d/ide
   mkdir -p $d/usb
-  symlink $source_path/Makefile.hw $d/Makefile
+  symlink "$source_path/Makefile.hw" "$d/Makefile"
   mkdir -p $d/9pfs
   echo "QEMU_CFLAGS+=-DTARGET_PHYS_ADDR_BITS=$hwlib" > $d/config.mak
 done
@@ -3914,7 +3914,6 @@ done
 if [ "$source_path" != `pwd` ]; then
     # out of tree build
     mkdir -p libcacard
-    rm -f libcacard/Makefile
     symlink "$source_path/libcacard/Makefile" libcacard/Makefile
 fi
 
@@ -3922,7 +3921,7 @@ d=libuser
 mkdir -p $d
 mkdir -p $d/trace
 mkdir -p $d/qom
-symlink $source_path/Makefile.user $d/Makefile
+symlink "$source_path/Makefile.user" "$d/Makefile"
 
 if test "$docs" = "yes" ; then
   mkdir -p QMP
-- 
1.7.9


