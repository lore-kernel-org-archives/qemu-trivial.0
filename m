Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZwFLL-0007Kj-4E
	for mharc-qemu-trivial@gnu.org; Tue, 10 Nov 2015 15:16:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50756)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ZwFLG-0007Ci-BR
	for qemu-trivial@nongnu.org; Tue, 10 Nov 2015 15:16:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ZwFLF-0005KX-7d
	for qemu-trivial@nongnu.org; Tue, 10 Nov 2015 15:16:34 -0500
Received: from mx1.redhat.com ([209.132.183.28]:58428)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>)
	id 1ZwFLD-0005Ju-CU; Tue, 10 Nov 2015 15:16:31 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id D876FC0AAB34;
	Tue, 10 Nov 2015 20:16:30 +0000 (UTC)
Received: from thh440s.redhat.com (vpn1-6-38.ams2.redhat.com [10.36.6.38])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tAAKGBoq029221; Tue, 10 Nov 2015 15:16:21 -0500
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Tue, 10 Nov 2015 21:16:09 +0100
Message-Id: <1447186571-27672-3-git-send-email-thuth@redhat.com>
In-Reply-To: <1447186571-27672-1-git-send-email-thuth@redhat.com>
References: <1447186571-27672-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Subject: [Qemu-trivial] [PATCH 2/4] hw/acpi: Remove superfluous return
	statement
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
X-List-Received-Date: Tue, 10 Nov 2015 20:16:37 -0000

The "return;" statement at the end of acpi_memory_plug_cb()
does not make much sense, so let's remove it.

Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/acpi/memory_hotplug.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/acpi/memory_hotplug.c b/hw/acpi/memory_hotplug.c
index ce428df..bca7c54 100644
--- a/hw/acpi/memory_hotplug.c
+++ b/hw/acpi/memory_hotplug.c
@@ -244,7 +244,6 @@ void acpi_memory_plug_cb(ACPIREGS *ar, qemu_irq irq, MemHotplugState *mem_st,
         /* do ACPI magic */
         acpi_send_gpe_event(ar, irq, ACPI_MEMORY_HOTPLUG_STATUS);
     }
-    return;
 }
 
 void acpi_memory_unplug_request_cb(ACPIREGS *ar, qemu_irq irq,
-- 
1.8.3.1


