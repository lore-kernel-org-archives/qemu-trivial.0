Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1afCoa-0007vN-LX
	for mharc-qemu-trivial@gnu.org; Sun, 13 Mar 2016 16:40:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57666)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mbtamuli@gmail.com>) id 1afBFV-0003OA-M3
	for qemu-trivial@nongnu.org; Sun, 13 Mar 2016 15:00:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mbtamuli@gmail.com>) id 1afBFU-0002nN-8r
	for qemu-trivial@nongnu.org; Sun, 13 Mar 2016 15:00:21 -0400
Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244]:35805)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mbtamuli@gmail.com>)
	id 1afBFL-0002m0-SJ; Sun, 13 Mar 2016 15:00:12 -0400
Received: by mail-pf0-x244.google.com with SMTP id u190so8016364pfb.2;
	Sun, 13 Mar 2016 12:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=o6CHQXqClUTM1zTc/dEvFNdYofDaOlfLviBNVWch+xw=;
	b=rwzfRR40CPCfPlbadDSUpArg7Y9xtsq5v1OFK0JPrxxo36jI9bXxDYhhGc5EqgDeJC
	mYNHB3rAg6WVf0dli1joPBnaSax3VkzWoTyTm0wdof4KHBxm2maDyNS5IdSeDsMySSb9
	XWNVf8a5KUdv/xHl/M5KMgB3FbG+PkLXjhO6+6Zryu+gL3ZdxXp3uvgSJHQho2b4n5bg
	abUiNHo4Ibk+4NsizLD04cl8i49t0Hw2g7AzKLtcTvTKWIvSuMlgZ+LkwvDiev94V1F/
	z5dBR0q+qE1uIF1LRKtxh6TYqdTjASiq55V2Bb9QtaSaSclEmhHTx9KyzMte22V0PtML
	xS0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=o6CHQXqClUTM1zTc/dEvFNdYofDaOlfLviBNVWch+xw=;
	b=CwnlTpFddZ7hsEzmwfFwNNwWxgbPUr/B6/wtpE3LXNR5PQqQWJ8nhLxSZ43QOSiRWp
	XsXz7NUiB6OQO+Y9ok/m2R0qWKV6O+vw9wkmbzXCtr5a6ba+CKQLa1+VD/Jqo4PIGFeh
	HsZQZunrJmMrYr4ITOb6mKwxITAP3GFDJw7akBAwodqJs/KgVOmI235AUCmQdCn1W9mz
	ymY11A9qD2SEv0lBUm3hi8XuiPOeCaEsol3cL9mJGbTKEkCmmcknLmDvt0n3IrBz9pYa
	BHkHOxg9O9vXTXzmnslwCEvOf56nVsajt7ynJ7mI6O8pAJu0uEL64BKf+/W5fEfhNEWo
	/4gw==
X-Gm-Message-State: AD7BkJJfuuT+QyyZM79sDQlGp56oZkfspNX0GFeTnp77RMYjXJ38zMoEnpsaR9SY2LilCg==
X-Received: by 10.98.17.132 with SMTP id 4mr24351054pfr.16.1457895610996;
	Sun, 13 Mar 2016 12:00:10 -0700 (PDT)
Received: from localhost.localdomain (us-vpn.mytunneling.com. [192.81.211.71])
	by smtp.gmail.com with ESMTPSA id
	y68sm26666979pfi.6.2016.03.13.12.00.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 13 Mar 2016 12:00:10 -0700 (PDT)
From: Mriyam Tamuli <mbtamuli@gmail.com>
To: qemu-devel@nongnu.org
Date: Mon, 14 Mar 2016 00:29:38 +0530
Message-Id: <1457895578-22460-1-git-send-email-mbtamuli@gmail.com>
X-Mailer: git-send-email 2.5.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::244
X-Mailman-Approved-At: Sun, 13 Mar 2016 16:40:36 -0400
Cc: peter.maydell@linaro.org, Mriyam Tamuli <mbtamuli@gmail.com>,
	mst@redhat.com, qemu-trivial@nongnu.org,
	edgar.iglesias@gmail.com, balrogg@gmail.com
Subject: [Qemu-trivial] [PATCH 5/5] address_space: replaced function calls
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
X-List-Received-Date: Sun, 13 Mar 2016 19:00:26 -0000

replaced calls named cpu_physical_memory_* with address_space_*

