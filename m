Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VtOhh-00021r-OH
	for mharc-qemu-trivial@gnu.org; Wed, 18 Dec 2013 16:30:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34859)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VtOhb-0001sS-C5
	for qemu-trivial@nongnu.org; Wed, 18 Dec 2013 16:30:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VtOhW-0008Lz-DK
	for qemu-trivial@nongnu.org; Wed, 18 Dec 2013 16:30:47 -0500
Received: from qemu.weilnetz.de ([37.221.198.45]:48242
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VtOhK-0008Kt-0F; Wed, 18 Dec 2013 16:30:30 -0500
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id DC38117F6D6; Wed, 18 Dec 2013 22:30:26 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel <qemu-devel@nongnu.org>
Date: Wed, 18 Dec 2013 22:30:26 +0100
Message-Id: <1387402226-20892-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.198.45
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH] configure: Python tests must be done before
	help message
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
X-List-Received-Date: Wed, 18 Dec 2013 21:30:52 -0000

The help message uses $python and displays its value, so that macro
should be tested and set early.

With this modification, configure --help displays the correct value
(usually python -B) and no longer creates several *.pyc files.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---

There still remains a problem with configure --help: it creates new files
config.log, config.status.

Regards,
Stefan Weil

 configure |   38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/configure b/configure
index f81a629..d899da6 100755
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


