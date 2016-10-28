Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c09CJ-0002Xa-0c
	for mharc-qemu-trivial@gnu.org; Fri, 28 Oct 2016 11:35:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60199)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1c09CC-0002T6-Dy
	for qemu-trivial@nongnu.org; Fri, 28 Oct 2016 11:35:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1c09CB-0003lM-Gg
	for qemu-trivial@nongnu.org; Fri, 28 Oct 2016 11:35:52 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:56813)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1c09C4-0003hw-Qa; Fri, 28 Oct 2016 11:35:45 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 30A7D4373F;
	Fri, 28 Oct 2016 18:35:44 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 4A63FB63;
	Fri, 28 Oct 2016 18:18:58 +0300 (MSK)
Received: (nullmailer pid 6075 invoked by uid 1000);
	Fri, 28 Oct 2016 15:18:56 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Daniel Shahaf <danielsh@apache.org>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Fri, 28 Oct 2016 18:18:46 +0300
Message-Id: <5a1de0b325c9c3df41cb41bcea8dca5fafc67b9a.1477667878.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1477667878.git.mjt@msgid.tls.msk.ru>
References: <cover.1477667878.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1477667878.git.mjt@msgid.tls.msk.ru>
References: <cover.1477667878.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 15/23] scripts/hxtool: fix undefined behavour
 of echo
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
X-List-Received-Date: Fri, 28 Oct 2016 15:35:53 -0000

From: Daniel Shahaf <danielsh@apache.org>

Avoid undefined behaviour of echo(1) with backslashes in arguments
The behaviour is implementation-defined, different /bin/sh's behave
differently.

Signed-off-by: Daniel Shahaf <danielsh@apache.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 scripts/hxtool | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/scripts/hxtool b/scripts/hxtool
index 995bb7f..04f7d7b 100644
--- a/scripts/hxtool
+++ b/scripts/hxtool
@@ -26,32 +26,32 @@ hxtotexi()
             ;;
             STEXI*)
             if test $flag -eq 1 ; then
-                echo "line $line: syntax error: expected ETEXI, found $str" >&2
+                printf "line %d: syntax error: expected ETEXI, found '%s'\n" "$line" "$str" >&2
                 exit 1
             fi
             flag=1
             ;;
             ETEXI*)
             if test $flag -ne 1 ; then
-                echo "line $line: syntax error: expected STEXI, found $str" >&2
+                printf "line %d: syntax error: expected STEXI, found '%s'\n" "$line" "$str" >&2
                 exit 1
             fi
             flag=0
             ;;
             SQMP*|EQMP*)
             if test $flag -eq 1 ; then
-                echo "line $line: syntax error: expected ETEXI, found $str" >&2
+                printf "line %d: syntax error: expected ETEXI, found '%s'\n" "$line" "$str" >&2
                 exit 1
             fi
             ;;
             DEFHEADING*)
-            echo "$(expr "$str" : "DEFHEADING(\(.*\))")"
+            printf '%s\n' "$(expr "$str" : "DEFHEADING(\(.*\))")"
             ;;
             ARCHHEADING*)
-            echo "$(expr "$str" : "ARCHHEADING(\(.*\),.*)")"
+            printf '%s\n' "$(expr "$str" : "ARCHHEADING(\(.*\),.*)")"
             ;;
             *)
-            test $flag -eq 1 && echo "$str"
+            test $flag -eq 1 && printf '%s\n' "$str"
             ;;
         esac
         line=$((line+1))
@@ -69,26 +69,26 @@ hxtoqmp()
             ;;
             SQMP*)
             if test $flag -eq 1 ; then
-                echo "line $line: syntax error: expected EQMP, found $str" >&2
+                printf "line %d: syntax error: expected EQMP, found '%s'\n" "$line" "$str" >&2
                 exit 1
             fi
             flag=1
             ;;
             EQMP*)
             if test $flag -ne 1 ; then
-                echo "line $line: syntax error: expected SQMP, found $str" >&2
+                printf "line %d: syntax error: expected SQMP, found '%s'\n" "$line" "$str" >&2
                 exit 1
             fi
             flag=0
             ;;
             STEXI*|ETEXI*)
             if test $flag -eq 1 ; then
-                echo "line $line: syntax error: expected EQMP, found $str" >&2
+                printf "line %d: syntax error: expected EQMP, found '%s'\n" "$line" "$str" >&2
                 exit 1
             fi
             ;;
             *)
-            test $flag -eq 1 && echo "$str"
+            test $flag -eq 1 && printf '%s\n' "$str"
             ;;
         esac
         line=$((line+1))
-- 
2.1.4


