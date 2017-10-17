Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4V15-0002mo-CG
	for mharc-qemu-trivial@gnu.org; Tue, 17 Oct 2017 12:46:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47404)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4V10-0002iF-NL
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 12:46:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4V10-0003j0-1D
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 12:46:50 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:51386)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4V0x-0003hp-Tv; Tue, 17 Oct 2017 12:46:47 -0400
Received: by mail-qk0-x243.google.com with SMTP id 17so2819733qkq.8;
	Tue, 17 Oct 2017 09:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=mUyULARCrODKwvARoNwGEDj8rUT0zNCfSozT3++jstc=;
	b=BrSK1WW+YzrKOg5mhsptJG3ZPs8yOlEBYRl6mi4B9QGom5BimDQ3r63jcCENPikuIW
	VUw4sX2GPbEugj8IMSGdNgLT1o04R8SyZdreCcLKc5CqCESTBWvUCXGCUhd4Y/a7EZfw
	pZXAlxrYA4ppzlVe2ZzNOsQlyZG2kvaziuDtSGia4PwBvGPbOm4btE+NkXDym/pnHcx/
	mCUIHqaV7RYD1oq1xUgpZliXKBSDgYVu7iiGnLd7tdNEXudnZClm5GY8s8lLLirj/nhF
	/1TFOyqCwdMneNCov+BJHKEwocv8033OGW9cJ54s3CQ6TikcHhxNltKfvUP9T+sE+3Xv
	2GcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=mUyULARCrODKwvARoNwGEDj8rUT0zNCfSozT3++jstc=;
	b=r12KAl618XUVY0jUFU0t2E/yeoLEkvS41UPwAfaKwf66kqRvyiCMk86vXbDPSb4YWa
	cTuNXovNDsC3KX1DwxWhdx4fYDVFmyr1b5U0+htVJNJQBZ/pg+aTvc5nCzdQh4BipsRT
	nZ8qAhMtKOPjHBY+NfNFEFjWCKPTcZpt3jcANaLbtBBCSrm/FLwFzF+gkYSZiycr2n4J
	oPdpOc0iePacqIZAll1F8xXM85X+byP/d9WXxjsJ5tSygkblr9Lkd5XpEcTer1uTakxv
	POStO+t6s5RosiW7KPFkfrNRc7FEEH/idU2LaoUURbCxlbgdvSDPnSTIMHIW77Fe2z7F
	96hQ==
X-Gm-Message-State: AMCzsaVNWRN7/VAOGrv/s732MjI5mnpvKYFxJgbjCvFaIWhXD21vlCO2
	+QFNNbrnYsJ+MQx9GQBpcnE=
X-Google-Smtp-Source: ABhQp+SZKIHlDfwayBm5GXo1ufMPh+TVGdDWS5DEtOrSTh5FCAZPAZ9Cr2R/09nRijcMsNEWbo+IPA==
X-Received: by 10.55.160.135 with SMTP id j129mr18195999qke.274.1508258807460; 
	Tue, 17 Oct 2017 09:46:47 -0700 (PDT)
Received: from x1.local ([181.93.89.178]) by smtp.gmail.com with ESMTPSA id
	q49sm6687653qtq.80.2017.10.17.09.46.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Oct 2017 09:46:46 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Michael Tokarev <mjt@tls.msk.ru>, Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Tue, 17 Oct 2017 13:44:18 -0300
Message-Id: <20171017164426.25277-35-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.0.rc0
In-Reply-To: <20171017164426.25277-1-f4bug@amsat.org>
References: <20171017164426.25277-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: [Qemu-trivial] [PATCH v3 34/42] hw/acpi/ich9: extract
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
X-List-Received-Date: Tue, 17 Oct 2017 16:46:51 -0000

enable_tco is specific to i386/pc.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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
index 6335e2bf47..b1b4c918af 100644
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
2.15.0.rc0


