Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fXQr1-0001ye-NB
	for mharc-qemu-trivial@gnu.org; Mon, 25 Jun 2018 08:44:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54569)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQqz-0001vt-A4
	for qemu-trivial@nongnu.org; Mon, 25 Jun 2018 08:44:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQqy-00081k-CN
	for qemu-trivial@nongnu.org; Mon, 25 Jun 2018 08:44:21 -0400
Received: from mail-qk0-x22f.google.com ([2607:f8b0:400d:c09::22f]:36333)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQqv-00080P-IM; Mon, 25 Jun 2018 08:44:17 -0400
Received: by mail-qk0-x22f.google.com with SMTP id a132-v6so423283qkg.3;
	Mon, 25 Jun 2018 05:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=wplSpMQsybUjD/teSFBT4ppWSdPGswCxgwbKvL+lxAs=;
	b=RLW8TNsBODFQpWTlNTWe5H6jUMikFf6/Mo5JDJwzxEMpf7NWyn75CCUm3gjN5Xz7i6
	ezBwn1iRG6D1tYO7I86uJwh4CKa3KxOuwSkXWWwwZAz/6iWwdjHoFvH7OF1+CrbyUnBI
	MvqZ3ltevSqICOZCFNM+VyunqHBS4XkuPHKY/2Xj7OaL8ZD0lieQ7Br8eiy25eW9+Tw9
	bCEduK95urXaLsW4hk+BFtw0oOuGa84Mj5ggZiFa9/9wuV4UlhNPmXHj113s8cBCnzoa
	qjDrDAweSWrGPHsW3/7uJi9mq8ypvl2wMhGFYDjIICK6896A8JcsAdl6dJkRKrtsSyvt
	FF0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=wplSpMQsybUjD/teSFBT4ppWSdPGswCxgwbKvL+lxAs=;
	b=ZLGo4S72UWm032kLQ8yYfcl7A+5/3EvjSloLHlJlBJnk392r+SXhy+fR+Oav60TtFU
	0i2/aaYKu9b40vMOvj6yPsF/NRBKRaMbjzf11wRx4eIwVw9TODrqLSBp5ICir1JRsGza
	x2eHj0rSUQ1RL4JsYfZ6ASEWlkNNz3i80bqQek3VsxsiNwyMX4x09ccPhb4l0ksI34Gp
	98so7ky5XeCFFVUb5ObTWUmeiA7V7fxO5TMdDyWN7TQEjjsfsa9KBwkNsfHvAoGkXo9+
	1SHOgKzRFnB4r5Cd8tv+nnt9znXo1d6SscnP0p4ihRnn5YBRaJOvv5M6CN3SaeHFJca3
	WHRw==
X-Gm-Message-State: APt69E3mlnKUygq5MSjIrSmPTl03c+1Xqp/Xdlp90KxqETC8tGZWFs3g
	EZTQLsTOEb8h3YVd7u1lMYo=
X-Google-Smtp-Source: AAOMgpcsdhvi9eW2WzxOA5dfXFtON0IRDLrDQ/n5/MHOjDz9Hp80UHeNniG8JeHhB25gWcLGC9eHVA==
X-Received: by 2002:a37:234c:: with SMTP id
	j73-v6mr4197623qkj.146.1529930656976; 
	Mon, 25 Jun 2018 05:44:16 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	m15-v6sm12549562qtm.84.2018.06.25.05.44.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Jun 2018 05:44:16 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>,
	Stefan Weil <sw@weilnetz.de>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Date: Mon, 25 Jun 2018 09:42:16 -0300
Message-Id: <20180625124238.25339-25-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180625124238.25339-1-f4bug@amsat.org>
References: <20180625124238.25339-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::22f
Subject: [Qemu-trivial] [PATCH v5 24/46] hw/microblaze: Use the IEC binary
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
X-List-Received-Date: Mon, 25 Jun 2018 12:44:22 -0000

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
2.18.0


