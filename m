Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dTVTA-0002Z1-5X
	for mharc-qemu-trivial@gnu.org; Fri, 07 Jul 2017 11:47:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45644)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1dTVT7-0002XG-UP
	for qemu-trivial@nongnu.org; Fri, 07 Jul 2017 11:46:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1dTVT7-0001m1-0z
	for qemu-trivial@nongnu.org; Fri, 07 Jul 2017 11:46:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52724)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>)
	id 1dTVT2-0001hW-MX; Fri, 07 Jul 2017 11:46:52 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BD2C6267C9;
	Fri,  7 Jul 2017 15:46:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com BD2C6267C9
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=pbonzini@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com BD2C6267C9
Received: from donizetti.redhat.com (ovpn-117-183.ams2.redhat.com
	[10.36.117.183])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 69EF89080D;
	Fri,  7 Jul 2017 15:46:47 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com,
	qemu-trivial@nongnu.org
Date: Fri,  7 Jul 2017 17:46:46 +0200
Message-Id: <20170707154646.22230-1-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Fri, 07 Jul 2017 15:46:50 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] hxtool: remove dead -q option
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
X-List-Received-Date: Fri, 07 Jul 2017 15:46:58 -0000

This was used to extract .txt documentation for QMP.  This was
changed to use the QAPI schema instead, so zap it.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
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
2.13.0


