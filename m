Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dvQOs-0006HX-Up
	for mharc-qemu-trivial@gnu.org; Fri, 22 Sep 2017 12:01:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51655)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvQOl-0006C1-PC
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 12:01:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvQOk-0008T8-RT
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 12:01:51 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:37306)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvQOf-0008Oi-Lt; Fri, 22 Sep 2017 12:01:45 -0400
Received: by mail-qt0-x243.google.com with SMTP id u48so923684qtc.4;
	Fri, 22 Sep 2017 09:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=/vTJhoXWoZsgcDOXvcRuqqfhOoSV0vVpPdkW06HrZ3w=;
	b=PJTM1r9LKA9S/icPTAoM/7NvGUw4UB4QFQHkdI6axCvJylzZYrkIRX/ueoU4+4N5bN
	Ae9/Yykcc7qB5sE3NY9GaL4JsBS+OuR+i4/FzDs1sBi5e/ZSMCwSFH2KC1vNGj9x/IL1
	HOKL1hrq+YK3cYtdVE45UT/fkGpjT9GtBa6bibUtd6mLI8Vol7JW9JsAaPsadm6OX4EZ
	Vq1AqblcwaOw6xXuL4hSWN42D1sdm04aWlRfbEo7o/nRs0HQlgRehDIA737q8MCmN8Sh
	axcmj3Ja3EadHouC/DI5oY0x3h6NQW3qxD1trkcFgsPl0FOhhqjMTTlaisly/Yukx2uj
	xCIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=/vTJhoXWoZsgcDOXvcRuqqfhOoSV0vVpPdkW06HrZ3w=;
	b=iZ13HTMh2CRQA7tpcpmVmjabwfjWiy+0B4IGaI92ms0FPnxMX60FtWI3+04Oh5PuGX
	E67RC+F1gSFMU/5kylE+evs3fPMa5ftgY221RznKHj5dsocJd88+/Aoc2YskeEZ9TKiY
	AObgVZrR0rdxBQZLunJYAgmi9Q41UDD715Jv+6B7OcrIV2UUIPmsPkYpTORKICP99LUA
	bRkH9J4db14onqYgRJ/Qah/QKt8sprvQALZZQbDVMaXZItPFKCW+bKsViXnOic972c3U
	sIdNgRIvhelPX/bw784mpR5C0WGOrIVAdENbw9k62AlhHKAPFCOW7VAW7I1UzTSO2S80
	uyug==
X-Gm-Message-State: AHPjjUhxgxqF/QHOTK65jE02Jp/lc8ZbedlyA0V05lqCbEBo29lAjO9q
	zvLJS5CoQ64dSKTIX4SWlbs=
X-Google-Smtp-Source: AOwi7QBrrK1Bp5+A4RDiUkDgxsJ9/9fCKV+tt1PuTGULunjXRFW3+PHaFhqcmdpMh19t5HdaUN9y8g==
X-Received: by 10.200.27.85 with SMTP id p21mr8433969qtk.3.1506096104946;
	Fri, 22 Sep 2017 09:01:44 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id y31sm108325qta.83.2017.09.22.09.01.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Sep 2017 09:01:44 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	David Gibson <david@gibson.dropbear.id.au>, Alexander Graf <agraf@suse.de>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-trivial@nongnu.org
Date: Fri, 22 Sep 2017 13:01:02 -0300
Message-Id: <20170922160111.31885-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170922154014.29350-1-f4bug@amsat.org>
References: <20170922154014.29350-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-trivial] [PATCH 25/34] hw/timer/m48t59: use TYPE_M48T59_ISA,
 add entries to MAINTAINERS
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
X-List-Received-Date: Fri, 22 Sep 2017 16:01:57 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/timer/m48t59.h | 2 ++
 hw/ppc/prep.c             | 2 +-
 hw/timer/m48t59-isa.c     | 2 +-
 MAINTAINERS               | 2 ++
 4 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/include/hw/timer/m48t59.h b/include/hw/timer/m48t59.h
index db5e43a8da..069bb045d7 100644
--- a/include/hw/timer/m48t59.h
+++ b/include/hw/timer/m48t59.h
@@ -25,6 +25,8 @@ typedef struct NvramClass {
     void (*toggle_lock)(Nvram *obj, int lock);
 } NvramClass;
 
+#define TYPE_M48T59_ISA "isa-m48t59"
+
 Nvram *m48t59_init_isa(ISABus *bus, uint32_t io_base, uint16_t size,
                        int base_year, int type);
 Nvram *m48t59_init(qemu_irq IRQ, hwaddr mem_base,
diff --git a/hw/ppc/prep.c b/hw/ppc/prep.c
index 16f4537093..1f8ef4819b 100644
--- a/hw/ppc/prep.c
+++ b/hw/ppc/prep.c
@@ -777,7 +777,7 @@ static void ibm_40p_init(MachineState *machine)
     /* add some more devices */
     if (defaults_enabled()) {
         isa_create_simple(isa_bus, TYPE_I8042);
-        m48t59 = NVRAM(isa_create_simple(isa_bus, "isa-m48t59"));
+        m48t59 = NVRAM(isa_create_simple(isa_bus, TYPE_M48T59_ISA));
 
         dev = DEVICE(isa_create(isa_bus, "cs4231a"));
         qdev_prop_set_uint32(dev, "iobase", 0x830);
diff --git a/hw/timer/m48t59-isa.c b/hw/timer/m48t59-isa.c
index ea1ba703d7..077346f7ca 100644
--- a/hw/timer/m48t59-isa.c
+++ b/hw/timer/m48t59-isa.c
@@ -49,7 +49,7 @@ typedef struct M48txxISADeviceClass {
 
 static M48txxInfo m48txx_isa_info[] = {
     {
-        .bus_name = "isa-m48t59",
+        .bus_name = TYPE_M48T59_ISA,
         .model = 59,
         .size = 0x2000,
     }
diff --git a/MAINTAINERS b/MAINTAINERS
index a79723601c..3cb6bc190c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -708,6 +708,8 @@ F: hw/pci-host/prep.[hc]
 F: hw/isa/i82378.c
 F: hw/isa/pc87312.[hc]
 F: hw/dma/i82374.c
+F: hw/timer/m48t59-isa.c
+F: include/hw/timer/m48t59.h
 F: pc-bios/ppc_rom.bin
 
 sPAPR
-- 
2.14.1


