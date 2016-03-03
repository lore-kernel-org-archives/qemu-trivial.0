Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1abTim-00062N-TM
	for mharc-qemu-trivial@gnu.org; Thu, 03 Mar 2016 08:55:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58488)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1abTie-0005sL-05
	for qemu-trivial@nongnu.org; Thu, 03 Mar 2016 08:55:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1abTid-0008Eg-8E
	for qemu-trivial@nongnu.org; Thu, 03 Mar 2016 08:55:07 -0500
Received: from mx1.redhat.com ([209.132.183.28]:37247)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1abTiT-00087w-Df; Thu, 03 Mar 2016 08:54:57 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id 5CFF67F083;
	Thu,  3 Mar 2016 13:54:56 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.34.112.60])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u23DssAM026816; Thu, 3 Mar 2016 08:54:55 -0500
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu,  3 Mar 2016 14:54:50 +0100
Message-Id: <1457013290-269368-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, ehabkost@redhat.com, mst@redhat.com
Subject: [Qemu-trivial] [PATCH] pc: acpi: remove NOP assignment
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
X-List-Received-Date: Thu, 03 Mar 2016 13:55:13 -0000

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/i386/acpi-build.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 52c9470..453d61c 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2386,7 +2386,6 @@ build_srat(GArray *table_data, GArray *linker)
 
     srat = acpi_data_push(table_data, sizeof *srat);
     srat->reserved1 = cpu_to_le32(1);
-    core = (void *)(srat + 1);
 
     for (i = 0; i < pcms->apic_id_limit; ++i) {
         core = acpi_data_push(table_data, sizeof *core);
-- 
1.8.3.1


