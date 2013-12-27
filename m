Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VwfhF-0001Am-UQ
	for mharc-qemu-trivial@gnu.org; Fri, 27 Dec 2013 17:15:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33209)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vwfh9-0000y8-W6
	for qemu-trivial@nongnu.org; Fri, 27 Dec 2013 17:15:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vwfh5-0005rk-JO
	for qemu-trivial@nongnu.org; Fri, 27 Dec 2013 17:15:51 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:58951)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Vwfgr-0005ob-Dx; Fri, 27 Dec 2013 17:15:33 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id DF094438A4;
	Sat, 28 Dec 2013 02:15:32 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 9A8335FE;
	Sat, 28 Dec 2013 02:07:35 +0400 (MSK)
Received: (nullmailer pid 10351 invoked by uid 1000);
	Fri, 27 Dec 2013 22:07:34 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@amazon.com
Date: Sat, 28 Dec 2013 02:07:25 +0400
Message-Id: <1388182050-10270-13-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1388182050-10270-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1388182050-10270-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 12/17] configure: Python tests must be done
	before help message
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
X-List-Received-Date: Fri, 27 Dec 2013 22:15:56 -0000

From: Stefan Weil <sw@weilnetz.de>

The help message uses $python and displays its value, so that macro
should be tested and set early.

With this modification, configure --help displays the correct value
(usually python -B) and no longer creates several *.pyc files.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 configure |   38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/configure b/configure
index 552d865..57fe31e 100755
--- a/configure
+++ b/configure
@@ -1004,6 +1004,25 @@ for opt do
   esac
 done
 
+if ! has $python; then
+  error_exit "Python not found. Use --python=/path/to/python"
+fi
+
+# Note that if the Python conditional here evaluates True we will exit
+# with status 1 which is a shell 'false' value.
+if ! $python -c 'import sys; sys.exit(sys.version_info < (2,4) or sys.version_info >= (3,))'; then
+  error_exit "Cannot use '$python', Python 2.4 or later is required." \
+      "Note that Python 3 or later is not yet supported." \
+      "Use --python=/path/to/python to specify a supported Python."
+fi
+
+# The -B switch was added in Python 2.6.
+# If it is supplied, compiled files are not written.
+# Use it for Python versions which support it.
+if $python -B -c 'import sys; sys.exit(0)' 2>/dev/null; then
+  python="$python -B"
+fi
+
 case "$cpu" in
     ppc)
            CPU_CFLAGS="-m32"
@@ -1419,25 +1438,6 @@ if test "$solaris" = "yes" ; then
   fi
 fi
 
-if ! has $python; then
-  error_exit "Python not found. Use --python=/path/to/python"
-fi
-
-# Note that if the Python conditional here evaluates True we will exit
-# with status 1 which is a shell 'false' value.
-if ! $python -c 'import sys; sys.exit(sys.version_info < (2,4) or sys.version_info >= (3,))'; then
-  error_exit "Cannot use '$python', Python 2.4 or later is required." \
-      "Note that Python 3 or later is not yet supported." \
-      "Use --python=/path/to/python to specify a supported Python."
-fi
-
-# The -B switch was added in Python 2.6.
-# If it is supplied, compiled files are not written.
-# Use it for Python versions which support it.
-if $python -B -c 'import sys; sys.exit(0)' 2>/dev/null; then
-  python="$python -B"
-fi
-
 if test -z "${target_list+xxx}" ; then
     target_list="$default_target_list"
 else
-- 
1.7.10.4


