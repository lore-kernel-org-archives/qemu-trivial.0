Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eQh3Z-00035D-GB
	for mharc-qemu-trivial@gnu.org; Sun, 17 Dec 2017 17:05:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47823)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1eQh3W-00032A-Oc
	for qemu-trivial@nongnu.org; Sun, 17 Dec 2017 17:05:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1eQh3V-00069z-Sq
	for qemu-trivial@nongnu.org; Sun, 17 Dec 2017 17:05:10 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:33619)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1eQh3N-00065m-Ue; Sun, 17 Dec 2017 17:05:02 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 465B341178;
	Mon, 18 Dec 2017 01:04:56 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 39079CAE;
	Mon, 18 Dec 2017 00:25:46 +0300 (MSK)
Received: (nullmailer pid 30895 invoked by uid 1000);
	Sun, 17 Dec 2017 21:28:08 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <danielhb@linux.vnet.ibm.com>,
	qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Date: Mon, 18 Dec 2017 00:27:11 +0300
Message-Id: <9dcfdb30a300bc4ff11354da251a11c1c995e003.1513545944.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1513545944.git.mjt@msgid.tls.msk.ru>
References: <cover.1513545944.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1513545944.git.mjt@msgid.tls.msk.ru>
References: <cover.1513545944.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 06/61] configure: check $CC available before
 verifying host CPU
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
X-List-Received-Date: Sun, 17 Dec 2017 22:05:12 -0000

From: Daniel Henrique Barboza <danielhb@linux.vnet.ibm.com>

When executing 'configure' in a fresh QEMU clone, in a fresh
OS install running in a ppc64le host, this is the error
shown:

-----

../configure --enable-trace-backend=simple --enable-debug
    --target-list=ppc64-softmmu

ERROR: Unsupported CPU = ppc64le, try --enable-tcg-interpreter

-----

This isn't true, ppc64le host CPU is supported. This happens because,
in a fresh install, we don't have a C compiler to autodetect
the $cpu variable to "ppc64".

This patch moves the CC available check up a bit, just before verifying
the host CPU. This ensures that we bail out with a $CC not available
error instead of unsupported CPU (the host CPU detection without
the compiler wouldn't work properly anyway). It also allows --help to
keep working without a C compiler. With this patch, in the same ppc64le
host without gcc:

$ ../configure --enable-trace-backend=simple --enable-debug
    --target-list=ppc64-softmmu

ERROR: "cc" either does not exist or does not work

$ ../configure --help

Usage: configure [options]
Options: [defaults in brackets after descriptions]

Standard options:
  --help                   print this message
  --prefix=PREFIX          install in PREFIX [/usr/local]
  --interp-prefix=PREFIX   where to find shared libraries, etc.
(...)

Signed-off-by: Daniel Henrique Barboza <danielhb@linux.vnet.ibm.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 configure | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/configure b/configure
index 0c6e7572db..9c8aa5a98b 100755
--- a/configure
+++ b/configure
@@ -1582,6 +1582,20 @@ fi
 # Suppress writing compiled files
 python="$python -B"
 
+# Check that the C compiler works. Doing this here before testing
+# the host CPU ensures that we had a valid CC to autodetect the
+# $cpu var (and we should bail right here if that's not the case).
+# It also allows the help message to be printed without a CC.
+write_c_skeleton;
+if compile_object ; then
+  : C compiler works ok
+else
+    error_exit "\"$cc\" either does not exist or does not work"
+fi
+if ! compile_prog ; then
+    error_exit "\"$cc\" cannot build an executable (is your linker broken?)"
+fi
+
 # Now we have handled --enable-tcg-interpreter and know we're not just
 # printing the help message, bail out if the host CPU isn't supported.
 if test "$ARCH" = "unknown"; then
@@ -1603,17 +1617,6 @@ if test -z "$werror" ; then
     fi
 fi
 
-# check that the C compiler works.
-write_c_skeleton;
-if compile_object ; then
-  : C compiler works ok
-else
-    error_exit "\"$cc\" either does not exist or does not work"
-fi
-if ! compile_prog ; then
-    error_exit "\"$cc\" cannot build an executable (is your linker broken?)"
-fi
-
 if test "$bogus_os" = "yes"; then
     # Now that we know that we're not printing the help and that
     # the compiler works (so the results of the check_defines we used
-- 
2.11.0


