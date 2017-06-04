Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dHXzH-00075K-Is
	for mharc-qemu-trivial@gnu.org; Sun, 04 Jun 2017 12:02:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35174)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dHXzE-00073J-NG
	for qemu-trivial@nongnu.org; Sun, 04 Jun 2017 12:02:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dHXzE-0003yu-20
	for qemu-trivial@nongnu.org; Sun, 04 Jun 2017 12:02:40 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:59505)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dHXz9-0003uV-EI; Sun, 04 Jun 2017 12:02:35 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 2CE9D404E6;
	Sun,  4 Jun 2017 19:02:34 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id CE5025E4;
	Sun,  4 Jun 2017 18:45:28 +0300 (MSK)
Received: (nullmailer pid 16362 invoked by uid 1000);
	Sun, 04 Jun 2017 15:45:27 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sun,  4 Jun 2017 18:45:08 +0300
Message-Id: <7a0bbd55e5a1844996896fea5c006e3263c345e2.1496591095.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1496591095.git.mjt@msgid.tls.msk.ru>
References: <cover.1496591095.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1496591095.git.mjt@msgid.tls.msk.ru>
References: <cover.1496591095.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 04/22] docs/qdev-device-use.txt: update
 section Default Devices
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
X-List-Received-Date: Sun, 04 Jun 2017 16:02:41 -0000

From: Markus Armbruster <armbru@redhat.com>

Resynchronize the table of default device suppressions with vl.c's
default_list[].

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 docs/qdev-device-use.txt | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/docs/qdev-device-use.txt b/docs/qdev-device-use.txt
index 95a0c3ae55..1f297b5e9c 100644
--- a/docs/qdev-device-use.txt
+++ b/docs/qdev-device-use.txt
@@ -399,12 +399,13 @@ type.
 some DEVNAMEs:
 
     default device      suppressing DEVNAMEs
-    CD-ROM              ide-cd, ide-drive, scsi-cd
-    isa-fdc's driveA    isa-fdc
+    CD-ROM              ide-cd, ide-drive, ide-hd, scsi-cd, scsi-hd
+    isa-fdc's driveA    floppy, isa-fdc
     parallel            isa-parallel
     serial              isa-serial
-    VGA                 VGA, cirrus-vga, vmware-svga
-    virtioconsole       virtio-serial-pci, virtio-serial-s390, virtio-serial
+    VGA                 VGA, cirrus-vga, isa-vga, isa-cirrus-vga,
+                        vmware-svga, qxl-vga, virtio-vga
+    virtioconsole       virtio-serial-pci, virtio-serial
 
 The default NIC is connected to a default part created along with it.
 It is *not* suppressed by configuring a NIC with -device (you may call
-- 
2.11.0


