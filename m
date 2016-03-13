Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1afCoZ-0007u3-Iu
	for mharc-qemu-trivial@gnu.org; Sun, 13 Mar 2016 16:40:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57279)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mbtamuli@gmail.com>) id 1afBDr-0000f6-Gw
	for qemu-trivial@nongnu.org; Sun, 13 Mar 2016 14:58:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mbtamuli@gmail.com>) id 1afBDq-00023G-Kg
	for qemu-trivial@nongnu.org; Sun, 13 Mar 2016 14:58:39 -0400
Received: from mail-pa0-x243.google.com ([2607:f8b0:400e:c03::243]:36049)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mbtamuli@gmail.com>)
	id 1afBDo-00022y-DL; Sun, 13 Mar 2016 14:58:36 -0400
Received: by mail-pa0-x243.google.com with SMTP id 1so12808549pal.3;
	Sun, 13 Mar 2016 11:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=a/Tg6YohhFz9F+u+kHCByyVeIwPM7M9xb/yLqJsHcu0=;
	b=IZi1NmLsgnLV5oNrBhWM8AxikYITPWpNirlgr55Swz516mIwZjsuCv4Hqe86aEE11E
	HPL5A6Q8jezlmCrgVnItr8S5XZ5VKJykWDQIBFsz9xzK6/6xoSZBbnpS1zaiQXK0bMy/
	qMfGBBZJUF4JqQyov+OJ4287qpKzcbXQMZGpaYEEYHwClOfY4AwrhkE/XtpKitvadhK/
	1mJw+TpEZ51PWZN5DD/ngov+oWGvciWRUycFRmIMqNLf7lNTXgi3Ch0OnWMtwJU5Vsgu
	yBQeYKEcT5OxHfe8kMSstD8V4pCdit7V23c9QiHdduj2GJpJleDpuGtnw56mt6pElc4w
	6FZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=a/Tg6YohhFz9F+u+kHCByyVeIwPM7M9xb/yLqJsHcu0=;
	b=krCANTxJYlCFj7LdAUQpsTF7eHqkskJgjXH2FFxXfpJUGnL00bAWwoKHfRjeJI5YqU
	T52rn7HvL5+kOkB9ocw5vTJmFyaVes9y4XPV1fod/c5ITWWVZ8aXOlSvdsYZzi3OoEsA
	e6FwXXodpYqM8T09sX4LD4ICGFhuzsC9c/gGwbgsjAsx8wUS14Fl2ayPpcUITpOCq8EF
	/gLWhFHSL5b9lXynU64pX9+On7h3vs0StIVd+70Cqj6X+tAWdwSllBV9pUxcM+M+dILJ
	BNZ0aRcB1IqQ1qCkNIm8rWte8ogLHVThk3/JpUSO1z4QifgMT9w3aaqMP9zF8C2zIv7q
	rLXw==
X-Gm-Message-State: AD7BkJJAlahJMIwTjkvrXWAgIf8Ooz+nFoT6A0qbusNRYd0UK6Ny0pxThJPeihCdlLWweg==
X-Received: by 10.66.97.8 with SMTP id dw8mr32375706pab.28.1457895515579;
	Sun, 13 Mar 2016 11:58:35 -0700 (PDT)
Received: from localhost.localdomain (us-vpn.mytunneling.com. [192.81.211.71])
	by smtp.gmail.com with ESMTPSA id
	79sm26595917pfq.65.2016.03.13.11.58.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 13 Mar 2016 11:58:34 -0700 (PDT)
From: Mriyam Tamuli <mbtamuli@gmail.com>
To: qemu-devel@nongnu.org
Date: Mon, 14 Mar 2016 00:28:04 +0530
Message-Id: <1457895484-22276-1-git-send-email-mbtamuli@gmail.com>
X-Mailer: git-send-email 2.5.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c03::243
X-Mailman-Approved-At: Sun, 13 Mar 2016 16:40:36 -0400
Cc: peter.maydell@linaro.org, Mriyam Tamuli <mbtamuli@gmail.com>,
	qemu-trivial@nongnu.org, michael@walle.cc, kraxel@redhat.com,
	balrogg@gmail.com
Subject: [Qemu-trivial] [PATCH 3/5] address_space: replaced function calls
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
X-List-Received-Date: Sun, 13 Mar 2016 18:58:40 -0000

replaced calls named cpu_physical_memory_* with address_space_*

hw/arm/omap1.c
hw/arm/pxa2xx.c
hw/audio/marvell_88w8618.c
hw/audio/milkymist-ac97.c
---
 hw/arm/omap1.c             | 12 ++++++------
 hw/arm/pxa2xx.c            |  4 ++--
 hw/audio/marvell_88w8618.c |  2 +-
 hw/audio/milkymist-ac97.c  |  4 ++--
 4 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/hw/arm/omap1.c b/hw/arm/omap1.c
