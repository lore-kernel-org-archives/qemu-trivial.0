Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VJQwB-0002Qh-0X
	for mharc-qemu-trivial@gnu.org; Tue, 10 Sep 2013 12:37:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51606)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony.perard@citrix.com>) id 1VJQw4-0002HR-4V
	for qemu-trivial@nongnu.org; Tue, 10 Sep 2013 12:37:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anthony.perard@citrix.com>) id 1VJQvz-0006xk-Au
	for qemu-trivial@nongnu.org; Tue, 10 Sep 2013 12:37:03 -0400
Received: from smtp02.citrix.com ([66.165.176.63]:54773)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony.perard@citrix.com>)
	id 1VJQvp-0006ve-L6; Tue, 10 Sep 2013 12:36:49 -0400
X-IronPort-AV: E=Sophos;i="4.90,879,1371081600"; d="scan'208";a="50113711"
Received: from accessns.citrite.net (HELO FTLPEX01CL02.citrite.net)
	([10.9.154.239])
	by FTLPIPO02.CITRIX.COM with ESMTP; 10 Sep 2013 16:36:48 +0000
Received: from ukmail1.uk.xensource.com (10.80.16.128) by smtprelay.citrix.com
	(10.13.107.79) with Microsoft SMTP Server id 14.2.342.4;
	Tue, 10 Sep 2013 12:36:47 -0400
Received: from perard.uk.xensource.com ([10.80.2.84])	by
	ukmail1.uk.xensource.com with esmtp (Exim 4.69)	(envelope-from
	<anthony.perard@citrix.com>)	id 1VJQvn-00057m-QN;
	Tue, 10 Sep 2013 17:36:47 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: <qemu-trivial@nongnu.org>
Date: Tue, 10 Sep 2013 17:36:18 +0100
Message-ID: <1378830978-27578-1-git-send-email-anthony.perard@citrix.com>
X-Mailer: git-send-email 1.8.4
MIME-Version: 1.0
Content-Type: text/plain
X-DLP: MIA2
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 66.165.176.63
Cc: Anthony PERARD <anthony.perard@citrix.com>,
	QEMU-devel <qemu-devel@nongnu.org>
Subject: [Qemu-trivial] [PATCH] docs: Fix IO port number for CPU present
	bitmap.
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
X-List-Received-Date: Tue, 10 Sep 2013 16:37:09 -0000

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 docs/specs/acpi_cpu_hotplug.txt | 2 +-
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
Anthony PERARD


