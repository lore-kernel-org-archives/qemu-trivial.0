Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1g8rUS-0000xj-Da
	for mharc-qemu-trivial@gnu.org; Sat, 06 Oct 2018 14:39:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60258)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1g8rUN-0000wU-Tm
	for qemu-trivial@nongnu.org; Sat, 06 Oct 2018 14:39:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1g8rUN-0004sq-5h
	for qemu-trivial@nongnu.org; Sat, 06 Oct 2018 14:39:43 -0400
Received: from mail.weilnetz.de ([37.120.169.71]:37928
	helo=v2201612906741603.powersrv.de)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefan@weilnetz.de>)
	id 1g8rU4-0004Mi-HD; Sat, 06 Oct 2018 14:39:26 -0400
Received: from localhost (localhost [127.0.0.1])
	by v2201612906741603.powersrv.de (Postfix) with ESMTP id 9A802DAFFC6;
	Sat,  6 Oct 2018 20:39:18 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at v2201612906741603.powersrv.de
Received: from v2201612906741603.powersrv.de ([127.0.0.1])
	by localhost (v2201612906741603.powersrv.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id u05a-I-Hx594; Sat,  6 Oct 2018 20:39:17 +0200 (CEST)
Received: from qemu.weilnetz.de (qemu.weilnetz.de [188.68.58.204])
	by v2201612906741603.powersrv.de (Postfix) with ESMTP id 33948DAFF8A;
	Sat,  6 Oct 2018 20:39:17 +0200 (CEST)
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id CE6024606D3; Sat,  6 Oct 2018 20:39:16 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: QEMU Developer <qemu-devel@nongnu.org>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Kevin Wolf <kwolf@redhat.com>,
	Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org,
	Stefan Weil <sw@weilnetz.de>
Date: Sat,  6 Oct 2018 20:38:51 +0200
Message-Id: <20181006183851.3797-1-sw@weilnetz.de>
X-Mailer: git-send-email 2.11.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 37.120.169.71
Subject: [Qemu-trivial] [PATCH] qemu-io-cmds: Fix two format strings
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
X-List-Received-Date: Sat, 06 Oct 2018 18:39:44 -0000

Use %zu instead of %zd for unsigned numbers.

This fixes two error messages from the LSTM static code analyzer:

This argument should be of type 'ssize_t' but is of type 'unsigned long'

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 qemu-io-cmds.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/qemu-io-cmds.c b/qemu-io-cmds.c
index db0b3ee5ef..5363482213 100644
--- a/qemu-io-cmds.c
+++ b/qemu-io-cmds.c
@@ -907,7 +907,7 @@ static int readv_f(BlockBackend *blk, int argc, char **argv)
         memset(cmp_buf, pattern, qiov.size);
         if (memcmp(buf, cmp_buf, qiov.size)) {
             printf("Pattern verification failed at offset %"
-                   PRId64 ", %zd bytes\n", offset, qiov.size);
+                   PRId64 ", %zu bytes\n", offset, qiov.size);
             ret = -EINVAL;
         }
         g_free(cmp_buf);
@@ -1294,7 +1294,7 @@ static void aio_read_done(void *opaque, int ret)
         memset(cmp_buf, ctx->pattern, ctx->qiov.size);
         if (memcmp(ctx->buf, cmp_buf, ctx->qiov.size)) {
             printf("Pattern verification failed at offset %"
-                   PRId64 ", %zd bytes\n", ctx->offset, ctx->qiov.size);
+                   PRId64 ", %zu bytes\n", ctx->offset, ctx->qiov.size);
         }
         g_free(cmp_buf);
     }
-- 
2.11.0


