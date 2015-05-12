Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ys151-0007RX-Mq
	for mharc-qemu-trivial@gnu.org; Mon, 11 May 2015 23:42:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44435)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1YrztY-0000uF-GO
	for qemu-trivial@nongnu.org; Mon, 11 May 2015 22:26:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1YrztT-0007xE-Pt
	for qemu-trivial@nongnu.org; Mon, 11 May 2015 22:26:08 -0400
Received: from mail-pa0-f43.google.com ([209.85.220.43]:35877)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1YrztT-0007wx-It
	for qemu-trivial@nongnu.org; Mon, 11 May 2015 22:26:03 -0400
Received: by pabsx10 with SMTP id sx10so126773270pab.3
	for <qemu-trivial@nongnu.org>; Mon, 11 May 2015 19:26:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=2A6jj72MZBiqxBueHrSr6CTu9NDrvrRhJlxs/F1g0Gc=;
	b=DiS0ZLoF+kZL7Wxr0B5TUuw7PIU/hk78BO21vnqKwUi9M33EqXmEVLWEtr4q3QHndp
	T4a2Fv8t3MdAtURNZCYd3YoRClLgE1oWfLdUzcIzXBoBQKkRWBB6owa3HGA9kokI3rie
	33blF0eCoUM+CKZJOpGBsgx9h4UJxgZnIDl535VEc+lj1X9s327jpKPC8a37CDSskecZ
	pyHklVC+8rmj9oFjl+GOtmh787mS2qeWwmKuhhR+8d+pZrbSiFn8/RMItVv5ZX50Gz6m
	sP+i9Qp5y7hyZETwRYZYKPt2dtM/vfkcMXG7sTcH98xTNPw6IFzz4cUusJex+9MpUX0W
	AH0A==
X-Gm-Message-State: ALoCoQl8SYuhR92iqZj83mYEF1PwstEhiC7K4X0CIl7uWGoOy5PXeuN4azlXQ6OX4B/yEHAKWobX
X-Received: by 10.68.250.229 with SMTP id zf5mr24300796pbc.158.1431397563117; 
	Mon, 11 May 2015 19:26:03 -0700 (PDT)
Received: from localhost ([180.150.141.243]) by mx.google.com with ESMTPSA id
	by8sm14430794pab.16.2015.05.11.19.26.00
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 11 May 2015 19:26:01 -0700 (PDT)
From: shannon.zhao@linaro.org
To: qemu-devel@nongnu.org
Date: Tue, 12 May 2015 10:25:21 +0800
Message-Id: <1431397521-2316-7-git-send-email-shannon.zhao@linaro.org>
X-Mailer: git-send-email 1.9.5.msysgit.1
In-Reply-To: <1431397521-2316-1-git-send-email-shannon.zhao@linaro.org>
References: <1431397521-2316-1-git-send-email-shannon.zhao@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.220.43
X-Mailman-Approved-At: Mon, 11 May 2015 23:42:02 -0400
Cc: peter.maydell@linaro.org, hangaohuai@huawei.com, qemu-trivial@nongnu.org,
	mjt@tls.msk.ru, peter.huangpeng@huawei.com,
	zhaoshenglong@huawei.com, christoffer.dall@linaro.org
Subject: [Qemu-trivial] [PATCH 6/6] Add comma after DEFINE_PROP_END_OF_LIST()
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 12 May 2015 02:26:11 -0000

