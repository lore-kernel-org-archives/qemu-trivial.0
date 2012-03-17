Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S8vbs-0005ec-Bs
	for mharc-qemu-trivial@gnu.org; Sat, 17 Mar 2012 11:32:00 -0400
Received: from eggs.gnu.org ([208.118.235.92]:34026)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1S8vbp-0005T4-2K
	for qemu-trivial@nongnu.org; Sat, 17 Mar 2012 11:31:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1S8vbn-0003NC-Cp
	for qemu-trivial@nongnu.org; Sat, 17 Mar 2012 11:31:56 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:56850)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1S8vbj-0003Lr-AT; Sat, 17 Mar 2012 11:31:51 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	03F7B72800A0; Sat, 17 Mar 2012 16:31:49 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id JDaDCaHHuQNG; Sat, 17 Mar 2012 16:31:48 +0100 (CET)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 5C44B72800A1; Sat, 17 Mar 2012 16:31:48 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Sat, 17 Mar 2012 16:31:46 +0100
Message-Id: <1331998306-30941-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.9
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.47.199.172
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH] configure: Fix creation of symbolic links
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
X-List-Received-Date: Sat, 17 Mar 2012 15:31:58 -0000

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

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 configure |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/configure b/configure
index afe7395..acf63a9 100755
--- a/configure
+++ b/configure
@@ -41,7 +41,7 @@ compile_prog() {
 
 # symbolically link $1 to $2.  Portable version of "ln -sf".
 symlink() {
-  rm -f $2
+  rm -rf $2
   ln -s $1 $2
 }
 
@@ -3883,7 +3883,7 @@ do
 done
 mkdir -p $DIRS
 for f in $FILES ; do
-    if [ -e "$source_path/$f" ] && ! [ -e "$f" ]; then
+    if [ -e "$source_path/$f" ] && [ "$source_path" != `pwd` ]; then
         symlink "$source_path/$f" "$f"
     fi
 done
@@ -3914,7 +3914,6 @@ done
 if [ "$source_path" != `pwd` ]; then
     # out of tree build
     mkdir -p libcacard
-    rm -f libcacard/Makefile
     symlink "$source_path/libcacard/Makefile" libcacard/Makefile
 fi
 
-- 
1.7.9


