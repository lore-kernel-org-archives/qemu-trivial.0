Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bxA1f-0006cA-IG
	for mharc-qemu-trivial@gnu.org; Thu, 20 Oct 2016 05:52:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34179)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anand.indukala@gmail.com>) id 1bxA1d-0006ap-05
	for qemu-trivial@nongnu.org; Thu, 20 Oct 2016 05:52:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anand.indukala@gmail.com>) id 1bxA1c-00027d-1h
	for qemu-trivial@nongnu.org; Thu, 20 Oct 2016 05:52:37 -0400
Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241]:34493)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <anand.indukala@gmail.com>)
	id 1bxA1X-00025k-I6; Thu, 20 Oct 2016 05:52:31 -0400
Received: by mail-pf0-x241.google.com with SMTP id 128so5132933pfz.1;
	Thu, 20 Oct 2016 02:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=9489FRSvjveLNqQWfME3m3vYpEq8bJveHi10qpSfdrU=;
	b=pNB4rzkYCSlrQJy3opxoE02/4Y4HIRPe4MCnv8KhhNHrz3SY1F7KrpUPB59LKDK386
	lW2Pu4Zt+lGEgcMjw2o6SmgVheZbXGbaMl/GkGN3FjEbzJ3H0dOe76U00ZKFGxivk17r
	wspMqFeIQ20hk4xtBPX12+hpkcKHtGXAsEOrAlH2iMFRtJiOqK+Ogxffh7W5Lw1ke7bY
	SRR8ztZkaYlWQigY4K/Y6opuIhS9mZ8M/ZNDBMP7gkHMSHUXgFa5NRrEdiRmbeOnaiWh
	H3RuwVYtHLnVv/oJogap6tKU8iX5AuYGQ0OmBaGmumU4uo4YNGAzHCgRJUMv8qQNpWNL
	auPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=9489FRSvjveLNqQWfME3m3vYpEq8bJveHi10qpSfdrU=;
	b=kCfkQ2w3nO/uNuIBtItGFW1/l9TXSxxbzWXy+/xWpiDi6NOXVeqdvwmPx9dSKQtkMS
	tFQ/1TgpxMLITTPm0roQCQo4Y79nOmVPpzQ9ujafWZ947VjrJAh0APsbN7Slx/ovt17e
	+sZKIGbrPm9+EPjrbOgq96Z5na2sz1ibc9u2dLQGDYP6mP/PeEBQj9nfGV5zukiVVE3f
	ZXn6juxdUv4+puiUsNVA57LZw+GCaKQApp5tRhrYFKAQIxCnVqW6t8FB9z3qqA4yspST
	uaFUEonMQj+ofvEAlbw4aOpjitQejsmc/VF9A2pWvwjMtJ3lVZJax7Ffvh0z4GCMxh/V
	+j8g==
X-Gm-Message-State: AA6/9Rknq9IIhZ007mtzLHT94/JwXHVGFI8hdcSrbdGpnuuRLSiJXnCGPIpiqzGtIzBo4Q==
X-Received: by 10.98.90.130 with SMTP id o124mr19776724pfb.53.1476957150083;
	Thu, 20 Oct 2016 02:52:30 -0700 (PDT)
Received: from anand.j ([117.209.162.59])
	by smtp.googlemail.com with ESMTPSA id
	g67sm27721482pfd.82.2016.10.20.02.52.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Oct 2016 02:52:29 -0700 (PDT)
From: Anand J <anand.indukala@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	thuth@redhat.com
Date: Thu, 20 Oct 2016 15:22:12 +0530
Message-Id: <1476957133-24382-1-git-send-email-anand.indukala@gmail.com>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::241
Subject: [Qemu-trivial] [Qemu-devel] [PATCH 1/2] script/clean-includes:
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
X-List-Received-Date: Thu, 20 Oct 2016 09:52:38 -0000

Added script to check duplicate #include entries. This check will scan
and print the files in which duplicate #include entries are present.

Script might output false positive entries as well. Such entries should
not be removed. So if it finds any duplicate entries script will
terminate with an exit status 1. Then each and every file should be
checked manually and corrected if necessary.

In order to enable the check use --check-duphead option with
script/clean-includes.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Anand J <anand.indukala@gmail.com>
---
 scripts/clean-includes | 50 +++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 37 insertions(+), 13 deletions(-)

diff --git a/scripts/clean-includes b/scripts/clean-includes
index 4412a55..76dd0e4 100755
--- a/scripts/clean-includes
+++ b/scripts/clean-includes
@@ -14,15 +14,18 @@
 # the top-level directory.
 
 # Usage:
-#   clean-includes [--git subjectprefix] file ...
+#   clean-includes [--git subjectprefix] [--check-duphead] file ...
 # or
-#   clean-includes [--git subjectprefix] --all
+#   clean-includes [--git subjectprefix] [--check-duphead] --all
 #
 # If the --git subjectprefix option is given, then after making
 # the changes to the files this script will create a git commit
 # with the subject line "subjectprefix: Clean up includes"
 # and a boilerplate commit message.
 #
+# If --check-duphead option is used, then check for duplicate
+# header files will be enabled.
+#
 # Using --all will cause clean-includes to run on the whole source
 # tree (excluding certain directories which are known not to need
 # handling).
@@ -45,23 +48,36 @@
 
 
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
+    "--check-duphead")
+        DUPHEAD=yes
+        shift
+        ;;
+    *)
+        break
+        ;;
+   esac
+done
 
 if [ $# -eq 0 ]; then
-    echo "Usage: clean-includes [--git subjectprefix] [--all | foo.c ...]"
+    echo "Usage: clean-includes [--git subjectprefix] [--check-duphead] [--all | foo.c ...]"
     echo "(modifies the files in place)"
     exit 1
 fi
@@ -154,6 +170,14 @@ for f in "$@"; do
 
 done
 
+if [ "$DUPHEAD" = "yes" ]; then
+    grep "^#include" $@ | sort | uniq -c | awk '{if ($1 > 1) print $0}'
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


