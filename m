Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4FWZ-0007OX-MM
	for mharc-qemu-trivial@gnu.org; Mon, 16 Oct 2017 20:14:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34340)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FWW-0007LO-DP
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 20:14:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FWT-00050q-9X
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 20:14:20 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:43476)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FWQ-0004yJ-SB; Mon, 16 Oct 2017 20:14:14 -0400
Received: by mail-qt0-x244.google.com with SMTP id j58so80617qtj.0;
	Mon, 16 Oct 2017 17:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=xQ0BUrqOTBr2242YTc97Gf98kMMY/BNwgwnn+L3Tc/8=;
	b=GnNqilIc0BZHphSNIXY82BCyS2ghyZvI6/SnZNX/ETpSNBCrcWBLr20EXPVX4A0/mC
	H2iF4/wSY45Ab11buoM3N6d/BASm41L6d08CVv34OIcMSrzKJbfNEloa4MS8Se8uo+Ya
	pTC8HH3EKghoCJ3o5qgEWll2VWr3er7S3iksLtlNbVG/NPLieM98I1i0KI//cJMrOpcv
	6L4UiCxfDIuvXNoDIPYeJJWUWlCdKJbED3xVEIE2a/TK6TwwlC38r+0E3NVgVcQkciN1
	4sRttjD9dz+pHCMIbg/E2vDvi2AkHOnPuATSbqypIu/YpI/11C9xytVZNjRUiu026NMb
	0bHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=xQ0BUrqOTBr2242YTc97Gf98kMMY/BNwgwnn+L3Tc/8=;
	b=gHJGf/yiFDxJi2N95C4YHSYA6jbbUgKqhZa3TgNXnZ6Oi9LYlSC7bDWwfza8yixigA
	6YjM+hCnlxzRKDN07dHKcM5OKJe+fRluS9Nf2MwB0RM2TvJVCu6phOX3cdlaK2DzpsK1
	OlYPGMk4rMj7zV3W9Plf4MrkqJpNCKni23DE9dHChrYyyloLMVcNaQBjAmtBRsSlDMWy
	gB4pZjY9Cn+IW5Hw32cDjlcp9D0LefG81kLIz5hRem2OddkxpuTxRKmhXA6JWebZmdQk
	kcIe0b8mRX69pHBPvb7rkhIZHVJfkambMyqIHtLHTHWmg/ypRY7rWzq6bosceapxsRO4
	EB9A==
X-Gm-Message-State: AMCzsaVEnY9wqmYunXHsC6lvqCi5tEKFHgQMmzr9OTZq5CvGs9EfTTB9
	i91HK5o4OJIwZ0Cku85xUIU=
X-Google-Smtp-Source: ABhQp+SyRDkmd43iXMR3yl1+PgNpKOWrVkHwdCOC7abGkJHPfHuBcMuA+cbp7+0WUHW7XvqPymDdyw==
X-Received: by 10.200.47.187 with SMTP id l56mr16799713qta.319.1508199254451; 
	Mon, 16 Oct 2017 17:14:14 -0700 (PDT)
Received: from x1.local ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id r6sm5409043qkh.22.2017.10.16.17.14.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Oct 2017 17:14:13 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Mon, 16 Oct 2017 21:12:05 -0300
Message-Id: <20171017001209.32276-36-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.0.rc0
In-Reply-To: <20171017001209.32276-1-f4bug@amsat.org>
References: <20171017001209.32276-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-trivial] [PATCH v2 35/39] i386/pc: move vmport.c from
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
X-List-Received-Date: Tue, 17 Oct 2017 00:14:21 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 default-configs/i386-softmmu.mak   | 1 -
 default-configs/x86_64-softmmu.mak | 1 -
 hw/{misc => i386}/vmport.c         | 0
 hw/i386/Makefile.objs              | 1 +
 hw/misc/Makefile.objs              | 2 --
 5 files changed, 1 insertion(+), 4 deletions(-)
 rename hw/{misc => i386}/vmport.c (100%)

diff --git a/default-configs/i386-softmmu.mak b/default-configs/i386-softmmu.mak
index d2ab2f6655..dbc4e65652 100644
--- a/default-configs/i386-softmmu.mak
+++ b/default-configs/i386-softmmu.mak
@@ -41,7 +41,6 @@ CONFIG_PCI_PIIX=y
 CONFIG_WDT_IB700=y
 CONFIG_ISA_DEBUG=y
 CONFIG_ISA_TESTDEV=y
-CONFIG_VMPORT=y
 CONFIG_SGA=y
 CONFIG_LPC_ICH9=y
 CONFIG_PCI_Q35=y
diff --git a/default-configs/x86_64-softmmu.mak b/default-configs/x86_64-softmmu.mak
index 9bde2f1c4b..f1fe508ff4 100644
--- a/default-configs/x86_64-softmmu.mak
+++ b/default-configs/x86_64-softmmu.mak
@@ -41,7 +41,6 @@ CONFIG_PCI_PIIX=y
 CONFIG_WDT_IB700=y
 CONFIG_ISA_DEBUG=y
 CONFIG_ISA_TESTDEV=y
-CONFIG_VMPORT=y
 CONFIG_SGA=y
 CONFIG_LPC_ICH9=y
 CONFIG_PCI_Q35=y
diff --git a/hw/misc/vmport.c b/hw/i386/vmport.c
similarity index 100%
rename from hw/misc/vmport.c
rename to hw/i386/vmport.c
diff --git a/hw/i386/Makefile.objs b/hw/i386/Makefile.objs
index 909ead6a77..feff56a9b7 100644
--- a/hw/i386/Makefile.objs
+++ b/hw/i386/Makefile.objs
@@ -9,3 +9,4 @@ obj-$(CONFIG_XEN) += ../xenpv/ xen/
 obj-y += kvmvapic.o
 obj-y += acpi-build.o
 obj-y += pci-assign-load-rom.o
+obj-y += vmport.o
diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
index 19202d90cf..03bc758592 100644
--- a/hw/misc/Makefile.objs
+++ b/hw/misc/Makefile.objs
@@ -11,8 +11,6 @@ common-obj-$(CONFIG_EDU) += edu.o
 common-obj-y += unimp.o
 common-obj-y += vmcoreinfo.o
 
-obj-$(CONFIG_VMPORT) += vmport.o
-
 # ARM devices
 common-obj-$(CONFIG_PL310) += arm_l2x0.o
 common-obj-$(CONFIG_INTEGRATOR_DEBUG) += arm_integrator_debug.o
-- 
2.15.0.rc0


