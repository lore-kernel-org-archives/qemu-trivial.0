Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fSBSk-0006J9-Ti
	for mharc-qemu-trivial@gnu.org; Sun, 10 Jun 2018 21:17:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43620)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBSi-0006Ft-7b
	for qemu-trivial@nongnu.org; Sun, 10 Jun 2018 21:17:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBSh-0003jF-Ch
	for qemu-trivial@nongnu.org; Sun, 10 Jun 2018 21:17:36 -0400
Received: from mail-qt0-x22a.google.com ([2607:f8b0:400d:c0d::22a]:42494)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBSd-0003fU-Ex; Sun, 10 Jun 2018 21:17:31 -0400
Received: by mail-qt0-x22a.google.com with SMTP id y31-v6so18839433qty.9;
	Sun, 10 Jun 2018 18:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Hzb3KDk1C+C5bfYzlKadB7KauS83bBN5i2E8WC245YM=;
	b=QopADyG7UBl5K6eXmh/FwTRyCLI58U0rVjM3LqW6F7Yah0tqjfCElBx5H4Te0l0yjp
	93jush20MD4+57xQBd5W/Qnn8tpUpsSa0sGk7/VgjC4Qv5YPSbYdhzXu+PKKPwdmCpFi
	gqiWqNT88FG2nou6FXozUG+2rdZXLYxWeuKbZo8CB1q2ThriJQC8alhs/WM/R2yIBh38
	tTsS5tZ9wJeXNo9OqnkTtNo4cEyQChdTcZOh+dmBn3IVeYSEO9jEo6Qs31oeAIAXElwL
	pCg10gTd+J5Q2GTRKeVSbNg4Lpk6p+JIOkKYuo8qjjOwXH5uL2dxbCQ6THHDQWaCil4T
	XMZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=Hzb3KDk1C+C5bfYzlKadB7KauS83bBN5i2E8WC245YM=;
	b=md14cJ02FwoDW8R9CbqPEgLZOneZy8XB2vTwiwM1wLqGc09GPKejDzj1lodqmSdVBU
	tdFraW7PHyAoLoOrVpwGXEL88jT118pTsxogVIj8jSCja6TJzAF62Xg3QAKgfVrQISJe
	+ZV0nD4SaT2VUk/G2O/5K4ImcDke8IMGhryepb+imraNbe186Slgbh5Y7CNenvUSmR/Z
	4sevCfs+9ocMwwO+mT9roydlpMp/c6SE6AVZZJc61djGkxgjQHeDo3HQwi2UrOkgZvLv
	UESoArZP6sBs/tDNulaZF/RI/L2S77FMD2fEyecjdQqzyZpHOYHzyU91MOHlW2pWHmfI
	j9Bw==
X-Gm-Message-State: APt69E15b7JDNF9ULkLLhpFQZCoFSHsvlRtARtcxazEc4EV33nMWLxRy
	UYLGzIIUVoBN/nXJVG44BSM=
X-Google-Smtp-Source: ADUXVKLbyrPAoLsJ2Y9pwMzxJQS2PMahrJM6A+yFZtwIQcQ0tvHRcKa/IISi5SLJoMzhwzIiSljcSw==
X-Received: by 2002:ac8:2393:: with SMTP id
	q19-v6mr14227338qtq.197.1528679851043; 
	Sun, 10 Jun 2018 18:17:31 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	o5-v6sm28237223qtm.60.2018.06.10.18.17.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Jun 2018 18:17:30 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>,
	Stefan Weil <sw@weilnetz.de>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Sun, 10 Jun 2018 22:14:57 -0300
Message-Id: <20180611011501.10235-37-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180611011501.10235-1-f4bug@amsat.org>
References: <20180611011501.10235-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::22a
Subject: [Qemu-trivial] [PATCH v4 36/40] hw/sd: Use the IEC binary prefix
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
X-List-Received-Date: Mon, 11 Jun 2018 01:17:37 -0000

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
index a11e802485..39c2b3a6e8 100644
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
@@ -790,7 +790,7 @@ static void sdhci_do_adma(SDHCIState *s)
             return;
         }
 
-        length = dscr.length ? dscr.length : 65536;
+        length = dscr.length ? dscr.length : 64 * KiB;
 
         switch (dscr.attr & SDHC_ADMA_ATTR_ACT_MASK) {
         case SDHC_ADMA_ATTR_ACT_TRAN:  /* data transfer */
-- 
2.17.1


