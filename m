Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1f7rKv-0006UZ-UB
	for mharc-qemu-trivial@gnu.org; Sun, 15 Apr 2018 19:45:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52637)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rKt-0006SE-DV
	for qemu-trivial@nongnu.org; Sun, 15 Apr 2018 19:45:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rKs-0001oR-GG
	for qemu-trivial@nongnu.org; Sun, 15 Apr 2018 19:45:31 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:38599)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rKs-0001oD-8I; Sun, 15 Apr 2018 19:45:30 -0400
Received: by mail-qt0-x243.google.com with SMTP id z23so13564515qti.5;
	Sun, 15 Apr 2018 16:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=P/eYd0gYK9XBPzUYbdxuExY/CGzG8++sxns3+Lwdmhc=;
	b=Ao3WQTAnkyuJ7rf6pEuQPEBj6mqyvHTkk9EYPDsnMC36JzwUGG7xagcRC3yFP1bYn1
	mc+XzDal39i7hqBbRM7MG70IJV8V2E1yIUN1KKUOt7iay6kkvFfTENuI1WGXo/rY/c5T
	JM2H0gLtytfuNq/Mwy1aotNi35ZivEWIqhXBmhoHgr44lfRwzv+iFzH56+G/PiT8rfWv
	gSBocv4ma6mIG/w9GnWHpWqEMTyubG8tE9A+WJcyCi9VW/8USOppwXuoUUd1Q6bo0ENt
	Yig4/WESc5fTUOPSnXv7DIotUTXGdprmChKzwVoQIF9pru3vAr9N/daYIXi6Z1XKkTcV
	nP6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=P/eYd0gYK9XBPzUYbdxuExY/CGzG8++sxns3+Lwdmhc=;
	b=Cqhm3zqwVWwKkBLaxnFXge/fAgins+/vgO3Jb1elhiHohiaxzwRZdIlIL7aewfxRAO
	MICpnMrOzk1dIc6FEa0fcy7CZfPTdpb1TZQ6E8f4AY9MpNHsD6QRUwcUysTtG5wKUKKw
	jaK+7CIoadoWM6C+f9XRAVzabfKUGFS30e6kfbpgATL6p5i4KvZZZ8sFUD6SrK4kdeu+
	xE+spYhUP/O7gFx71JqcgT6SNL4XbRX6grjWoDekJbttu6aw79IgYrY2qSVqLV9npGG6
	dCXEKcDHmYDWXHGxKRLfu+4gehmGj41NMIA5HA4ez0zzRo86OuWiSniXBP4Kq/cWS3sY
	x8Lg==
X-Gm-Message-State: ALQs6tB7z8NK9DVcCj5FHszetuLNVgOrU+Sy0oDUf5J8zF+Oye+za3WD
	It7M7ytHYkN+aX3yq05GevZp7KItppo=
X-Google-Smtp-Source: AIpwx48/bgVZK9NvwJBQX8xzHhK5PxP+qmSiVs+EwFJOlCi/ID/2tA0/WkAIkXGuZLO0/lpJtT91Wg==
X-Received: by 10.200.3.207 with SMTP id z15mr4010097qtg.119.1523835929620;
	Sun, 15 Apr 2018 16:45:29 -0700 (PDT)
Received: from x1.local ([138.117.48.212])
	by smtp.gmail.com with ESMTPSA id d1sm1081394qtk.57.2018.04.15.16.45.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Apr 2018 16:45:29 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Date: Sun, 15 Apr 2018 20:43:05 -0300
Message-Id: <20180415234307.28132-40-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180415234307.28132-1-f4bug@amsat.org>
References: <20180415234307.28132-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-trivial] [PATCH v3 39/41] hw/nvdimm: Use the BYTE-based
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
X-List-Received-Date: Sun, 15 Apr 2018 23:45:32 -0000

It eases code review, unit is explicit.

Patch generated using:

  $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/hw/

and modified manually.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/mem/nvdimm.h | 3 ++-
 hw/mem/nvdimm.c         | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/hw/mem/nvdimm.h b/include/hw/mem/nvdimm.h
index 7fd87c4e1c..fda855ad1a 100644
--- a/include/hw/mem/nvdimm.h
+++ b/include/hw/mem/nvdimm.h
@@ -23,6 +23,7 @@
 #ifndef QEMU_NVDIMM_H
 #define QEMU_NVDIMM_H
 
+#include "qemu/units.h"
 #include "hw/mem/pc-dimm.h"
 #include "hw/acpi/bios-linker-loader.h"
 
@@ -40,7 +41,7 @@
  *   "NVDIMMs following the NVDIMM Block Mode Specification use an area
  *    at least 128KB in size, which holds around 1000 labels."
  */
-#define MIN_NAMESPACE_LABEL_SIZE      (128UL << 10)
+#define MIN_NAMESPACE_LABEL_SIZE      (128 * K_BYTE)
 
 #define TYPE_NVDIMM      "nvdimm"
 #define NVDIMM(obj)      OBJECT_CHECK(NVDIMMDevice, (obj), TYPE_NVDIMM)
diff --git a/hw/mem/nvdimm.c b/hw/mem/nvdimm.c
index acb656b672..0f83e9fb4c 100644
--- a/hw/mem/nvdimm.c
+++ b/hw/mem/nvdimm.c
@@ -54,7 +54,7 @@ static void nvdimm_set_label_size(Object *obj, Visitor *v, const char *name,
     }
     if (value < MIN_NAMESPACE_LABEL_SIZE) {
         error_setg(&local_err, "Property '%s.%s' (0x%" PRIx64 ") is required"
-                   " at least 0x%lx", object_get_typename(obj),
+                   " at least 0x%llx", object_get_typename(obj),
                    name, value, MIN_NAMESPACE_LABEL_SIZE);
         goto out;
     }
-- 
2.17.0


