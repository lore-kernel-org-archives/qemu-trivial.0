Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1f7rJI-0004fC-1s
	for mharc-qemu-trivial@gnu.org; Sun, 15 Apr 2018 19:43:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50729)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rJF-0004bl-EO
	for qemu-trivial@nongnu.org; Sun, 15 Apr 2018 19:43:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rJC-0000R2-4L
	for qemu-trivial@nongnu.org; Sun, 15 Apr 2018 19:43:49 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:40147)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rJC-0000Qm-10; Sun, 15 Apr 2018 19:43:46 -0400
Received: by mail-qt0-x241.google.com with SMTP id d12so811818qtp.7;
	Sun, 15 Apr 2018 16:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=nW4d7ZZdSNBJjTgQllexWpB3A0CF3y/UAP01zb3qVEM=;
	b=u5Blne92GSDd5XnJJP8AWfFe/BMfBA0K6fb5iMyir8h7rBhwLyKMy/zd/mr7ou7Mo5
	W+n8s7s/W9k9pVX5glHEdHTi1m0CoPsBgNUptNapbcZUi3JvFzq1OCTijN6g2XgtNXQr
	EuNOg+0xhjXFIEyDaUNRWmxy99UZK2CjU5deESTEnyM0NbtMuSNCb9ZwUzxBs2Kt0vMo
	V5ly1Ca8B07XTodzmBK0TePGjwb35YwZ42NXcjO9AsmMRXIWPreoPmEo/q1vGiONfjfA
	vX2Mo6uR+lCl1Ih1YRgcila6L0IYIIHzHy/xc/AjCTBIkE7uKtBlkqdPOZ6/fGUkLW0P
	Q/FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=nW4d7ZZdSNBJjTgQllexWpB3A0CF3y/UAP01zb3qVEM=;
	b=AgSOu5sqIvi/DEDzH6V/95l9O4DimEJgC7OAOXjfDKAAMENY5fypOQWW9fnM0C5baI
	iN6BR84q7aBTOs3wTV8JUEJoC/vUO/mH++x6HCjad0+XjF/rn2G+eK6VpVOiOEl681lV
	E9go+yDDpbtZCucv7mgxcUX8QKvYeYcwsCae+kgxFkKQg1Ws8Gd12WbmMowQRTDT9y1a
	aZH3YdoUNRaofqDH+iUKXi1CnPtX5Uh6ytPnoxieWqDmkRKSn52oL+tTegof/gU/oBK1
	z/MGR0GvpX8SZBkN9zIHkda4zJI3aMzu1mMQ8yPxqywlosVn+EN7QyPyn+khU+Ri8m2Q
	FpmQ==
X-Gm-Message-State: ALQs6tAKAjjyvCqvtnoKWmQ8y3CcDgAzc/1uWh2qknqhOVFGoXTkVR/e
	Z+16QyhxdqJDTHI1VQqaMGzzRQbU
X-Google-Smtp-Source: AIpwx485dG6+8OVc2CUQUYwh1EzFB0S4BZsH+b8JpHKHDhxBZWJDRF3zwLR/De/Q2MhfuZprxhETqg==
X-Received: by 10.237.62.25 with SMTP id l25mr4653218qtf.143.1523835825425;
	Sun, 15 Apr 2018 16:43:45 -0700 (PDT)
Received: from x1.local ([138.117.48.212])
	by smtp.gmail.com with ESMTPSA id d1sm1081394qtk.57.2018.04.15.16.43.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Apr 2018 16:43:44 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>
Date: Sun, 15 Apr 2018 20:42:36 -0300
Message-Id: <20180415234307.28132-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180415234307.28132-1-f4bug@amsat.org>
References: <20180415234307.28132-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-trivial] [PATCH v3 10/41] hw/smbios: Use the BYTE-based
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
X-List-Received-Date: Sun, 15 Apr 2018 23:43:50 -0000

It eases code review, unit is explicit.

Patch generated using:

  $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/hw/

and modified manually.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/smbios/smbios.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
index 27a07e96f4..a72f35d9f5 100644
--- a/hw/smbios/smbios.c
+++ b/hw/smbios/smbios.c
@@ -16,6 +16,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qapi/error.h"
 #include "qemu/config-file.h"
 #include "qemu/error-report.h"
@@ -625,10 +626,6 @@ static void smbios_build_type_11_table(void)
     SMBIOS_BUILD_TABLE_POST;
 }
 
-#define ONE_KB ((ram_addr_t)1 << 10)
-#define ONE_MB ((ram_addr_t)1 << 20)
-#define ONE_GB ((ram_addr_t)1 << 30)
-
 #define MAX_T16_STD_SZ 0x80000000 /* 2T in Kilobytes */
 
 static void smbios_build_type_16_table(unsigned dimm_cnt)
@@ -640,7 +637,7 @@ static void smbios_build_type_16_table(unsigned dimm_cnt)
     t->location = 0x01; /* Other */
     t->use = 0x03; /* System memory */
     t->error_correction = 0x06; /* Multi-bit ECC (for Microsoft, per SeaBIOS) */
-    size_kb = QEMU_ALIGN_UP(ram_size, ONE_KB) / ONE_KB;
+    size_kb = QEMU_ALIGN_UP(ram_size, K_BYTE) / K_BYTE;
     if (size_kb < MAX_T16_STD_SZ) {
         t->maximum_capacity = cpu_to_le32(size_kb);
         t->extended_maximum_capacity = cpu_to_le64(0);
@@ -668,7 +665,7 @@ static void smbios_build_type_17_table(unsigned instance, uint64_t size)
     t->memory_error_information_handle = cpu_to_le16(0xFFFE); /* Not provided */
     t->total_width = cpu_to_le16(0xFFFF); /* Unknown */
     t->data_width = cpu_to_le16(0xFFFF); /* Unknown */
-    size_mb = QEMU_ALIGN_UP(size, ONE_MB) / ONE_MB;
+    size_mb = QEMU_ALIGN_UP(size, M_BYTE) / M_BYTE;
     if (size_mb < MAX_T17_STD_SZ) {
         t->size = cpu_to_le16(size_mb);
         t->extended_size = cpu_to_le32(0);
@@ -707,8 +704,8 @@ static void smbios_build_type_19_table(unsigned instance,
 
     end = start + size - 1;
     assert(end > start);
-    start_kb = start / ONE_KB;
-    end_kb = end / ONE_KB;
+    start_kb = start / K_BYTE;
+    end_kb = end / K_BYTE;
     if (start_kb < UINT32_MAX && end_kb < UINT32_MAX) {
         t->starting_address = cpu_to_le32(start_kb);
         t->ending_address = cpu_to_le32(end_kb);
@@ -869,7 +866,7 @@ void smbios_get_tables(const struct smbios_phys_mem_area *mem_array,
 
         smbios_build_type_11_table();
 
-#define MAX_DIMM_SZ (16ll * ONE_GB)
+#define MAX_DIMM_SZ (16 * G_BYTE)
 #define GET_DIMM_SZ ((i < dimm_cnt - 1) ? MAX_DIMM_SZ \
                                         : ((ram_size - 1) % MAX_DIMM_SZ) + 1)
 
-- 
2.17.0


