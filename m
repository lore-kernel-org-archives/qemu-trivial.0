Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WzsLl-00017Z-8c
	for mharc-qemu-trivial@gnu.org; Wed, 25 Jun 2014 14:55:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57662)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1WzsLf-0000xj-6A
	for qemu-trivial@nongnu.org; Wed, 25 Jun 2014 14:55:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1WzsLa-0003rT-9m
	for qemu-trivial@nongnu.org; Wed, 25 Jun 2014 14:55:11 -0400
Received: from qemu.weilnetz.de ([37.221.198.45]:55224)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1WzsLQ-0003XT-3O; Wed, 25 Jun 2014 14:54:56 -0400
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id 6E65817F99C; Wed, 25 Jun 2014 20:54:53 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Wed, 25 Jun 2014 20:54:53 +0200
Message-Id: <1403722493-26602-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.198.45
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH] qemu-char: Fix compiler warning
	(-Wuninitialized)
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
X-List-Received-Date: Wed, 25 Jun 2014 18:55:16 -0000

qemu-char.c:155:8: warning:
 'res' may be used uninitialized in this function [-Wuninitialized]

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 qemu-char.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qemu-char.c b/qemu-char.c
index c1ea84c..c65f81f 100644
--- a/qemu-char.c
+++ b/qemu-char.c
@@ -133,7 +133,7 @@ int qemu_chr_fe_write(CharDriverState *s, const uint8_t *buf, int len)
 int qemu_chr_fe_write_all(CharDriverState *s, const uint8_t *buf, int len)
 {
     int offset = 0;
-    int res;
+    int res = 0;
 
     qemu_mutex_lock(&s->chr_write_lock);
     while (offset < len) {
-- 
1.7.10.4