index 6f68130..211e335 100644
--- a/hw/arm/omap1.c
+++ b/hw/arm/omap1.c
@@ -35,7 +35,7 @@ uint32_t omap_badwidth_read8(void *opaque, hwaddr addr)
     uint8_t ret;
 
     OMAP_8B_REG(addr);
-    cpu_physical_memory_read(addr, &ret, 1);
+    address_space_read(addr, &ret, 1);
     return ret;
 }
 
@@ -45,7 +45,7 @@ void omap_badwidth_write8(void *opaque, hwaddr addr,
     uint8_t val8 = value;
 
     OMAP_8B_REG(addr);
-    cpu_physical_memory_write(addr, &val8, 1);
+    address_space_write(addr, &val8, 1);
 }
 
 uint32_t omap_badwidth_read16(void *opaque, hwaddr addr)
@@ -53,7 +53,7 @@ uint32_t omap_badwidth_read16(void *opaque, hwaddr addr)
     uint16_t ret;
 
     OMAP_16B_REG(addr);
-    cpu_physical_memory_read(addr, &ret, 2);
+    address_space_read(addr, &ret, 2);
     return ret;
 }
 
@@ -63,7 +63,7 @@ void omap_badwidth_write16(void *opaque, hwaddr addr,
     uint16_t val16 = value;
 
     OMAP_16B_REG(addr);
-    cpu_physical_memory_write(addr, &val16, 2);
+    address_space_write(addr, &val16, 2);
 }
 
 uint32_t omap_badwidth_read32(void *opaque, hwaddr addr)
@@ -71,7 +71,7 @@ uint32_t omap_badwidth_read32(void *opaque, hwaddr addr)
     uint32_t ret;
 
     OMAP_32B_REG(addr);
-    cpu_physical_memory_read(addr, &ret, 4);
+    address_space_read(addr, &ret, 4);
     return ret;
 }
 
@@ -79,7 +79,7 @@ void omap_badwidth_write32(void *opaque, hwaddr addr,
                 uint32_t value)
 {
     OMAP_32B_REG(addr);
-    cpu_physical_memory_write(addr, &value, 4);
+    address_space_write(addr, &value, 4);
 }
 
 /* MPU OS timers */
diff --git a/hw/arm/pxa2xx.c b/hw/arm/pxa2xx.c
index ff6ac7a..c8172c8 100644
--- a/hw/arm/pxa2xx.c
+++ b/hw/arm/pxa2xx.c
@@ -292,9 +292,9 @@ static void pxa2xx_pwrmode_write(CPUARMState *env, const ARMCPRegInfo *ri,
 
 #if 0
         buffer = 0xe59ff000; /* ldr     pc, [pc, #0] */
-        cpu_physical_memory_write(0, &buffer, 4);
+        address_space_write(0, &buffer, 4);
         buffer = s->pm_regs[PSPR >> 2];
-        cpu_physical_memory_write(8, &buffer, 4);
+        address_space_write(8, &buffer, 4);
 #endif
 
         /* Suspend */
diff --git a/hw/audio/marvell_88w8618.c b/hw/audio/marvell_88w8618.c
index a6ca180..5e6175b 100644
--- a/hw/audio/marvell_88w8618.c
+++ b/hw/audio/marvell_88w8618.c
@@ -82,7 +82,7 @@ static void mv88w8618_audio_callback(void *opaque, int free_out, int free_in)
     if (block_size > 4096) {
         return;
     }
-    cpu_physical_memory_read(s->target_buffer + s->play_pos, buf, block_size);
+    address_space_read(s->target_buffer + s->play_pos, buf, block_size);
     mem_buffer = buf;
     if (s->playback_mode & MP_AUDIO_16BIT_SAMPLE) {
         if (s->playback_mode & MP_AUDIO_MONO) {
diff --git a/hw/audio/milkymist-ac97.c b/hw/audio/milkymist-ac97.c
index 6a3b536..a5dae59 100644
--- a/hw/audio/milkymist-ac97.c
+++ b/hw/audio/milkymist-ac97.c
@@ -203,7 +203,7 @@ static void ac97_in_cb(void *opaque, int avail_b)
             break;
         }
 
-        cpu_physical_memory_write(addr, buf, acquired);
+        address_space_write(addr, buf, acquired);
 
         temp -= acquired;
         addr += acquired;
@@ -241,7 +241,7 @@ static void ac97_out_cb(void *opaque, int free_b)
         int copied, to_copy;
 
         to_copy = audio_MIN(temp, sizeof(buf));
-        cpu_physical_memory_read(addr, buf, to_copy);
+        address_space_read(addr, buf, to_copy);
         copied = AUD_write(s->voice_out, buf, to_copy);
         if (!copied) {
             break;
-- 
2.5.0


