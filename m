Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XqzMK-0008Cf-BG
	for mharc-qemu-trivial@gnu.org; Wed, 19 Nov 2014 02:07:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39237)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1XqzMD-00081z-0R
	for qemu-trivial@nongnu.org; Wed, 19 Nov 2014 02:07:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1XqzM6-0000vw-Rq
	for qemu-trivial@nongnu.org; Wed, 19 Nov 2014 02:07:16 -0500
Received: from mx1.redhat.com ([209.132.183.28]:50215)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>)
	id 1XqzLu-0000tI-BM; Wed, 19 Nov 2014 02:06:58 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sAJ76urC019475
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Wed, 19 Nov 2014 02:06:57 -0500
Received: from fam-t430.nay.redhat.com (dhcp-14-161.nay.redhat.com
	[10.66.14.161])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sAJ76pAB028912; Wed, 19 Nov 2014 02:06:52 -0500
From: Fam Zheng <famz@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 19 Nov 2014 15:07:12 +0800
Message-Id: <1416380832-9697-1-git-send-email-famz@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: kwolf@redhat.com, qemu-trivial@nongnu.org, mjt@tls.msk.ru,
	mreitz@redhat.com, stefanha@redhat.com, eblake@redhat.com
Subject: [Qemu-trivial] [PATCH v2] tests: Use "command -v" instead of
	which(1) in shell scripts
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
X-List-Received-Date: Wed, 19 Nov 2014 07:07:23 -0000

When which(1) is not installed, we would complain "perl not found"
because it's the first set_prog_path check. The error message is
wrong.

Fix it by using "command -v", a native way to query the existence of a
command.

Suggested-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Fam Zheng <famz@redhat.com>

---
v2: Use "command -v" as suggested by Eric. Also change a few other
occasions of which(1) in tests/qemu-iotests/common.
---
 tests/qemu-iotests/common        | 8 ++++----
 tests/qemu-iotests/common.config | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/tests/qemu-iotests/common b/tests/qemu-iotests/common
index 9e12bec..bc27f6a 100644
--- a/tests/qemu-iotests/common
+++ b/tests/qemu-iotests/common
@@ -289,10 +289,10 @@ testlist options
 
             if [ ! -z "$DISPLAY" ]
             then
-                which xdiff >/dev/null 2>&1 && diff=xdiff
-                which gdiff >/dev/null 2>&1 && diff=gdiff
-                which tkdiff >/dev/null 2>&1 && diff=tkdiff
-                which xxdiff >/dev/null 2>&1 && diff=xxdiff
+                command -v xdiff >/dev/null 2>&1 && diff=xdiff
+                command -v gdiff >/dev/null 2>&1 && diff=gdiff
+                command -v tkdiff >/dev/null 2>&1 && diff=tkdiff
+                command -v xxdiff >/dev/null 2>&1 && diff=xxdiff
             fi
             ;;
 
diff --git a/tests/qemu-iotests/common.config b/tests/qemu-iotests/common.config
index bd6790b..91a5ef6 100644
--- a/tests/qemu-iotests/common.config
+++ b/tests/qemu-iotests/common.config
@@ -47,7 +47,7 @@ export PWD=`pwd`
 # $1 = prog to look for, $2* = default pathnames if not found in $PATH
 set_prog_path()
 {
-    p=`which $1 2> /dev/null`
+    p=`command -v $1 2> /dev/null`
     if [ -n "$p" -a -x "$p" ]; then
         echo $p
         return 0
-- 
1.9.3