From: Shannon Zhao <shannon.zhao@linaro.org>

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
 hw/audio/intel-hda.c               | 2 +-
 hw/char/virtio-serial-bus.c        | 2 +-
 hw/core/platform-bus.c             | 2 +-
 hw/dma/i82374.c                    | 2 +-
 hw/i386/kvm/ioapic.c               | 2 +-
 hw/i386/xen/xen_pvdevice.c         | 2 +-
 hw/ide/mmio.c                      | 2 +-
 hw/ipack/ipack.c                   | 2 +-
 hw/isa/pc87312.c                   | 2 +-
 hw/misc/arm11scu.c                 | 2 +-
 hw/misc/macio/cuda.c               | 2 +-
 hw/misc/macio/macio.c              | 2 +-
 hw/nvram/mac_nvram.c               | 2 +-
 hw/pci-bridge/ioh3420.c            | 2 +-
 hw/pci-bridge/xio3130_downstream.c | 2 +-
 hw/pci-host/prep.c                 | 2 +-
 hw/pci-host/versatile.c            | 2 +-
 hw/pci/pci.c                       | 2 +-
 hw/pci/pcie_port.c                 | 4 ++--
 hw/timer/a9gtimer.c                | 2 +-
 hw/timer/arm_mptimer.c             | 2 +-
 hw/usb/bus.c                       | 2 +-
 target-arm/cpu.c                   | 2 +-
 target-i386/cpu.c                  | 4 ++--
 tests/test-qdev-global-props.c     | 2 +-
 25 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/hw/audio/intel-hda.c b/hw/audio/intel-hda.c
