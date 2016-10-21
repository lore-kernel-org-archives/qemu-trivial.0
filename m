Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bxTlg-0007Gm-SS
	for mharc-qemu-trivial@gnu.org; Fri, 21 Oct 2016 02:57:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41418)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anand.indukala@gmail.com>) id 1bxTle-0007Ed-11
	for qemu-trivial@nongnu.org; Fri, 21 Oct 2016 02:57:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anand.indukala@gmail.com>) id 1bxTlc-0004n4-Kj
	for qemu-trivial@nongnu.org; Fri, 21 Oct 2016 02:57:26 -0400
Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244]:33989)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <anand.indukala@gmail.com>)
	id 1bxTla-0004fP-As; Fri, 21 Oct 2016 02:57:22 -0400
Received: by mail-pf0-x244.google.com with SMTP id 128so7790071pfz.1;
	Thu, 20 Oct 2016 23:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=MDSGRmy6nFtnvcgDvHNjEPcVu1ACJba8GBV0vfex2hU=;
	b=TW3qYitDugLtVA6qlGo4U4aIhWP8t6KzJmgPs+A/9TreMeLzmI2P4uuDGgZua3jvGe
	UpvhAQwZVIBHC0EPeOordQrMZzkuLRl6Vub3me51mg97uu370ofQzxGWtTZUiBwIWiuG
	S13yAHnbFyYKg8INM07yyB8GDCMCFi1fLtgY/l3eCCb5880/rUWHBe4sMgx/MrP97x+i
	IOpbbxdrAoQ6pKK5MWFzONtmE2NoAmBRN++sIIpFojzW2aJgabmiXNbdQJgQMQ3W+Vf7
	hxzObmih57a5L2YlqpT4AWxN4I3uAiGgP5tEPfJxIhpKXUYICJjcjP8SgTcULn5iMYtm
	63mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=MDSGRmy6nFtnvcgDvHNjEPcVu1ACJba8GBV0vfex2hU=;
	b=FxHEvxTQyOSIqAQ3OvysnKangKgNJEGtSstZlxYnEDUpGSi8cvTZU3NizzuNgb0x+V
	AWFLanx8/2rW5/6c3N2HmVQJ6VHBLhFFSes7km0Jkucwy4C0EzurRhuq809lCPHmcVpt
	0z8sNEAA5BwXT5+mWkrOeyoaWhPG/1Iq34ZxgbFzTdAgJRglspE42NNEvHOKvo4ZE0/e
	vxf0u2MJ5HuFtIVWMxhYX9injcmoVDBmZhfH+Alk4gEdueCY4fvDbTwL0cNN2YBHWx3Y
	AcglzIERb6CMZInmDGCqSB1wApPpSp8FCrj7WXNg07ucNIFMKGVWGLm6LnpaprK+X7BV
	wlAw==
X-Gm-Message-State: AA6/9RnNRXLeOXWwOcPtKDDP/7SWx6YpPQD6xunmu4NFNxVlZQz+yYd2mthHdJYKEfH7kg==
X-Received: by 10.98.192.135 with SMTP id g7mr8852435pfk.58.1477033041061;
	Thu, 20 Oct 2016 23:57:21 -0700 (PDT)
Received: from anand.j ([117.242.89.90]) by smtp.googlemail.com with ESMTPSA id
	j17sm2057818pfe.79.2016.10.20.23.57.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Oct 2016 23:57:20 -0700 (PDT)
From: Anand J <anand.indukala@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	thuth@redhat.com,
	eblake@redhat.com
Date: Fri, 21 Oct 2016 12:27:06 +0530
Message-Id: <1477033027-25315-2-git-send-email-anand.indukala@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1477033027-25315-1-git-send-email-anand.indukala@gmail.com>
References: <1477033027-25315-1-git-send-email-anand.indukala@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::244
Subject: [Qemu-trivial] [Qemu-devel] [PATCH v4 1/2] scripts/clean-includes:
 added duplicate #include check
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
X-List-Received-Date: Fri, 21 Oct 2016 06:57:27 -0000

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
2.7.4