hw/display/omap_lcdc.c
hw/display/pxa2xx_lcd.c
hw/display/virtio-gpu.c
hw/dma/etraxfs_dma.c
---
 hw/display/omap_lcdc.c  |  8 ++++----
 hw/display/pxa2xx_lcd.c |  4 ++--
 hw/display/virtio-gpu.c |  6 +++---
 hw/dma/etraxfs_dma.c    | 34 +++++++++++++++++-----------------
 4 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/hw/display/omap_lcdc.c b/hw/display/omap_lcdc.c
index ce1058b..9f6e38c 100644
--- a/hw/display/omap_lcdc.c
+++ b/hw/display/omap_lcdc.c
@@ -128,9 +128,9 @@ static void omap_update_display(void *opaque)
 
     frame_offset = 0;
     if (omap_lcd->plm != 2) {
-        cpu_physical_memory_read(omap_lcd->dma->phys_framebuffer[
-                                  omap_lcd->dma->current_frame],
-                                 (void *)omap_lcd->palette, 0x200);
+        address_space_read(omap_lcd->dma->phys_framebuffer[
+                           omap_lcd->dma->current_frame],
+                           (void *)omap_lcd->palette, 0x200);
         switch (omap_lcd->palette[0] >> 12 & 7) {
         case 3 ... 7:
             frame_offset += 0x200;
@@ -280,7 +280,7 @@ static void omap_lcd_update(struct omap_lcd_panel_s *s) {
     s->dma->phys_framebuffer[1] = s->dma->src_f2_top;
 
     if (s->plm != 2 && !s->palette_done) {
-        cpu_physical_memory_read(
+        address_space_read(
             s->dma->phys_framebuffer[s->dma->current_frame],
             (void *)s->palette, 0x200);
         s->palette_done = 1;
diff --git a/hw/display/pxa2xx_lcd.c b/hw/display/pxa2xx_lcd.c
index 845521c..67b9a53 100644
--- a/hw/display/pxa2xx_lcd.c
+++ b/hw/display/pxa2xx_lcd.c
@@ -309,7 +309,7 @@ static void pxa2xx_descriptor_load(PXA2xxLCDState *s)
             continue;
         }
 
-        cpu_physical_memory_read(descptr, &desc, sizeof(desc));
+        address_space_read(descptr, &desc, sizeof(desc));
         s->dma_ch[i].descriptor = le32_to_cpu(desc.fdaddr);
         s->dma_ch[i].source = le32_to_cpu(desc.fsaddr);
         s->dma_ch[i].id = le32_to_cpu(desc.fidr);
@@ -853,7 +853,7 @@ static void pxa2xx_update_display(void *opaque)
             }
 
             if (s->dma_ch[ch].command & LDCMD_PAL) {
-                cpu_physical_memory_read(fbptr, s->dma_ch[ch].pbuffer,
+                address_space_read(fbptr, s->dma_ch[ch].pbuffer,
                     MAX(LDCMD_LENGTH(s->dma_ch[ch].command),
                         sizeof(s->dma_ch[ch].pbuffer)));
                 pxa2xx_palette_parse(s, ch, s->bpp);
diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index ddf3bfb..2a97b04 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -622,7 +622,7 @@ int virtio_gpu_create_mapping_iov(struct virtio_gpu_resource_attach_backing *ab,
     for (i = 0; i < ab->nr_entries; i++) {
         hwaddr len = ents[i].length;
         (*iov)[i].iov_len = ents[i].length;
-        (*iov)[i].iov_base = cpu_physical_memory_map(ents[i].addr, &len, 1);
+        (*iov)[i].iov_base = address_space_map(ents[i].addr, &len, 1);
         if (!(*iov)[i].iov_base || len != ents[i].length) {
             qemu_log_mask(LOG_GUEST_ERROR, "%s: failed to map MMIO memory for"
                           " resource %d element %d\n",
@@ -642,8 +642,8 @@ void virtio_gpu_cleanup_mapping_iov(struct iovec *iov, uint32_t count)
     int i;
 
     for (i = 0; i < count; i++) {
-        cpu_physical_memory_unmap(iov[i].iov_base, iov[i].iov_len, 1,
-                                  iov[i].iov_len);
+        address_space_unmap(iov[i].iov_base, iov[i].iov_len, 1,
+                            iov[i].iov_len);
     }
     g_free(iov);
 }
diff --git a/hw/dma/etraxfs_dma.c b/hw/dma/etraxfs_dma.c
index d5650eb..4b49528 100644
--- a/hw/dma/etraxfs_dma.c
+++ b/hw/dma/etraxfs_dma.c
@@ -223,9 +223,9 @@ static void channel_load_g(struct fs_dma_ctrl *ctrl, int c)
 	hwaddr addr = channel_reg(ctrl, c, RW_GROUP);
 
 	/* Load and decode. FIXME: handle endianness.  */
-	cpu_physical_memory_read (addr, 
-				  (void *) &ctrl->channels[c].current_g, 
-				  sizeof ctrl->channels[c].current_g);
+    address_space_read(addr,
+                  (void *) &ctrl->channels[c].current_g,
+                  sizeof ctrl->channels[c].current_g);
 }
 
 static void dump_c(int ch, struct dma_descr_context *c)
@@ -255,9 +255,9 @@ static void channel_load_c(struct fs_dma_ctrl *ctrl, int c)
 	hwaddr addr = channel_reg(ctrl, c, RW_GROUP_DOWN);
 
 	/* Load and decode. FIXME: handle endianness.  */
-	cpu_physical_memory_read (addr, 
-				  (void *) &ctrl->channels[c].current_c, 
-				  sizeof ctrl->channels[c].current_c);
+    address_space_read(addr,
+                  (void *) &ctrl->channels[c].current_c,
+                  sizeof ctrl->channels[c].current_c);
 
 	D(dump_c(c, &ctrl->channels[c].current_c));
 	/* I guess this should update the current pos.  */
@@ -273,9 +273,9 @@ static void channel_load_d(struct fs_dma_ctrl *ctrl, int c)
 
 	/* Load and decode. FIXME: handle endianness.  */
 	D(printf("%s ch=%d addr=" TARGET_FMT_plx "\n", __func__, c, addr));
-	cpu_physical_memory_read (addr,
-				  (void *) &ctrl->channels[c].current_d, 
-				  sizeof ctrl->channels[c].current_d);
+    address_space_read(addr,
+                  (void *) &ctrl->channels[c].current_d,
+                  sizeof ctrl->channels[c].current_d);
 
 	D(dump_d(c, &ctrl->channels[c].current_d));
 	ctrl->channels[c].regs[RW_DATA] = addr;
@@ -288,9 +288,9 @@ static void channel_store_c(struct fs_dma_ctrl *ctrl, int c)
 	/* Encode and store. FIXME: handle endianness.  */
 	D(printf("%s ch=%d addr=" TARGET_FMT_plx "\n", __func__, c, addr));
 	D(dump_d(c, &ctrl->channels[c].current_d));
-	cpu_physical_memory_write (addr,
-				  (void *) &ctrl->channels[c].current_c,
-				  sizeof ctrl->channels[c].current_c);
+    address_space_write(addr,
+                  (void *) &ctrl->channels[c].current_c,
+                  sizeof ctrl->channels[c].current_c);
 }
 
 static void channel_store_d(struct fs_dma_ctrl *ctrl, int c)
@@ -299,9 +299,9 @@ static void channel_store_d(struct fs_dma_ctrl *ctrl, int c)
 
 	/* Encode and store. FIXME: handle endianness.  */
 	D(printf("%s ch=%d addr=" TARGET_FMT_plx "\n", __func__, c, addr));
-	cpu_physical_memory_write (addr,
-				  (void *) &ctrl->channels[c].current_d, 
-				  sizeof ctrl->channels[c].current_d);
+    address_space_write(addr,
+                  (void *) &ctrl->channels[c].current_d,
+                  sizeof ctrl->channels[c].current_d);
 }
 
 static inline void channel_stop(struct fs_dma_ctrl *ctrl, int c)
@@ -431,7 +431,7 @@ static int channel_out_run(struct fs_dma_ctrl *ctrl, int c)
 
 		if (len > sizeof buf)
 			len = sizeof buf;
-		cpu_physical_memory_read (saved_data_buf, buf, len);
+        address_space_read(saved_data_buf, buf, len);
 
 		out_eop = ((saved_data_buf + len) ==
 		           ctrl->channels[c].current_d.after) &&
@@ -512,7 +512,7 @@ static int channel_in_process(struct fs_dma_ctrl *ctrl, int c,
 	if (len > buflen)
 		len = buflen;
 
-	cpu_physical_memory_write (saved_data_buf, buf, len);
+    address_space_write(saved_data_buf, buf, len);
 	saved_data_buf += len;
 
 	if (saved_data_buf ==
-- 
2.5.0


