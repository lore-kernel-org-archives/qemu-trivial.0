Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QPHuc-0005Ca-VQ
	for mharc-qemu-trivial@gnu.org; Wed, 25 May 2011 13:30:26 -0400
Received: from eggs.gnu.org ([140.186.70.92]:60064)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1QPHua-00059F-RQ
	for qemu-trivial@nongnu.org; Wed, 25 May 2011 13:30:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1QPHua-0005rg-3H
	for qemu-trivial@nongnu.org; Wed, 25 May 2011 13:30:24 -0400
Received: from mnementh.archaic.org.uk ([81.2.115.146]:42279)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1QPHuX-0005qK-Uh; Wed, 25 May 2011 13:30:22 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.72)
	(envelope-from <pm215@archaic.org.uk>)
	id 1QPHuT-0000Qy-NN; Wed, 25 May 2011 18:30:17 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 25 May 2011 18:30:17 +0100
Message-Id: <1306344617-1645-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 81.2.115.146
Cc: qemu-trivial@nongnu.org, patches@linaro.org
Subject: [Qemu-trivial] [PATCH v2] configure: Don't create symlinks to
	nonexistent targets
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
X-List-Received-Date: Wed, 25 May 2011 17:30:25 -0000

When we create the symlinks to source tree files, don't create them
if the file is not actually present in the source tree; this will
happen if the file is in a git submodule that wasn't checked out.

This also avoids the odd effect where an in-source-tree configure
will end up creating the missing file as a symlink to itself.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
v2: Remove the debug printing. Oops.

 configure |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/configure b/configure
index a318d37..a648f3d 100755
--- a/configure
+++ b/configure
@@ -3564,7 +3564,9 @@ for bios_file in $source_path/pc-bios/*.bin $source_path/pc-bios/*.rom $source_p
 done
 mkdir -p $DIRS
 for f in $FILES ; do
-    test -e $f || symlink $source_path/$f $f
+    if [ -e "$source_path/$f" -a ! -e "$f" ]; then
+        symlink "$source_path/$f" "$f"
+    fi
 done
 
 # temporary config to build submodules
-- 
1.7.1


