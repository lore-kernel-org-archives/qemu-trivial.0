Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ePgjk-0003Ms-H8
	for mharc-qemu-trivial@gnu.org; Thu, 14 Dec 2017 22:32:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35399)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgjg-0003KD-HA
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 22:32:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgjf-0006GZ-Jf
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 22:32:32 -0500
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:34512)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgjd-0006Cs-Ak; Thu, 14 Dec 2017 22:32:29 -0500
Received: by mail-qt0-x242.google.com with SMTP id 33so10640383qtv.1;
	Thu, 14 Dec 2017 19:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=6aE4J53AQg2NMSm2wYea90LRla3zFu9AEcN6eCIJw4I=;
	b=fFJMS+JheCTj0fOLzPMS4OVzP2lVmx4UdLC/2ltEENk7jtWd8mwlOvSqDSgbJ5Ajac
	MVdZP/6f8erAvmNf4+gm56atOwnxf6WmV4bChxRIHgH/F2vZAvI9WqQkoB8n1GLfF9HF
	YG9OaF6OU4QnhPfolnDGM0kgwBDScapykbAT0QQFF1DUsTddGugvp8J2p5TUGp50gDJy
	L02kFpHtdzCRqgXSgvTP0+ISJI22h44HTd/SvQ/8HVpgB4WJ/Qv91dqonOjf3h1KNtsA
	15AAI6wip+xZKL18VUP42Wdp+ObuSBPO8JVjcJwIgMLxqyOEy8wrENSxiI/AcyPmTJip
	O0Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=6aE4J53AQg2NMSm2wYea90LRla3zFu9AEcN6eCIJw4I=;
	b=eomzUNogx0xxz56rA1+u0Pn82yXAFhLBUGnXI4ECZE3wqTvvMjp3txSewgnXJk+iFA
	ITUYXiRPfkNMp1+YcjsCfNhjgVl2KLyo8GPCqbXtKitm+UsG0xPNm6J9fg1OayfsKs5d
	ip80k5buda3UaVDiOuyF54bHLH1cc3sTPRa692OUngdE88n0fuft/1R3iVBZrFdYuVdM
	5dL4XLEKi4x7dACWEEDo1nC0ncrlnvLvF/Wc1hCdo+KhLI3grWD28t0ryeeJyxXgF36D
	YBRngXREmH1JQEj6jE4mQ5PmP/hCGaICjA1qhmBSPf8RlcR8qdzJBKa5bTaRMx1zJUw8
	4YTQ==
X-Gm-Message-State: AKGB3mKLHHv0FvR5pAo3/p2prTW6Ykct8uk9ElJAeuXvPFy1SCxEydRi
	MU4hk5xXvPjJxEPFrODRiyZdcW+RGJk=
X-Google-Smtp-Source: ACJfBovCp+pP8XzNE/DeU/4nJX9iXfAopOVTx8kum1gerouaQPSZTyybA7hrF246UKi8t5OWXsMeqA==
X-Received: by 10.200.27.200 with SMTP id m8mr19260753qtk.102.1513308748853;
	Thu, 14 Dec 2017 19:32:28 -0800 (PST)
Received: from x1.local ([181.91.222.165]) by smtp.gmail.com with ESMTPSA id
	q24sm3794605qkq.63.2017.12.14.19.32.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Dec 2017 19:32:28 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: "Michael S. Tsirkin" <mst@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>
Date: Fri, 15 Dec 2017 00:30:05 -0300
Message-Id: <20171215033015.738-34-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171215033015.738-1-f4bug@amsat.org>
References: <20171215033015.738-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-trivial] [PATCH v4 33/43] hw/acpi: ACPI_PM_* defines are not
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
X-List-Received-Date: Fri, 15 Dec 2017 03:32:36 -0000

this allows to remove the old i386/pc dependency on acpi/core.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
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
index ef438bd765..252526e600 100644
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
2.15.1


