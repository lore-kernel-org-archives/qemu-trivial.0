Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TTxe6-00078U-UH
	for mharc-qemu-trivial@gnu.org; Thu, 01 Nov 2012 12:29:30 -0400
Received: from eggs.gnu.org ([208.118.235.92]:52365)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>) id 1TTxe5-00073j-2x
	for qemu-trivial@nongnu.org; Thu, 01 Nov 2012 12:29:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>) id 1TTxe3-0001G8-Py
	for qemu-trivial@nongnu.org; Thu, 01 Nov 2012 12:29:29 -0400
Received: from mout.web.de ([212.227.17.11]:58130)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>)
	id 1TTxe1-0001Cz-EG; Thu, 01 Nov 2012 12:29:25 -0400
Received: from mchn199C.mchp.siemens.de ([95.157.56.37]) by smtp.web.de
	(mrweb001) with ESMTPSA (Nemesis) id 0M2unu-1TCqV02YYI-00sXxN;
	Thu, 01 Nov 2012 17:29:24 +0100
Message-ID: <5092A364.4040807@web.de>
Date: Thu, 01 Nov 2012 17:29:24 +0100
From: Jan Kiszka <jan.kiszka@web.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de;
	rv:1.8.1.12) Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12
	Mnenhy/0.7.5.666
MIME-Version: 1.0
To: qemu-devel <qemu-devel@nongnu.org>, qemu-trivial <qemu-trivial@nongnu.org>
X-Enigmail-Version: 1.4.5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-Provags-ID: V02:K0:h3HQlDI82SZMouv5QDQYfa6WINPVyndX9yzyqy6sLBU
	KxyK/xfJU/vj3HmnWLCKgs4finHvy+Et00ROP3jXLtf/kT0ZiF
	JvEDL4le3pagxeU1De38bisby1N3JeJCt8p2hmFtEibGyQivfP
	ZDLSPerixlARUl7qQNTcSaZhYIwbvAFO2OAJJroVHwsNjieuTA
	PhZGWXi9T1myCMPQ70ymQ==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 212.227.17.11
Subject: [Qemu-trivial] [PATCH] pc: Drop redundant test for ROM memory region
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
X-List-Received-Date: Thu, 01 Nov 2012 16:29:30 -0000

From: Jan Kiszka <jan.kiszka@siemens.com>

Just a few lines above, we already initialize rom_memory accordingly.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hw/pc_piix.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/hw/pc_piix.c b/hw/pc_piix.c
index 85529b2..cfa839c 100644
--- a/hw/pc_piix.c
+++ b/hw/pc_piix.c
@@ -178,7 +178,7 @@ static void pc_init1(MemoryRegion *system_memory,
         fw_cfg = pc_memory_init(system_memory,
                        kernel_filename, kernel_cmdline, initrd_filename,
                        below_4g_mem_size, above_4g_mem_size,
-                       pci_enabled ? rom_memory : system_memory, &ram_memory);
+                       rom_memory, &ram_memory);
     }
 
     gsi_state = g_malloc0(sizeof(*gsi_state));
-- 
1.7.3.4

