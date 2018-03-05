Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1esoHs-0003fh-2K
	for mharc-qemu-trivial@gnu.org; Mon, 05 Mar 2018 06:28:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41534)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esoHm-0003ZP-4L
	for qemu-trivial@nongnu.org; Mon, 05 Mar 2018 06:28:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esoHl-000757-8z
	for qemu-trivial@nongnu.org; Mon, 05 Mar 2018 06:28:06 -0500
Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244]:50234)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esoHl-00074N-1t; Mon, 05 Mar 2018 06:28:05 -0500
Received: by mail-wm0-x244.google.com with SMTP id w128so15142239wmw.0;
	Mon, 05 Mar 2018 03:28:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=2NVhglAu0lpm7fA71cJmNDc3qiccCiPElzXNg66vU9Q=;
	b=gM/NAOuHqoVKaN7YxO4uj1+5ttLTW4UY55PTgInqlKEXme/M7QJYpANWTEfHfiSbf3
	1vACL+T4YkKNDcuPTZ10bpk3Tn55iW+cua2g8gSUaxcVuT1x4qoWuFEwsl+tLlPNND0N
	hiAyvRB4jNSnQZz36e3d2aXEK8GqXSRbiX8c6RzGYqgoMyM7asxzId93jaLMu/AGmHPN
	aaTaot23Rnh8k9qdv1bdFnqYYX3Rg2ce6Bm+xVEWXbQnAsPjtDvllgsrnkvt3cKVbYaU
	GXnla0DctGT878BrIh0x0Vm2LpI73I1au5mjH5QRIlPM3ag3aDvKq/nH7k64GkULbcEj
	mAhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=2NVhglAu0lpm7fA71cJmNDc3qiccCiPElzXNg66vU9Q=;
	b=XfxaoX73Muzvv+yAtMiJIJesdAoCNNM2B4Wq1KcHKWaRYscBRve/g7SiTOEt2Firto
	5d+/okXbVT9DYIbYYvuCukyabLEpcoIIrWbsBAUSIZ3MTj5rLElZFe8ucjxoqX0K9Dmi
	e2pugm+E7VtbdOLVawqB9+w0gA9PPmaIZqp+ztFNgzza6CB8it1dahFXIBetn6iGqMlo
	Ub4ZU/0guoCqVAWMt5l7ut3Vi3PAaIoFqsLT2ZBbH8xzEgMUcxNa/Ac/HKMaE19f0R7k
	v2Y87lKVznDC61X/BiAYc5a0w/zEpRGSwrSeP9IS4jvAuB3Nix8VeIbGxG8/ccxVwbTq
	56lA==
X-Gm-Message-State: AElRT7G7jjQDH1KmQlf6zGWFlgjjzy9WWo/DPyrhygQKGXf9hKNQ95jz
	RNy2Yaf32zOSjnje/hFAR+nMJV3d
X-Google-Smtp-Source: AG47ELtyOOUfcetSrPKS0dnbc7Nk92B+7u9GH32nrBntwiNc26MB1rTEPD51hlp0gSuhzQUvUjeEag==
X-Received: by 10.28.17.210 with SMTP id 201mr3008716wmr.58.1520249283889;
	Mon, 05 Mar 2018 03:28:03 -0800 (PST)
Received: from x1.local (ABayonne-654-1-79-224.w86-222.abo.wanadoo.fr.
	[86.222.222.224]) by smtp.gmail.com with ESMTPSA id
	k45sm11744388wrf.62.2018.03.05.03.28.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Mar 2018 03:28:03 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Date: Mon,  5 Mar 2018 08:27:20 -0300
Message-Id: <20180305112732.26471-19-f4bug@amsat.org>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180305112732.26471-1-f4bug@amsat.org>
References: <20180305112732.26471-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::244
Subject: [Qemu-trivial] [PATCH v2 18/30] hw/microblaze: use the BYTE-based
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
X-List-Received-Date: Mon, 05 Mar 2018 11:28:07 -0000

It eases code review, unit is explicit.

Patch generated using:

  $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/hw/

and modified manually.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/microblaze/petalogix_ml605_mmu.c      | 6 +++---
 hw/microblaze/petalogix_s3adsp1800_mmu.c | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/microblaze/petalogix_ml605_mmu.c b/hw/microblaze/petalogix_ml605_mmu.c
index b664dc0f9c..d2b316fcba 100644
--- a/hw/microblaze/petalogix_ml605_mmu.c
+++ b/hw/microblaze/petalogix_ml605_mmu.c
@@ -45,8 +45,8 @@
 
 #include "hw/stream.h"
 
-#define LMB_BRAM_SIZE  (128 * 1024)
-#define FLASH_SIZE     (32 * 1024 * 1024)
+#define LMB_BRAM_SIZE  (128 * K_BYTE)
+#define FLASH_SIZE     (32 * M_BYTE)
 
 #define BINARY_DEVICE_TREE_FILE "petalogix-ml605.dtb"
 
@@ -110,7 +110,7 @@ petalogix_ml605_init(MachineState *machine)
     pflash_cfi01_register(FLASH_BASEADDR,
                           NULL, "petalogix_ml605.flash", FLASH_SIZE,
                           dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                          (64 * 1024), FLASH_SIZE >> 16,
+                          64 * K_BYTE, FLASH_SIZE >> 16,
                           2, 0x89, 0x18, 0x0000, 0x0, 0);
 
 
diff --git a/hw/microblaze/petalogix_s3adsp1800_mmu.c b/hw/microblaze/petalogix_s3adsp1800_mmu.c
index 5cb4deb69e..d93f7184a5 100644
--- a/hw/microblaze/petalogix_s3adsp1800_mmu.c
+++ b/hw/microblaze/petalogix_s3adsp1800_mmu.c
@@ -40,8 +40,8 @@
 
 #include "boot.h"
 
-#define LMB_BRAM_SIZE  (128 * 1024)
-#define FLASH_SIZE     (16 * 1024 * 1024)
+#define LMB_BRAM_SIZE  (128 * K_BYTE)
+#define FLASH_SIZE     (16 * M_BYTE)
 
 #define BINARY_DEVICE_TREE_FILE "petalogix-s3adsp1800.dtb"
 
@@ -88,7 +88,7 @@ petalogix_s3adsp1800_init(MachineState *machine)
     pflash_cfi01_register(FLASH_BASEADDR,
                           NULL, "petalogix_s3adsp1800.flash", FLASH_SIZE,
                           dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                          (64 * 1024), FLASH_SIZE >> 16,
+                          64 * K_BYTE, FLASH_SIZE >> 16,
                           1, 0x89, 0x18, 0x0000, 0x0, 1);
 
     dev = qdev_create(NULL, "xlnx.xps-intc");
-- 
2.16.2


