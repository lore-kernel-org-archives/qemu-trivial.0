Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WhFQw-0005d2-KR
	for mharc-qemu-trivial@gnu.org; Mon, 05 May 2014 05:43:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57539)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WhFQq-0005Uo-0Y
	for qemu-trivial@nongnu.org; Mon, 05 May 2014 05:43:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WhFQl-0006ey-2h
	for qemu-trivial@nongnu.org; Mon, 05 May 2014 05:43:31 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:42360)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WhFQa-0006df-Uj; Mon, 05 May 2014 05:43:17 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 483F64068E;
	Mon,  5 May 2014 13:43:14 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 348705FE;
	Mon,  5 May 2014 13:43:14 +0400 (MSK)
Received: (nullmailer pid 9439 invoked by uid 1000);
	Mon, 05 May 2014 09:43:13 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
Date: Sun, 4 May 2014 12:23:59 +0400
To: qemu-trivial@nongnu.org
Message-Id: <1399282993.052701.9438.nullmailer@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH v3] qmp: report path ambiguity error
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
X-List-Received-Date: Mon, 05 May 2014 09:43:37 -0000

Without this, ambiguous path is reported to the user as
"not found", which is confusing at least.

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qmp.c |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/qmp.c b/qmp.c
index 74107be..37bd7dc 100644
--- a/qmp.c
+++ b/qmp.c
@@ -200,7 +200,11 @@ ObjectPropertyInfoList *qmp_qom_list(const char *path, Error **errp)
 
     obj = object_resolve_path(path, &ambiguous);
     if (obj == NULL) {
-        error_set(errp, QERR_DEVICE_NOT_FOUND, path);
+        if (ambiguous) {
+            error_setg(errp, "Path '%s' is ambiguous", path);
+        } else {
+            error_set(errp, QERR_DEVICE_NOT_FOUND, path);
+        }
         return NULL;
     }
 
-- 
1.7.10.4


