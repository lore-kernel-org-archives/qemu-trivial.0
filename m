Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hQUF4-0006u9-Fn
	for mharc-qemu-trivial@gnu.org; Tue, 14 May 2019 06:01:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49356)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hQUEy-0006lu-Ts
	for qemu-trivial@nongnu.org; Tue, 14 May 2019 06:01:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hQUEu-000499-22
	for qemu-trivial@nongnu.org; Tue, 14 May 2019 06:00:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44300)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1hQUEa-0003PZ-QA; Tue, 14 May 2019 06:00:32 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 16A29883B8;
	Tue, 14 May 2019 10:00:32 +0000 (UTC)
Received: from thuth.com (ovpn-116-85.ams2.redhat.com [10.36.116.85])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2790E5C207;
	Tue, 14 May 2019 10:00:27 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-trivial@nongnu.org,
	philmd@redhat.com
Date: Tue, 14 May 2019 12:00:16 +0200
Message-Id: <20190514100019.13263-2-thuth@redhat.com>
In-Reply-To: <20190514100019.13263-1-thuth@redhat.com>
References: <20190514100019.13263-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Tue, 14 May 2019 10:00:32 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 1/4] hw/core: Add a config switch for the
 "register" device
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
X-List-Received-Date: Tue, 14 May 2019 10:01:01 -0000

The "register" device is only used by certain machines. Let's add
a proper config switch for it so that it only gets compiled when we
really need it.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/core/Kconfig       | 3 +++
 hw/core/Makefile.objs | 2 +-
 hw/dma/Kconfig        | 1 +
 hw/timer/Kconfig      | 1 +
 4 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/core/Kconfig b/hw/core/Kconfig
index c2a1ae8122..d11920fcb3 100644
--- a/hw/core/Kconfig
+++ b/hw/core/Kconfig
@@ -9,3 +9,6 @@ config FITLOADER
=20
 config PLATFORM_BUS
     bool
+
+config REGISTER
+    bool
diff --git a/hw/core/Makefile.objs b/hw/core/Makefile.objs
index a799c83815..d493a051ee 100644
--- a/hw/core/Makefile.objs
+++ b/hw/core/Makefile.objs
@@ -16,7 +16,7 @@ common-obj-$(CONFIG_SOFTMMU) +=3D machine.o
 common-obj-$(CONFIG_SOFTMMU) +=3D loader.o
 common-obj-$(CONFIG_FITLOADER) +=3D loader-fit.o
 common-obj-$(CONFIG_SOFTMMU) +=3D qdev-properties-system.o
-common-obj-$(CONFIG_SOFTMMU) +=3D register.o
+common-obj-$(CONFIG_REGISTER) +=3D register.o
 common-obj-$(CONFIG_SOFTMMU) +=3D or-irq.o
 common-obj-$(CONFIG_SOFTMMU) +=3D split-irq.o
 common-obj-$(CONFIG_PLATFORM_BUS) +=3D platform-bus.o
diff --git a/hw/dma/Kconfig b/hw/dma/Kconfig
index 751dec5426..5c61b67bc0 100644
--- a/hw/dma/Kconfig
+++ b/hw/dma/Kconfig
@@ -16,6 +16,7 @@ config I8257
=20
 config ZYNQ_DEVCFG
     bool
+    select REGISTER
=20
 config STP2000
     bool
diff --git a/hw/timer/Kconfig b/hw/timer/Kconfig
index 51921eb63f..f575481210 100644
--- a/hw/timer/Kconfig
+++ b/hw/timer/Kconfig
@@ -36,6 +36,7 @@ config TWL92230
=20
 config XLNX_ZYNQMP
     bool
+    select REGISTER
=20
 config ALTERA_TIMER
     bool
--=20
2.21.0


