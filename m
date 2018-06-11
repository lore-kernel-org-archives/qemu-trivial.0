Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fSBS8-0005lo-7A
	for mharc-qemu-trivial@gnu.org; Sun, 10 Jun 2018 21:17:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43267)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBS2-0005hg-RG
	for qemu-trivial@nongnu.org; Sun, 10 Jun 2018 21:16:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBS1-0003IN-S6
	for qemu-trivial@nongnu.org; Sun, 10 Jun 2018 21:16:54 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:43089)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBRy-0003Gu-Uw; Sun, 10 Jun 2018 21:16:51 -0400
Received: by mail-qk0-x244.google.com with SMTP id g126-v6so12065931qke.10;
	Sun, 10 Jun 2018 18:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=OchsBYueB6ChGz1p2yxytPa4B9x5Y+r/0RBXsHXpDFQ=;
	b=qJ6WLLOHEsMJg2l/0rAbsTAVhBwtgB51m3OesB5XH4+z7nmQ3LW9HBREr2dVYqi23B
	/Ju+1YTxge8t865UUAXdQpjP6dSu12ZJPILJU4rkaJOFTkn6cjjMkTVkAWGNAhp/a/n5
	CQFDGU9z1iynvzuAwmx5pe/YL3w9SdhEqchC+tRjShLuDEUZyl0Tknb+Mv7eRIx/hV83
	stuZzK5EKGC4E/LTAMFOXkhSHFuHiNINV8pmU/WksQjCAJBVv0sgAOB1fyqJrEzEEH3u
	wf/TNmTdQNwVDefm7u471FyOON0vKiBIkI+BSZuoxKNCVQq35FlaeZMKC9HQDjbxtn21
	F/gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=OchsBYueB6ChGz1p2yxytPa4B9x5Y+r/0RBXsHXpDFQ=;
	b=hzzGATgvT+xEph/g4VTtYXJOvUJDwpIf4fzwEqC8xLAmvBSwnm+7h0mi3VglAupth8
	uDMXvInJGMbq7Tav7NFrTZocxa3js4XMxKEhIrmDyviZL8DobMcNnCUmGV9DvJkMP62m
	pXPZSGsHqTk5msuL88051+UrN9I9LFc3cPRfG1HED6jzmEGCNhUEHO7wpHBxuTqPVVj6
	EmQMqVJynNy4clZhVwb/osGdQsYDWJh60776w142cVMSc/cF8VQDq6/LkDNICoGFNfYk
	3D7UhwtLfG+/HCt6OJSqGTqvPL72DpeADiKCiwREPJyynHdyCY9shh++xC1p/kNF/QUz
	zbnA==
X-Gm-Message-State: APt69E3o5bCsrTZhnQoVTRY+UZaf+AqZe1zIeCH+UeC7UkZ7RErsxlV9
	iBAarbD8IjcbXA3E1kFlZVo=
X-Google-Smtp-Source: ADUXVKIg/0wi2Oz31DsIhROWr4CrADhGb9YWFMi+zsrRW6A+iPxzQDWycrHphJZnssFhqVpLtWrz8w==
X-Received: by 2002:a37:66c5:: with SMTP id
	a188-v6mr13101118qkc.201.1528679810490; 
	Sun, 10 Jun 2018 18:16:50 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	o5-v6sm28237223qtm.60.2018.06.10.18.16.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Jun 2018 18:16:50 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>,
	Stefan Weil <sw@weilnetz.de>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Date: Sun, 10 Jun 2018 22:14:45 -0300
Message-Id: <20180611011501.10235-25-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180611011501.10235-1-f4bug@amsat.org>
References: <20180611011501.10235-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-trivial] [PATCH v4 24/40] hw/microblaze: Use the IEC binary
 prefix definitions
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
X-List-Received-Date: Mon, 11 Jun 2018 01:16:56 -0000

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
index 6c4a544eac..c730878d25 100644
--- a/hw/microblaze/petalogix_ml605_mmu.c
+++ b/hw/microblaze/petalogix_ml605_mmu.c
@@ -26,6 +26,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qapi/error.h"
 #include "qemu-common.h"
 #include "cpu.h"
@@ -44,8 +45,8 @@
 
 #include "hw/stream.h"
 
-#define LMB_BRAM_SIZE  (128 * 1024)
-#define FLASH_SIZE     (32 * 1024 * 1024)
+#define LMB_BRAM_SIZE  (128 * KiB)
+#define FLASH_SIZE     (32 * MiB)
 
 #define BINARY_DEVICE_TREE_FILE "petalogix-ml605.dtb"
 
@@ -109,7 +110,7 @@ petalogix_ml605_init(MachineState *machine)
     pflash_cfi01_register(FLASH_BASEADDR,
                           NULL, "petalogix_ml605.flash", FLASH_SIZE,
                           dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                          (64 * 1024), FLASH_SIZE >> 16,
+                          64 * KiB, FLASH_SIZE >> 16,
                           2, 0x89, 0x18, 0x0000, 0x0, 0);
 
 
diff --git a/hw/microblaze/petalogix_s3adsp1800_mmu.c b/hw/microblaze/petalogix_s3adsp1800_mmu.c
index 0da3e62102..5cf7b84c79 100644
--- a/hw/microblaze/petalogix_s3adsp1800_mmu.c
+++ b/hw/microblaze/petalogix_s3adsp1800_mmu.c
@@ -24,6 +24,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qapi/error.h"
 #include "qemu-common.h"
 #include "cpu.h"
@@ -39,8 +40,8 @@
 
 #include "boot.h"
 
-#define LMB_BRAM_SIZE  (128 * 1024)
-#define FLASH_SIZE     (16 * 1024 * 1024)
+#define LMB_BRAM_SIZE  (128 * KiB)
+#define FLASH_SIZE     (16 * MiB)
 
 #define BINARY_DEVICE_TREE_FILE "petalogix-s3adsp1800.dtb"
 
@@ -87,7 +88,7 @@ petalogix_s3adsp1800_init(MachineState *machine)
     pflash_cfi01_register(FLASH_BASEADDR,
                           NULL, "petalogix_s3adsp1800.flash", FLASH_SIZE,
                           dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                          (64 * 1024), FLASH_SIZE >> 16,
+                          64 * KiB, FLASH_SIZE >> 16,
                           1, 0x89, 0x18, 0x0000, 0x0, 1);
 
     dev = qdev_create(NULL, "xlnx.xps-intc");
-- 
2.17.1


