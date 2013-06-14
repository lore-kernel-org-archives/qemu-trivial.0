Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UnRfP-0001pl-K4
	for mharc-qemu-trivial@gnu.org; Fri, 14 Jun 2013 06:55:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56177)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UnRfK-0001ee-0c
	for qemu-trivial@nongnu.org; Fri, 14 Jun 2013 06:55:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UnRfI-0005sl-LG
	for qemu-trivial@nongnu.org; Fri, 14 Jun 2013 06:55:33 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:56969)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UnRfA-0005pT-Ca; Fri, 14 Jun 2013 06:55:24 -0400
Received: from gandalf.tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 99D0C41661;
	Fri, 14 Jun 2013 14:55:23 +0400 (MSK)
Received: by gandalf.tls.msk.ru (Postfix, from userid 1000)
	id 4AAC51A3; Fri, 14 Jun 2013 14:50:47 +0400 (MSK)
From: Michael Tokarev <mjt@tls.msk.ru>
To: Anthony Liguori <aliguori@us.ibm.com>
Date: Fri, 14 Jun 2013 14:50:22 +0400
Message-Id: <1371207042-17980-7-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1371207042-17980-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1371207042-17980-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org, "Richard W.M. Jones" <rjones@redhat.com>
Subject: [Qemu-trivial] [PULL 06/26] curl: Whitespace only changes.
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
X-List-Received-Date: Fri, 14 Jun 2013 10:55:35 -0000

From: "Richard W.M. Jones" <rjones@redhat.com>

Trivial patch to remove odd whitespace.

Signed-off-by: Richard W.M. Jones <rjones@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 block/curl.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/block/curl.c b/block/curl.c
index b8935fd..4dc3b4b 100644
--- a/block/curl.c
+++ b/block/curl.c
@@ -462,8 +462,8 @@ static int curl_open(BlockDriverState *bs, QDict *options, int flags)
     // initialize the multi interface!
 
     s->multi = curl_multi_init();
-    curl_multi_setopt( s->multi, CURLMOPT_SOCKETDATA, s); 
-    curl_multi_setopt( s->multi, CURLMOPT_SOCKETFUNCTION, curl_sock_cb ); 
+    curl_multi_setopt(s->multi, CURLMOPT_SOCKETDATA, s);
+    curl_multi_setopt(s->multi, CURLMOPT_SOCKETFUNCTION, curl_sock_cb);
     curl_multi_do(s);
 
     qemu_opts_del(opts);
-- 
1.7.10.4


