Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b9XDc-0007RZ-D8
	for mharc-qemu-trivial@gnu.org; Sun, 05 Jun 2016 08:31:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44319)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9XDW-0007KI-9r
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 08:31:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9XDU-00020e-F5
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 08:31:45 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:59798)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1b9XDJ-0001wa-VA; Sun, 05 Jun 2016 08:31:34 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id CC1714092A;
	Sun,  5 Jun 2016 15:31:30 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 8CD0FB04;
	Sun,  5 Jun 2016 10:43:38 +0300 (MSK)
Received: (nullmailer pid 1145 invoked by uid 1000);
	Sun, 05 Jun 2016 07:43:32 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sun,  5 Jun 2016 10:43:04 +0300
Message-Id: <6053989dab7f82a889f908b250931a32b879c71f.1465112552.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
References: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 27/52] pc: cleanup unused struct PcRomPciInfo
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
X-List-Received-Date: Sun, 05 Jun 2016 12:31:51 -0000

From: Igor Mammedov <imammedo@redhat.com>

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/i386/pc.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index e29ccc8..b0a4bec 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1149,14 +1149,6 @@ void pc_cpus_init(PCMachineState *pcms)
     smbios_set_cpuid(cpu->env.cpuid_version, cpu->env.features[FEAT_1_EDX]);
 }
 
-/* pci-info ROM file. Little endian format */
-typedef struct PcRomPciInfo {
-    uint64_t w32_min;
-    uint64_t w32_max;
-    uint64_t w64_min;
-    uint64_t w64_max;
-} PcRomPciInfo;
-
 static
 void pc_machine_done(Notifier *notifier, void *data)
 {
-- 
2.1.4


