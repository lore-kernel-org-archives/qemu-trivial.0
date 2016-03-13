Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1afCoZ-0007uN-Vz
	for mharc-qemu-trivial@gnu.org; Sun, 13 Mar 2016 16:40:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57497)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mbtamuli@gmail.com>) id 1afBF6-0002nK-6g
	for qemu-trivial@nongnu.org; Sun, 13 Mar 2016 14:59:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mbtamuli@gmail.com>) id 1afBF4-0002cT-Qo
	for qemu-trivial@nongnu.org; Sun, 13 Mar 2016 14:59:56 -0400
Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241]:34524)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mbtamuli@gmail.com>)
	id 1afBF0-0002bZ-K6; Sun, 13 Mar 2016 14:59:50 -0400
Received: by mail-pf0-x241.google.com with SMTP id n5so6075493pfn.1;
	Sun, 13 Mar 2016 11:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=H3GMUSLCywX8P4ZxoqZE0GX3R0F9gQsffLLAcRTPLBo=;
	b=OmLj6MywVSpHYiR55PjyN0MMrAUQXxjzwlVktFUuS/+VzObBQcF8x9xSOUv3PR8m4n
	J+EaMmDuueMSaxRUSJBsO+oV07SLob7BJ0wGG0R/tqw0Z/SJ1U9T06U7nOp3OJgdJL75
	Of34Zimds54coJsnWcdMH1wNiSSOJ6k2zxqaVOKXLSGP5eWszN4ooCWs9EqIN2bmNDpD
	ry75lr66b3ppLXITKypdx918NX1VKHLT1JS5uGgnVQN5DX6Wy/N33c+BRCdPYHp/0FP9
	I676zWQi0UgZ147J+S/gFhSFMu30H5I0ONunf3csDN2Bzo18KeYFO2IqlUA1Nr69y+vr
	SfmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=H3GMUSLCywX8P4ZxoqZE0GX3R0F9gQsffLLAcRTPLBo=;
	b=k3tilgzYFQw/Fb8BUyy4vR51dv+c5yqWFnmM0Zj5YZsT4nIeIPoouYacbKLbLLuwS1
	JSbK+rARmmcfGv5vjn/nNzj13AoYY8rdkYcqHkSyxA5BE6ST2dUqT69V9OWNE1s3k9wJ
	sz6FocDy5nm4UZpRCe7f2EluvWT57LbUUPS0FExoAfDZ/3c2//Q7mvQIOSg2hWqheXzn
	ImHhUujxUtRhI3Yo8aV5Lf7K3uA5aWF+lfgWAHFeMmCye0BF3FprTWZWPjzAnswQvgnc
	ESMZZspL+ozAAJUptdWSib4f8NvK8B+XNPsqYlDmZwvPnQ4HtTTGXuY5E1INI2iu8xc3
	CzPA==
X-Gm-Message-State: AD7BkJJBVbVtbFppCCL4mR0vqKJspB2UaFLWHgyaIoh8646R3rigUkQyFLFSMA/8WMSEWw==
X-Received: by 10.98.72.218 with SMTP id q87mr13965103pfi.117.1457895589758;
	Sun, 13 Mar 2016 11:59:49 -0700 (PDT)
Received: from localhost.localdomain (us-vpn.mytunneling.com. [192.81.211.71])
	by smtp.gmail.com with ESMTPSA id
	ez6sm26691757pab.12.2016.03.13.11.59.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 13 Mar 2016 11:59:49 -0700 (PDT)
From: Mriyam Tamuli <mbtamuli@gmail.com>
To: qemu-devel@nongnu.org
Date: Mon, 14 Mar 2016 00:29:15 +0530
Message-Id: <1457895555-22405-1-git-send-email-mbtamuli@gmail.com>
X-Mailer: git-send-email 2.5.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::241
X-Mailman-Approved-At: Sun, 13 Mar 2016 16:40:36 -0400
Cc: peter.maydell@linaro.org, Mriyam Tamuli <mbtamuli@gmail.com>,
	e.voevodin@samsung.com, i.mitsyanko@gmail.com,
	qemu-trivial@nongnu.org, michael@walle.cc,
	d.solodkiy@samsung.com, m.kozlov@samsung.com
Subject: [Qemu-trivial] [PATCH 4/5] address_space: replaced function calls
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
X-List-Received-Date: Sun, 13 Mar 2016 18:59:58 -0000

replaced calls named cpu_physical_memory_* with address_space_*

