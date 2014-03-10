Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WN5bU-0005D0-UB
	for mharc-qemu-trivial@gnu.org; Mon, 10 Mar 2014 15:11:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57214)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1WN5bJ-0004rA-Tt
	for qemu-trivial@nongnu.org; Mon, 10 Mar 2014 15:11:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1WN5bJ-0003Nv-8R
	for qemu-trivial@nongnu.org; Mon, 10 Mar 2014 15:11:01 -0400
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:46645)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1WN5bC-0003L7-UY; Mon, 10 Mar 2014 15:10:55 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1WN5b7-0002TB-6T; Mon, 10 Mar 2014 19:10:49 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 10 Mar 2014 19:10:40 +0000
Message-Id: <1394478649-9453-5-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1394478649-9453-1-git-send-email-peter.maydell@linaro.org>
References: <1394478649-9453-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2001:8b0:1d0::1
Cc: qemu-trivial@nongnu.org, qemu-ppc@nongnu.org, patches@linaro.org
Subject: [Qemu-trivial] [PATCH 04/12] hw/i386/acpi_build.c: Avoid shifting
	left into sign bit
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
X-List-Received-Date: Mon, 10 Mar 2014 19:11:05 -0000

Add U suffix to avoid undefined behaviour.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/i386/acpi-build.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index b1a7ebb..46d4e60 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -813,7 +813,7 @@ static void build_pci_bus_end(PCIBus *bus, void *bus_state)
 
             build_append_byte(notify, 0x7B); /* AndOp */
             build_append_byte(notify, 0x68); /* Arg0Op */
-            build_append_int(notify, 0x1 << i);
+            build_append_int(notify, 0x1U << i);
             build_append_byte(notify, 0x00); /* NullName */
             build_append_byte(notify, 0x86); /* NotifyOp */
             build_append_nameseg(notify, "S%.02X_", PCI_DEVFN(i, 0));
-- 
1.9.0


