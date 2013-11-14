Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Vh1KC-0007yc-Ml
	for mharc-qemu-trivial@gnu.org; Thu, 14 Nov 2013 13:07:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47555)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1Vh1K6-0007s5-Un
	for qemu-trivial@nongnu.org; Thu, 14 Nov 2013 13:07:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1Vh1K2-0001m6-2H
	for qemu-trivial@nongnu.org; Thu, 14 Nov 2013 13:07:22 -0500
Received: from qemu.weilnetz.de ([37.221.198.45]:39334
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1Vh1Js-0001iF-2A; Thu, 14 Nov 2013 13:07:08 -0500
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id 4AED41802A5; Thu, 14 Nov 2013 19:07:04 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel <qemu-devel@nongnu.org>
Date: Thu, 14 Nov 2013 19:07:03 +0100
Message-Id: <1384452423-7831-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.198.45
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: [Qemu-trivial] [PATCH (1.7?)] configure: Use -B switch only for
	Python versions which support it
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
X-List-Received-Date: Thu, 14 Nov 2013 18:07:27 -0000

Commit 1d984a67a95d88f3e708b077dab8adeb47c38c93 added the -B switch
unconditionally. This breaks Python versions before 2.6 which don't
support that switch.

Now configure adds -B only if it is accepted by the Python interpreter.

This modification introduces a small incompatiblity because -B might now
also be added when configure was called with --python=PYTHON_INTERPRETER.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 configure |    9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

This is an optional patch. We need it for Python versions older than 5 years
if we don't want to use the workaround --python=python.

I don't think it is needed for 1.7, but maybe other people think different.

Stefan

diff --git a/configure b/configure
index 9a02610..3c25816 100755
--- a/configure
+++ b/configure
@@ -593,7 +593,7 @@ fi
 
 : ${make=${MAKE-make}}
 : ${install=${INSTALL-install}}
-: ${python=${PYTHON-python -B}}
+: ${python=${PYTHON-python}}
 : ${smbd=${SMBD-/usr/sbin/smbd}}
 
 # Default objcc to clang if available, otherwise use CC
@@ -1420,6 +1420,13 @@ if ! $python -c 'import sys; sys.exit(sys.version_info < (2,4) or sys.version_in
       "Use --python=/path/to/python to specify a supported Python."
 fi
 
+# The -B switch was added in Python 2.6.
+# If it is supplied, compiled files are not written.
+# Use it for Python versions which support it.
+if $python -B -c 'import sys; sys.exit(0)' 2>/dev/null; then
+  $python="$python -B"
+fi
+
 if test -z "${target_list+xxx}" ; then
     target_list="$default_target_list"
 else
-- 
1.7.10.4


