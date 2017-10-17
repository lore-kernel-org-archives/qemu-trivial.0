Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4V1U-0003Ge-8i
	for mharc-qemu-trivial@gnu.org; Tue, 17 Oct 2017 12:47:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47697)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4V1N-000369-Pq
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 12:47:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4V1M-0003uC-Sz
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 12:47:13 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:57085)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4V1K-0003tG-PB; Tue, 17 Oct 2017 12:47:10 -0400
Received: by mail-qt0-x242.google.com with SMTP id z28so4903580qtz.13;
	Tue, 17 Oct 2017 09:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ZdE2/u31aPItGjDO4IDaM2er9Gg82Xp1BcEcbbT5J5s=;
	b=SWewvzLbpaLOu07xchHaNy5nvHS+wFSWrKvKYQKehoOWxNzUqCQe6/66JOJnkTDiB6
	1gnMcs9cUsK3T0yWlcczJY44AmWeYabf9E+OfkZbRsXRUFwxElHR09QKF7suho0X2XdP
	KUDFAADu7T4l6Apa0X5IwBx4Y/vAl7O7qNDTiLFdYu5Gp9xSU2DeshndGIzisuBPqnNQ
	U4D8LV6YtukEhN6HrYNlcCYT1HEJHdRv0wiTS+9hqQ/uaXLqJlICY90Q+kLzoCkbddr4
	tuTXRAtc2803yCa5zEXgBaRuOR74I8AQxn83Z7deikm0iEv8XWi+TDOQAx5E5QvsYEEH
	t+6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=ZdE2/u31aPItGjDO4IDaM2er9Gg82Xp1BcEcbbT5J5s=;
	b=DFIW0sNUT4E1PyAGRLNYBaU7H7eEOEv2T48YCrsx+zqQlIYovTJwcNzQYSP77P/Rt3
	HvXEOfhcvb6ikPpMe1fxl+vKWDabsFC5dIJf9yqQc3SFhiI7/FwgGi+yp06cUD0dxlUI
	bSvq2Xoe3awNmvz4KKUKCaEiP7++ZnKXzPdyOcvowWryXnLdGl50ip5QMuTSxjqHkXKW
	rBhRIsRRQF6Bqj+h57soPkoChh6Q+BoQWsQq5BvlFw37mKXkL2OFBGxwSZ9D544Kerqq
	U9Ag81bAmMAKnaRx+dnDSFJt5Cm5h2aszFofhVah0b4QGaFa8LjCNXVSf4wEUcKJ9n2q
	EFIg==
X-Gm-Message-State: AMCzsaWJQy2U3WZxrm48jDUBQx2P5G1cWa8OewH/HI2/w6o2HEfhuK9p
	dFDa9l4hDzfJVGD/3wB+A1aKfDTezws=
X-Google-Smtp-Source: ABhQp+SAxHNwY0ZTwu9EhQkOa2xZlLEvzsy3uz/skqYPVVkgysilt3fTOsV4fVozQ++lwV2P3Gr/DQ==
X-Received: by 10.200.50.15 with SMTP id x15mr19043789qta.302.1508258830238;
	Tue, 17 Oct 2017 09:47:10 -0700 (PDT)
Received: from x1.local ([181.93.89.178]) by smtp.gmail.com with ESMTPSA id
	q49sm6687653qtq.80.2017.10.17.09.47.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Oct 2017 09:47:09 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Tue, 17 Oct 2017 13:44:24 -0300
Message-Id: <20171017164426.25277-41-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.0.rc0
In-Reply-To: <20171017164426.25277-1-f4bug@amsat.org>
References: <20171017164426.25277-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-trivial] [PATCH v3 40/42] i386/pc: move vmport.c to hw/i386/
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
X-List-Received-Date: Tue, 17 Oct 2017 16:47:18 -0000

It's a x86-only device, so it does not make sense to keep it
in the shared misc folder.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/{misc => i386}/vmport.c | 0
 hw/i386/Makefile.objs      | 1 +
 hw/misc/Makefile.objs      | 2 --
 3 files changed, 1 insertion(+), 2 deletions(-)
 rename hw/{misc => i386}/vmport.c (100%)

diff --git a/hw/misc/vmport.c b/hw/i386/vmport.c
similarity index 100%
rename from hw/misc/vmport.c
rename to hw/i386/vmport.c
diff --git a/hw/i386/Makefile.objs b/hw/i386/Makefile.objs
index 909ead6a77..64a461c929 100644
--- a/hw/i386/Makefile.objs
+++ b/hw/i386/Makefile.objs
@@ -5,6 +5,7 @@ obj-y += pc_sysfw.o
 obj-y += x86-iommu.o intel_iommu.o
 obj-y += amd_iommu.o
 obj-$(CONFIG_XEN) += ../xenpv/ xen/
+obj-$(CONFIG_VMPORT) += vmport.o
 
 obj-y += kvmvapic.o
 obj-y += acpi-build.o
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


