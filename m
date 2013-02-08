Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U3qdr-0000zg-71
	for mharc-qemu-trivial@gnu.org; Fri, 08 Feb 2013 11:17:35 -0500
Received: from eggs.gnu.org ([208.118.235.92]:33577)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1U3qdg-0000X1-S1
	for qemu-trivial@nongnu.org; Fri, 08 Feb 2013 11:17:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1U3qdd-0008Ii-GC
	for qemu-trivial@nongnu.org; Fri, 08 Feb 2013 11:17:24 -0500
Received: from oxygen.pond.sub.org ([2a01:4f8:121:10e4::3]:39703)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>)
	id 1U3qdX-0008FY-6i; Fri, 08 Feb 2013 11:17:15 -0500
Received: from blackfin.pond.sub.org (p5B32B25A.dip.t-dialin.net
	[91.50.178.90])
	by oxygen.pond.sub.org (Postfix) with ESMTPA id 437C89FE6C;
	Fri,  8 Feb 2013 17:17:13 +0100 (CET)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 94F23200A9; Fri,  8 Feb 2013 17:17:12 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri,  8 Feb 2013 17:17:07 +0100
Message-Id: <1360340232-4670-2-git-send-email-armbru@redhat.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <1360340232-4670-1-git-send-email-armbru@redhat.com>
References: <1360340232-4670-1-git-send-email-armbru@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a01:4f8:121:10e4::3
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org, lcapitulino@redhat.com
Subject: [Qemu-trivial] [PATCH for-1.4 v2 1/6] error: Clean up error strings
	with embedded newlines
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
X-List-Received-Date: Fri, 08 Feb 2013 16:17:30 -0000

The arguments of error_report() should yield a short error string
without newlines.

A few places try to print additional help after the error message by
embedding newlines in the error string.  That's nice, but let's do it
the right way.

Since I'm touching these lines anyway, drop a stray preposition and
some tabs.  We don't use tabs for similar messages elsewhere.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/kvm/pci-assign.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/kvm/pci-assign.c b/hw/kvm/pci-assign.c
index 896cfe8..da64b5b 100644
--- a/hw/kvm/pci-assign.c
+++ b/hw/kvm/pci-assign.c
@@ -936,8 +936,8 @@ retry:
             /* Retry with host-side MSI. There might be an IRQ conflict and
              * either the kernel or the device doesn't support sharing. */
             error_report("Host-side INTx sharing not supported, "
-                         "using MSI instead.\n"
-                         "Some devices do not to work properly in this mode.");
+                         "using MSI instead");
+            error_printf("Some devices do not work properly in this mode.\n");
             dev->features |= ASSIGNED_DEVICE_PREFER_MSI_MASK;
             goto retry;
         }
@@ -1903,10 +1903,10 @@ static void assigned_dev_load_option_rom(AssignedDevice *dev)
     memset(ptr, 0xff, st.st_size);
 
     if (!fread(ptr, 1, st.st_size, fp)) {
-        error_report("pci-assign: Cannot read from host %s\n"
-                     "\tDevice option ROM contents are probably invalid "
-                     "(check dmesg).\n\tSkip option ROM probe with rombar=0, "
-                     "or load from file with romfile=", rom_file);
+        error_report("pci-assign: Cannot read from host %s", rom_file);
+        error_printf("Device option ROM contents are probably invalid "
+                     "(check dmesg).\nSkip option ROM probe with rombar=0, "
+                     "or load from file with romfile=\n");
         memory_region_destroy(&dev->dev.rom);
         goto close_rom;
     }
-- 
1.7.11.7


