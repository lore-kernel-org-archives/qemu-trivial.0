Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cVxaB-000665-Ge
	for mharc-qemu-trivial@gnu.org; Tue, 24 Jan 2017 04:40:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40937)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cVxa7-00062K-92
	for qemu-trivial@nongnu.org; Tue, 24 Jan 2017 04:40:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cVxZz-0000sJ-Vh
	for qemu-trivial@nongnu.org; Tue, 24 Jan 2017 04:40:03 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:52725)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1cVxZn-0000iJ-M7; Tue, 24 Jan 2017 04:39:43 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id B5C2442106;
	Tue, 24 Jan 2017 12:39:42 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 1591C55D;
	Tue, 24 Jan 2017 12:39:42 +0300 (MSK)
Received: (nullmailer pid 12632 invoked by uid 1000);
	Tue, 24 Jan 2017 09:39:41 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Tue, 24 Jan 2017 12:39:16 +0300
Message-Id: <2cd3dc3d543fdfc19bf3322b48d22619d5ba5081.1485250702.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
References: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
References: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 12/31] qemu-img: remove dead check
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
X-List-Received-Date: Tue, 24 Jan 2017 09:40:04 -0000

From: Paolo Bonzini <pbonzini@redhat.com>

options must be non-NULL here, because it has been checked before.
Reported by Coverity.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qemu-img.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/qemu-img.c b/qemu-img.c
index 5df66fe..74e3362 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -3455,13 +3455,11 @@ static int img_amend(int argc, char **argv)
 
     create_opts = qemu_opts_append(create_opts, bs->drv->create_opts);
     opts = qemu_opts_create(create_opts, NULL, 0, &error_abort);
-    if (options) {
-        qemu_opts_do_parse(opts, options, NULL, &err);
-        if (err) {
-            error_report_err(err);
-            ret = -1;
-            goto out;
-        }
+    qemu_opts_do_parse(opts, options, NULL, &err);
+    if (err) {
+        error_report_err(err);
+        ret = -1;
+        goto out;
     }
 
     /* In case the driver does not call amend_status_cb() */
-- 
2.1.4


