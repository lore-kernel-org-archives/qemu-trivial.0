Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dwGh0-0006Aw-KN
	for mharc-qemu-trivial@gnu.org; Sun, 24 Sep 2017 19:52:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40859)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dwGgy-0005zt-3D
	for qemu-trivial@nongnu.org; Sun, 24 Sep 2017 19:52:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dwGgx-0000iv-Cx
	for qemu-trivial@nongnu.org; Sun, 24 Sep 2017 19:52:08 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:57461)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dwGgt-0000gv-2T; Sun, 24 Sep 2017 19:52:03 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 7A93E41C9C;
	Mon, 25 Sep 2017 02:52:00 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 1AE53C2C;
	Mon, 25 Sep 2017 00:22:56 +0300 (MSK)
Received: (nullmailer pid 28294 invoked by uid 1000);
	Sun, 24 Sep 2017 21:22:52 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Mon, 25 Sep 2017 00:22:45 +0300
Message-Id: <7d2ed4f2343951a7ca4c322119eacff09d9f8db0.1506288070.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1506288070.git.mjt@msgid.tls.msk.ru>
References: <cover.1506288070.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1506288070.git.mjt@msgid.tls.msk.ru>
References: <cover.1506288070.git.mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 27/31] nbd-client: Use correct macro
 parenthesization
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
X-List-Received-Date: Sun, 24 Sep 2017 23:52:09 -0000

From: Eric Blake <eblake@redhat.com>

If 'bs' is a complex expression, we were only casting the front half
rather than the full expression.  Luckily, none of the callers were
passing bad arguments, but it's better to be robust up front.

Signed-off-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 block/nbd-client.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/block/nbd-client.c b/block/nbd-client.c
index ee7f758e68..cc05e73c2d 100644
--- a/block/nbd-client.c
+++ b/block/nbd-client.c
@@ -31,8 +31,8 @@
 #include "qapi/error.h"
 #include "nbd-client.h"
=20
-#define HANDLE_TO_INDEX(bs, handle) ((handle) ^ ((uint64_t)(intptr_t)bs)=
)
-#define INDEX_TO_HANDLE(bs, index)  ((index)  ^ ((uint64_t)(intptr_t)bs)=
)
+#define HANDLE_TO_INDEX(bs, handle) ((handle) ^ (uint64_t)(intptr_t)(bs)=
)
+#define INDEX_TO_HANDLE(bs, index)  ((index)  ^ (uint64_t)(intptr_t)(bs)=
)
=20
 static void nbd_recv_coroutines_wake_all(NBDClientSession *s)
 {
--=20
2.11.0


