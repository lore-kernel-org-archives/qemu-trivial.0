Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dHXpc-0006xD-9B
	for mharc-qemu-trivial@gnu.org; Sun, 04 Jun 2017 11:52:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32779)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dHXpY-0006sV-Jx
	for qemu-trivial@nongnu.org; Sun, 04 Jun 2017 11:52:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dHXpX-0005B5-Op
	for qemu-trivial@nongnu.org; Sun, 04 Jun 2017 11:52:40 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:60421)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dHXpS-0004y8-2w; Sun, 04 Jun 2017 11:52:34 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 44857404E3;
	Sun,  4 Jun 2017 18:52:33 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id F2FA25F4;
	Sun,  4 Jun 2017 18:45:29 +0300 (MSK)
Received: (nullmailer pid 16393 invoked by uid 1000);
	Sun, 04 Jun 2017 15:45:27 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sun,  4 Jun 2017 18:45:23 +0300
Message-Id: <543f8f13e256a081dd820375e9575439b659ccd8.1496591095.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1496591095.git.mjt@msgid.tls.msk.ru>
References: <cover.1496591095.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1496591095.git.mjt@msgid.tls.msk.ru>
References: <cover.1496591095.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 19/22] ide-test: check return of fwrite
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
X-List-Received-Date: Sun, 04 Jun 2017 15:52:41 -0000

From: John Snow <jsnow@redhat.com>

To quiet patchew, add an assert for fwrite's return value.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Jeff Cody <jcody@redhat.com>
Reviewed-by: Laurent Vivier <lvivier@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 tests/ide-test.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/tests/ide-test.c b/tests/ide-test.c
index 139ebc0ec6..bfd79ddbdc 100644
--- a/tests/ide-test.c
+++ b/tests/ide-test.c
@@ -796,11 +796,13 @@ static void cdrom_pio_impl(int nblocks)
     int i, j;
     uint8_t data;
     uint16_t limit;
+    size_t ret;
 
     /* Prepopulate the CDROM with an interesting pattern */
     generate_pattern(pattern, patt_len, ATAPI_BLOCK_SIZE);
     fh = fopen(tmp_path, "w+");
-    fwrite(pattern, ATAPI_BLOCK_SIZE, patt_blocks, fh);
+    ret = fwrite(pattern, ATAPI_BLOCK_SIZE, patt_blocks, fh);
+    g_assert_cmpint(ret, ==, patt_blocks);
     fclose(fh);
 
     ide_test_start("-drive if=none,file=%s,media=cdrom,format=raw,id=sr0,index=0 "
@@ -880,6 +882,7 @@ static void test_cdrom_pio_large(void)
 static void test_cdrom_dma(void)
 {
     static const size_t len = ATAPI_BLOCK_SIZE;
+    size_t ret;
     char *pattern = g_malloc(ATAPI_BLOCK_SIZE * 16);
     char *rx = g_malloc0(len);
     uintptr_t guest_buf;
@@ -896,7 +899,8 @@ static void test_cdrom_dma(void)
 
     generate_pattern(pattern, ATAPI_BLOCK_SIZE * 16, ATAPI_BLOCK_SIZE);
     fh = fopen(tmp_path, "w+");
-    fwrite(pattern, ATAPI_BLOCK_SIZE, 16, fh);
+    ret = fwrite(pattern, ATAPI_BLOCK_SIZE, 16, fh);
+    g_assert_cmpint(ret, ==, 16);
     fclose(fh);
 
     send_dma_request(CMD_PACKET, 0, 1, prdt, 1, send_scsi_cdb_read10);
-- 
2.11.0


