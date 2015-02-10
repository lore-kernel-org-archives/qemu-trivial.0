Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YL5bS-0005sr-SW
	for mharc-qemu-trivial@gnu.org; Tue, 10 Feb 2015 02:51:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39112)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YL5bP-0005mf-O3
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 02:51:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YL5bO-00048b-Ra
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 02:51:23 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:58310)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YL5b6-00041N-VL; Tue, 10 Feb 2015 02:51:05 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 8623A41828;
	Tue, 10 Feb 2015 10:51:03 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 95DD5951;
	Tue, 10 Feb 2015 09:34:46 +0300 (MSK)
Received: (nullmailer pid 9371 invoked by uid 1000);
	Tue, 10 Feb 2015 06:34:43 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 10 Feb 2015 09:34:08 +0300
Message-Id: <55a10996034cb2e633f0437cedd97f345183c0ec.1423549659.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1423549659.git.mjt@msgid.tls.msk.ru>
References: <cover.1423549659.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 19/46] qemu-sockets: Fix buffer overflow in
	inet_parse()
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
X-List-Received-Date: Tue, 10 Feb 2015 07:51:25 -0000

From: Kevin Wolf <kwolf@redhat.com>

The size of the stack allocated host[] array didn't account for the
terminating '\0' byte that sscanf() writes. Fix the array size.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 util/qemu-sockets.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index cf4b91f..61fc3c1 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -512,7 +512,7 @@ InetSocketAddress *inet_parse(const char *str, Error **errp)
 {
     InetSocketAddress *addr;
     const char *optstr, *h;
-    char host[64];
+    char host[65];
     char port[33];
     int to;
     int pos;
-- 
2.1.4


