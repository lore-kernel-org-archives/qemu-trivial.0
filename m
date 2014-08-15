Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XIJEB-00013l-84
	for mharc-qemu-trivial@gnu.org; Fri, 15 Aug 2014 11:15:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57820)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XIJE5-0000zA-HR
	for qemu-trivial@nongnu.org; Fri, 15 Aug 2014 11:15:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XIJE1-0005cU-6L
	for qemu-trivial@nongnu.org; Fri, 15 Aug 2014 11:15:33 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:36555)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XIJDn-0005ae-NA; Fri, 15 Aug 2014 11:15:15 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 18ED04307C;
	Fri, 15 Aug 2014 19:15:15 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 0BCCD6E1;
	Fri, 15 Aug 2014 19:15:14 +0400 (MSK)
Received: (nullmailer pid 17918 invoked by uid 1000);
	Fri, 15 Aug 2014 15:15:13 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri, 15 Aug 2014 19:14:59 +0400
Message-Id: <1408115711-17836-9-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1408115711-17836-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1408115711-17836-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 08/20] audio: don't use 'Yoda conditions'
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
X-List-Received-Date: Fri, 15 Aug 2014 15:15:38 -0000

From: Gonglei <arei.gonglei@huawei.com>

imitate nearby code about using '!value' or 'value == NULL'

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/audio/gus.c       |    2 +-
 hw/audio/hda-codec.c |    3 ++-
 hw/audio/sb16.c      |    6 +++---
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/hw/audio/gus.c b/hw/audio/gus.c
index bba6840..4a43ce7 100644
--- a/hw/audio/gus.c
+++ b/hw/audio/gus.c
@@ -212,7 +212,7 @@ static int GUS_read_DMA (void *opaque, int nchan, int dma_pos, int dma_len)
         pos += copied;
     }
 
-    if (0 == ((mode >> 4) & 1)) {
+    if (((mode >> 4) & 1) == 0) {
         DMA_release_DREQ (s->emu.gusdma);
     }
     return dma_len;
diff --git a/hw/audio/hda-codec.c b/hw/audio/hda-codec.c
index cbcf521..3c03ff5 100644
--- a/hw/audio/hda-codec.c
+++ b/hw/audio/hda-codec.c
@@ -489,8 +489,9 @@ static int hda_audio_init(HDACodecDevice *hda, const struct desc_codec *desc)
     for (i = 0; i < a->desc->nnodes; i++) {
         node = a->desc->nodes + i;
         param = hda_codec_find_param(node, AC_PAR_AUDIO_WIDGET_CAP);
-        if (NULL == param)
+        if (param == NULL) {
             continue;
+        }
         type = (param->val & AC_WCAP_TYPE) >> AC_WCAP_TYPE_SHIFT;
         switch (type) {
         case AC_WID_AUD_OUT:
diff --git a/hw/audio/sb16.c b/hw/audio/sb16.c
index 60c4b3b..bda26d0 100644
--- a/hw/audio/sb16.c
+++ b/hw/audio/sb16.c
@@ -928,7 +928,7 @@ static IO_WRITE_PROTO (dsp_write)
 /*         if (s->highspeed) */
 /*             break; */
 
-        if (0 == s->needed_bytes) {
+        if (s->needed_bytes == 0) {
             command (s, val);
 #if 0
             if (0 == s->needed_bytes) {
@@ -1212,7 +1212,7 @@ static int SB_read_DMA (void *opaque, int nchan, int dma_pos, int dma_len)
 #endif
 
     if (till <= copy) {
-        if (0 == s->dma_auto) {
+        if (s->dma_auto == 0) {
             copy = till;
         }
     }
@@ -1224,7 +1224,7 @@ static int SB_read_DMA (void *opaque, int nchan, int dma_pos, int dma_len)
     if (s->left_till_irq <= 0) {
         s->mixer_regs[0x82] |= (nchan & 4) ? 2 : 1;
         qemu_irq_raise (s->pic);
-        if (0 == s->dma_auto) {
+        if (s->dma_auto == 0) {
             control (s, 0);
             speaker (s, 0);
         }
-- 
1.7.10.4


