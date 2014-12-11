Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xz2D5-0000FT-Mf
	for mharc-qemu-trivial@gnu.org; Thu, 11 Dec 2014 06:47:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36795)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1Xz2Cw-0008Vc-Po
	for qemu-trivial@nongnu.org; Thu, 11 Dec 2014 06:47:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1Xz2Cq-0003fn-KI
	for qemu-trivial@nongnu.org; Thu, 11 Dec 2014 06:46:58 -0500
Received: from mx1.redhat.com ([209.132.183.28]:48962)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>)
	id 1Xz2Cd-0003dQ-P8; Thu, 11 Dec 2014 06:46:39 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sBBBkcn5031277
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Thu, 11 Dec 2014 06:46:38 -0500
Received: from dgilbert-t530.redhat.com (ovpn-116-122.ams2.redhat.com
	[10.36.116.122])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sBBBkb2e007957; Thu, 11 Dec 2014 06:46:38 -0500
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 11 Dec 2014 11:46:36 +0000
Message-Id: <1418298396-27089-1-git-send-email-dgilbert@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH 1/1] Sort include/qemu/typedefs.h
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
X-List-Received-Date: Thu, 11 Dec 2014 11:47:06 -0000

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Mainly to make it less likely to conflict during merges.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 include/qemu/typedefs.h | 105 +++++++++++++++++++++++-------------------------
 1 file changed, 50 insertions(+), 55 deletions(-)

diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
index 3475177..57ff47f 100644
--- a/include/qemu/typedefs.h
+++ b/include/qemu/typedefs.h
@@ -3,80 +3,75 @@
 
 /* A load of opaque types so that device init declarations don't have to
    pull in all the real definitions.  */
-typedef struct QEMUTimer QEMUTimer;
-typedef struct QEMUTimerListGroup QEMUTimerListGroup;
-typedef struct QEMUFile QEMUFile;
-typedef struct QEMUBH QEMUBH;
-
-typedef struct AioContext AioContext;
-
-typedef struct Visitor Visitor;
-
 struct Monitor;
-typedef struct Monitor Monitor;
-typedef struct MigrationParams MigrationParams;
-
-typedef struct Property Property;
-typedef struct PropertyInfo PropertyInfo;
-typedef struct CompatProperty CompatProperty;
-typedef struct DeviceState DeviceState;
-typedef struct BusState BusState;
-typedef struct BusClass BusClass;
 
+/* Please keep this list in alphabetical order */
+typedef struct AdapterInfo AdapterInfo;
 typedef struct AddressSpace AddressSpace;
-typedef struct MemoryRegion MemoryRegion;
-typedef struct MemoryRegionSection MemoryRegionSection;
-typedef struct MemoryListener MemoryListener;
-
-typedef struct MemoryMappingList MemoryMappingList;
-
-typedef struct QEMUMachine QEMUMachine;
-typedef struct MachineClass MachineClass;
-typedef struct MachineState MachineState;
-typedef struct NICInfo NICInfo;
-typedef struct HCIInfo HCIInfo;
+typedef struct AioContext AioContext;
 typedef struct AudioState AudioState;
 typedef struct BlockBackend BlockBackend;
 typedef struct BlockDriverState BlockDriverState;
-typedef struct DriveInfo DriveInfo;
-typedef struct DisplayState DisplayState;
+typedef struct BusClass BusClass;
+typedef struct BusState BusState;
+typedef struct CharDriverState CharDriverState;
+typedef struct CompatProperty CompatProperty;
+typedef struct DeviceState DeviceState;
 typedef struct DisplayChangeListener DisplayChangeListener;
+typedef struct DisplayState DisplayState;
 typedef struct DisplaySurface DisplaySurface;
