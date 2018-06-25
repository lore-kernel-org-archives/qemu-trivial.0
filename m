Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fXQqQ-0001Ma-DQ
	for mharc-qemu-trivial@gnu.org; Mon, 25 Jun 2018 08:43:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53928)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQqM-0001K7-8X
	for qemu-trivial@nongnu.org; Mon, 25 Jun 2018 08:43:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQqK-0007f9-2D
	for qemu-trivial@nongnu.org; Mon, 25 Jun 2018 08:43:42 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:39695)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQqE-0007cm-Ic; Mon, 25 Jun 2018 08:43:34 -0400
Received: by mail-qt0-x243.google.com with SMTP id c23-v6so2825649qtn.6;
	Mon, 25 Jun 2018 05:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ks9APs4FnU7N4alkvQahhOOn31iXi+wj6DszMhAYvWg=;
	b=g7Moo/gcZII4UjwTdMNijLGMlp58osHCXMLjCdhlts+WpXeCJPQnepGBa2e/qG2lA1
	QkNi3DjpMzmSDwMaRu3jf3YJncbL4/pr+jfpgbxsUksgoZDWXmA9v+sk2fnN5Lgbsc3Q
	OlUkpSjABEU4l3dwOKcGGGroR2siOaKNs+E0q1uGeQNtYyXUhIRJKi3e+Vn3aQ7rmDW2
	oUxanKaOCzMdqPTP3iqkdVHqs8+QVEEmyrSo0CeSwv/knE9Mruo9uaKDhFLXcwik8IO4
	FO3Uz5Mfo5IvEu+YQFgq//2jNQSr/zqyLPW66v5t9xgpwewVs3ASxzt+vRRYjU3jGVp9
	bNGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=ks9APs4FnU7N4alkvQahhOOn31iXi+wj6DszMhAYvWg=;
	b=K0H2iLFUSb6pO8h+khCDNk3rWjoTLXRbKyKnk27boh7wfEZNFbQ8u0+/3Rjc8n+ELA
	JDt2+SbEabjatoDlexxa21v8ZTHo2baxFs/yJiI1YNzq4oWO5a4b7jKWY49V/iBId4P6
	73/2nfHprNCRr9avPLOulul/3sSKRZdlAIzR74zDVFOp4Kqq4XeY4EsF43R7/KzGGCLP
	Zw7AqD+MoZGg0xfYjgFRohF10emjQ7ibFl5HvPUYbuUBXpD13IX2GHVfQpz8QoMIFleK
	CHem6r5Do43d/5nhmVzHQdMjBH9/N1kzxvYiDAC8GtuMUqVTDjDTrNOrwfFQebPnwJWG
	W4uw==
X-Gm-Message-State: APt69E06bi9a1nShSdGBjxHqJCvFhIOJJQK9rm2FIVnO2VYv//hYkqnA
	F4cLYWgIE7DTpVOCuDKQAvvR1Z4Sf+0=
X-Google-Smtp-Source: AAOMgpewGeDMj11U0if5JuJoO+P2hqrtZB5VeGzRjJdjmeujXPU1fWFwPOzHVivsufWRbYRg0oOr9g==
X-Received: by 2002:aed:3cae:: with SMTP id
	d43-v6mr4827943qtf.379.1529930614062; 
	Mon, 25 Jun 2018 05:43:34 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	m15-v6sm12549562qtm.84.2018.06.25.05.43.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Jun 2018 05:43:33 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>,
	Stefan Weil <sw@weilnetz.de>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	"Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Date: Mon, 25 Jun 2018 09:42:02 -0300
Message-Id: <20180625124238.25339-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180625124238.25339-1-f4bug@amsat.org>
References: <20180625124238.25339-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-trivial] [PATCH v5 10/46] hw/smbios: Use the IEC binary
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
X-List-Received-Date: Mon, 25 Jun 2018 12:43:44 -0000

It eases code review, unit is explicit.

Patch generated using:

  $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/hw/

and modified manually.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/smbios/smbios.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
index 27a07e96f4..a27e54b2fa 100644
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
+    size_kb = QEMU_ALIGN_UP(ram_size, KiB) / KiB;
     if (size_kb < MAX_T16_STD_SZ) {
         t->maximum_capacity = cpu_to_le32(size_kb);
         t->extended_maximum_capacity = cpu_to_le64(0);
@@ -668,7 +665,7 @@ static void smbios_build_type_17_table(unsigned instance, uint64_t size)
     t->memory_error_information_handle = cpu_to_le16(0xFFFE); /* Not provided */
     t->total_width = cpu_to_le16(0xFFFF); /* Unknown */
     t->data_width = cpu_to_le16(0xFFFF); /* Unknown */
-    size_mb = QEMU_ALIGN_UP(size, ONE_MB) / ONE_MB;
+    size_mb = QEMU_ALIGN_UP(size, MiB) / MiB;
     if (size_mb < MAX_T17_STD_SZ) {
         t->size = cpu_to_le16(size_mb);
         t->extended_size = cpu_to_le32(0);
@@ -707,8 +704,8 @@ static void smbios_build_type_19_table(unsigned instance,
 
     end = start + size - 1;
     assert(end > start);
-    start_kb = start / ONE_KB;
-    end_kb = end / ONE_KB;
+    start_kb = start / KiB;
+    end_kb = end / KiB;
     if (start_kb < UINT32_MAX && end_kb < UINT32_MAX) {
         t->starting_address = cpu_to_le32(start_kb);
         t->ending_address = cpu_to_le32(end_kb);
@@ -869,7 +866,7 @@ void smbios_get_tables(const struct smbios_phys_mem_area *mem_array,
 
         smbios_build_type_11_table();
 
-#define MAX_DIMM_SZ (16ll * ONE_GB)
+#define MAX_DIMM_SZ (16 * GiB)
 #define GET_DIMM_SZ ((i < dimm_cnt - 1) ? MAX_DIMM_SZ \
                                         : ((ram_size - 1) % MAX_DIMM_SZ) + 1)
 
-- 
2.18.0


