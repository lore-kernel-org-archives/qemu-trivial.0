Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b9W7w-0001jp-DF
	for mharc-qemu-trivial@gnu.org; Sun, 05 Jun 2016 07:21:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35328)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9W7r-0001ak-La
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 07:21:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9W7p-0003nH-QE
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 07:21:50 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:48040)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1b9W7b-0003jo-3Q; Sun, 05 Jun 2016 07:21:35 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 77917408D7;
	Sun,  5 Jun 2016 14:21:29 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 6E5EAB46;
	Sun,  5 Jun 2016 10:43:41 +0300 (MSK)
Received: (nullmailer pid 1180 invoked by uid 1000);
	Sun, 05 Jun 2016 07:43:32 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, qemu-trivial@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>
Date: Sun,  5 Jun 2016 10:43:21 +0300
Message-Id: <92833cd0f6369c64cfea204dbe310c604ffed24c.1465112552.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
References: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 44/52] audio: Use DIV_ROUND_UP
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
X-List-Received-Date: Sun, 05 Jun 2016 11:21:52 -0000

From: Laurent Vivier <lvivier@redhat.com>

Replace (((n) + (d) - 1) /(d)) by DIV_ROUND_UP(n,d).

This patch is the result of coccinelle script
scripts/coccinelle/round.cocci

CC: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/audio/pcspk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/audio/pcspk.c b/hw/audio/pcspk.c
index f9afc8e..d259960 100644
--- a/hw/audio/pcspk.c
+++ b/hw/audio/pcspk.c
@@ -35,7 +35,7 @@
 #define PCSPK_BUF_LEN 1792
 #define PCSPK_SAMPLE_RATE 32000
 #define PCSPK_MAX_FREQ (PCSPK_SAMPLE_RATE >> 1)
-#define PCSPK_MIN_COUNT ((PIT_FREQ + PCSPK_MAX_FREQ - 1) / PCSPK_MAX_FREQ)
+#define PCSPK_MIN_COUNT DIV_ROUND_UP(PIT_FREQ, PCSPK_MAX_FREQ)
 
 #define PC_SPEAKER(obj) OBJECT_CHECK(PCSpkState, (obj), TYPE_PC_SPEAKER)
 
-- 
2.1.4


