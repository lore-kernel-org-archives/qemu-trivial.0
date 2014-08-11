Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XGpF8-0003mk-U6
	for mharc-qemu-trivial@gnu.org; Mon, 11 Aug 2014 09:02:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43868)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XGpF2-0003bU-Cx
	for qemu-trivial@nongnu.org; Mon, 11 Aug 2014 09:02:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XGpEx-0003mS-J3
	for qemu-trivial@nongnu.org; Mon, 11 Aug 2014 09:02:24 -0400
Received: from szxga01-in.huawei.com ([119.145.14.64]:65035)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1XGpEl-0003hD-F6; Mon, 11 Aug 2014 09:02:08 -0400
Received: from 172.24.2.119 (EHLO szxeml406-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CAC71206; Mon, 11 Aug 2014 21:01:17 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml406-hub.china.huawei.com
	(10.82.67.93) with Microsoft SMTP Server id 14.3.158.1; Mon, 11 Aug 2014
	21:01:06 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Mon, 11 Aug 2014 21:00:53 +0800
Message-ID: <1407762058-11512-4-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
In-Reply-To: <1407762058-11512-1-git-send-email-arei.gonglei@huawei.com>
References: <1407762058-11512-1-git-send-email-arei.gonglei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.64
Cc: peter.maydell@linaro.org, peter.crosthwaite@xilinx.com,
	weidong.huang@huawei.com, mst@redhat.com,
	qemu-trivial@nongnu.org, mjt@tls.msk.ru, marcel.a@redhat.com,
	luonengjun@huawei.com, armbru@redhat.com, lcapitulino@redhat.com,
	Gonglei <arei.gonglei@huawei.com>, av1474@comtv.ru,
	kraxel@redhat.com, stefanha@redhat.com, imammedo@redhat.com,
	dmitry@daynix.com, pbonzini@redhat.com,
	peter.huangpeng@huawei.com, eblake@redhat.com, afaerber@suse.de,
	dgilbert@redhat.com
Subject: [Qemu-trivial] [PATCH v5 3/8] audio: don't use 'Yoda conditions'
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
X-List-Received-Date: Mon, 11 Aug 2014 13:02:29 -0000

From: Gonglei <arei.gonglei@huawei.com>

imitate nearby code about using '!value' or 'value == NULL'

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 hw/audio/gus.c       | 2 +-
 hw/audio/hda-codec.c | 3 ++-
 hw/audio/sb16.c      | 6 +++---
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
1.7.12.4



