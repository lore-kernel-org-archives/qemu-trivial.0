Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZkFFz-0007PE-Sl
	for mharc-qemu-trivial@gnu.org; Thu, 08 Oct 2015 13:45:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43348)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZkFFS-0007IA-5R
	for qemu-trivial@nongnu.org; Thu, 08 Oct 2015 13:44:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZkFFR-0002wi-Fi
	for qemu-trivial@nongnu.org; Thu, 08 Oct 2015 13:44:58 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:44507)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZkEQz-0000sq-9s; Thu, 08 Oct 2015 12:52:49 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 7735740A5D;
	Thu,  8 Oct 2015 19:52:31 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 5EF7CA85;
	Thu,  8 Oct 2015 19:52:31 +0300 (MSK)
Received: (nullmailer pid 11986 invoked by uid 1000);
	Thu, 08 Oct 2015 16:52:30 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu,  8 Oct 2015 19:52:14 +0300
Message-Id: <eab2ac9d3c1675a58989000c2647aa33e440906a.1444323071.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1444323071.git.mjt@msgid.tls.msk.ru>
References: <cover.1444323071.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 05/19] block/ssh: remove dead code
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
X-List-Received-Date: Thu, 08 Oct 2015 17:44:58 -0000

From: Paolo Bonzini <pbonzini@redhat.com>

The "err" label cannot be reached with qp != NULL.  Remove the free-ing
of qp and avoid future regressions by removing the initializer.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
ACKed-by: Richard W.M. Jones <rjones@redhat.com>
Reviewed-by: Fam Zheng <famz@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
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
2.1.4


