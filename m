Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dVHyV-0006qV-9U
	for mharc-qemu-trivial@gnu.org; Wed, 12 Jul 2017 09:46:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35816)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dVHyS-0006nj-W5
	for qemu-trivial@nongnu.org; Wed, 12 Jul 2017 09:46:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dVHyS-0003UP-5j
	for qemu-trivial@nongnu.org; Wed, 12 Jul 2017 09:46:40 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:44751)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dVHyL-0003Nv-4K; Wed, 12 Jul 2017 09:46:33 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 61EFC40F6B;
	Wed, 12 Jul 2017 16:46:31 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 28854ACF;
	Wed, 12 Jul 2017 16:38:14 +0300 (MSK)
Received: (nullmailer pid 29051 invoked by uid 1000);
	Wed, 12 Jul 2017 13:38:12 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Wed, 12 Jul 2017 16:38:06 +0300
Message-Id: <44d619beb5ac50b09ce6785add8ec637de461d6a.1499866676.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1499866676.git.mjt@msgid.tls.msk.ru>
References: <cover.1499866676.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1499866676.git.mjt@msgid.tls.msk.ru>
References: <cover.1499866676.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 10/13] hxtool: remove dead -q option
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
X-List-Received-Date: Wed, 12 Jul 2017 13:46:42 -0000

From: Paolo Bonzini <pbonzini@redhat.com>

This was used to extract .txt documentation for QMP.  This was
changed to use the QAPI schema instead, so zap it.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 scripts/hxtool | 46 +---------------------------------------------
 1 file changed, 1 insertion(+), 45 deletions(-)

diff --git a/scripts/hxtool b/scripts/hxtool
index 5468cd7782..1e2c97c5e6 100644
--- a/scripts/hxtool
+++ b/scripts/hxtool
@@ -7,7 +7,7 @@ hxtoh()
         case $str in
             HXCOMM*)
             ;;
-            STEXI*|ETEXI*|SQMP*|EQMP*) flag=$(($flag^1))
+            STEXI*|ETEXI*) flag=$(($flag^1))
             ;;
             *)
             test $flag -eq 1 && printf "%s\n" "$str"
@@ -45,12 +45,6 @@ hxtotexi()
             fi
             flag=0
             ;;
-            SQMP*|EQMP*)
-            if test $flag -eq 1 ; then
-                printf "line %d: syntax error: expected ETEXI, found '%s'\n" "$line" "$str" >&2
-                exit 1
-            fi
-            ;;
             DEFHEADING*)
             print_texi_heading "$(expr "$str" : "DEFHEADING(\(.*\))")"
             ;;
@@ -65,47 +59,9 @@ hxtotexi()
     done
 }
 
-hxtoqmp()
-{
-    IFS=
-    flag=0
-    line=1
-    while read -r str; do
-        case "$str" in
-            HXCOMM*)
-            ;;
-            SQMP*)
-            if test $flag -eq 1 ; then
-                printf "line %d: syntax error: expected EQMP, found '%s'\n" "$line" "$str" >&2
-                exit 1
-            fi
-            flag=1
-            ;;
-            EQMP*)
-            if test $flag -ne 1 ; then
-                printf "line %d: syntax error: expected SQMP, found '%s'\n" "$line" "$str" >&2
-                exit 1
-            fi
-            flag=0
-            ;;
-            STEXI*|ETEXI*)
-            if test $flag -eq 1 ; then
-                printf "line %d: syntax error: expected EQMP, found '%s'\n" "$line" "$str" >&2
-                exit 1
-            fi
-            ;;
-            *)
-            test $flag -eq 1 && printf '%s\n' "$str"
-            ;;
-        esac
-        line=$((line+1))
-    done
-}
-
 case "$1" in
 "-h") hxtoh ;;
 "-t") hxtotexi ;;
-"-q") hxtoqmp ;;
 *) exit 1 ;;
 esac
 
-- 
2.11.0


