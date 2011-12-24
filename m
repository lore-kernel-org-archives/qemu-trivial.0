Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ReRKA-0005Bb-Ny
	for mharc-qemu-trivial@gnu.org; Sat, 24 Dec 2011 08:07:42 -0500
Received: from eggs.gnu.org ([140.186.70.92]:48569)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1ReRK7-0004yw-Bh
	for qemu-trivial@nongnu.org; Sat, 24 Dec 2011 08:07:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1ReRK6-0001X9-5l
	for qemu-trivial@nongnu.org; Sat, 24 Dec 2011 08:07:39 -0500
Received: from mnementh.archaic.org.uk ([81.2.115.146]:55606)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1ReRK3-0001W6-2J; Sat, 24 Dec 2011 08:07:35 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.72)
	(envelope-from <pm215@archaic.org.uk>)
	id 1ReRJt-0001RP-BU; Sat, 24 Dec 2011 13:07:25 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat, 24 Dec 2011 13:07:25 +0000
Message-Id: <1324732045-5516-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 81.2.115.146
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>, patches@linaro.org
Subject: [Qemu-trivial] [PATCH] configure: Fix test for supported host CPU
	type
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
X-List-Received-Date: Sat, 24 Dec 2011 13:07:40 -0000

The test for whether the host CPU is supported had several problems:
 * the attempt to fall back to TCI was done as a duplicate
   test, very late (so "--cpu foo" would fail early but "--cpu unicore32"
   would fail late, differently, and after configure had already
   printed a lot of output)
 * a number of CPUs only supported as guests were included in the
   list of CPUs we would accept as valid hosts, which would result
   in a late compile failure on those systems rather than a
   configure failure or fallback to TCI
 * bailing out for an unsupported CPU happened before the main
   option parsing, so "configure --help" wouldn't work

Fix these by folding the setting of ARCH into the first test for
supported host CPU, removing spurious guest-only CPU names from it,
and moving the "fall back to TCI" code earlier.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 configure |   44 +++++++++++++++++++++-----------------------
 1 files changed, 21 insertions(+), 23 deletions(-)

diff --git a/configure b/configure
index 640e815..a563516 100755
--- a/configure
+++ b/configure
@@ -300,8 +300,11 @@ else
   cpu=`uname -m`
 fi
 
+ARCH=
+# Normalise host CPU name and set ARCH.
+# Note that this case should only have supported host CPUs, not guests.
 case "$cpu" in
-  alpha|cris|ia64|lm32|m68k|microblaze|ppc|ppc64|sparc64|unicore32)
+  ia64|ppc|ppc64|s390|s390x|sparc64)
     cpu="$cpu"
   ;;
   i386|i486|i586|i686|i86pc|BePC)
@@ -319,20 +322,17 @@ case "$cpu" in
   mips*)
     cpu="mips"
   ;;
-  s390)
-    cpu="s390"
-  ;;
-  s390x)
-    cpu="s390x"
-  ;;
   sparc|sun4[cdmuv])
     cpu="sparc"
   ;;
   *)
-    echo "Unsupported CPU = $cpu"
-    exit 1
+    # This will result in either an error or falling back to TCI later
+    ARCH=unknown
   ;;
 esac
+if test -z "$ARCH"; then
+  ARCH="$cpu"
+fi
 
 # OS specific
 if check_define __linux__ ; then
@@ -1080,6 +1080,18 @@ echo "NOTE: The object files are built at the place where configure is launched"
 exit 1
 fi
 
+# Now we have handled --enable-tcg-interpreter and know we're not just
+# printing the help message, bail out if the host CPU isn't supported.
+if test "$ARCH" = "unknown"; then
+    if test "$tcg_interpreter" = "yes" ; then
+        echo "Unsupported CPU = $cpu, will use TCG with TCI (experimental)"
+        ARCH=tci
+    else
+        echo "Unsupported CPU = $cpu, try --enable-tcg-interpreter"
+        exit 1
+    fi
+fi
+
 # check that the C compiler works.
 cat > $TMPC <<EOF
 int main(void) { return 0; }
@@ -2903,20 +2915,6 @@ echo "sysconfdir=$sysconfdir" >> $config_host_mak
 echo "docdir=$docdir" >> $config_host_mak
 echo "confdir=$confdir" >> $config_host_mak
 
-case "$cpu" in
-  i386|x86_64|alpha|arm|cris|hppa|ia64|lm32|m68k|microblaze|mips|mips64|ppc|ppc64|s390|s390x|sparc|sparc64|unicore32)
-    ARCH=$cpu
-  ;;
-  *)
-    if test "$tcg_interpreter" = "yes" ; then
-        echo "Unsupported CPU = $cpu, will use TCG with TCI (experimental)"
-        ARCH=tci
-    else
-        echo "Unsupported CPU = $cpu, try --enable-tcg-interpreter"
-        exit 1
-    fi
-  ;;
-esac
 echo "ARCH=$ARCH" >> $config_host_mak
 if test "$debug_tcg" = "yes" ; then
   echo "CONFIG_DEBUG_TCG=y" >> $config_host_mak
-- 
1.7.5.4