hw/core/loader.c
hw/display/exynos4210_fimd.c
hw/display/milkymist-tmu2.c
hw/display/omap_dss.c
---
 hw/core/loader.c             |  4 ++--
 hw/display/exynos4210_fimd.c |  6 +++---
 hw/display/milkymist-tmu2.c  | 16 ++++++++--------
 hw/display/omap_dss.c        |  8 ++++----
 4 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/hw/core/loader.c b/hw/core/loader.c
index 8e8031c..19fa77a 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -1000,8 +1000,8 @@ static void rom_reset(void *unused)
             void *host = memory_region_get_ram_ptr(rom->mr);
             memcpy(host, rom->data, rom->datasize);
         } else {
-            cpu_physical_memory_write_rom(&address_space_memory,
-                                          rom->addr, rom->data, rom->datasize);
+            address_space_write_rom(&address_space_memory,
+                                    rom->addr, rom->data, rom->datasize);
         }
         if (rom->isrom) {
             /* rom needs to be written only once */
diff --git a/hw/display/exynos4210_fimd.c b/hw/display/exynos4210_fimd.c
index 728eb21..cc3e38c 100644
--- a/hw/display/exynos4210_fimd.c
+++ b/hw/display/exynos4210_fimd.c
@@ -1130,7 +1130,7 @@ static void fimd_update_memory_section(Exynos4210fimdState *s, unsigned win)
     }
 
     if (w->host_fb_addr) {
-        cpu_physical_memory_unmap(w->host_fb_addr, w->fb_len, 0, 0);
+        address_space_unmap(w->host_fb_addr, w->fb_len, 0, 0);
         w->host_fb_addr = NULL;
         w->fb_len = 0;
     }
@@ -1161,7 +1161,7 @@ static void fimd_update_memory_section(Exynos4210fimdState *s, unsigned win)
         goto error_return;
     }
 
