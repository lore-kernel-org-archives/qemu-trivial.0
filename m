Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Um1vu-0006ve-EF
	for mharc-qemu-trivial@gnu.org; Mon, 10 Jun 2013 09:14:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38512)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rjones@redhat.com>) id 1Um1vr-0006v0-Pj
	for qemu-trivial@nongnu.org; Mon, 10 Jun 2013 09:14:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rjones@redhat.com>) id 1Um1vn-00020Y-6j
	for qemu-trivial@nongnu.org; Mon, 10 Jun 2013 09:14:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:4174)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rjones@redhat.com>) id 1Um1vm-00020Q-VZ
	for qemu-trivial@nongnu.org; Mon, 10 Jun 2013 09:14:43 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r5ADEfb0029060
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <qemu-trivial@nongnu.org>; Mon, 10 Jun 2013 09:14:42 -0400
Received: from choo.home.annexia.org (vpn1-6-48.ams2.redhat.com [10.36.6.48])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id r5ADEeKL018192; Mon, 10 Jun 2013 09:14:40 -0400
From: "Richard W.M. Jones" <rjones@redhat.com>
To: qemu-trivial@nongnu.org
Date: Mon, 10 Jun 2013 14:14:35 +0100
Message-Id: <1370870075-21570-1-git-send-email-rjones@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: stefanha@redhat.com
Subject: [Qemu-trivial] [PATCH TRIVIAL] curl: Whitespace only changes.
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
X-List-Received-Date: Mon, 10 Jun 2013 13:14:48 -0000

From: "Richard W.M. Jones" <rjones@redhat.com>

Trivial patch to remove odd whitespace.

Signed-off-by: Richard W.M. Jones <rjones@redhat.com>
---
 block/curl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/block/curl.c b/block/curl.c
index bf31efe..781c49c 100644
--- a/block/curl.c
+++ b/block/curl.c
@@ -467,8 +467,8 @@ static int curl_open(BlockDriverState *bs, QDict *options, int flags)
     // initialize the multi interface!
 
     s->multi = curl_multi_init();
-    curl_multi_setopt( s->multi, CURLMOPT_SOCKETDATA, s); 
-    curl_multi_setopt( s->multi, CURLMOPT_SOCKETFUNCTION, curl_sock_cb ); 
+    curl_multi_setopt(s->multi, CURLMOPT_SOCKETDATA, s);
+    curl_multi_setopt(s->multi, CURLMOPT_SOCKETFUNCTION, curl_sock_cb);
     curl_multi_do(s);
 
     qemu_opts_del(opts);
-- 
1.8.2.1