-typedef struct PixelFormat PixelFormat;
-typedef struct QemuConsole QemuConsole;
-typedef struct CharDriverState CharDriverState;
-typedef struct MACAddr MACAddr;
-typedef struct NetClientState NetClientState;
+typedef struct DriveInfo DriveInfo;
+typedef struct EventNotifier EventNotifier;
+typedef struct FWCfgState FWCfgState;
+typedef struct HCIInfo HCIInfo;
 typedef struct I2CBus I2CBus;
+typedef struct I2SCodec I2SCodec;
 typedef struct ISABus ISABus;
 typedef struct ISADevice ISADevice;
-typedef struct SMBusDevice SMBusDevice;
-typedef struct PCIHostState PCIHostState;
-typedef struct PCIExpressHost PCIExpressHost;
+typedef struct MACAddr MACAddr;
+typedef struct MachineClass MachineClass;
+typedef struct MachineState MachineState;
+typedef struct MemoryListener MemoryListener;
+typedef struct MemoryMappingList MemoryMappingList;
+typedef struct MemoryRegion MemoryRegion;
+typedef struct MemoryRegionSection MemoryRegionSection;
+typedef struct MigrationParams MigrationParams;
+typedef struct Monitor Monitor;
+typedef struct MouseTransformInfo MouseTransformInfo;
+typedef struct MSIMessage MSIMessage;
+typedef struct NetClientState NetClientState;
+typedef struct NICInfo NICInfo;
+typedef struct PcGuestInfo PcGuestInfo;
+typedef struct PCIBridge PCIBridge;
 typedef struct PCIBus PCIBus;
 typedef struct PCIDevice PCIDevice;
-typedef struct PCIExpressDevice PCIExpressDevice;
-typedef struct PCIBridge PCIBridge;
-typedef struct PCIEAERMsg PCIEAERMsg;
-typedef struct PCIEAERLog PCIEAERLog;
 typedef struct PCIEAERErr PCIEAERErr;
+typedef struct PCIEAERLog PCIEAERLog;
+typedef struct PCIEAERMsg PCIEAERMsg;
 typedef struct PCIEPort PCIEPort;
 typedef struct PCIESlot PCIESlot;
-typedef struct MSIMessage MSIMessage;
-typedef struct SerialState SerialState;
+typedef struct PCIExpressDevice PCIExpressDevice;
+typedef struct PCIExpressHost PCIExpressHost;
+typedef struct PCIHostState PCIHostState;
 typedef struct PCMCIACardState PCMCIACardState;
-typedef struct MouseTransformInfo MouseTransformInfo;
-typedef struct uWireSlave uWireSlave;
-typedef struct I2SCodec I2SCodec;
-typedef struct SSIBus SSIBus;
-typedef struct EventNotifier EventNotifier;
-typedef struct VirtIODevice VirtIODevice;
+typedef struct PixelFormat PixelFormat;
+typedef struct PropertyInfo PropertyInfo;
+typedef struct Property Property;
+typedef struct QEMUBH QEMUBH;
+typedef struct QemuConsole QemuConsole;
+typedef struct QEMUFile QEMUFile;
+typedef struct QEMUMachine QEMUMachine;
 typedef struct QEMUSGList QEMUSGList;
 typedef struct QEMUSizedBuffer QEMUSizedBuffer;
-typedef struct SHPCDevice SHPCDevice;
-typedef struct FWCfgState FWCfgState;
-typedef struct PcGuestInfo PcGuestInfo;
+typedef struct QEMUTimerListGroup QEMUTimerListGroup;
+typedef struct QEMUTimer QEMUTimer;
 typedef struct Range Range;
-typedef struct AdapterInfo AdapterInfo;
+typedef struct SerialState SerialState;
+typedef struct SHPCDevice SHPCDevice;
+typedef struct SMBusDevice SMBusDevice;
+typedef struct SSIBus SSIBus;
+typedef struct uWireSlave uWireSlave;
+typedef struct VirtIODevice VirtIODevice;
+typedef struct Visitor Visitor;
 
 #endif /* QEMU_TYPEDEFS_H */
-- 
2.1.0


