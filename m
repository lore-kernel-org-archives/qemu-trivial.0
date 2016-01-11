Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aIY8M-0001QX-W3
	for mharc-qemu-trivial@gnu.org; Mon, 11 Jan 2016 03:47:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52024)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aIY8E-00018Z-Q4
	for qemu-trivial@nongnu.org; Mon, 11 Jan 2016 03:47:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aIY8E-0002CI-0C
	for qemu-trivial@nongnu.org; Mon, 11 Jan 2016 03:47:18 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:56820)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1aIY86-00027L-GE; Mon, 11 Jan 2016 03:47:10 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 6C1B1403EC;
	Mon, 11 Jan 2016 11:47:08 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 7DE54AE0;
	Mon, 11 Jan 2016 11:42:01 +0300 (MSK)
Received: (nullmailer pid 28798 invoked by uid 1000);
	Mon, 11 Jan 2016 08:42:00 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 11 Jan 2016 11:41:55 +0300
Message-Id: <4e6f7cfbf98e7adae2be524b4042751d107a5bb4.1452501578.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1452501577.git.mjt@msgid.tls.msk.ru>
References: <cover.1452501577.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Thomas Huth <thuth@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-block@nongnu.org
Subject: [Qemu-trivial] [PULL 16/19] hw/ide: Remove superfluous return
	statements
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
X-List-Received-Date: Mon, 11 Jan 2016 08:47:19 -0000

From: Thomas Huth <thuth@redhat.com>

The "return;" statements at the end of functions do not make
much sense, so let's remove them.

Cc: qemu-block@nongnu.org
Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/ide/atapi.c | 1 -
 hw/ide/macio.c | 2 --
 2 files changed, 3 deletions(-)

diff --git a/hw/ide/atapi.c b/hw/ide/atapi.c
index 65f8dd4..272ab90 100644
--- a/hw/ide/atapi.c
+++ b/hw/ide/atapi.c
@@ -824,7 +824,6 @@ static void cmd_inquiry(IDEState *s, uint8_t *buf)
  out:
     buf[size_idx] = idx - preamble_len;
     ide_atapi_cmd_reply(s, idx, max_len);
-    return;
 }
 
 static void cmd_get_configuration(IDEState *s, uint8_t *buf)
diff --git a/hw/ide/macio.c b/hw/ide/macio.c
index 3ee962f..9771261 100644
--- a/hw/ide/macio.c
+++ b/hw/ide/macio.c
@@ -292,8 +292,6 @@ done:
         block_acct_done(blk_get_stats(s->blk), &s->acct);
     }
     io->dma_end(opaque);
-
-    return;
 }
 
 static void pmac_ide_transfer_cb(void *opaque, int ret)
-- 
2.1.4


