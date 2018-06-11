Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fSBRb-0005Ky-Gw
	for mharc-qemu-trivial@gnu.org; Sun, 10 Jun 2018 21:16:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42898)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBRW-0005JB-Vo
	for qemu-trivial@nongnu.org; Sun, 10 Jun 2018 21:16:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBRT-0002wE-GZ
	for qemu-trivial@nongnu.org; Sun, 10 Jun 2018 21:16:22 -0400
Received: from mail-qk0-x22d.google.com ([2607:f8b0:400d:c09::22d]:41671)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBRQ-0002uR-9y; Sun, 10 Jun 2018 21:16:16 -0400
Received: by mail-qk0-x22d.google.com with SMTP id w23-v6so12067734qkb.8;
	Sun, 10 Jun 2018 18:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=4EFKG3mDcOHQE1nyo4hxmJr/AEiksu62sw6BUErZzn8=;
	b=KmY2k9PpRhZH+dTZUCGKQLplRYSlkvaba4bwIuoHveHitz368U9AytvGb0ziVY7qou
	vm/N4QlHGyKONCvvLmWu2FYZstqALQ6dbk0lkOd4x1nsqph3d4+IkS6lvOn2BayM6E9P
	ySJV3dhtJyREtK97u2msgwswbqXX6giZtwHtnXSp0H13dFQvvG0RSdofyEKWd/x4ypDB
	r/PIhtPGK5a4tG0PW6iX19j6mh1w7cnJT9g3MJma92tP2elyITXfnARjAeD/CU8GdEef
	UMxCheY9WOPKWlEIP43JkTvZ+3XIOeEpLpj+kYFblnKXzZ+orUdMud0OABF7reFZ0lCt
	hDIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=4EFKG3mDcOHQE1nyo4hxmJr/AEiksu62sw6BUErZzn8=;
	b=fcLuUnsFSKZzIcM4n4qVtqeMYSBLmgxcSk3yNpNjZu/2yqsUwic5awRs9yi6V2v2Jg
	gKYGpcf22+9+ev60sw+gGC9S6IdXkYDWxeS0dX0T1cR54KrKgRT9lKnKhz9CZWKzR7ur
	UsTFhsK6cPcGtFImFWvv5z9xv2er4rVBM+qEAj6Yvr8uQCPSQc0J822Z7yFZjPb1kSN6
	W2H7ZVRwBijj1nu8sOuX01LQLGzTEQlvT+MDS9I8R9bAS5xoeeLMH+VVnKxq2di+Fa8K
	msY3JcQOPZMbrkGIf4F+Sn0Ztuvq1L6nX9Mk9smAQM/6YdtLe5mVaL5EIzqsEY/BLKEN
	TxYg==
X-Gm-Message-State: APt69E0xPlo7mvQaIe4qM2qpq0Qpguyc46NWIZu3RtL1OVIZPqT7gGMw
	NNR03Pd9tjnjqMtI23Gzvuo=
X-Google-Smtp-Source: ADUXVKILlWhCGxi2UT8jrRrWYuiJiaNPGVOZ8swd+uJHj+5V7znS8ZvRAMwdMU3NRaBdWHrCEbTF4g==
X-Received: by 2002:ae9:ef0a:: with SMTP id
	d10-v6mr12352221qkg.253.1528679775807; 
	Sun, 10 Jun 2018 18:16:15 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	o5-v6sm28237223qtm.60.2018.06.10.18.16.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Jun 2018 18:16:15 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>,
	Stefan Weil <sw@weilnetz.de>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Alistair Francis <alistair@alistair23.me>, Kevin Wolf <kwolf@redhat.com>,
	Max Reitz <mreitz@redhat.com>, Keith Busch <keith.busch@intel.com>,
	qemu-block@nongnu.org (open list:Block layer core)
Date: Sun, 10 Jun 2018 22:14:34 -0300
Message-Id: <20180611011501.10235-14-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180611011501.10235-1-f4bug@amsat.org>
References: <20180611011501.10235-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::22d
Subject: [Qemu-trivial] [PATCH v4 13/40] hw/block: Use the IEC binary prefix
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
X-List-Received-Date: Mon, 11 Jun 2018 01:16:24 -0000

It eases code review, unit is explicit.

Patch generated using:

  $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/hw/

and modified manually.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/block/m25p80.c  | 5 +++--
 hw/block/nvme.c    | 3 ++-
 hw/block/tc58128.c | 3 ++-
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index a5ccffb4aa..38c69c81a9 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -22,6 +22,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "hw/hw.h"
 #include "sysemu/block-backend.h"
 #include "hw/ssi/ssi.h"
@@ -541,12 +542,12 @@ static void flash_erase(Flash *s, int offset, FlashCMD cmd)
     switch (cmd) {
     case ERASE_4K:
     case ERASE4_4K:
-        len = 4 << 10;
+        len = 4 * KiB;
         capa_to_assert = ER_4K;
         break;
     case ERASE_32K:
     case ERASE4_32K:
-        len = 32 << 10;
+        len = 32 * KiB;
         capa_to_assert = ER_32K;
         break;
     case ERASE_SECTOR:
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 811084b6a7..ae2188c761 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -25,6 +25,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "hw/block/block.h"
 #include "hw/hw.h"
 #include "hw/pci/msix.h"
@@ -648,7 +649,7 @@ static uint16_t nvme_identify_ns(NvmeCtrl *n, NvmeIdentify *c)
 
 static uint16_t nvme_identify_nslist(NvmeCtrl *n, NvmeIdentify *c)
 {
-    static const int data_len = 4096;
+    static const int data_len = 4 * KiB;
     uint32_t min_nsid = le32_to_cpu(c->nsid);
     uint64_t prp1 = le64_to_cpu(c->prp1);
     uint64_t prp2 = le64_to_cpu(c->prp2);
diff --git a/hw/block/tc58128.c b/hw/block/tc58128.c
index 1d9f7ee000..808ad76ba6 100644
--- a/hw/block/tc58128.c
+++ b/hw/block/tc58128.c
@@ -1,4 +1,5 @@
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "hw/hw.h"
 #include "hw/sh4/sh.h"
 #include "hw/loader.h"
@@ -26,7 +27,7 @@ typedef struct {
 
 static tc58128_dev tc58128_devs[2];
 
-#define FLASH_SIZE (16*1024*1024)
+#define FLASH_SIZE (16 * MiB)
 
 static void init_dev(tc58128_dev * dev, const char *filename)
 {
-- 
2.17.1


