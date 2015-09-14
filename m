Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZbRgs-0004rq-G2
	for mharc-qemu-trivial@gnu.org; Mon, 14 Sep 2015 07:12:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57545)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1ZbRgp-0004nD-BQ
	for qemu-trivial@nongnu.org; Mon, 14 Sep 2015 07:12:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1ZbRgm-00026i-5n
	for qemu-trivial@nongnu.org; Mon, 14 Sep 2015 07:12:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37123)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1ZbRgd-000242-CZ; Mon, 14 Sep 2015 07:12:39 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id C8F3E341AF9;
	Mon, 14 Sep 2015 11:12:38 +0000 (UTC)
Received: from donizetti.redhat.com (ovpn-112-65.ams2.redhat.com
	[10.36.112.65])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t8EBCaN3014459; Mon, 14 Sep 2015 07:12:37 -0400
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 14 Sep 2015 13:12:34 +0200
Message-Id: <1442229154-2052-1-git-send-email-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, jcody@redhat.com, rjones@redhat.com
Subject: [Qemu-trivial] [PATCH] block/ssh: remove dead code
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
X-List-Received-Date: Mon, 14 Sep 2015 11:12:52 -0000

The "err" label cannot be reached with qp != NULL.  Remove the free-ing
of qp and avoid future regressions by removing the initializer.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/ssh.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/block/ssh.c b/block/ssh.c
index 8d06739..d35b51f 100644
--- a/block/ssh.c
+++ b/block/ssh.c
@@ -193,7 +193,7 @@ sftp_error_report(BDRVSSHState *s, const char *fs, ...)
 static int parse_uri(const char *filename, QDict *options, Error **errp)
 {
     URI *uri = NULL;
-    QueryParams *qp = NULL;
+    QueryParams *qp;
     int i;
 
     uri = uri_parse(filename);
@@ -249,9 +249,6 @@ static int parse_uri(const char *filename, QDict *options, Error **errp)
     return 0;
 
  err:
-    if (qp) {
-      query_params_free(qp);
-    }
     if (uri) {
       uri_free(uri);
     }
-- 
2.5.0


