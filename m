Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YL6h8-0002TD-AH
	for mharc-qemu-trivial@gnu.org; Tue, 10 Feb 2015 04:01:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54583)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YL6h5-0002Nw-Q7
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 04:01:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YL6h1-00027J-DC
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 04:01:19 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:56030)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YL6gq-000202-Mh; Tue, 10 Feb 2015 04:01:04 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id CF71741894;
	Tue, 10 Feb 2015 12:01:03 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id CE5AB948;
	Tue, 10 Feb 2015 09:34:45 +0300 (MSK)
Received: (nullmailer pid 9396 invoked by uid 1000);
	Tue, 10 Feb 2015 06:34:43 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 10 Feb 2015 09:34:20 +0300
Message-Id: <6b0126f94099db15fb0110218b17eeccefa077d1.1423549659.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1423549659.git.mjt@msgid.tls.msk.ru>
References: <cover.1423549659.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Markus Armbruster <armbru@redhat.com>
Subject: [Qemu-trivial] [PULL 31/46] onenand: g_malloc() can't fail,
	bury dead error handling
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
X-List-Received-Date: Tue, 10 Feb 2015 09:01:21 -0000

From: Markus Armbruster <armbru@redhat.com>

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Gonglei <arei.gonglei@huawei.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/block/onenand.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/hw/block/onenand.c b/hw/block/onenand.c
index 348630d..1b2c893 100644
--- a/hw/block/onenand.c
+++ b/hw/block/onenand.c
@@ -346,15 +346,9 @@ static inline int onenand_prog_spare(OneNANDState *s, int sec, int secn,
 static inline int onenand_erase(OneNANDState *s, int sec, int num)
 {
     uint8_t *blankbuf, *tmpbuf;
+
     blankbuf = g_malloc(512);
-    if (!blankbuf) {
-        return 1;
-    }
     tmpbuf = g_malloc(512);
-    if (!tmpbuf) {
-        g_free(blankbuf);
-        return 1;
-    }
     memset(blankbuf, 0xff, 512);
     for (; num > 0; num--, sec++) {
         if (s->blk_cur) {
-- 
2.1.4


