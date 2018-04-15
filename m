Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1f7rK3-0005VX-9j
	for mharc-qemu-trivial@gnu.org; Sun, 15 Apr 2018 19:44:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51697)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rK1-0005TA-21
	for qemu-trivial@nongnu.org; Sun, 15 Apr 2018 19:44:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rK0-00011S-8K
	for qemu-trivial@nongnu.org; Sun, 15 Apr 2018 19:44:37 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:43678)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rK0-000112-3L; Sun, 15 Apr 2018 19:44:36 -0400
Received: by mail-qt0-x243.google.com with SMTP id l11so4359903qtj.10;
	Sun, 15 Apr 2018 16:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=HZcHu4PXesvduKS3OHHQV1gZt9YkEa+Iy+GiZqjCoGk=;
	b=KRSI/T4PBJNXKfKPPv26jY+huwbqX73T4P9yqEPyRVsKV5zFHIlrCFY0CDHgh+8uog
	S3B15KVZVxNdBbZ7r8RxL80cOb3NtJUDGEiZSiwcFqhIP5Dan3T5wpdiYMAUkyLa/DXr
	Xz9YhSjIRLQjnbebtRsEW/d8NiiMiQYIrKf25+wCreXjcs6ruZYvKRtg020GVD5tfL9E
	LcRFio8aa6j8aX+desepoIlJAcA8FX6cV5g91ypj75u7HgyK7qe6etQ1I2RRKkOcFh4Z
	BuHj77Y91i7qYAfVIUsSj3nELerOOCRbVOlpzyEmgcMtswENHZjIwWE7tvclFacmbpRc
	aoiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=HZcHu4PXesvduKS3OHHQV1gZt9YkEa+Iy+GiZqjCoGk=;
	b=Gwb/9fJJc1roJDh2ZkW1UVkWYFuEID2TYfAJKoV6aLgk4WTMcjWk0U7o1O1CedkEdO
	iGOrxBEkqj/ibKHqGDc11Ns8oZW9i7YpE+fPJtFDYkwv7fsIxwJXS6v1TBuQoz9DYvuV
	Shzc4zv+9gK5SHHyzIDKH3i4Y0OLJTXd2savXBCnJ5sbGC5a5RLki5TPW4qBKCFbTW0a
	0r0+AfLgmWJtM6TCzk5v5WLOhAht72BbnysP/kwfwpCtPLYCizhIVBR4BEfrH9UWtC+Z
	g9BafqbLg5SJoS1pL19EFIILqsjWaX5tNeBv5LjghGzKiHQUlp4yd40eHjP2og3v5IoO
	3FiA==
X-Gm-Message-State: ALQs6tBuKnb9tj1gn4JwEg9JBgGMlOqlHB24FluiW2NUXPzdb+paZIVU
	jxxaOPpZHVygKMPZhZJkJx7Y9kMo
X-Google-Smtp-Source: AIpwx4+GlaX2g1bhVGk+3Wwy7kkDwDt6985ZxSY1Rre1+ihyJo6UwMkP2lri4/w49p83XSRjy76Aew==
X-Received: by 10.200.70.21 with SMTP id p21mr13596011qtn.320.1523835875485;
	Sun, 15 Apr 2018 16:44:35 -0700 (PDT)
Received: from x1.local ([138.117.48.212])
	by smtp.gmail.com with ESMTPSA id d1sm1081394qtk.57.2018.04.15.16.44.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Apr 2018 16:44:35 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Chris Wulff <crwulff@gmail.com>,
	Marek Vasut <marex@denx.de>
Date: Sun, 15 Apr 2018 20:42:51 -0300
Message-Id: <20180415234307.28132-26-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180415234307.28132-1-f4bug@amsat.org>
References: <20180415234307.28132-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-trivial] [PATCH v3 25/41] hw/nios2: Use the BYTE-based
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
X-List-Received-Date: Sun, 15 Apr 2018 23:44:38 -0000

It eases code review, unit is explicit.

Patch generated using:

  $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/hw/

and modified manually.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/nios2/boot.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/nios2/boot.c b/hw/nios2/boot.c
index 94f436e7fb..1cc924805b 100644
--- a/hw/nios2/boot.c
+++ b/hw/nios2/boot.c
@@ -29,6 +29,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qemu-common.h"
 #include "cpu.h"
 #include "qemu/option.h"
@@ -38,7 +39,6 @@
 #include "sysemu/sysemu.h"
 #include "hw/loader.h"
 #include "elf.h"
-#include "qemu/cutils.h"
 
 #include "boot.h"
 
@@ -177,7 +177,7 @@ void nios2_load_kernel(Nios2CPU *cpu, hwaddr ddr_base,
             high = ddr_base + kernel_size;
         }
 
-        high = ROUND_UP(high, 1024 * 1024);
+        high = ROUND_UP(high, 1 * M_BYTE);
 
         /* If initrd is available, it goes after the kernel, aligned to 1M. */
         if (initrd_filename) {
@@ -213,7 +213,7 @@ void nios2_load_kernel(Nios2CPU *cpu, hwaddr ddr_base,
         high += fdt_size;
 
         /* Kernel command is at the end, 4k aligned. */
-        boot_info.cmdline = ROUND_UP(high, 4096);
+        boot_info.cmdline = ROUND_UP(high, 4 * K_BYTE);
         if (kernel_cmdline && strlen(kernel_cmdline)) {
             pstrcpy_targphys("cmdline", boot_info.cmdline, 256, kernel_cmdline);
         }
-- 
2.17.0


