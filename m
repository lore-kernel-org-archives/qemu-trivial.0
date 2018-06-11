Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fSBRI-00058C-Te
	for mharc-qemu-trivial@gnu.org; Sun, 10 Jun 2018 21:16:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42749)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBRG-00053X-8i
	for qemu-trivial@nongnu.org; Sun, 10 Jun 2018 21:16:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBRF-0002mn-1i
	for qemu-trivial@nongnu.org; Sun, 10 Jun 2018 21:16:06 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:41712)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBRA-0002iy-IO; Sun, 10 Jun 2018 21:16:00 -0400
Received: by mail-qk0-x242.google.com with SMTP id w23-v6so12067496qkb.8;
	Sun, 10 Jun 2018 18:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=il7wha5HlRd74bIeuuro7pR2rsTDOz8yWq0585fLYxk=;
	b=R2L2hGLG7efAQLhIYuOS6R+lWFHj6RQ8EFBV694RCsXWLw5H0WJaWmK+LHawVnZeSZ
	Rzk0SVydrFFZlcVdbdmb7PQOIMyMl89m5DE6Wg+/T6Uy4DA3JUO3NCoPIZ95/SB3f1Cz
	ALRIBpFuJgjQmL3HNd6mRvq0Iwz/2h18cJtwEDNo5ahQzbDOfeDbnQ3geIXuvV8jr9MM
	xupQmyzypeG4pNTRamQcT8QFYyg2Ad7BBin7daTmuLnMo3YjAOdGwCLNSk6CXRWwlEUb
	1HBG/+kJcXBxYhr+yKkW9T4ocejemMtnWodBv1lTcmq2mtM66o725LwMx+xYVJfT9I+X
	9c6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=il7wha5HlRd74bIeuuro7pR2rsTDOz8yWq0585fLYxk=;
	b=MuA3F5isQEPfgfgqNs4NZgS5V77qlp7lB3IGcz6Z/6qjdn1ffmSB+mOqX3oS9Bcl5h
	LrIYp/GRg+re9cqlgX21ntKHZzxyCwPnIrnaslJ4G1jyo+CkVoFT6ZVwGCirIM+q2RSa
	LkuvW/RjYMJI8UO+8RJQoxywswM8SpzV75NZ9j2EYTTC1Q1dp6923MaIxPhXZ9CcQpnX
	kTALe77sH/556NAZhJ5Bv1E9QTfbJ3LW4mo8Fjw+cSarC3d2pgmotjrCuzK94OZVhu8M
	Dl08fQ4obHxeAYq/TqPWK1uMiZAlK+d30dH8oetbXbfZrZmSFix7G3V2vWvmhQR3VtDu
	hxlQ==
X-Gm-Message-State: APt69E3pPlrdHCyeDaIHpYnd7n2eYTuBRg2zZi7FSDZCZ3FBKm42b9n/
	7pRbAp7J7z9I5IsI/KDG158=
X-Google-Smtp-Source: ADUXVKI9GjuQW5DydehD56PCL/1OIFLc6Alfigm+0zDOUTUttOaJhedCv8GrfHhh9TCdWI+u0cVb6Q==
X-Received: by 2002:a37:9543:: with SMTP id
	x64-v6mr12621121qkd.368.1528679760094; 
	Sun, 10 Jun 2018 18:16:00 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	o5-v6sm28237223qtm.60.2018.06.10.18.15.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Jun 2018 18:15:59 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>,
	Stefan Weil <sw@weilnetz.de>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	"Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Date: Sun, 10 Jun 2018 22:14:31 -0300
Message-Id: <20180611011501.10235-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180611011501.10235-1-f4bug@amsat.org>
References: <20180611011501.10235-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: [Qemu-trivial] [PATCH v4 10/40] hw/smbios: Use the IEC binary
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
X-List-Received-Date: Mon, 11 Jun 2018 01:16:07 -0000

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
2.17.1


