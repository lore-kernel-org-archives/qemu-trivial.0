Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ePgjo-0003R3-Id
	for mharc-qemu-trivial@gnu.org; Thu, 14 Dec 2017 22:32:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35531)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgjm-0003OZ-5L
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 22:32:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgjl-0006Td-9X
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 22:32:38 -0500
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:46950)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgjg-0006IE-UX; Thu, 14 Dec 2017 22:32:32 -0500
Received: by mail-qt0-x241.google.com with SMTP id r39so10551799qtr.13;
	Thu, 14 Dec 2017 19:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=XoPo/RZmR9MSg/VyfmEeOtUBI6JhBlsnNzYpQBrgs2I=;
	b=Gsm4qE2m0oFmv6MWuZuGXyoDZlBtuDXn6hvHXHZQUuvhcc1m+Paf8UlnzGV7MIeJm4
	zOi+Mfx+tXmxRtu14Vsd21I3lPTg63cCsv6AmgFXOzSvsU/1SnXphUZvXI4ypN8n4x8v
	JvksaAzQJVhFcwUHvpmP+3ZMzIMxWVb3UgTSx9T0ZdpCxG05cDsRGGKQoOS3OLBf++RJ
	nH5Qc9+ZhAKiX3fbLk83jQY1lei6dTaWiIIc43L47gClD/SCAaIsETth5gP2dZifFFn2
	gbl5v3+JAu4m9Kx5E4hyYqIC/Nt/2MAQOS/OVD2mMh02m5GIRaObebdMSjoqAUxuc+vf
	G/EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=XoPo/RZmR9MSg/VyfmEeOtUBI6JhBlsnNzYpQBrgs2I=;
	b=OWbm/XH5CKfCpGrenFV3VGs/ch067aBWot52haK9eTWB9EcyaW4uDRFNts3titdJZx
	x9bnyOq7umIo9xnzXY1mP0giMs5YHe275s3WifpxyJoHCitybAD1g0aas6qX61Qo4pFY
	sJ/kp38gfn4hZ09eoA9akQ64RcBDF9qQ0sx/cPXhNDLOYRr+ghVKJTaf2naybJ9VN22K
	Q4v/UdSBbznxpzNmrNyKKSnwiek6OrPNsxDUE3CY8MNVle6zw0wnYzqBGdGHCfg7uXgk
	BzGGCKSJeYl63P8w7JYMYEooaHY8VW3k5Y9dqOwcm/XnGAGNL3a+3nhK9RRCeX/rMtGb
	wPig==
X-Gm-Message-State: AKGB3mKCL4+YKkDi4a6G4kUt4fZcNjUf2R9joVut0LN8VsCEdwmFMXbn
	Qhw6qK/e6Hhv0hq4gu8Uavg=
X-Google-Smtp-Source: ACJfBov5Y0WxSahu9NH8Za5kfYChENUNUPF5VqoM53FvoTTZgaaV+N9suV0qJ38i4cJ7ZDBAjwECEg==
X-Received: by 10.200.50.116 with SMTP id y49mr20256336qta.10.1513308752497;
	Thu, 14 Dec 2017 19:32:32 -0800 (PST)
Received: from x1.local ([181.91.222.165]) by smtp.gmail.com with ESMTPSA id
	q24sm3794605qkq.63.2017.12.14.19.32.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Dec 2017 19:32:31 -0800 (PST)
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
Date: Fri, 15 Dec 2017 00:30:06 -0300
Message-Id: <20171215033015.738-35-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171215033015.738-1-f4bug@amsat.org>
References: <20171215033015.738-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-trivial] [PATCH v4 34/43] hw/acpi/ich9: extract
 ACPI_PM_PROP_TCO_ENABLED from i386/pc
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
X-List-Received-Date: Fri, 15 Dec 2017 03:32:39 -0000

enable_tco is specific to i386/pc.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 include/hw/acpi/ich9.h | 2 ++
 include/hw/i386/pc.h   | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/hw/acpi/ich9.h b/include/hw/acpi/ich9.h
index a352c94fde..59aeb06393 100644
--- a/include/hw/acpi/ich9.h
+++ b/include/hw/acpi/ich9.h
@@ -63,6 +63,8 @@ typedef struct ICH9LPCPMRegs {
     TCOIORegs tco_regs;
 } ICH9LPCPMRegs;
 
+#define ACPI_PM_PROP_TCO_ENABLED "enable_tco"
+
 void ich9_pm_init(PCIDevice *lpc_pci, ICH9LPCPMRegs *pm,
                   bool smm_enabled,
                   qemu_irq sci_irq);
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 252526e600..3794473108 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -151,8 +151,6 @@ struct PCMachineClass {
 #define PC_MACHINE_CLASS(klass) \
     OBJECT_CLASS_CHECK(PCMachineClass, (klass), TYPE_PC_MACHINE)
 
-#define ACPI_PM_PROP_TCO_ENABLED "enable_tco"
-
 /* parallel.c */
 
 void parallel_hds_isa_init(ISABus *bus, int n);
-- 
2.15.1


