Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4V12-0002k5-75
	for mharc-qemu-trivial@gnu.org; Tue, 17 Oct 2017 12:46:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47377)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4V0z-0002gS-5B
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 12:46:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4V0y-0003iA-Cj
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 12:46:49 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:47859)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4V0u-0003gJ-TR; Tue, 17 Oct 2017 12:46:44 -0400
Received: by mail-qt0-x243.google.com with SMTP id z50so4921339qtj.4;
	Tue, 17 Oct 2017 09:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ML60JehRDLpgid1nj+2rgPTzVAslf7kiV9IEUWmWMTg=;
	b=PtZGVl7ZCaK0FqajNiuQLnaWITfosAf5bHl39NeD3GCSV0FatjjxYmCpSra7A7uEYq
	ennx8Uv2SnSvghLrj7CfFS2wBSZBBdDRICo2Bwo2Izb2n3XOiyaHYnvbZIYTmreVHJOq
	/m3m3jcWqk7EEMngzM3F/o18czdFTgCiMosGHJ5c3nsiAdcRMflyTuFmsoRZAfP9ts5F
	zeDj82ZvUr3RQAuagH10CIO44BbSQupNZuO4JXdW8klW8Xemr+of7RcC9CGV9xCMYI8d
	DNwrpAR1g4kT7GjNk5NDVPAau5EV8TsMCcrnhN20tZrLb2Sfigpmq/+QBTr6edR0gPlh
	YA8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=ML60JehRDLpgid1nj+2rgPTzVAslf7kiV9IEUWmWMTg=;
	b=U3k9WWf1J1/cKxL2rBP7HZAzDhEMuUNa5I9psbkVjyHFfonjhCoWYWm4VcSgHM8N0Z
	er5CS8a544wmL9vLUSkd/KJe8HLAeq572tjKOEjeOji1Ja+ZgJzZRkiph2dbx9PCmFTp
	aBPWDsR4sdnayQwYTb5bY3AN69PPINDCbca7UNqnMECZqADO5koz8sSdU8S2RxQPQj+V
	UxfbyPFfCkAbKaFhh267Sz2xARj9LBdsX7MSVCuxyNfL3rg0qFxUwOabIPrGv25ifGCm
	L5TtjlQPhlnkvG5oEQ+rwuXzI1zsZfryDdfpg6l/q59jL39ki0J4EUOW1DLonK2d3jip
	owJA==
X-Gm-Message-State: AMCzsaVMEr3ENwe0T+r+jLAFOm8VnfnuB4tuTm7TRdnWHY+gvGgi0meR
	oiaLbZ7FoMqtc4YhcFxzZvE=
X-Google-Smtp-Source: AOwi7QCFQYzi9R16qtM5LOk8sO/eY+Sf814f/54Luor1dfq3JeCuNA6ruto2YtRt+VgYj141NWXIeQ==
X-Received: by 10.200.44.77 with SMTP id e13mr21088103qta.238.1508258804321;
	Tue, 17 Oct 2017 09:46:44 -0700 (PDT)
Received: from x1.local ([181.93.89.178]) by smtp.gmail.com with ESMTPSA id
	q49sm6687653qtq.80.2017.10.17.09.46.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Oct 2017 09:46:43 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Michael Tokarev <mjt@tls.msk.ru>, Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Tue, 17 Oct 2017 13:44:17 -0300
Message-Id: <20171017164426.25277-34-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.0.rc0
In-Reply-To: <20171017164426.25277-1-f4bug@amsat.org>
References: <20171017164426.25277-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-trivial] [PATCH v3 33/42] hw/acpi: ACPI_PM_* defines are not
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
X-List-Received-Date: Tue, 17 Oct 2017 16:46:50 -0000

this allows to remove the old i386/pc dependency on acpi/core.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/acpi/acpi.h | 11 +++++++++++
 include/hw/i386/pc.h   | 11 -----------
 hw/acpi/core.c         |  1 -
 3 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/include/hw/acpi/acpi.h b/include/hw/acpi/acpi.h
index 7b3d93cf0d..39ff512129 100644
--- a/include/hw/acpi/acpi.h
+++ b/include/hw/acpi/acpi.h
@@ -39,6 +39,17 @@
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
+
 /* PM Timer ticks per second (HZ) */
 #define PM_TIMER_FREQUENCY  3579545
 
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 087d184ef5..6335e2bf47 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -151,17 +151,6 @@ struct PCMachineClass {
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
 #define ACPI_PM_PROP_TCO_ENABLED "enable_tco"
 
 /* parallel.c */
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