index 433463e..d2b3f37 100644
--- a/hw/audio/intel-hda.c
+++ b/hw/audio/intel-hda.c
@@ -31,7 +31,7 @@
 
 static Property hda_props[] = {
     DEFINE_PROP_UINT32("cad", HDACodecDevice, cad, -1),
-    DEFINE_PROP_END_OF_LIST()
+    DEFINE_PROP_END_OF_LIST(),
 };
 
 static const TypeInfo hda_codec_bus_info = {
diff --git a/hw/char/virtio-serial-bus.c b/hw/char/virtio-serial-bus.c
index 16aa156..bce8842 100644
--- a/hw/char/virtio-serial-bus.c
+++ b/hw/char/virtio-serial-bus.c
@@ -776,7 +776,7 @@ static void virtser_bus_dev_print(Monitor *mon, DeviceState *qdev, int indent);
 static Property virtser_props[] = {
     DEFINE_PROP_UINT32("nr", VirtIOSerialPort, id, VIRTIO_CONSOLE_BAD_ID),
     DEFINE_PROP_STRING("name", VirtIOSerialPort, name),
-    DEFINE_PROP_END_OF_LIST()
+    DEFINE_PROP_END_OF_LIST(),
 };
 
 #define TYPE_VIRTIO_SERIAL_BUS "virtio-serial-bus"
diff --git a/hw/core/platform-bus.c b/hw/core/platform-bus.c
index 0f052b3..777428d 100644
--- a/hw/core/platform-bus.c
+++ b/hw/core/platform-bus.c
@@ -227,7 +227,7 @@ static void platform_bus_realize(DeviceState *dev, Error **errp)
 static Property platform_bus_properties[] = {
     DEFINE_PROP_UINT32("num_irqs", PlatformBusDevice, num_irqs, 0),
     DEFINE_PROP_UINT32("mmio_size", PlatformBusDevice, mmio_size, 0),
-    DEFINE_PROP_END_OF_LIST()
+    DEFINE_PROP_END_OF_LIST(),
 };
 
 static void platform_bus_class_init(ObjectClass *klass, void *data)
diff --git a/hw/dma/i82374.c b/hw/dma/i82374.c
index b8ad2e6..003153e 100644
--- a/hw/dma/i82374.c
+++ b/hw/dma/i82374.c
@@ -151,7 +151,7 @@ static void i82374_isa_realize(DeviceState *dev, Error **errp)
 
 static Property i82374_properties[] = {
     DEFINE_PROP_UINT32("iobase", ISAi82374State, iobase, 0x400),
-    DEFINE_PROP_END_OF_LIST()
+    DEFINE_PROP_END_OF_LIST(),
 };
 
 static void i82374_class_init(ObjectClass *klass, void *data)
diff --git a/hw/i386/kvm/ioapic.c b/hw/i386/kvm/ioapic.c
index d2a6c4c..8e39850 100644
--- a/hw/i386/kvm/ioapic.c
+++ b/hw/i386/kvm/ioapic.c
@@ -138,7 +138,7 @@ static void kvm_ioapic_realize(DeviceState *dev, Error **errp)
 
 static Property kvm_ioapic_properties[] = {
     DEFINE_PROP_UINT32("gsi_base", KVMIOAPICState, kvm_gsi_base, 0),
-    DEFINE_PROP_END_OF_LIST()
+    DEFINE_PROP_END_OF_LIST(),
 };
 
 static void kvm_ioapic_class_init(ObjectClass *klass, void *data)
diff --git a/hw/i386/xen/xen_pvdevice.c b/hw/i386/xen/xen_pvdevice.c
index c218947..c68d1ef 100644
--- a/hw/i386/xen/xen_pvdevice.c
+++ b/hw/i386/xen/xen_pvdevice.c
@@ -106,7 +106,7 @@ static Property xen_pv_props[] = {
     DEFINE_PROP_UINT16("device-id", XenPVDevice, device_id, 0xffff),
     DEFINE_PROP_UINT8("revision", XenPVDevice, revision, 0x01),
     DEFINE_PROP_UINT32("size", XenPVDevice, size, 0x400000),
-    DEFINE_PROP_END_OF_LIST()
+    DEFINE_PROP_END_OF_LIST(),
 };
 
 static void xen_pv_class_init(ObjectClass *klass, void *data)
diff --git a/hw/ide/mmio.c b/hw/ide/mmio.c
index b6ce62a..91142db 100644
--- a/hw/ide/mmio.c
+++ b/hw/ide/mmio.c
@@ -142,7 +142,7 @@ static void mmio_ide_initfn(Object *obj)
 
 static Property mmio_ide_properties[] = {
     DEFINE_PROP_UINT32("shift", MMIOState, shift, 0),
-    DEFINE_PROP_END_OF_LIST()
+    DEFINE_PROP_END_OF_LIST(),
 };
 
 static void mmio_ide_class_init(ObjectClass *oc, void *data)
diff --git a/hw/ipack/ipack.c b/hw/ipack/ipack.c
index 59bfe28..17577b6 100644
--- a/hw/ipack/ipack.c
+++ b/hw/ipack/ipack.c
@@ -71,7 +71,7 @@ static void ipack_device_unrealize(DeviceState *dev, Error **errp)
 
 static Property ipack_device_props[] = {
     DEFINE_PROP_INT32("slot", IPackDevice, slot, -1),
-    DEFINE_PROP_END_OF_LIST()
+    DEFINE_PROP_END_OF_LIST(),
 };
 
 static void ipack_device_class_init(ObjectClass *klass, void *data)
diff --git a/hw/isa/pc87312.c b/hw/isa/pc87312.c
index 3b1fcec..9c780fe 100644
--- a/hw/isa/pc87312.c
+++ b/hw/isa/pc87312.c
@@ -373,7 +373,7 @@ static const VMStateDescription vmstate_pc87312 = {
 static Property pc87312_properties[] = {
     DEFINE_PROP_UINT32("iobase", PC87312State, iobase, 0x398),
     DEFINE_PROP_UINT8("config", PC87312State, config, 1),
-    DEFINE_PROP_END_OF_LIST()
+    DEFINE_PROP_END_OF_LIST(),
 };
 
 static void pc87312_class_init(ObjectClass *klass, void *data)
diff --git a/hw/misc/arm11scu.c b/hw/misc/arm11scu.c
index a791675..7243f18 100644
--- a/hw/misc/arm11scu.c
+++ b/hw/misc/arm11scu.c
@@ -73,7 +73,7 @@ static void arm11_scu_init(Object *obj)
 
 static Property arm11_scu_properties[] = {
     DEFINE_PROP_UINT32("num-cpu", ARM11SCUState, num_cpu, 1),
-    DEFINE_PROP_END_OF_LIST()
+    DEFINE_PROP_END_OF_LIST(),
 };
 
 static void arm11_scu_class_init(ObjectClass *oc, void *data)
diff --git a/hw/misc/macio/cuda.c b/hw/misc/macio/cuda.c
index f3984e3..6f9d1dc 100644
--- a/hw/misc/macio/cuda.c
+++ b/hw/misc/macio/cuda.c
@@ -727,7 +727,7 @@ static void cuda_initfn(Object *obj)
 
 static Property cuda_properties[] = {
     DEFINE_PROP_UINT64("frequency", CUDAState, frequency, 0),
-    DEFINE_PROP_END_OF_LIST()
+    DEFINE_PROP_END_OF_LIST(),
 };
 
 static void cuda_class_init(ObjectClass *oc, void *data)
diff --git a/hw/misc/macio/macio.c b/hw/misc/macio/macio.c
index 063ad80..fc77162 100644
--- a/hw/misc/macio/macio.c
+++ b/hw/misc/macio/macio.c
@@ -379,7 +379,7 @@ static void macio_newworld_class_init(ObjectClass *oc, void *data)
 
 static Property macio_properties[] = {
     DEFINE_PROP_UINT64("frequency", MacIOState, frequency, 0),
-    DEFINE_PROP_END_OF_LIST()
+    DEFINE_PROP_END_OF_LIST(),
 };
 
 static void macio_class_init(ObjectClass *klass, void *data)
diff --git a/hw/nvram/mac_nvram.c b/hw/nvram/mac_nvram.c
index d35f8a3..986e56e 100644
--- a/hw/nvram/mac_nvram.c
+++ b/hw/nvram/mac_nvram.c
@@ -111,7 +111,7 @@ static void macio_nvram_unrealizefn(DeviceState *dev, Error **errp)
 static Property macio_nvram_properties[] = {
     DEFINE_PROP_UINT32("size", MacIONVRAMState, size, 0),
     DEFINE_PROP_UINT32("it_shift", MacIONVRAMState, it_shift, 0),
-    DEFINE_PROP_END_OF_LIST()
+    DEFINE_PROP_END_OF_LIST(),
 };
 
 static void macio_nvram_class_init(ObjectClass *oc, void *data)
diff --git a/hw/pci-bridge/ioh3420.c b/hw/pci-bridge/ioh3420.c
index cce2fdd..c02ba57 100644
--- a/hw/pci-bridge/ioh3420.c
+++ b/hw/pci-bridge/ioh3420.c
@@ -162,7 +162,7 @@ static void ioh3420_exitfn(PCIDevice *d)
 static Property ioh3420_props[] = {
     DEFINE_PROP_BIT(COMPAT_PROP_PCP, PCIDevice, cap_present,
                     QEMU_PCIE_SLTCAP_PCP_BITNR, true),
-    DEFINE_PROP_END_OF_LIST()
+    DEFINE_PROP_END_OF_LIST(),
 };
 
 static const VMStateDescription vmstate_ioh3420 = {
diff --git a/hw/pci-bridge/xio3130_downstream.c b/hw/pci-bridge/xio3130_downstream.c
index b3a6479..de8bc35 100644
--- a/hw/pci-bridge/xio3130_downstream.c
+++ b/hw/pci-bridge/xio3130_downstream.c
@@ -150,7 +150,7 @@ PCIESlot *xio3130_downstream_init(PCIBus *bus, int devfn, bool multifunction,
 static Property xio3130_downstream_props[] = {
     DEFINE_PROP_BIT(COMPAT_PROP_PCP, PCIDevice, cap_present,
                     QEMU_PCIE_SLTCAP_PCP_BITNR, true),
-    DEFINE_PROP_END_OF_LIST()
+    DEFINE_PROP_END_OF_LIST(),
 };
 
 static const VMStateDescription vmstate_xio3130_downstream = {
diff --git a/hw/pci-host/prep.c b/hw/pci-host/prep.c
index c63f45d..693be23 100644
--- a/hw/pci-host/prep.c
+++ b/hw/pci-host/prep.c
@@ -374,7 +374,7 @@ static Property raven_pcihost_properties[] = {
     DEFINE_PROP_UINT32("elf-machine", PREPPCIState, pci_dev.elf_machine,
                        EM_NONE),
     DEFINE_PROP_STRING("bios-name", PREPPCIState, pci_dev.bios_name),
-    DEFINE_PROP_END_OF_LIST()
+    DEFINE_PROP_END_OF_LIST(),
 };
 
 static void raven_pcihost_class_init(ObjectClass *klass, void *data)
diff --git a/hw/pci-host/versatile.c b/hw/pci-host/versatile.c
index 6d23553..4ff9421 100644
--- a/hw/pci-host/versatile.c
+++ b/hw/pci-host/versatile.c
@@ -489,7 +489,7 @@ static const TypeInfo versatile_pci_host_info = {
 static Property pci_vpb_properties[] = {
     DEFINE_PROP_UINT8("broken-irq-mapping", PCIVPBState, irq_mapping_prop,
                       PCI_VPB_IRQMAP_ASSUME_OK),
-    DEFINE_PROP_END_OF_LIST()
+    DEFINE_PROP_END_OF_LIST(),
 };
 
 static void pci_vpb_class_init(ObjectClass *klass, void *data)
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index f5c7a99..2c1afa9 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -58,7 +58,7 @@ static Property pci_props[] = {
                     QEMU_PCI_CAP_MULTIFUNCTION_BITNR, false),
     DEFINE_PROP_BIT("command_serr_enable", PCIDevice, cap_present,
                     QEMU_PCI_CAP_SERR_BITNR, true),
-    DEFINE_PROP_END_OF_LIST()
+    DEFINE_PROP_END_OF_LIST(),
 };
 
 static const VMStateDescription vmstate_pcibus = {
diff --git a/hw/pci/pcie_port.c b/hw/pci/pcie_port.c
index 40ca8d5..fd95cd7 100644
--- a/hw/pci/pcie_port.c
+++ b/hw/pci/pcie_port.c
@@ -123,7 +123,7 @@ static Property pcie_port_props[] = {
     DEFINE_PROP_UINT16("aer_log_max", PCIEPort,
                        parent_obj.parent_obj.exp.aer_log.log_max,
                        PCIE_AER_LOG_MAX_DEFAULT),
-    DEFINE_PROP_END_OF_LIST()
+    DEFINE_PROP_END_OF_LIST(),
 };
 
 static void pcie_port_class_init(ObjectClass *oc, void *data)
@@ -144,7 +144,7 @@ static const TypeInfo pcie_port_type_info = {
 static Property pcie_slot_props[] = {
     DEFINE_PROP_UINT8("chassis", PCIESlot, chassis, 0),
     DEFINE_PROP_UINT16("slot", PCIESlot, slot, 0),
-    DEFINE_PROP_END_OF_LIST()
+    DEFINE_PROP_END_OF_LIST(),
 };
 
 static void pcie_slot_class_init(ObjectClass *oc, void *data)
diff --git a/hw/timer/a9gtimer.c b/hw/timer/a9gtimer.c
index dd4aae8..06c934b 100644
--- a/hw/timer/a9gtimer.c
+++ b/hw/timer/a9gtimer.c
@@ -341,7 +341,7 @@ static const VMStateDescription vmstate_a9_gtimer = {
 
 static Property a9_gtimer_properties[] = {
     DEFINE_PROP_UINT32("num-cpu", A9GTimerState, num_cpu, 0),
-    DEFINE_PROP_END_OF_LIST()
+    DEFINE_PROP_END_OF_LIST(),
 };
 
 static void a9_gtimer_class_init(ObjectClass *klass, void *data)
diff --git a/hw/timer/arm_mptimer.c b/hw/timer/arm_mptimer.c
index 8b93b3c..25ad290 100644
--- a/hw/timer/arm_mptimer.c
+++ b/hw/timer/arm_mptimer.c
@@ -264,7 +264,7 @@ static const VMStateDescription vmstate_arm_mptimer = {
 
 static Property arm_mptimer_properties[] = {
     DEFINE_PROP_UINT32("num-cpu", ARMMPTimerState, num_cpu, 0),
-    DEFINE_PROP_END_OF_LIST()
+    DEFINE_PROP_END_OF_LIST(),
 };
 
 static void arm_mptimer_class_init(ObjectClass *klass, void *data)
diff --git a/hw/usb/bus.c b/hw/usb/bus.c
index 3751675..9a47005 100644
--- a/hw/usb/bus.c
+++ b/hw/usb/bus.c
@@ -18,7 +18,7 @@ static Property usb_props[] = {
                     USB_DEV_FLAG_FULL_PATH, true),
     DEFINE_PROP_BIT("msos-desc", USBDevice, flags,
                     USB_DEV_FLAG_MSOS_DESC_ENABLE, true),
-    DEFINE_PROP_END_OF_LIST()
+    DEFINE_PROP_END_OF_LIST(),
 };
 
 static void usb_bus_class_init(ObjectClass *klass, void *data)
diff --git a/target-arm/cpu.c b/target-arm/cpu.c
index 3ca3fa8..bfe6298 100644
--- a/target-arm/cpu.c
+++ b/target-arm/cpu.c
@@ -1194,7 +1194,7 @@ static Property arm_cpu_properties[] = {
     DEFINE_PROP_BOOL("start-powered-off", ARMCPU, start_powered_off, false),
     DEFINE_PROP_UINT32("psci-conduit", ARMCPU, psci_conduit, 0),
     DEFINE_PROP_UINT32("midr", ARMCPU, midr, 0),
-    DEFINE_PROP_END_OF_LIST()
+    DEFINE_PROP_END_OF_LIST(),
 };
 
 static void arm_cpu_class_init(ObjectClass *oc, void *data)
diff --git a/target-i386/cpu.c b/target-i386/cpu.c
index 3305e09..578e22f 100644
--- a/target-i386/cpu.c
+++ b/target-i386/cpu.c
@@ -1410,7 +1410,7 @@ static X86CPUDefinition host_cpudef;
 
 static Property host_x86_cpu_properties[] = {
     DEFINE_PROP_BOOL("migratable", X86CPU, migratable, true),
-    DEFINE_PROP_END_OF_LIST()
+    DEFINE_PROP_END_OF_LIST(),
 };
 
 /* class_init for the "host" CPU model
@@ -2956,7 +2956,7 @@ static Property x86_cpu_properties[] = {
     DEFINE_PROP_UINT32("level", X86CPU, env.cpuid_level, 0),
     DEFINE_PROP_UINT32("xlevel", X86CPU, env.cpuid_xlevel, 0),
     DEFINE_PROP_UINT32("xlevel2", X86CPU, env.cpuid_xlevel2, 0),
-    DEFINE_PROP_END_OF_LIST()
+    DEFINE_PROP_END_OF_LIST(),
 };
 
 static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
diff --git a/tests/test-qdev-global-props.c b/tests/test-qdev-global-props.c
index 0be9835..0cc6efd 100644
--- a/tests/test-qdev-global-props.c
+++ b/tests/test-qdev-global-props.c
@@ -46,7 +46,7 @@ typedef struct MyType {
 static Property static_props[] = {
     DEFINE_PROP_UINT32("prop1", MyType, prop1, PROP_DEFAULT),
     DEFINE_PROP_UINT32("prop2", MyType, prop2, PROP_DEFAULT),
-    DEFINE_PROP_END_OF_LIST()
+    DEFINE_PROP_END_OF_LIST(),
 };
 
 static void static_prop_class_init(ObjectClass *oc, void *data)
-- 
2.1.0


