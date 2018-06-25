Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fXQrf-0002aC-Uk
	for mharc-qemu-trivial@gnu.org; Mon, 25 Jun 2018 08:45:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55019)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQrZ-0002Tj-KO
	for qemu-trivial@nongnu.org; Mon, 25 Jun 2018 08:44:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQrY-0008G4-QB
	for qemu-trivial@nongnu.org; Mon, 25 Jun 2018 08:44:57 -0400
Received: from mail-qk0-x22a.google.com ([2607:f8b0:400d:c09::22a]:36331)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQrW-0008EQ-Ay; Mon, 25 Jun 2018 08:44:54 -0400
Received: by mail-qk0-x22a.google.com with SMTP id a132-v6so424480qkg.3;
	Mon, 25 Jun 2018 05:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=qQqHj8f6hL24hFZB8G7iCb6VX3fY6vRHctkm2u7O/m4=;
	b=CXN0PQCkBCpMRcFtmJROYPXKZX3RpopiPZJaos3sXKPP04012tdfA1CaqUD91DSYVx
	5UTMSalkDM82m/UFEeZRQVWD00ooscnJIObekgkqWE1e/nrlmqa97B3oHv8PmGP540iz
	1B2tUdObGk5wqRkuSQZnbnBK7SrtQALYtaP+DHwVi2S1fm6RPp31tlMl5t2mT6/PbuRH
	iFAAsEvnz0pmcpaHM7zAM/n7uEzs570n8tPOeocukiUbtQwW/xfKxGjQQiHmHKsWXewq
	935b6clUX9THeYRjZZvIJltQsB1vZCOxbacMlWXsxoutIEaw1omXjK1HYr/mE91ivqjf
	WPxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=qQqHj8f6hL24hFZB8G7iCb6VX3fY6vRHctkm2u7O/m4=;
	b=DTPWE+ARfdDzkzcqSGFbxQKZD+YiQUjHbT7pb93ye1nzwUdOTq5z+M3GUcvlrU4SYB
	N5V/ncfMZf0MLM4XcU/kzdOHgvyJtXIR4ig+GH+XGi+R6x4TtsUUpxRKfRwl9vScXUHQ
	4Kmg81tk7IgDDUOnxrBC3gHKaqvlmSywfdcojx6/VIRX02hTtOVct9pyBGzfGRoXSGZD
	fYQ9ne8ftFOdoC7Ip4MeVB5dr2vDSE9MqLOITvztfxscCU6xDZBalT5epkF/cELNIIg2
	GyN94BrUQlU0rDCnjYaur7t6O4WWbxT2pwd2T/lR2cgAeD4FpVeRRwrVAbJVMGsbmgRh
	qpiA==
X-Gm-Message-State: APt69E3GN560LYbS/SkkHDP2poUxkiQCXROb7ARMzdgQVVCGAdu9lCjo
	qsLtdCosn2v7RyEnBNe6EQs=
X-Google-Smtp-Source: AAOMgpfU6C4141qnMQmYhP9HTfuyg8p70I8yblleOCc2nP1sxcMYO4PTWz4JBoZOrqkJfocPNTFCTg==
X-Received: by 2002:a37:5a47:: with SMTP id
	o68-v6mr10755619qkb.226.1529930693761; 
	Mon, 25 Jun 2018 05:44:53 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	m15-v6sm12549562qtm.84.2018.06.25.05.44.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Jun 2018 05:44:53 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>,
	Stefan Weil <sw@weilnetz.de>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Mon, 25 Jun 2018 09:42:28 -0300
Message-Id: <20180625124238.25339-37-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180625124238.25339-1-f4bug@amsat.org>
References: <20180625124238.25339-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::22a
Subject: [Qemu-trivial] [PATCH v5 36/46] hw/sd: Use the IEC binary prefix
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
X-List-Received-Date: Mon, 25 Jun 2018 12:44:58 -0000

It eases code review, unit is explicit.

Patch generated using:

  $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/hw/

and modified manually.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/sd.c    | 4 ++--
 hw/sd/sdhci.c | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 9a16b768ed..d4356e9b73 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -31,6 +31,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "hw/qdev.h"
 #include "hw/hw.h"
 #include "hw/registerfields.h"
@@ -38,7 +39,6 @@
 #include "hw/sd/sd.h"
 #include "qapi/error.h"
 #include "qemu/bitmap.h"
-#include "qemu/cutils.h"
 #include "hw/qdev-properties.h"
 #include "qemu/error-report.h"
 #include "qemu/timer.h"
@@ -403,7 +403,7 @@ static void sd_set_csd(SDState *sd, uint64_t size)
             ((HWBLOCK_SHIFT << 6) & 0xc0);
         sd->csd[14] = 0x00;	/* File format group */
     } else {			/* SDHC */
-        size /= 512 * 1024;
+        size /= 512 * KiB;
         size -= 1;
         sd->csd[0] = 0x40;
         sd->csd[1] = 0x0e;
diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index a11e802485..643b39d306 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -23,6 +23,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "hw/hw.h"
@@ -32,7 +33,6 @@
 #include "hw/sd/sdhci.h"
 #include "sdhci-internal.h"
 #include "qemu/log.h"
-#include "qemu/cutils.h"
 #include "trace.h"
 
 #define TYPE_SDHCI_BUS "sdhci-bus"
@@ -742,7 +742,7 @@ static void get_adma_description(SDHCIState *s, ADMADescr *dscr)
         if ((dscr->attr & SDHC_ADMA_ATTR_ACT_MASK) == SDHC_ADMA_ATTR_SET_LEN) {
             dscr->length = (uint16_t)extract32(adma1, 12, 16);
         } else {
-            dscr->length = 4096;
+            dscr->length = 4 * KiB;
         }
         break;
     case SDHC_CTRL_ADMA2_64:
@@ -790,7 +790,7 @@ static void sdhci_do_adma(SDHCIState *s)
             return;
         }
 
-        length = dscr.length ? dscr.length : 65536;
+        length = dscr.length ? dscr.length : 64 * KiB;
 
         switch (dscr.attr & SDHC_ADMA_ATTR_ACT_MASK) {
         case SDHC_ADMA_ATTR_ACT_TRAN:  /* data transfer */
-- 
2.18.0


