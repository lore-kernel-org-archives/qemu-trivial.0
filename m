Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1f7rKh-0006G4-QH
	for mharc-qemu-trivial@gnu.org; Sun, 15 Apr 2018 19:45:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52412)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rKf-0006Cj-LS
	for qemu-trivial@nongnu.org; Sun, 15 Apr 2018 19:45:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rKe-0001Zf-UR
	for qemu-trivial@nongnu.org; Sun, 15 Apr 2018 19:45:17 -0400
Received: from mail-qk0-x231.google.com ([2607:f8b0:400d:c09::231]:40663)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rKe-0001Z3-Pf; Sun, 15 Apr 2018 19:45:16 -0400
Received: by mail-qk0-x231.google.com with SMTP id o64so14774279qkl.7;
	Sun, 15 Apr 2018 16:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=gMUXoooVsLVwSFlKFr/WLnMVu2eX5iKbuMtLDAxxZXo=;
	b=sZZEl8xB7BF5sX5x+PyTvXpqSFYMN+SI+fP3hX7zyV5Op9mselZ7hidSBMVwQGcKjb
	Q80VLaKwqK3q2wqLYvpWi9TOuI0Z95CzMdLlXyH0Ld2ah8mxa+7YkTPMM/Zja7knwEz1
	fQLcc0kCPPX1Q/j7jkcP1Sb3PFL6R6q28SX5/efWH1PGUyUmdCgSvHOxsVf0/KKZZLl1
	QD7+UwjHY0CkWEafzPQTn9o6UixZnNaOEmcuJ13ivjKmAAZLaLZ8zFJPiG/FphcFJvRO
	e7AibDWe7v9I72k1j0oW2e9KiUUiNNrZKN4AKCifMOFD2D/9Nuo+buIztIA6qtqwbHbI
	mIow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=gMUXoooVsLVwSFlKFr/WLnMVu2eX5iKbuMtLDAxxZXo=;
	b=pDR2RelFPKUxIe0hs3AohyRw4BeU5yuHko37rVZOSfgXsYDlhv4APC82wMtyOzj5yF
	xx0Aw3IXtVENmX1NLBPJ5cwEgrMW2/gAlrJbRkFY3iGvoX/0F2c7id8aFqWvwSo2Q5PP
	cNnhHkv53HHA7m8GGzbo5yO/aHpWMEtC6Ur1F7lhJpO2TYu4e18CFTPRm8jLuFUUyIv0
	k7AUmKVIp0fiLySYRO2ysbRUoEffT0bP9rTkoleGsSyV2W33+f21CiWBGEWuIllnsOZx
	QTv/iT2rR0aV1VCPlYRh3sDU/NGCIL8+waNo+U9A7tHk20z15NglO/UU87FLdG7zTd4v
	6QVw==
X-Gm-Message-State: ALQs6tBSeOir30sApHNtpkcsdvxcD/2o/7S8hKtXNOzlnjjI3K/U208F
	VZHYvkbNdekT7Wg8aOyF7D0XAHQFJxU=
X-Google-Smtp-Source: AIpwx4/1A+M4KaB14O4veKYz4TZK7qsschIqEIVkxOq5fBOpa0c6MeYdJpjKdbpHoazJIqE6ON43KA==
X-Received: by 10.55.75.146 with SMTP id y140mr14412355qka.222.1523835916072; 
	Sun, 15 Apr 2018 16:45:16 -0700 (PDT)
Received: from x1.local ([138.117.48.212])
	by smtp.gmail.com with ESMTPSA id d1sm1081394qtk.57.2018.04.15.16.45.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Apr 2018 16:45:15 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Date: Sun, 15 Apr 2018 20:43:01 -0300
Message-Id: <20180415234307.28132-36-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180415234307.28132-1-f4bug@amsat.org>
References: <20180415234307.28132-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::231
Subject: [Qemu-trivial] [PATCH v3 35/41] hw/sd: Use the BYTE-based
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
X-List-Received-Date: Sun, 15 Apr 2018 23:45:18 -0000

It eases code review, unit is explicit.

Patch generated using:

  $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/hw/

and modified manually.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/sd.c    | 4 ++--
 hw/sd/sdhci.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 235e0518d6..3b2f925ae6 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -30,6 +30,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "hw/qdev.h"
 #include "hw/hw.h"
 #include "hw/registerfields.h"
@@ -37,7 +38,6 @@
 #include "hw/sd/sd.h"
 #include "qapi/error.h"
 #include "qemu/bitmap.h"
-#include "qemu/cutils.h"
 #include "hw/qdev-properties.h"
 #include "qemu/error-report.h"
 #include "qemu/timer.h"
@@ -394,7 +394,7 @@ static void sd_set_csd(SDState *sd, uint64_t size)
             ((HWBLOCK_SHIFT << 6) & 0xc0);
         sd->csd[14] = 0x00;	/* File format group */
     } else {			/* SDHC */
-        size /= 512 * 1024;
+        size /= 512 * K_BYTE;
         size -= 1;
         sd->csd[0] = 0x40;
         sd->csd[1] = 0x0e;
diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 63c44a4ee8..55e2054148 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -23,6 +23,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "hw/hw.h"
@@ -34,7 +35,6 @@
 #include "hw/sd/sdhci.h"
 #include "sdhci-internal.h"
 #include "qemu/log.h"
-#include "qemu/cutils.h"
 #include "trace.h"
 
 #define TYPE_SDHCI_BUS "sdhci-bus"
@@ -792,7 +792,7 @@ static void sdhci_do_adma(SDHCIState *s)
             return;
         }
 
-        length = dscr.length ? dscr.length : 65536;
+        length = dscr.length ? dscr.length : 64 * K_BYTE;
 
         switch (dscr.attr & SDHC_ADMA_ATTR_ACT_MASK) {
         case SDHC_ADMA_ATTR_ACT_TRAN:  /* data transfer */
-- 
2.17.0


