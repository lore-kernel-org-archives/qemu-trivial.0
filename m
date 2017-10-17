Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4FW8-0006wx-JA
	for mharc-qemu-trivial@gnu.org; Mon, 16 Oct 2017 20:13:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34050)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FW6-0006uu-VS
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 20:13:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FW5-0004lU-T2
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 20:13:54 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:56095)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FW1-0004fU-FQ; Mon, 16 Oct 2017 20:13:49 -0400
Received: by mail-qk0-x243.google.com with SMTP id x82so9637qkb.12;
	Mon, 16 Oct 2017 17:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=f7+dvg4iGrjPpbeDNR/sPrlo38DWcv453r/1QYU2zRo=;
	b=YbKohdRPtbk2bI8lM29XW+MKGt1R398jOFomvQUtilOlps5Czx2xmpIF4LbeDQzqsx
	u4oC0GqZFMDLHwMZ53vvNVLK9K16PZOPe7QG4wqqVKHb5tZM4fHBBa0jsFfmF8I2DUMR
	oH8NEEyHBoo1kkrEA3qJWwe5KrVdSepVy1X+glltBMoYcdyDBqHUbyzBU3mCOm4XJGAO
	dlC5JbeIBLdS2tYrbfvfuhts1bw0lTXYAb6bLXx5yRaLX1K6F9J8oLKNYWnrWY+Muohf
	a0NgW5c/nVeyxXhc9AomwgCitIi+4gy9MB5AgKc3FlBDyYRnqhOmnXlYVVJvVboaZhOL
	xSPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=f7+dvg4iGrjPpbeDNR/sPrlo38DWcv453r/1QYU2zRo=;
	b=htSPBRi/jmfsxseP/RZCLiUfrL2CPJSxYHr5tpHg2X6CP6fNLuOtGxLuuvt55H3Mct
	QYHbsNYxPN8zesDE4Hc8CbgPamy29/nAdHEpsHnbAML3qEiURt7D1dNWHqtrzWKbvmlc
	X0g6gbpGjV8n7m7MkmLlctqljcszDYrfWC+9cLblYcnQ8HdzDFrSG175F0kOFzkoBl2l
	gjHSEYuDWKn7Rjz8g3UfUY/66kucX4NWi6BIeweJ1oQGHutfdR/BpO9XpW6A33wo/Tau
	uRC4jb5yblXinN9MufrkMbuVhnJzGN5NsGvlAD6hoktLsGTNEmUKLDdSA5r1mPyYWCCQ
	dVrw==
X-Gm-Message-State: AMCzsaWREBzLLNEeip+ufyaPNhRZfP6NvCS+2fNVO96lVv5umiY01E+d
	6N5gDyTX94YCLFRf28PNYuw=
X-Google-Smtp-Source: AOwi7QCI2OjQZqBTbVTVZuu9scDgfwJt8BD7s9cuqPXLgV+Hr4b3MSn69Hhj8sThQ0Kwwu1cnaAQjg==
X-Received: by 10.55.188.132 with SMTP id m126mr15798555qkf.126.1508199229050; 
	Mon, 16 Oct 2017 17:13:49 -0700 (PDT)
Received: from x1.local ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id r6sm5409043qkh.22.2017.10.16.17.13.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Oct 2017 17:13:48 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Michael Tokarev <mjt@tls.msk.ru>, Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Mon, 16 Oct 2017 21:11:58 -0300
Message-Id: <20171017001209.32276-29-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.0.rc0
In-Reply-To: <20171017001209.32276-1-f4bug@amsat.org>
References: <20171017001209.32276-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: [Qemu-trivial] [PATCH v2 28/39] hw/acpi: ACPI_PM_* defines are not
 restricted to i386 arch
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
X-List-Received-Date: Tue, 17 Oct 2017 00:13:56 -0000

this allows to remove the old i386/pc dependency on acpi/core.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/acpi/acpi.h | 12 ++++++++++++
 include/hw/i386/pc.h   | 13 -------------
 hw/acpi/core.c         |  1 -
 3 files changed, 12 insertions(+), 14 deletions(-)

diff --git a/include/hw/acpi/acpi.h b/include/hw/acpi/acpi.h
index 7b3d93cf0d..30013b0464 100644
--- a/include/hw/acpi/acpi.h
+++ b/include/hw/acpi/acpi.h
@@ -39,6 +39,18 @@
 #define ACPI_PM2_REGISTER_WIDTH         8
 #define ACPI_PM_TIMER_WIDTH             32
 
+/* PC-style peripherals (also used by other machines).  */
+#define ACPI_PM_PROP_S3_DISABLED "disable_s3"
+#define ACPI_PM_PROP_S4_DISABLED "disable_s4"
+#define ACPI_PM_PROP_S4_VAL "s4_val"
+#define ACPI_PM_PROP_SCI_INT "sci_int"
+#define ACPI_PM_PROP_ACPI_ENABLE_CMD "acpi_enable_cmd"
+#define ACPI_PM_PROP_ACPI_DISABLE_CMD "acpi_disable_cmd"
+#define ACPI_PM_PROP_PM_IO_BASE "pm_io_base"
+#define ACPI_PM_PROP_GPE0_BLK "gpe0_blk"
+#define ACPI_PM_PROP_GPE0_BLK_LEN "gpe0_blk_len"
+#define ACPI_PM_PROP_TCO_ENABLED "enable_tco"
+
 /* PM Timer ticks per second (HZ) */
 #define PM_TIMER_FREQUENCY  3579545
 
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 087d184ef5..b1b4c918af 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -151,19 +151,6 @@ struct PCMachineClass {
 #define PC_MACHINE_CLASS(klass) \
     OBJECT_CLASS_CHECK(PCMachineClass, (klass), TYPE_PC_MACHINE)
 
-/* PC-style peripherals (also used by other machines).  */
-
-#define ACPI_PM_PROP_S3_DISABLED "disable_s3"
-#define ACPI_PM_PROP_S4_DISABLED "disable_s4"
-#define ACPI_PM_PROP_S4_VAL "s4_val"
-#define ACPI_PM_PROP_SCI_INT "sci_int"
-#define ACPI_PM_PROP_ACPI_ENABLE_CMD "acpi_enable_cmd"
-#define ACPI_PM_PROP_ACPI_DISABLE_CMD "acpi_disable_cmd"
-#define ACPI_PM_PROP_PM_IO_BASE "pm_io_base"
-#define ACPI_PM_PROP_GPE0_BLK "gpe0_blk"
-#define ACPI_PM_PROP_GPE0_BLK_LEN "gpe0_blk_len"
-#define ACPI_PM_PROP_TCO_ENABLED "enable_tco"
-
 /* parallel.c */
 
 void parallel_hds_isa_init(ISABus *bus, int n);
diff --git a/hw/acpi/core.c b/hw/acpi/core.c
index cd0a1d357b..eb9b76f70b 100644
--- a/hw/acpi/core.c
+++ b/hw/acpi/core.c
@@ -21,7 +21,6 @@
 #include "qemu/osdep.h"
 #include "sysemu/sysemu.h"
 #include "hw/hw.h"
-#include "hw/i386/pc.h"
 #include "hw/acpi/acpi.h"
 #include "hw/nvram/fw_cfg.h"
 #include "qemu/config-file.h"
-- 
2.15.0.rc0


