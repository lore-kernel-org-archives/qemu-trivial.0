Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1f7rL1-0006YE-MB
	for mharc-qemu-trivial@gnu.org; Sun, 15 Apr 2018 19:45:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52681)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rKw-0006VY-Nc
	for qemu-trivial@nongnu.org; Sun, 15 Apr 2018 19:45:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rKv-0001qi-Lx
	for qemu-trivial@nongnu.org; Sun, 15 Apr 2018 19:45:34 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:38600)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rKv-0001qQ-Fh; Sun, 15 Apr 2018 19:45:33 -0400
Received: by mail-qt0-x244.google.com with SMTP id z23so13564646qti.5;
	Sun, 15 Apr 2018 16:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=+WqG1Y6FRlxIu3Tc3DagXW6yWpRzWHsMpc65faz12FM=;
	b=nxf+k5MZE1QpewKo5fb8kgTmZ+DujcgU6jlO7ineY9FuacO1h3AU+ZRWCsYwKEadyF
	wjFMZOBJojjk8l6/prvZgzKobcEmW9JnZ9BH9aQhZugYgoR7HOctQFF6FtuenSwwnwsA
	dIDC7/lWAz2i63ieITpHLrEJ3gxbpeIwzfUnCF22mlsZaOkYH4Vdx0sSW8WpFKJc8qAL
	2ozAVR83p/9ZvjlmMGLBvfxrOW2Szp66oWKXE3bRgZmgGnOVsgVqbcCqTFQaLMrKCJ7l
	v8KOB0UL4no+usctW2pvhxOzArICVP/YAxl3ocMrU7t+/jO518TJaG+PgBQxQGsRxtpc
	ZSRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=+WqG1Y6FRlxIu3Tc3DagXW6yWpRzWHsMpc65faz12FM=;
	b=L5IypdJM9Y6UK8vLeQBvNoNXsDIaEgepRpv6GnPHYEYt7fw3gmll1Hv/TQ8b0OQjug
	hWPmtfLIG58r2tRQ6nfr5mDSzqHF6hDvWtttV7rwO54xuzFAG9ctTopj4b0NzShfyF3b
	TOewQovHrjDYInUP+p6dtBqHMD0CkK98WKcSGLwPyaWeL86jEk+B08rJS1Sd5ucneBhh
	owrrwErTZSUKMzdYkDpc8F721NXn0k1oe4Hta/evNdUMMBxJcK3DSrQGickiX/Iy1k6H
	eQj0PJKpGoZfHT9q/hfJHsBbVYqdtz0b2nH/bIGBCvbN92VrS4/91ViQGSomoA/YrpE5
	T8wg==
X-Gm-Message-State: ALQs6tBC0qLRd7yQ3HwyajerbGDWnI3fMVRLS+PdqvepQWruAqvPKVt6
	GEljuG3uZmY/dDNuDi9G00j3eoIqUgg=
X-Google-Smtp-Source: AIpwx48lAP+KbY3j10M4RnrkmTlNrf3rvE35Wk6lhr/TL8UWnp8DcXnYVE7y4u58kcPCbYOdx5+Z7g==
X-Received: by 10.237.62.25 with SMTP id l25mr4658023qtf.143.1523835932828;
	Sun, 15 Apr 2018 16:45:32 -0700 (PDT)
Received: from x1.local ([138.117.48.212])
	by smtp.gmail.com with ESMTPSA id d1sm1081394qtk.57.2018.04.15.16.45.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Apr 2018 16:45:32 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Paul Burton <paul.burton@mips.com>
Date: Sun, 15 Apr 2018 20:43:06 -0300
Message-Id: <20180415234307.28132-41-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180415234307.28132-1-f4bug@amsat.org>
References: <20180415234307.28132-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-trivial] [PATCH v3 40/41] hw/loader: Use the BYTE-based
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
X-List-Received-Date: Sun, 15 Apr 2018 23:45:38 -0000

It eases code review, unit is explicit.

Patch generated using:

  $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/hw/

and modified manually.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/loader.h  | 5 +++--
 hw/core/loader-fit.c | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/include/hw/loader.h b/include/hw/loader.h
index 5ed3fd8ae6..2222ca4184 100644
--- a/include/hw/loader.h
+++ b/include/hw/loader.h
@@ -1,5 +1,6 @@
 #ifndef LOADER_H
 #define LOADER_H
+#include "qemu/units.h"
 #include "hw/nvram/fw_cfg.h"
 
 /* loader.c */
@@ -52,7 +53,7 @@ int load_image_mr(const char *filename, MemoryRegion *mr);
  * load_image_gzipped_buffer() and load_image_gzipped() will read. It prevents
  * g_malloc() in those functions from allocating a huge amount of memory.
  */
-#define LOAD_IMAGE_MAX_GUNZIP_BYTES (256 << 20)
+#define LOAD_IMAGE_MAX_GUNZIP_BYTES (256 * M_BYTE)
 
 int load_image_gzipped_buffer(const char *filename, uint64_t max_sz,
                               uint8_t **buffer);
@@ -253,6 +254,6 @@ int rom_add_option(const char *file, int32_t bootindex);
 
 /* This is the usual maximum in uboot, so if a uImage overflows this, it would
  * overflow on real hardware too. */
-#define UBOOT_MAX_GUNZIP_BYTES (64 << 20)
+#define UBOOT_MAX_GUNZIP_BYTES (64 * M_BYTE)
 
 #endif
diff --git a/hw/core/loader-fit.c b/hw/core/loader-fit.c
index 0c4a7207f4..0117104d69 100644
--- a/hw/core/loader-fit.c
+++ b/hw/core/loader-fit.c
@@ -22,7 +22,7 @@
 #include "exec/memory.h"
 #include "hw/loader.h"
 #include "hw/loader-fit.h"
-#include "qemu/cutils.h"
+#include "qemu/units.h"
 #include "qemu/error-report.h"
 #include "sysemu/device_tree.h"
 #include "sysemu/sysemu.h"
-- 
2.17.0


