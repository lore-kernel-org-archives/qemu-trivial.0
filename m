Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4FWa-0007Pl-TN
	for mharc-qemu-trivial@gnu.org; Mon, 16 Oct 2017 20:14:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34359)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FWY-0007NM-IR
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 20:14:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FWX-00052k-J5
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 20:14:22 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:45636)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FWV-00051R-5z; Mon, 16 Oct 2017 20:14:19 -0400
Received: by mail-qk0-x242.google.com with SMTP id f199so32990qke.2;
	Mon, 16 Oct 2017 17:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=+ISYs3l6xypf2ckPjA3GDCMzA6U11y/hwgDbsP/fkHc=;
	b=GjOimRmOnVFDh2tB2xzTEMEzPz65AeDRMPVHTeQi9ebReSX2tqwv8ePUYPSTtHNZNe
	HtpxaEvE+dvvEQDA5c0b/RTC+CggsoO9LkbtioayHRslfB0Vg44LW5cO9TfXCdZXidrd
	SWS7WFwrq6hJo+vlFDtyP25gJqSGPduv37DWH4kGc6TRDUurGXry2FG0fIhLlTHc6IGA
	VtCjff4pcjYej/LGn2DZkr00Z/6lnxCgoHUbxD0GacbhR2jF62WRlMZYJdSO1VloEnaN
	EtMBNFCxIuoLvW4FWGvH3tKrmefbqArK+UhsmZl4WrXzuwaUJKYqgIJ6OJQ1+OjqBhKj
	JeGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=+ISYs3l6xypf2ckPjA3GDCMzA6U11y/hwgDbsP/fkHc=;
	b=tQto95oPbZ+7WRwest62zKtbcg+WuFx9WyyarIYx4/dJLWCyytLzGoy59LDxxmcXzX
	pgAoIrP6u4uyAt7Fd/3rVMP7py5SMNLFompkKYpmJeQA7GXdKhDSUpMIZV9D2dwcFQQE
	S4ZE9fa/6L9sp4v8pxiZeiEjZ6VyClc56p2zRNP9Q9DE/XZfwZQogvaGs0XU0uouAFa0
	M1/fVDJWNe9/+Jcp5ufFVUe+rVjUGjmIO3JxIJAuqPpg8QJcfSQ8Fe5R2rgBqtlT5ZGz
	7xSt6Hvz1B5rsRxsk1TCJcj8+Lpt+yWXzDB4mfyadc5/bxK19ZQnZ6r3WZraqL4YdGG5
	hIyg==
X-Gm-Message-State: AMCzsaU/C/mWPiqOGsXNAYObfcVx3jqNo4xlXaihem1alWLfcYHlhpSP
	AxSN+FKPNPTWuoU7RjOcx1o=
X-Google-Smtp-Source: AOwi7QDhc3xZtdFblidHoT5XGqkDYBcMJPiAMZtCTcaKpo6VDlaXr0Sk6CLBXvpB6Wj4Q3UBj7pPWA==
X-Received: by 10.55.200.27 with SMTP id c27mr16608585qkj.115.1508199258758;
	Mon, 16 Oct 2017 17:14:18 -0700 (PDT)
Received: from x1.local ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id r6sm5409043qkh.22.2017.10.16.17.14.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Oct 2017 17:14:18 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Mon, 16 Oct 2017 21:12:06 -0300
Message-Id: <20171017001209.32276-37-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.0.rc0
In-Reply-To: <20171017001209.32276-1-f4bug@amsat.org>
References: <20171017001209.32276-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: [Qemu-trivial] [PATCH v2 36/39] i386/pc: move pvpanic.c from
 hw/misc/ to hw/i386/
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
X-List-Received-Date: Tue, 17 Oct 2017 00:14:23 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 default-configs/i386-softmmu.mak   | 1 -
 default-configs/x86_64-softmmu.mak | 1 -
 hw/{misc => i386}/pvpanic.c        | 0
 hw/i386/Makefile.objs              | 2 +-
 hw/misc/Makefile.objs              | 1 -
 5 files changed, 1 insertion(+), 4 deletions(-)
 rename hw/{misc => i386}/pvpanic.c (100%)

diff --git a/default-configs/i386-softmmu.mak b/default-configs/i386-softmmu.mak
index dbc4e65652..541ec8604d 100644
--- a/default-configs/i386-softmmu.mak
+++ b/default-configs/i386-softmmu.mak
@@ -46,7 +46,6 @@ CONFIG_LPC_ICH9=y
 CONFIG_PCI_Q35=y
 CONFIG_APIC=y
 CONFIG_IOAPIC=y
-CONFIG_PVPANIC=y
 CONFIG_MEM_HOTPLUG=y
 CONFIG_NVDIMM=y
 CONFIG_ACPI_NVDIMM=y
diff --git a/default-configs/x86_64-softmmu.mak b/default-configs/x86_64-softmmu.mak
index f1fe508ff4..23488d324f 100644
--- a/default-configs/x86_64-softmmu.mak
+++ b/default-configs/x86_64-softmmu.mak
@@ -46,7 +46,6 @@ CONFIG_LPC_ICH9=y
 CONFIG_PCI_Q35=y
 CONFIG_APIC=y
 CONFIG_IOAPIC=y
-CONFIG_PVPANIC=y
 CONFIG_MEM_HOTPLUG=y
 CONFIG_NVDIMM=y
 CONFIG_ACPI_NVDIMM=y
diff --git a/hw/misc/pvpanic.c b/hw/i386/pvpanic.c
similarity index 100%
rename from hw/misc/pvpanic.c
rename to hw/i386/pvpanic.c
diff --git a/hw/i386/Makefile.objs b/hw/i386/Makefile.objs
index feff56a9b7..41574096f1 100644
--- a/hw/i386/Makefile.objs
+++ b/hw/i386/Makefile.objs
@@ -7,6 +7,6 @@ obj-y += amd_iommu.o
 obj-$(CONFIG_XEN) += ../xenpv/ xen/
 
 obj-y += kvmvapic.o
-obj-y += acpi-build.o
+obj-y += acpi-build.o pvpanic.o
 obj-y += pci-assign-load-rom.o
 obj-y += vmport.o
diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
index 03bc758592..182f9a7d54 100644
--- a/hw/misc/Makefile.objs
+++ b/hw/misc/Makefile.objs
@@ -53,7 +53,6 @@ obj-$(CONFIG_MIPS_CPS) += mips_cpc.o
 obj-$(CONFIG_MIPS_ITU) += mips_itu.o
 obj-$(CONFIG_MPS2_SCC) += mps2-scc.o
 
-obj-$(CONFIG_PVPANIC) += pvpanic.o
 obj-$(CONFIG_HYPERV_TESTDEV) += hyperv_testdev.o
 obj-$(CONFIG_AUX) += auxbus.o
 obj-$(CONFIG_ASPEED_SOC) += aspeed_scu.o aspeed_sdmc.o
-- 
2.15.0.rc0


