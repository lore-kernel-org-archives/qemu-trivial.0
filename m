Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ePgkA-0003n9-0W
	for mharc-qemu-trivial@gnu.org; Thu, 14 Dec 2017 22:33:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35878)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgk7-0003kO-Lb
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 22:33:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgk6-0006wI-E9
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 22:32:59 -0500
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:44189)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgk3-0006t7-Vj; Thu, 14 Dec 2017 22:32:56 -0500
Received: by mail-qt0-x242.google.com with SMTP id m59so10550375qte.11;
	Thu, 14 Dec 2017 19:32:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=6TkBvKqs/HPy10vsij4QQ5Q0y/71VQSpDwmmh+UDQGs=;
	b=mtcjaEnB9EnLzcy5FEZRzKdrKJZdsbuvEi5w9+Ty2rVXYtBAtOpbYkUeuLAhpvryK+
	opF8UWO3layQk8iTL3UyBpBt9PWAdKHXuaxBRi2amEsum/GnsiiyxhjnOefJHzLBKipf
	DSb85Q5lW4ty6IoQPlgUPhiMXH2+7KnVudldgVPalXKF6qme9mmmU5LIQqWBQZjSoDtF
	uhzfk9zUNJXnI60h3ed1iRD4hFD161HSBqHpmBNsDwDIhVhJxMlxWgy0+86dQt2gDizF
	yAROUMR4RWc3P1mbGP5LNFGoVCF+xXoZoZJQDkhE2wprj6WYQWeAashPp47nlSRNRKN9
	af5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=6TkBvKqs/HPy10vsij4QQ5Q0y/71VQSpDwmmh+UDQGs=;
	b=KDh2BkanWgYwqYFo6j8c8pWPH7riaBwn1oo+ktHOGF0zYYcaIqrZ148tdPBTMWvOzo
	uZn7Al294lSDYG67aKysHTbAZCuDVgkcew9kCmvLawgazNeKDPvVHXcpbbI1stYMB2V+
	MeYTi2RUZTNyix0h5foQGAB2XbWZXk2z/n6ciRxz96br+ywtyZL/qfaklfobsgPS53HR
	I5t2gyxcFITJMVPJbJfnvYkhYHpWc1AGPHm5GfF952q1mD/OJkM1naAYaLbQWBcHvd7+
	hrGh6CrbYQZARdi6SLX+jxyRrFSmx/dVEAP2bVqfT2dmN3nXp/ykBpiKAye1rjd5eQRJ
	fxWA==
X-Gm-Message-State: AKGB3mI90xbDYxXnL75oamaEiHEc85ITyQyzPwiYV8MKEwmtLT0BLY7h
	TtJMGf/CgK7HS+8eoA1jpc8=
X-Google-Smtp-Source: ACJfBouo7RzCJW6mv47q8lIjEnoQ/zLWAauKNEYyVcxBnMpJk+pMDYqKaG+vo9mcn2YkoiDnYk1cxA==
X-Received: by 10.237.42.123 with SMTP id k56mr19760701qtf.175.1513308775493; 
	Thu, 14 Dec 2017 19:32:55 -0800 (PST)
Received: from x1.local ([181.91.222.165]) by smtp.gmail.com with ESMTPSA id
	q24sm3794605qkq.63.2017.12.14.19.32.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Dec 2017 19:32:54 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: "Michael S. Tsirkin" <mst@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org,
	Richard Henderson <rth@twiddle.net>
Date: Fri, 15 Dec 2017 00:30:12 -0300
Message-Id: <20171215033015.738-41-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171215033015.738-1-f4bug@amsat.org>
References: <20171215033015.738-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-trivial] [PATCH v4 40/43] i386/pc: move vmport.c to hw/i386/
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
X-List-Received-Date: Fri, 15 Dec 2017 03:33:00 -0000

It's a x86-only device, so it does not make sense to keep it
in the shared misc folder.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 hw/{misc => i386}/vmport.c | 17 +++++++++--------
 hw/i386/Makefile.objs      |  1 +
 hw/misc/Makefile.objs      |  2 --
 3 files changed, 10 insertions(+), 10 deletions(-)
 rename hw/{misc => i386}/vmport.c (95%)

diff --git a/hw/misc/vmport.c b/hw/i386/vmport.c
similarity index 95%
rename from hw/misc/vmport.c
rename to hw/i386/vmport.c
index 165500223f..eb880c6def 100644
--- a/hw/misc/vmport.c
+++ b/hw/i386/vmport.c
@@ -28,7 +28,7 @@
 #include "sysemu/hw_accel.h"
 #include "hw/qdev.h"
 
-//#define VMPORT_DEBUG
+/* #define VMPORT_DEBUG */
 
 #define VMPORT_CMD_GETVERSION 0x0a
 #define VMPORT_CMD_GETRAMSIZE 0x14
@@ -38,8 +38,7 @@
 
 #define VMPORT(obj) OBJECT_CHECK(VMPortState, (obj), TYPE_VMPORT)
 
-typedef struct VMPortState
-{
+typedef struct VMPortState {
     ISADevice parent_obj;
 
     MemoryRegion io;
@@ -51,8 +50,9 @@ static VMPortState *port_state;
 
 void vmport_register(unsigned char command, VMPortReadFunc *func, void *opaque)
 {
-    if (command >= VMPORT_ENTRIES)
+    if (command >= VMPORT_ENTRIES) {
         return;
+    }
 
     port_state->func[command] = func;
     port_state->opaque[command] = opaque;
@@ -71,14 +71,15 @@ static uint64_t vmport_ioport_read(void *opaque, hwaddr addr,
     cpu_synchronize_state(cs);
 
     eax = env->regs[R_EAX];
-    if (eax != VMPORT_MAGIC)
+    if (eax != VMPORT_MAGIC) {
         return eax;
+    }
 
     command = env->regs[R_ECX];
-    if (command >= VMPORT_ENTRIES)
+    if (command >= VMPORT_ENTRIES) {
         return eax;
-    if (!s->func[command])
-    {
+    }
+    if (!s->func[command]) {
 #ifdef VMPORT_DEBUG
         fprintf(stderr, "vmport: unknown command %x\n", command);
 #endif
diff --git a/hw/i386/Makefile.objs b/hw/i386/Makefile.objs
index 2e5e1299ad..1548ad1ad0 100644
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
index 10c88a84b4..d517f83e81 100644
--- a/hw/misc/Makefile.objs
+++ b/hw/misc/Makefile.objs
@@ -11,8 +11,6 @@ common-obj-$(CONFIG_EDU) += edu.o
 common-obj-y += unimp.o
 common-obj-$(CONFIG_FW_CFG_DMA) += vmcoreinfo.o
 
-obj-$(CONFIG_VMPORT) += vmport.o
-
 # ARM devices
 common-obj-$(CONFIG_PL310) += arm_l2x0.o
 common-obj-$(CONFIG_INTEGRATOR_DEBUG) += arm_integrator_debug.o
-- 
2.15.1


