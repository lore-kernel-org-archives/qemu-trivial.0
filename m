Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VEJ54-0000GU-Mn
	for mharc-qemu-trivial@gnu.org; Tue, 27 Aug 2013 09:13:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46438)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VEJ4x-00006u-Qg
	for qemu-trivial@nongnu.org; Tue, 27 Aug 2013 09:13:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VEJ4s-00025c-QT
	for qemu-trivial@nongnu.org; Tue, 27 Aug 2013 09:13:03 -0400
Received: from qemu.weilnetz.de ([37.221.198.45]:33846
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VEJ4i-0001ys-Is; Tue, 27 Aug 2013 09:12:48 -0400
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id 9D4A217F6F9; Tue, 27 Aug 2013 15:12:45 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel <qemu-devel@nongnu.org>, qemu-trivial <qemu-trivial@nongnu.org>
Date: Tue, 27 Aug 2013 15:12:41 +0200
Message-Id: <1377609161-25108-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.198.45
Cc: Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH] configure: Don't write .pyc files by default
	(python -B)
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
X-List-Received-Date: Tue, 27 Aug 2013 13:13:08 -0000

When a Python script is run, Python normally writes bytecode into a .pyc file.
QEMU's build process uses several Python scripts which are called from
configure or make.

The generated .pyc files take disk space without being of much use, because
those scripts are short, not time critical and only called a few times.

Python's option -B disables writing of .pyc files. QEMU now uses "python -B"
as default, but it is still possible to choose a different call by passing
--python=PYTHON to configure.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---

It was necessary to change from "$python" to simply $python in the
Python test. This should not matter: we already have a simple $python
in configure, and Python wants to be installed in a path without
spaces.

Stefan

 configure |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index 0a55c20..db69327 100755
--- a/configure
+++ b/configure
@@ -568,7 +568,7 @@ fi
 
 : ${make=${MAKE-make}}
 : ${install=${INSTALL-install}}
-: ${python=${PYTHON-python}}
+: ${python=${PYTHON-python -B}}
 : ${smbd=${SMBD-/usr/sbin/smbd}}
 
 # Default objcc to clang if available, otherwise use CC
@@ -1348,7 +1348,7 @@ fi
 
 # Note that if the Python conditional here evaluates True we will exit
 # with status 1 which is a shell 'false' value.
-if ! "$python" -c 'import sys; sys.exit(sys.version_info < (2,4) or sys.version_info >= (3,))'; then
+if ! $python -c 'import sys; sys.exit(sys.version_info < (2,4) or sys.version_info >= (3,))'; then
   error_exit "Cannot use '$python', Python 2.4 or later is required." \
       "Note that Python 3 or later is not yet supported." \
       "Use --python=/path/to/python to specify a supported Python."
-- 
1.7.10.4


