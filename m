Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cVzqN-0000mN-Ap
	for mharc-qemu-trivial@gnu.org; Tue, 24 Jan 2017 07:04:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47346)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cVzqI-0000h7-C9
	for qemu-trivial@nongnu.org; Tue, 24 Jan 2017 07:04:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cVzqH-00009N-J0
	for qemu-trivial@nongnu.org; Tue, 24 Jan 2017 07:04:54 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:45169)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1cVzqC-00005T-As; Tue, 24 Jan 2017 07:04:48 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 07AD44212F;
	Tue, 24 Jan 2017 15:04:48 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 10EDB568;
	Tue, 24 Jan 2017 12:39:43 +0300 (MSK)
Received: (nullmailer pid 12636 invoked by uid 1000);
	Tue, 24 Jan 2017 09:39:41 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Tue, 24 Jan 2017 12:39:18 +0300
Message-Id: <9fcf8d63ea603736391d0508c08e0a50e4a2c091.1485250702.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
References: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
References: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 14/31] block: remove dead check
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
X-List-Received-Date: Tue, 24 Jan 2017 12:04:58 -0000

From: Paolo Bonzini <pbonzini@redhat.com>

options must be non-NULL here, because a NULL value is replaced with
qdict_new earlier in the function.  Reported by Coverity.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 block.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block.c b/block.c
index 39ddea3..a0346c8 100644
--- a/block.c
+++ b/block.c
@@ -1851,7 +1851,7 @@ static BlockDriverState *bdrv_open_inherit(const char *filename,
     bdrv_refresh_filename(bs);
 
     /* Check if any unknown options were used */
-    if (options && (qdict_size(options) != 0)) {
+    if (qdict_size(options) != 0) {
         const QDictEntry *entry = qdict_first(options);
         if (flags & BDRV_O_PROTOCOL) {
             error_setg(errp, "Block protocol '%s' doesn't support the option "
-- 
2.1.4


