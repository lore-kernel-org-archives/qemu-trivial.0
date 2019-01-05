Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gfbsM-0002nM-8B
	for mharc-qemu-trivial@gnu.org; Fri, 04 Jan 2019 21:39:50 -0500
Received: from eggsout.gnu.org ([209.51.188.92]:53071 helo=eggs.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <liq3ea@163.com>) id 1gfbsK-0002mv-TP
	for qemu-trivial@nongnu.org; Fri, 04 Jan 2019 21:39:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <liq3ea@163.com>) id 1gfbsK-0007rz-5Y
	for qemu-trivial@nongnu.org; Fri, 04 Jan 2019 21:39:48 -0500
Received: from m12-11.163.com ([220.181.12.11]:51677)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <liq3ea@163.com>)
	id 1gfbsF-0007qK-J9; Fri, 04 Jan 2019 21:39:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=gv+VD1uLx0OKGE0AyR
	oqWQpjIOUvKDftyiSbzTToFe8=; b=Y+bSTq3DwaOTiYK5pfQkpL7lsfqjxAX4cv
	ooiaI2GBp1lkbpUWJPLpmQDbQSGD41527yp1lFXsG4u2Qj8dwBQX8ZmJ0QOEXxBn
	aNEO6zl5rCiJEv0MQcQZ0Bd7Q11OiyNVD6IaRhoe8okGUDH1R/IVTZSg32RsVKe9
	lNkip2IFM=
Received: from localhost.localdomain (unknown [183.134.169.2])
	by smtp7 (Coremail) with SMTP id C8CowAC3HVzqGDBcIwPtDA--.8700S2;
	Sat, 05 Jan 2019 10:39:39 +0800 (CST)
From: Li Qiang <liq3ea@163.com>
To: mst@redhat.com, marcel.apfelbaum@gmail.com, pbonzini@redhat.com,
	rth@twiddle.net, ehabkost@redhat.com
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, lvivier@redhat.com,
	Li Qiang <liq3ea@163.com>
Date: Fri,  4 Jan 2019 18:38:31 -0800
Message-Id: <20190105023831.66910-1-liq3ea@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: C8CowAC3HVzqGDBcIwPtDA--.8700S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Kr1rAFW7Xr47ur1fJrWDurg_yoW8uw13pF
	Z7ZF4Fk3yDJF4kJFnrJFsFkFyrGr4kuF1DJF95u3yfAr15AryrJFsrKF18Z345WrWxAFW5
	XF9Ig345ArWDX3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UbBMiUUUUU=
X-Originating-IP: [183.134.169.2]
X-CM-SenderInfo: 5oltjvrd6rljoofrz/1tbitBUzbVSIaMyIBAAAsL
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 220.181.12.11
Subject: [Qemu-trivial] [PATCH] ioapic: use TYPE_FOO MACRO than constant
 string
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
X-List-Received-Date: Sat, 05 Jan 2019 02:39:49 -0000

Make them more QOMConventional.
Cc:qemu-trivial@nongnu.org

Signed-off-by: Li Qiang <liq3ea@163.com>
---
 hw/i386/kvm/ioapic.c     | 2 +-
 hw/i386/pc.c             | 4 ++--
 hw/intc/ioapic.c         | 2 +-
 include/hw/i386/ioapic.h | 3 +++
 4 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/hw/i386/kvm/ioapic.c b/hw/i386/kvm/ioapic.c
index 5b40d75439..e453692199 100644
--- a/hw/i386/kvm/ioapic.c
+++ b/hw/i386/kvm/ioapic.c
@@ -163,7 +163,7 @@ static void kvm_ioapic_class_init(ObjectClass *klass, void *data)
 }
 
 static const TypeInfo kvm_ioapic_info = {
-    .name  = "kvm-ioapic",
+    .name  = TYPE_KVM_IOAPIC,
     .parent = TYPE_IOAPIC_COMMON,
     .instance_size = sizeof(KVMIOAPICState),
     .class_init = kvm_ioapic_class_init,
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index f248662e97..af68a61615 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1665,9 +1665,9 @@ void ioapic_init_gsi(GSIState *gsi_state, const char *parent_name)
     unsigned int i;
 
     if (kvm_ioapic_in_kernel()) {
-        dev = qdev_create(NULL, "kvm-ioapic");
+        dev = qdev_create(NULL, TYPE_KVM_IOAPIC);
     } else {
-        dev = qdev_create(NULL, "ioapic");
+        dev = qdev_create(NULL, TYPE_IOAPIC);
     }
     if (parent_name) {
         object_property_add_child(object_resolve_path(parent_name, NULL),
diff --git a/hw/intc/ioapic.c b/hw/intc/ioapic.c
index 4e529729b4..9d75f84d3b 100644
--- a/hw/intc/ioapic.c
+++ b/hw/intc/ioapic.c
@@ -429,7 +429,7 @@ static void ioapic_class_init(ObjectClass *klass, void *data)
 }
 
 static const TypeInfo ioapic_info = {
-    .name          = "ioapic",
+    .name          = TYPE_IOAPIC,
     .parent        = TYPE_IOAPIC_COMMON,
     .instance_size = sizeof(IOAPICCommonState),
     .class_init    = ioapic_class_init,
diff --git a/include/hw/i386/ioapic.h b/include/hw/i386/ioapic.h
index 9c8816f11f..59fcb158a7 100644
--- a/include/hw/i386/ioapic.h
+++ b/include/hw/i386/ioapic.h
@@ -23,6 +23,9 @@
 #define IOAPIC_NUM_PINS 24
 #define IO_APIC_DEFAULT_ADDRESS 0xfec00000
 
+#define TYPE_KVM_IOAPIC "kvm-ioapic"
+#define TYPE_IOAPIC "ioapic"
+
 void ioapic_eoi_broadcast(int vector);
 
 #endif /* HW_IOAPIC_H */
-- 
2.17.1



