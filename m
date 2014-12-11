Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xz8aW-0003jZ-JC
	for mharc-qemu-trivial@gnu.org; Thu, 11 Dec 2014 13:35:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59261)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xz8aP-0003dp-7G
	for qemu-trivial@nongnu.org; Thu, 11 Dec 2014 13:35:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xz8aJ-00024b-F4
	for qemu-trivial@nongnu.org; Thu, 11 Dec 2014 13:35:36 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:43124)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Xz8Zz-0001tK-R3; Thu, 11 Dec 2014 13:35:11 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 8931C41D4A;
	Thu, 11 Dec 2014 21:35:10 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 786428C6;
	Thu, 11 Dec 2014 21:16:17 +0300 (MSK)
Received: (nullmailer pid 22975 invoked by uid 1000);
	Thu, 11 Dec 2014 18:16:15 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 11 Dec 2014 21:15:58 +0300
Message-Id: <9be71be5bda27b068176ab9b982cf3d7d41a4acd.1418321644.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.3
In-Reply-To: <cover.1418321644.git.mjt@msgid.tls.msk.ru>
References: <cover.1418321644.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Markus Armbruster <armbru@redhat.com>
Subject: [Qemu-trivial] [PULL 10/20] util: Fuse g_malloc();
	memset() into g_new0()
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
X-List-Received-Date: Thu, 11 Dec 2014 18:35:42 -0000

From: Markus Armbruster <armbru@redhat.com>

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Fam Zheng <famz@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 util/uri.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/util/uri.c b/util/uri.c
index 01dc09e..918d235 100644
--- a/util/uri.c
+++ b/util/uri.c
@@ -1004,8 +1004,7 @@ URI *
 uri_new(void) {
     URI *ret;
 
-    ret = (URI *) g_malloc(sizeof(URI));
-    memset(ret, 0, sizeof(URI));
+    ret = g_new0(URI, 1);
     return(ret);
 }
 
-- 
2.1.3


