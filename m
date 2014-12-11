Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xz8tm-0006ww-Hj
	for mharc-qemu-trivial@gnu.org; Thu, 11 Dec 2014 13:55:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41661)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xz8tf-0006lK-6J
	for qemu-trivial@nongnu.org; Thu, 11 Dec 2014 13:55:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xz8ta-000236-Db
	for qemu-trivial@nongnu.org; Thu, 11 Dec 2014 13:55:31 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:38658)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Xz8tM-0001xz-Ru; Thu, 11 Dec 2014 13:55:13 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 2AD7B41D56;
	Thu, 11 Dec 2014 21:55:10 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id CA5098CF;
	Thu, 11 Dec 2014 21:16:17 +0300 (MSK)
Received: (nullmailer pid 22995 invoked by uid 1000);
	Thu, 11 Dec 2014 18:16:15 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 11 Dec 2014 21:16:08 +0300
Message-Id: <64baadc2726ae929660dd0c61a42e8d9f3ba1828.1418321644.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.3
In-Reply-To: <cover.1418321644.git.mjt@msgid.tls.msk.ru>
References: <cover.1418321644.git.mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: [Qemu-trivial] [PULL 20/20] Sort include/qemu/typedefs.h
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
X-List-Received-Date: Thu, 11 Dec 2014 18:55:35 -0000

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Mainly to make it less likely to conflict during merges.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 include/qemu/typedefs.h | 105 +++++++++++++++++++++++-------------------=
------
 1 file changed, 50 insertions(+), 55 deletions(-)

diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
index 3475177..57ff47f 100644
--- a/include/qemu/typedefs.h
+++ b/include/qemu/typedefs.h
@@ -3,80 +3,75 @@
=20
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
=20
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
=20
 #endif /* QEMU_TYPEDEFS_H */
--=20
2.1.3


