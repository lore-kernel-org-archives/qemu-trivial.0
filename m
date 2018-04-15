Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1f7rJR-0004pe-K7
	for mharc-qemu-trivial@gnu.org; Sun, 15 Apr 2018 19:44:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50895)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rJP-0004nS-3h
	for qemu-trivial@nongnu.org; Sun, 15 Apr 2018 19:44:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rJO-0000Y0-9g
	for qemu-trivial@nongnu.org; Sun, 15 Apr 2018 19:43:59 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:46896)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rJO-0000Xq-4h; Sun, 15 Apr 2018 19:43:58 -0400
Received: by mail-qk0-x242.google.com with SMTP id l16so13887932qke.13;
	Sun, 15 Apr 2018 16:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=jRvlgf+SGJi5ZSRNSBMn7y07pZ2VmHXkwI1D3ItLfIk=;
	b=a9nhSVGZy1dSyreBY7Z1KlM7Cl2C23I9VZ7agi40iDUr754I4uGemLV6yqMyrq6cNm
	+m7w+0jTDfjD7g55R1zOtTOlrn3EL0wSPv2Wma7a5YDuVQJkRvUD49hb2C6LPDI2Pobg
	NoZUv1rzMWtjIlXhbSlLqEyYebqs07BOTuT0wPX5zXnHs4rIrRM8G5e/MBUP5Hm8BzjA
	vTy5mCEwgPX1x8VPHIAVywhfNL/cHEKNGMLwTAr784rMrBNZsTFXQXKgpzUGI2+Q0GMQ
	txpJn6LPmfJiXrR4RbIWq68Kr4lUazQQESUUKeF44HEk9lUJyjtvfOpgdzkY4uSu1xPo
	tagQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=jRvlgf+SGJi5ZSRNSBMn7y07pZ2VmHXkwI1D3ItLfIk=;
	b=U5OjEaS88gnEklzsmUaFDhYN4gznLWJaAOIinHGXyLZHYQpb+QyoWIV22Pe7xDlVAS
	Vh2v5YNgm2xWD2nLt2YpVcJnrw2OOfHzOfH5u7KMJKNqMDoVjO4OslLEz3m74m3qD2B9
	PaW7yybC9qBuuJsctLdUx4gBbwcS6Dz2m7hp1E5xIX063MukfSB7s/vNwwM4zrFc9LwS
	LCyruNFrqUr8xtuUnPRoV6TZs4nWHGfnRqZ/tj2NAyEkquPZSIyradT/EDKvDbF2dS/w
	9p1Dg1ZGZ6ztAkrgB8CHMZgQBNJvYoMnUPvYzWwVa3UjMmEpIKimj5LUIT8J2l5IVJfJ
	4rrg==
X-Gm-Message-State: ALQs6tBpOLO0A4Q63136VIxDGUJOuKHG9mpv317SCOUchIsLRQmCwMxP
	SnKnwieXSgXXAtmsOsHUgL62OPHz
X-Google-Smtp-Source: AIpwx49MUPAzNQctCLSJpOlcBnOFQjZ5t4+AdvL9wlIJPXcUYsxOL0gng078DGOZF2wR0VdQjVwlKQ==
X-Received: by 10.55.16.91 with SMTP id a88mr10492556qkh.199.1523835837459;
	Sun, 15 Apr 2018 16:43:57 -0700 (PDT)
Received: from x1.local ([138.117.48.212])
	by smtp.gmail.com with ESMTPSA id d1sm1081394qtk.57.2018.04.15.16.43.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Apr 2018 16:43:57 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Keith Busch <keith.busch@intel.com>,
	Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
	qemu-block@nongnu.org (open list:nvme)
Date: Sun, 15 Apr 2018 20:42:39 -0300
Message-Id: <20180415234307.28132-14-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180415234307.28132-1-f4bug@amsat.org>
References: <20180415234307.28132-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: [Qemu-trivial] [PATCH v3 13/41] hw/block: Use the BYTE-based
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
X-List-Received-Date: Sun, 15 Apr 2018 23:44:00 -0000

It eases code review, unit is explicit.

Patch generated using:

  $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/hw/

and modified manually.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/block/nvme.c    | 3 ++-
 hw/block/tc58128.c | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 811084b6a7..273d36de76 100644
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
+    static const int data_len = 4 * K_BYTE;
     uint32_t min_nsid = le32_to_cpu(c->nsid);
     uint64_t prp1 = le64_to_cpu(c->prp1);
     uint64_t prp2 = le64_to_cpu(c->prp2);
diff --git a/hw/block/tc58128.c b/hw/block/tc58128.c
index 1d9f7ee000..42e1269546 100644
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
+#define FLASH_SIZE (16 * M_BYTE)
 
 static void init_dev(tc58128_dev * dev, const char *filename)
 {
-- 
2.17.0


