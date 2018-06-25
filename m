Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fXQqX-0001Uz-Iq
	for mharc-qemu-trivial@gnu.org; Mon, 25 Jun 2018 08:43:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54071)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQqV-0001SX-EU
	for qemu-trivial@nongnu.org; Mon, 25 Jun 2018 08:43:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQqS-0007kQ-Br
	for qemu-trivial@nongnu.org; Mon, 25 Jun 2018 08:43:51 -0400
Received: from mail-qt0-x229.google.com ([2607:f8b0:400d:c0d::229]:40045)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQqP-0007j1-Rz; Mon, 25 Jun 2018 08:43:45 -0400
Received: by mail-qt0-x229.google.com with SMTP id x23-v6so1558433qto.7;
	Mon, 25 Jun 2018 05:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Kisz6XCZvm5VQaoGpFfligXR8g2TGkGe0t/8nXzQvRk=;
	b=TJ4pRNpF/VqZ6Chr95qq9GbN9Zk0MbvbA2/Krw3xrvncgfRn8ew35e5zj9DkL/nHc8
	30DEFoAyofznw7NBYTpyhKoK+N5LuQIe4TPq0ZNWWMmJIR51NOQRe6GaZlRhmuvgugFr
	Y4DAdEFSsFgNMI2arw7vbQR3mmUpwxYARiTHY/HDhqyF8siA1k2OCv5C5PDj/y6GHNr8
	DmPR1ERnoPeHp6KOUFCaORHBb2/A7N8myTSxsnrk2OSTGKj7fv9cJ9NGBkkKbtBAKFOE
	XqwqCz/ks2MzN0EdipKySXpbknTPYs5bAsAm6ahxXh6utAcUFJTws/GzKyaXjOBVNt58
	/Scw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=Kisz6XCZvm5VQaoGpFfligXR8g2TGkGe0t/8nXzQvRk=;
	b=toIsvLkWWf1yI3oQ3Q9JfGdvGmodlLA+qoQX0tp8AGWrYFVqNTzSi+iawSOFbDzX5Y
	tEn/TdlAmy9wJwS7iIs67HTM2KN2wWJ/V23d7nuRXBh16YXzzHoIE6rxbfJJHqaHrLmK
	rdVWZG4OLvf9GjoXdsOb+DsqUjRD9oW3uQG8GNJqCW09VqTmo13rFT1hHHhW58pxK/1j
	rS0dpCfKSrelCMkUAp9ihNAVm5exBRsBi7Xr/zsSAaER6iOC5aZ8edMTqQ9jBVaVcfag
	8pczuYIAfr1coA1bxTDzN1HlDSn1P+cMfsKqjruf+HpGCIdSBY4lfknyhtBSigCTkawO
	RAbg==
X-Gm-Message-State: APt69E0s1wLakv/AvhfiSafgG/DApLWR83+JjD+dDFI4GEzXWkdxXdzy
	hIbOZx6iH7MklRwbw3p0H8s=
X-Google-Smtp-Source: ADUXVKIkIISM/YOPDogt7fthe3j34OcXJ9nTvvZdCxHRiFZJ1TTBIjIMS13M6EtsXqL5HPE1EWai+Q==
X-Received: by 2002:aed:3f36:: with SMTP id
	p51-v6mr10523944qtf.213.1529930625271; 
	Mon, 25 Jun 2018 05:43:45 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	m15-v6sm12549562qtm.84.2018.06.25.05.43.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Jun 2018 05:43:44 -0700 (PDT)
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
Date: Mon, 25 Jun 2018 09:42:05 -0300
Message-Id: <20180625124238.25339-14-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180625124238.25339-1-f4bug@amsat.org>
References: <20180625124238.25339-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::229
Subject: [Qemu-trivial] [PATCH v5 13/46] hw/block: Use the IEC binary prefix
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
X-List-Received-Date: Mon, 25 Jun 2018 12:43:52 -0000

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
index b0ed8fa418..e8dfa14b33 100644
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
index d5bf95b79b..65c84e7de3 100644
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
2.18.0


