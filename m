Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fWwIl-0004AE-RK
	for mharc-qemu-trivial@gnu.org; Sun, 24 Jun 2018 00:06:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42477)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWwIg-000464-D3
	for qemu-trivial@nongnu.org; Sun, 24 Jun 2018 00:06:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWwIf-0004CM-D5
	for qemu-trivial@nongnu.org; Sun, 24 Jun 2018 00:06:54 -0400
Received: from mail-qk0-x235.google.com ([2607:f8b0:400d:c09::235]:37508)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWwIc-00044W-04; Sun, 24 Jun 2018 00:06:50 -0400
Received: by mail-qk0-x235.google.com with SMTP id j12-v6so5833380qkk.4;
	Sat, 23 Jun 2018 21:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=is7KX7DYXJQMvKVDeWgdn/GlkMgXVP6yLiPhgPPFzKY=;
	b=hW+4ZUOccUFBnx6pVtMcooaBIlJ+hVoLrhHnAeZcE/f9x1vwegFNjZfg6RkNhYPcsz
	velHqR416ck3qfD3XMf6leptS60DrvCSxlEFqVAtr8fXzP8GK6ej9gjq0bLMSI1FsXV4
	btEMPycLiaDoJlJePfJ3H7tXcevbQ/VEFPtSQoP+LTwVCQvqcIJfdJ3lihNO1ahc3LFQ
	+3LJr4NvloMk5Xta+X1vsPu2SbvHHUgHdKRR9bq0JiMHbFzCTZQU9FC6izOznt11PmTM
	1yiAJKlTD/CTjLRqgzaERUdkEepriK5YME3KGOpp1Xo4ETmk0Vc8+sDwqzMmN/TiowHL
	d6HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=is7KX7DYXJQMvKVDeWgdn/GlkMgXVP6yLiPhgPPFzKY=;
	b=KNZA1FlpzXfOSbbZzeQh5DaznTegiGXTS5t7HZdztHaU07AmhVc/k6sCpUJcVrA/HT
	dyxAwbDl63r14DMeheGlBYuyzvf4YSOnxyhCWXzX6/h66DSLS8zAsSPrzbdL4hZ/+JMh
	25nh55l7LtgLI7nq/V0s9dNPXOu7Bji5gSgXLBBDhf4JPiHksK8A+9lpj1Z3XiDSxB+E
	UmV4osjcUO5gfGQPiNTeQfoC+v7Dh4aGdMugcm8/OMXvDcctEEjDpE7oBSqitUK1L9uI
	8mWSN7mhlvGR28lBG1PYCc8sixlZDWCvxVYYT0NFfkV4pBoKqj93wd9LQL10wyZYL1CO
	yRiQ==
X-Gm-Message-State: APt69E2VthXLkihMZ8I/DK/k/zkQJGv+A2b6VjUK/40eI9Ebu0iq84Sv
	KX3gT7VbbzB+6jdHp2wBWjs=
X-Google-Smtp-Source: ADUXVKKTFrlc8GAABIkyYV2pGeXvu84PRh7r754d4OUqJZbWX5Si9vE4jBMpF4aqeH/EvyBFNqGcJQ==
X-Received: by 2002:a37:de02:: with SMTP id
	h2-v6mr6381027qkj.420.1529813209510; 
	Sat, 23 Jun 2018 21:06:49 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	d14-v6sm7145313qtn.90.2018.06.23.21.06.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 23 Jun 2018 21:06:49 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-arm@nongnu.org
Date: Sun, 24 Jun 2018 01:06:02 -0300
Message-Id: <20180624040609.17572-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180624040609.17572-1-f4bug@amsat.org>
References: <20180624040609.17572-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::235
Subject: [Qemu-trivial] [PATCH v3 09/16] hw/arm/omap: Use
 qemu_log_mask(GUEST_ERROR) instead of fprintf
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
X-List-Received-Date: Sun, 24 Jun 2018 04:06:56 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/arm/omap.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/hw/arm/omap.h b/include/hw/arm/omap.h
index 39abba753d..e7fbd340f3 100644
--- a/include/hw/arm/omap.h
+++ b/include/hw/arm/omap.h
@@ -21,6 +21,7 @@
 # define hw_omap_h		"omap.h"
 #include "hw/irq.h"
 #include "target/arm/cpu-qom.h"
+#include "qemu/log.h"
 
 # define OMAP_EMIFS_BASE	0x00000000
 # define OMAP2_Q0_BASE		0x00000000
@@ -944,8 +945,6 @@ struct omap_mpu_state_s *omap2420_mpu_init(MemoryRegion *sysmem,
                 unsigned long sdram_size,
                 const char *core);
 
-#define OMAP_FMT_plx "%#08" HWADDR_PRIx
-
 uint32_t omap_badwidth_read8(void *opaque, hwaddr addr);
 void omap_badwidth_write8(void *opaque, hwaddr addr,
                 uint32_t value);
@@ -959,11 +958,12 @@ void omap_badwidth_write32(void *opaque, hwaddr addr,
 void omap_mpu_wakeup(void *opaque, int irq, int req);
 
 # define OMAP_BAD_REG(paddr)		\
-        fprintf(stderr, "%s: Bad register " OMAP_FMT_plx "\n",	\
-                        __func__, paddr)
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad register %#08"HWADDR_PRIx"\n", \
+                      __func__, paddr)
 # define OMAP_RO_REG(paddr)		\
-        fprintf(stderr, "%s: Read-only register " OMAP_FMT_plx "\n",	\
-                        __func__, paddr)
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Read-only register %#08" \
+                                       HWADDR_PRIx "\n", \
+                      __func__, paddr)
 
 /* OMAP-specific Linux bootloader tags for the ATAG_BOARD area
    (Board-specifc tags are not here)  */
-- 
2.18.0