-    w->host_fb_addr = cpu_physical_memory_map(fb_start_addr, &fb_mapped_len, 0);
+    w->host_fb_addr = address_space_map(fb_start_addr, &fb_mapped_len, 0);
     if (!w->host_fb_addr) {
         DPRINT_ERROR("Failed to map window %u framebuffer\n", win);
         goto error_return;
@@ -1170,7 +1170,7 @@ static void fimd_update_memory_section(Exynos4210fimdState *s, unsigned win)
     if (fb_mapped_len != w->fb_len) {
         DPRINT_ERROR("Window %u mapped framebuffer length is less then "
                 "expected\n", win);
-        cpu_physical_memory_unmap(w->host_fb_addr, fb_mapped_len, 0, 0);
+        address_space_unmap(w->host_fb_addr, fb_mapped_len, 0, 0);
         goto error_return;
     }
     memory_region_set_log(w->mem_section.mr, true, DIRTY_MEMORY_VGA);
diff --git a/hw/display/milkymist-tmu2.c b/hw/display/milkymist-tmu2.c
index 9bc88f9..cf3bf97 100644
--- a/hw/display/milkymist-tmu2.c
+++ b/hw/display/milkymist-tmu2.c
@@ -213,7 +213,7 @@ static void tmu2_start(MilkymistTMU2State *s)
     glGenTextures(1, &texture);
     glBindTexture(GL_TEXTURE_2D, texture);
     fb_len = 2*s->regs[R_TEXHRES]*s->regs[R_TEXVRES];
-    fb = cpu_physical_memory_map(s->regs[R_TEXFBUF], &fb_len, 0);
+    fb = address_space_map(s->regs[R_TEXFBUF], &fb_len, 0);
     if (fb == NULL) {
         glDeleteTextures(1, &texture);
         glXMakeContextCurrent(s->dpy, None, None, NULL);
@@ -222,7 +222,7 @@ static void tmu2_start(MilkymistTMU2State *s)
     }
     glTexImage2D(GL_TEXTURE_2D, 0, 3, s->regs[R_TEXHRES], s->regs[R_TEXVRES],
             0, GL_RGB, GL_UNSIGNED_SHORT_5_6_5, fb);
-    cpu_physical_memory_unmap(fb, fb_len, 0, fb_len);
+    address_space_unmap(fb, fb_len, 0, fb_len);
 
     /* Set up texturing options */
     /* WARNING:
@@ -257,7 +257,7 @@ static void tmu2_start(MilkymistTMU2State *s)
 
     /* Read the QEMU dest. framebuffer into the OpenGL framebuffer */
     fb_len = 2 * s->regs[R_DSTHRES] * s->regs[R_DSTVRES];
-    fb = cpu_physical_memory_map(s->regs[R_DSTFBUF], &fb_len, 0);
+    fb = address_space_map(s->regs[R_DSTFBUF], &fb_len, 0);
     if (fb == NULL) {
         glDeleteTextures(1, &texture);
         glXMakeContextCurrent(s->dpy, None, None, NULL);
@@ -267,7 +267,7 @@ static void tmu2_start(MilkymistTMU2State *s)
 
     glDrawPixels(s->regs[R_DSTHRES], s->regs[R_DSTVRES], GL_RGB,
             GL_UNSIGNED_SHORT_5_6_5, fb);
-    cpu_physical_memory_unmap(fb, fb_len, 0, fb_len);
+    address_space_unmap(fb, fb_len, 0, fb_len);
     glViewport(0, 0, s->regs[R_DSTHRES], s->regs[R_DSTVRES]);
     glMatrixMode(GL_PROJECTION);
     glLoadIdentity();
@@ -276,7 +276,7 @@ static void tmu2_start(MilkymistTMU2State *s)
 
     /* Map the texture */
     mesh_len = MESH_MAXSIZE*MESH_MAXSIZE*sizeof(struct vertex);
-    mesh = cpu_physical_memory_map(s->regs[R_VERTICESADDR], &mesh_len, 0);
+    mesh = address_space_map(s->regs[R_VERTICESADDR], &mesh_len, 0);
     if (mesh == NULL) {
         glDeleteTextures(1, &texture);
         glXMakeContextCurrent(s->dpy, None, None, NULL);
@@ -289,11 +289,11 @@ static void tmu2_start(MilkymistTMU2State *s)
         s->regs[R_HMESHLAST], s->regs[R_VMESHLAST],
         s->regs[R_DSTHOFFSET], s->regs[R_DSTVOFFSET],
         s->regs[R_DSTSQUAREW], s->regs[R_DSTSQUAREH]);
-    cpu_physical_memory_unmap(mesh, mesh_len, 0, mesh_len);
+    address_space_unmap(mesh, mesh_len, 0, mesh_len);
 
     /* Write back the OpenGL framebuffer to the QEMU framebuffer */
     fb_len = 2 * s->regs[R_DSTHRES] * s->regs[R_DSTVRES];
-    fb = cpu_physical_memory_map(s->regs[R_DSTFBUF], &fb_len, 1);
+    fb = address_space_map(s->regs[R_DSTFBUF], &fb_len, 1);
     if (fb == NULL) {
         glDeleteTextures(1, &texture);
         glXMakeContextCurrent(s->dpy, None, None, NULL);
@@ -303,7 +303,7 @@ static void tmu2_start(MilkymistTMU2State *s)
 
     glReadPixels(0, 0, s->regs[R_DSTHRES], s->regs[R_DSTVRES], GL_RGB,
             GL_UNSIGNED_SHORT_5_6_5, fb);
-    cpu_physical_memory_unmap(fb, fb_len, 1, fb_len);
+    address_space_unmap(fb, fb_len, 1, fb_len);
 
     /* Free OpenGL allocs */
     glDeleteTextures(1, &texture);
diff --git a/hw/display/omap_dss.c b/hw/display/omap_dss.c
index 783e9e1..782493e 100644
--- a/hw/display/omap_dss.c
+++ b/hw/display/omap_dss.c
@@ -630,9 +630,9 @@ static void omap_rfbi_transfer_start(struct omap_dss_s *s)
     len = s->rfbi.pixels * 2;
 
     data_addr = s->dispc.l[0].addr[0];
-    data = cpu_physical_memory_map(data_addr, &len, 0);
+    data = address_space_map(data_addr, &len, 0);
     if (data && len != s->rfbi.pixels * 2) {
-        cpu_physical_memory_unmap(data, len, 0, 0);
+        address_space_unmap(data, len, 0, 0);
         data = NULL;
         len = s->rfbi.pixels * 2;
     }
@@ -641,7 +641,7 @@ static void omap_rfbi_transfer_start(struct omap_dss_s *s)
             bounce_buffer = g_realloc(bounce_buffer, len);
         }
         data = bounce_buffer;
-        cpu_physical_memory_read(data_addr, data, len);
+        address_space_read(data_addr, data, len);
     }
 
     /* TODO bpp */
@@ -656,7 +656,7 @@ static void omap_rfbi_transfer_start(struct omap_dss_s *s)
         s->rfbi.chip[1]->block(s->rfbi.chip[1]->opaque, 1, data, len, pitch);
 
     if (data != bounce_buffer) {
-        cpu_physical_memory_unmap(data, len, 0, len);
+        address_space_unmap(data, len, 0, len);
     }
 
     omap_rfbi_transfer_stop(s);
-- 
2.5.0


