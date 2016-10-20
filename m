Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bxFa0-0003Vq-Ah
	for mharc-qemu-trivial@gnu.org; Thu, 20 Oct 2016 11:48:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41065)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anand.indukala@gmail.com>) id 1bxFZx-0003Sz-Bp
	for qemu-trivial@nongnu.org; Thu, 20 Oct 2016 11:48:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anand.indukala@gmail.com>) id 1bxFZw-0005Ii-Di
	for qemu-trivial@nongnu.org; Thu, 20 Oct 2016 11:48:25 -0400
Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242]:35860)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <anand.indukala@gmail.com>)
	id 1bxFZt-0005Hi-Of; Thu, 20 Oct 2016 11:48:21 -0400
Received: by mail-pf0-x242.google.com with SMTP id r16so5917324pfg.3;
	Thu, 20 Oct 2016 08:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=EgdDsRyr9dMnqG5UeySaEWbc+NHjCMmyLc4WsJIT2Hk=;
	b=w5kiU/sYQ3+m7ALGFZE5PKejhosRWsJ2cbs+Gxa9vC1p1LhrtN2KdhTk8KyfcDRroY
	2I3N0ITdEnOK2pcUgj/f4xDIEZFLpOA2se5na5ZkDHl2Fj8yX9rp2OdpO46NH9dt2C2C
	892nvQQFjdTHRumP+oZFtkvDjZd4xF94bO1kN2AH1vODsZwU8MkZkz5TMLDh0OFPcrPg
	0x+IdJwRgZFO6CKzo3Ql9J5jGuo+kxlclpbC5MPUAOaEuBA+RY8CMS+Awj+tMiwrZ2Vt
	rtoGaeUux8Wk0wOaMOlKa5ByV35on0DDdNpwG6T+IcuF2Duy4X/NdrYYLlxrhWoOGcqL
	kj7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=EgdDsRyr9dMnqG5UeySaEWbc+NHjCMmyLc4WsJIT2Hk=;
	b=NSSuBwVHtqJ5sW8PiQ+jRwXEQjjoxFg6Hzx+nMQ1aE5jDgJULZpNkcznW2/RqJ3CdI
	N6DNvOwdC04TbjNM0D/FdRUjswBzJkrXgHrsR5tL3Ao6f7nZlCsV6U/lkZialHYxhZYL
	xC7d/Mgz6+LwCoJ2ABa5CbxQV2zVdoGs06I/oL7QntBcJyk6CTPmVZboRHZ2hCCXRHps
	j8yk1eICKaNSIMPfdxLo8xkTu25HSRDAnvx1uPsGpNM3KynOfvQHS4kQILXnOMUtxY1L
	ALNSFRzJiuIi4mR5xNYD1UKLNpCBNOHD9JwedZg0QNJ0VAgbaFlxjny26r9L9aot6qDI
	gUnw==
X-Gm-Message-State: AA6/9Rn3NOVI0dF2wTHwJppyfOKmWzvJWKLJgVa2Ia9iB/9JVeRDQw7t7/sLe7poy3M2Og==
X-Received: by 10.98.101.71 with SMTP id z68mr2355110pfb.13.1476978500121;
	Thu, 20 Oct 2016 08:48:20 -0700 (PDT)
Received: from anand.j ([117.209.148.213])
	by smtp.googlemail.com with ESMTPSA id
	188sm58670462pfd.9.2016.10.20.08.48.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Oct 2016 08:48:19 -0700 (PDT)
From: Anand J <anand.indukala@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	thuth@redhat.com,
	eblake@redhat.com
Date: Thu, 20 Oct 2016 21:18:01 +0530
Message-Id: <1476978482-13108-2-git-send-email-anand.indukala@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1476978482-13108-1-git-send-email-anand.indukala@gmail.com>
References: <1476978482-13108-1-git-send-email-anand.indukala@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::242
Subject: [Qemu-trivial] [Qemu-devel] [PATCH v3 1/2] scripts/clean-includes:
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
X-List-Received-Date: Thu, 20 Oct 2016 15:48:26 -0000

Added script to check duplicate #include entries. This check will scan
and print the files in which duplicate #include entries are present.

Script might output false positive entries as well. Such entries should
not be removed. So if it finds any duplicate entries script will
terminate with an exit status 1. Then each and every file should be
checked manually and corrected if necessary.

In order to enable the check use --check-dup-head option with
scripts/clean-includes.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Anand J <anand.indukala@gmail.com>
---
 scripts/clean-includes | 54 ++++++++++++++++++++++++++++++++++++++------------
 1 file changed, 41 insertions(+), 13 deletions(-)

diff --git a/scripts/clean-includes b/scripts/clean-includes
index 4412a55..a0d5c18 100755
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
@@ -154,6 +174,14 @@ for f in "$@"; do
 
 done
 
+if [ "$DUPHEAD" = "yes" ]; then
+    grep "^#include" "$@" | sort | uniq -c | awk '{if ($1 > 1) print $0}'
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


