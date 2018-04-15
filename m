Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1f7rK0-0005T4-Uz
	for mharc-qemu-trivial@gnu.org; Sun, 15 Apr 2018 19:44:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51609)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rJy-0005Q4-B8
	for qemu-trivial@nongnu.org; Sun, 15 Apr 2018 19:44:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rJx-0000yx-GB
	for qemu-trivial@nongnu.org; Sun, 15 Apr 2018 19:44:34 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:46043)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rJx-0000yb-Bc; Sun, 15 Apr 2018 19:44:33 -0400
Received: by mail-qk0-x244.google.com with SMTP id f9so6881212qkm.12;
	Sun, 15 Apr 2018 16:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ZTfyC4ZqTgwjwL1Oh7RyxLtPXzQplIT/v4+OXPa8MQM=;
	b=HbdEfSvMrmuljIVBiE2Wv8gtGDvYb3bKN94s9xjK54IL1Er3cjoMYMMHfFnO83DUGe
	3ghMO1ArCyVJ5GYOlnbY4BtdZ+bLdV5V1RZrhXCkZryEGhSBITi9OQNFy1MkCOOxvcnh
	5y30D5dAN7tULbuWxTP899NYSOyjrsiUv29vepQARNqSPQMtHDTcT4IRsEvcu8JmkWcL
	E0N/WYdKSrijTWIE5/OVBR5Utu+s3n2DBEGHJTFOSEf6MdvVdCCWhBcr6tnWmCDzClfV
	42uZIu9KaUksVfbONaM4EGNqLM2XQ9uudQ6GO9Cj20weOMQhhtnhivuiP/VReix6GKEz
	VN0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=ZTfyC4ZqTgwjwL1Oh7RyxLtPXzQplIT/v4+OXPa8MQM=;
	b=YiOTZV7G7XBPEf5SgHOH1bqCvRUX3uF6zfvluw2r0raZZDNtR5eb7FCMmkPOBSVjZj
	IOe9PYyB/sLiCQ8ab680kikwYXa6Bx4w0FIOu7QyyxwdHM7PdWZSbrHOPxUpv8NEd7R4
	ALAKdu+1/OFjOASglo8Rt7dkfsjxCF7X2HNteYdLrbrucoSVLd60ZCc8M6Zz7A0+Kmek
	G1VtP2U9GP5xnRRXre9AeNokAr88kpDIoSKDlhZueqnLgmUbX06vEbMzJ7Uzwk2EVnUe
	V4Ot/UyKOvtjzUfWiOLOcGyVotRXOG9C/1XOBOBMsaT0kWBBscEvtB3/FwK/e0QUfh1x
	juYw==
X-Gm-Message-State: ALQs6tCiIHHoScoeL8byisZAzJwTlBo6O22PVhyDKx5bMxRpIIcHCEDO
	aXp0teE5GTbTImQAg3RyVyHBur5j
X-Google-Smtp-Source: AIpwx4/xNlxZTMXsVrbdHRuMGcEzwkZj+g4Jedc7hOh575uo88PEFqlxy1nqSHxqrlTperLMeN1B7g==
X-Received: by 10.55.133.1 with SMTP id h1mr14744842qkd.209.1523835872681;
	Sun, 15 Apr 2018 16:44:32 -0700 (PDT)
Received: from x1.local ([138.117.48.212])
	by smtp.gmail.com with ESMTPSA id d1sm1081394qtk.57.2018.04.15.16.44.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Apr 2018 16:44:32 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Date: Sun, 15 Apr 2018 20:42:50 -0300
Message-Id: <20180415234307.28132-25-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180415234307.28132-1-f4bug@amsat.org>
References: <20180415234307.28132-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-trivial] [PATCH v3 24/41] hw/microblaze: Use the BYTE-based
 definitions
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
X-List-Received-Date: Sun, 15 Apr 2018 23:44:35 -0000

It eases code review, unit is explicit.

Patch generated using:

  $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/hw/

and modified manually.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/microblaze/petalogix_ml605_mmu.c      | 7 ++++---
 hw/microblaze/petalogix_s3adsp1800_mmu.c | 7 ++++---
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/hw/microblaze/petalogix_ml605_mmu.c b/hw/microblaze/petalogix_ml605_mmu.c
index b664dc0f9c..5c4fe2345c 100644
--- a/hw/microblaze/petalogix_ml605_mmu.c
+++ b/hw/microblaze/petalogix_ml605_mmu.c
@@ -26,6 +26,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qapi/error.h"
 #include "qemu-common.h"
 #include "cpu.h"
@@ -45,8 +46,8 @@
 
 #include "hw/stream.h"
 
-#define LMB_BRAM_SIZE  (128 * 1024)
-#define FLASH_SIZE     (32 * 1024 * 1024)
+#define LMB_BRAM_SIZE  (128 * K_BYTE)
+#define FLASH_SIZE     (32 * M_BYTE)
 
 #define BINARY_DEVICE_TREE_FILE "petalogix-ml605.dtb"
 
@@ -110,7 +111,7 @@ petalogix_ml605_init(MachineState *machine)
     pflash_cfi01_register(FLASH_BASEADDR,
                           NULL, "petalogix_ml605.flash", FLASH_SIZE,
                           dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                          (64 * 1024), FLASH_SIZE >> 16,
+                          64 * K_BYTE, FLASH_SIZE >> 16,
                           2, 0x89, 0x18, 0x0000, 0x0, 0);
 
 
diff --git a/hw/microblaze/petalogix_s3adsp1800_mmu.c b/hw/microblaze/petalogix_s3adsp1800_mmu.c
index 5cb4deb69e..32e73a589f 100644
--- a/hw/microblaze/petalogix_s3adsp1800_mmu.c
+++ b/hw/microblaze/petalogix_s3adsp1800_mmu.c
@@ -24,6 +24,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qapi/error.h"
 #include "qemu-common.h"
 #include "cpu.h"
@@ -40,8 +41,8 @@
 
 #include "boot.h"
 
-#define LMB_BRAM_SIZE  (128 * 1024)
-#define FLASH_SIZE     (16 * 1024 * 1024)
+#define LMB_BRAM_SIZE  (128 * K_BYTE)
+#define FLASH_SIZE     (16 * M_BYTE)
 
 #define BINARY_DEVICE_TREE_FILE "petalogix-s3adsp1800.dtb"
 
@@ -88,7 +89,7 @@ petalogix_s3adsp1800_init(MachineState *machine)
     pflash_cfi01_register(FLASH_BASEADDR,
                           NULL, "petalogix_s3adsp1800.flash", FLASH_SIZE,
                           dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                          (64 * 1024), FLASH_SIZE >> 16,
+                          64 * K_BYTE, FLASH_SIZE >> 16,
                           1, 0x89, 0x18, 0x0000, 0x0, 1);
 
     dev = qdev_create(NULL, "xlnx.xps-intc");
-- 
2.17.0


