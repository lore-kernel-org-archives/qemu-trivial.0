Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dvQ5J-0005Kk-4J
	for mharc-qemu-trivial@gnu.org; Fri, 22 Sep 2017 11:41:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41933)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvQ5E-0005E2-23
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 11:41:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvQ5D-0003Ym-4S
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 11:41:40 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:37009)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvQ58-0003Ut-O2; Fri, 22 Sep 2017 11:41:34 -0400
Received: by mail-qt0-x243.google.com with SMTP id u48so888417qtc.4;
	Fri, 22 Sep 2017 08:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Z/vylf1C4XC/eLYnmksZh8YoUspYr1bGIiB6ltwpn0g=;
	b=jpSohIl1TCUaO+/zLWRvE4nkmoafD1w06+ixz9RUn/UbLhjrMAEKzY0Z1OgSBh0/vn
	x/Hl49OjYHKCfwECHkN9A3wDiqYXtIzRjtwZ3wUGr/YcZ94KRJJbQfyWFl+1824vIgh/
	Yy6o+NEmMDRhvFmhFhVn6R5ba7/vHGaV37ykQvJGzplkHq1D7rhymgrqEXt/1YbuaSkq
	fO97H8lB5yDTU54XshXE4UuWlORws0Y3MkKny8IzqUWEyezi9yF1zv7TFOogph1p1GCd
	WzqpVjesBi1e5hAA+8g4PBVNIxK78K1zs1tFX46fPJc/pLRs7krPXJ9sOFsaDYsweaix
	BR7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=Z/vylf1C4XC/eLYnmksZh8YoUspYr1bGIiB6ltwpn0g=;
	b=XPPIkmroZUdRoLZaRxb4D6WAS3wlngLkcAt/W5o/hpC6rlHDNtt3DmHVMxFcy7fNE+
	VyMAmuUVRltz+s2zbZezl4VNxmk8PwV54SJDWX33Dbe8onIzXmmSDu1khn2QvejCAdjX
	I4RQ7Goax8oPB8CyBxnWMdsGROz1JwyFOOxpHteW6b12qB2ARehjAXq3jaDp0G3tXpTI
	M8EbWmAKS+hUP8dVh3Cp+QKpZiwLs0BaFFeQYxx95VpTV2fInGp36n/UNjrLa18+E97k
	OM8RL+M35Pwk4oqNk71dVSmyehrvhDTfCs9MKWAviuPbX2KImq7apFu2RFLwRL464R5z
	XVUQ==
X-Gm-Message-State: AHPjjUiIQd2O9hoMLu7XDcEDuGaMVLqxhXWryl9M+ieS6/N6aht/mmHt
	xUCLAzKOzakoNllNZQ4oEhk=
X-Google-Smtp-Source: AOwi7QChIGRy0mjtm0C6EvYkkbYkmLdVlRxiCIDf4UPJwZaX1Zi2Bd187RJYuJD4zOFUUYTvHuqftg==
X-Received: by 10.237.57.38 with SMTP id l35mr9032867qte.118.1506094894234;
	Fri, 22 Sep 2017 08:41:34 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id z75sm71742qkb.71.2017.09.22.08.41.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Sep 2017 08:41:33 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Fri, 22 Sep 2017 12:39:59 -0300
Message-Id: <20170922154014.29350-20-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170922154014.29350-1-f4bug@amsat.org>
References: <20170922154014.29350-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-trivial] [PATCH 19/34] hw/acpi: ACPI_PM_* defines are not
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
X-List-Received-Date: Fri, 22 Sep 2017 15:41:44 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/acpi/acpi.h | 12 ++++++++++++
 include/hw/i386/pc.h   | 13 -------------
 2 files changed, 12 insertions(+), 13 deletions(-)

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
-- 
2.14.1


