Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c09Va-00036D-NI
	for mharc-qemu-trivial@gnu.org; Fri, 28 Oct 2016 11:55:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37043)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1c09VW-00031L-Q3
	for qemu-trivial@nongnu.org; Fri, 28 Oct 2016 11:55:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1c09VV-0003Mw-OY
	for qemu-trivial@nongnu.org; Fri, 28 Oct 2016 11:55:50 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:35486)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1c09VQ-0003Gs-ML; Fri, 28 Oct 2016 11:55:45 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id A550C43748;
	Fri, 28 Oct 2016 18:55:43 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id C5E06B53;
	Fri, 28 Oct 2016 18:18:57 +0300 (MSK)
Received: (nullmailer pid 6087 invoked by uid 1000);
	Fri, 28 Oct 2016 15:18:56 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Anand J <anand.indukala@gmail.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Fri, 28 Oct 2016 18:18:52 +0300
Message-Id: <d66253e46ae2b9c36a9dd90b2b74c0dfa5804b22.1477667878.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1477667878.git.mjt@msgid.tls.msk.ru>
References: <cover.1477667878.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1477667878.git.mjt@msgid.tls.msk.ru>
References: <cover.1477667878.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 21/23] scripts/clean-includes: added duplicate
 #include check
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
X-List-Received-Date: Fri, 28 Oct 2016 15:55:51 -0000

From: Anand J <anand.indukala@gmail.com>

Enhance the clean-includes script to optionally check for duplicate #include
entries.

Script might output false positive entries as well. Such entries should
not be removed. So if it finds any duplicate entries script will
terminate with an exit status 1. Then each and every file should be
checked manually and corrected if necessary.

In order to enable the check use --check-dup-head option with
scripts/clean-includes.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Anand J <anand.indukala@gmail.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 scripts/clean-includes | 56 +++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 42 insertions(+), 14 deletions(-)

diff --git a/scripts/clean-includes b/scripts/clean-includes
index 4412a55..dd938da 100755
--- a/scripts/clean-includes
+++ b/scripts/clean-includes
@@ -14,15 +14,18 @@
 # the top-level directory.
 
 # Usage:
-#   clean-includes [--git subjectprefix] file ...
+#   clean-includes [--git subjectprefix] [--check-dup-head] file ...
 # or
-#   clean-includes [--git subjectprefix] --all
+#   clean-includes [--git subjectprefix] [--check-dup-head] --all
 #
 # If the --git subjectprefix option is given, then after making
 # the changes to the files this script will create a git commit
 # with the subject line "subjectprefix: Clean up includes"
 # and a boilerplate commit message.
 #
+# If --check-dup-head is specified, additionally check for duplicate
+# header includes.
+#
 # Using --all will cause clean-includes to run on the whole source
 # tree (excluding certain directories which are known not to need
 # handling).
@@ -45,23 +48,40 @@
 
 
 GIT=no
+DUPHEAD=no
 
 # Extended regular expression defining files to ignore when using --all
 XDIRREGEX='^(tests/tcg|tests/multiboot|pc-bios|disas/libvixl)'
 
-if [ $# -ne 0 ] && [ "$1" = "--git" ]; then
-    if [ $# -eq 1 ]; then
-        echo "--git option requires an argument"
-        exit 1
-    fi
-    GITSUBJ="$2"
-    GIT=yes
-    shift
-    shift
-fi
+while true
+do
+    case $1 in
+    "--git")
+         if [ $# -eq 1 ]; then
+             echo "--git option requires an argument"
+             exit 1
+         fi
+         GITSUBJ="$2"
+         GIT=yes
+         shift
+         shift
+         ;;
+    "--check-dup-head")
+        DUPHEAD=yes
+        shift
+        ;;
+    "--")
+        shift
+        break
+        ;;
+    *)
+        break
+        ;;
+   esac
+done
 
 if [ $# -eq 0 ]; then
-    echo "Usage: clean-includes [--git subjectprefix] [--all | foo.c ...]"
+    echo "Usage: clean-includes [--git subjectprefix] [--check-dup-head] [--all | foo.c ...]"
     echo "(modifies the files in place)"
     exit 1
 fi
@@ -91,7 +111,6 @@ cat >"$COCCIFILE" <<EOT
 )
 EOT
 
-
 for f in "$@"; do
   case "$f" in
     *.inc.c)
@@ -154,6 +173,15 @@ for f in "$@"; do
 
 done
 
+if [ "$DUPHEAD" = "yes" ]; then
+    egrep "^[[:space:]]*#[[:space:]]*include" "$@" | tr -d '[:blank:]' \
+        | sort | uniq -c | awk '{if ($1 > 1) print $0}'
+    if [ $? -eq 0 ]; then
+        echo "Found duplicate header file includes. Please check the above files manually."
+        exit 1
+    fi
+fi
+
 if [ "$GIT" = "yes" ]; then
     git add -- "$@"
     git commit --signoff -F - <<EOF
-- 
2.1.4


