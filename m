Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SIOTE-0002z2-4i
	for mharc-qemu-trivial@gnu.org; Thu, 12 Apr 2012 14:10:12 -0400
Received: from eggs.gnu.org ([208.118.235.92]:50548)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1SIOTB-0002qY-R4
	for qemu-trivial@nongnu.org; Thu, 12 Apr 2012 14:10:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1SIOT9-0007Ii-R8
	for qemu-trivial@nongnu.org; Thu, 12 Apr 2012 14:10:09 -0400
Received: from mnementh.archaic.org.uk ([81.2.115.146]:60301)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1SIOT2-00079H-OQ; Thu, 12 Apr 2012 14:10:00 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.72)
	(envelope-from <pm215@archaic.org.uk>)
	id 1SIOSu-0006p7-Ov; Thu, 12 Apr 2012 19:09:52 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu, 12 Apr 2012 19:09:52 +0100
Message-Id: <1334254192-26204-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 81.2.115.146
Cc: qemu-trivial@nongnu.org, Boris Matti <swiftos@lavabit.com>,
	patches@linaro.org
Subject: [Qemu-trivial] [PATCH] configure: Insist on a Python 2, not Python 3
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
X-List-Received-Date: Thu, 12 Apr 2012 18:10:11 -0000

Our Python scripts require Python 2 and will fail on Python 3, eg:
  File "/home/petmay01/linaro/qemu-from-laptop/qemu/scripts/qapi-commands.py", line 378
      except getopt.GetoptError, err:
                               ^
  SyntaxError: invalid syntax

Add a check to configure that Python is not a Python 3, so we can
fail with a comprehensible error rather than an obscure one.

Reported-by: Boris Matti <swiftos@lavabit.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 configure |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/configure b/configure
index e05f34b..1d5ab07 100755
--- a/configure
+++ b/configure
@@ -1242,6 +1242,14 @@ if ! has $python; then
   exit 1
 fi
 
+# Note that if the Python conditional here evaluates True we will exit
+# with status 1 which is a shell 'false' value.
+if ! "$python" -c 'import sys; sys.exit(sys.version_info[0] >= 3)'; then
+  echo "Python 2 required but '$python' is version 3 or better."
+  echo "Use --python=/path/to/python to specify a Python 2."
+  exit 1
+fi
+
 if test -z "$target_list" ; then
     target_list="$default_target_list"
 else
-- 
1.7.1


