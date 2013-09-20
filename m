Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VN42d-0005bm-33
	for mharc-qemu-trivial@gnu.org; Fri, 20 Sep 2013 12:58:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50399)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VN42Y-0005Q6-7E
	for qemu-trivial@nongnu.org; Fri, 20 Sep 2013 12:58:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VN42T-0000Li-UU
	for qemu-trivial@nongnu.org; Fri, 20 Sep 2013 12:58:46 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:54176)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VN42B-0000EC-9R; Fri, 20 Sep 2013 12:58:23 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 08C44419CB;
	Fri, 20 Sep 2013 20:58:21 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id E34F14C3;
	Fri, 20 Sep 2013 20:58:20 +0400 (MSK)
Received: (nullmailer pid 32166 invoked by uid 1000);
	Fri, 20 Sep 2013 16:58:20 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@us.ibm.com
Date: Fri, 20 Sep 2013 20:58:02 +0400
Message-Id: <1379696296-32105-4-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1379696296-32105-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1379696296-32105-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: Anthony PERARD <anthony.perard@citrix.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 03/17] docs: Fix IO port number for CPU
	present bitmap.
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
X-List-Received-Date: Fri, 20 Sep 2013 16:58:50 -0000

From: Anthony PERARD <anthony.perard@citrix.com>

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Reviewd-By: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 docs/specs/acpi_cpu_hotplug.txt |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/specs/acpi_cpu_hotplug.txt b/docs/specs/acpi_cpu_hotplug.txt
index 5dec0c5..f6f5774 100644
--- a/docs/specs/acpi_cpu_hotplug.txt
+++ b/docs/specs/acpi_cpu_hotplug.txt
@@ -10,7 +10,7 @@ ACPI GPE block (IO ports 0xafe0-0xafe3, byte access):
 Generic ACPI GPE block. Bit 2 (GPE.2) used to notify CPU
 hot-add/remove event to ACPI BIOS, via SCI interrupt.
 
-CPU present bitmap (IO port 0xaf00-0xae1f, 1-byte access):
+CPU present bitmap (IO port 0xaf00-0xaf1f, 1-byte access):
 ---------------------------------------------------------------
 One bit per CPU. Bit position reflects corresponding CPU APIC ID.
 Read-only.
-- 
1.7.10.4


