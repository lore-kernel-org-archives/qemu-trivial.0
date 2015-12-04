Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1a4kRE-0006gG-4B
	for mharc-qemu-trivial@gnu.org; Fri, 04 Dec 2015 02:05:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36660)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1a4kRA-0006Wx-5X
	for qemu-trivial@nongnu.org; Fri, 04 Dec 2015 02:05:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1a4kR9-0004BR-3S
	for qemu-trivial@nongnu.org; Fri, 04 Dec 2015 02:05:48 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:45747)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1a4kR2-00048m-SJ; Fri, 04 Dec 2015 02:05:41 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id F17DF40689;
	Fri,  4 Dec 2015 10:05:37 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 9FBDEAB0;
	Fri,  4 Dec 2015 09:57:43 +0300 (MSK)
Received: (nullmailer pid 7969 invoked by uid 1000);
	Fri, 04 Dec 2015 06:57:42 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri,  4 Dec 2015 09:57:39 +0300
Message-Id: <2988cbeaf94203b2cf31c0b3f589aa4ebc0cff34.1449211229.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1449211229.git.mjt@msgid.tls.msk.ru>
References: <cover.1449211229.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Markus Armbruster <armbru@redhat.com>
Subject: [Qemu-trivial] [PULL 8/9] typedefs: Put them back into alphabetical
	order
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
X-List-Received-Date: Fri, 04 Dec 2015 07:05:49 -0000

From: Markus Armbruster <armbru@redhat.com>

"Please keep this list in alphabetical order" has been more honoured
in the breach than in the observance.  Clean up.

While there, drop a redundant struct declaration.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 include/qemu/typedefs.h | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
index 6b1093d..3eedcf4 100644
--- a/include/qemu/typedefs.h
+++ b/include/qemu/typedefs.h
@@ -3,7 +3,6 @@
 
 /* A load of opaque types so that device init declarations don't have to
    pull in all the real definitions.  */
-struct Monitor;
 
 /* Please keep this list in alphabetical order */
 typedef struct AdapterInfo AdapterInfo;
@@ -19,8 +18,8 @@ typedef struct BusState BusState;
 typedef struct CharDriverState CharDriverState;
 typedef struct CompatProperty CompatProperty;
 typedef struct CPUAddressSpace CPUAddressSpace;
-typedef struct DeviceState DeviceState;
 typedef struct DeviceListener DeviceListener;
+typedef struct DeviceState DeviceState;
 typedef struct DisplayChangeListener DisplayChangeListener;
 typedef struct DisplayState DisplayState;
 typedef struct DisplaySurface DisplaySurface;
@@ -46,6 +45,7 @@ typedef struct MigrationIncomingState MigrationIncomingState;
 typedef struct MigrationParams MigrationParams;
 typedef struct MigrationState MigrationState;
 typedef struct Monitor Monitor;
+typedef struct MonitorDef MonitorDef;
 typedef struct MouseTransformInfo MouseTransformInfo;
 typedef struct MSIMessage MSIMessage;
 typedef struct NetClientState NetClientState;
@@ -63,13 +63,13 @@ typedef struct PCIESlot PCIESlot;
 typedef struct PCIExpressDevice PCIExpressDevice;
 typedef struct PCIExpressHost PCIExpressHost;
 typedef struct PCIHostState PCIHostState;
-typedef struct PCMachineState PCMachineState;
 typedef struct PCMachineClass PCMachineClass;
+typedef struct PCMachineState PCMachineState;
 typedef struct PCMCIACardState PCMCIACardState;
 typedef struct PixelFormat PixelFormat;
 typedef struct PostcopyDiscardState PostcopyDiscardState;
-typedef struct PropertyInfo PropertyInfo;
 typedef struct Property Property;
+typedef struct PropertyInfo PropertyInfo;
 typedef struct QEMUBH QEMUBH;
 typedef struct QemuConsole QemuConsole;
 typedef struct QEMUFile QEMUFile;
@@ -78,10 +78,10 @@ typedef struct QemuOpts QemuOpts;
 typedef struct QemuOptsList QemuOptsList;
 typedef struct QEMUSGList QEMUSGList;
 typedef struct QEMUSizedBuffer QEMUSizedBuffer;
-typedef struct QEMUTimerListGroup QEMUTimerListGroup;
 typedef struct QEMUTimer QEMUTimer;
-typedef struct Range Range;
+typedef struct QEMUTimerListGroup QEMUTimerListGroup;
 typedef struct RAMBlock RAMBlock;
+typedef struct Range Range;
 typedef struct SerialState SerialState;
 typedef struct SHPCDevice SHPCDevice;
 typedef struct SMBusDevice SMBusDevice;
@@ -89,6 +89,5 @@ typedef struct SSIBus SSIBus;
 typedef struct uWireSlave uWireSlave;
 typedef struct VirtIODevice VirtIODevice;
 typedef struct Visitor Visitor;
-typedef struct MonitorDef MonitorDef;
 
 #endif /* QEMU_TYPEDEFS_H */
-- 
2.1.4


