Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1frlUl-00064Y-2b
	for mharc-qemu-trivial@gnu.org; Mon, 20 Aug 2018 10:49:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60329)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.williamson@redhat.com>) id 1frlUi-000639-V4
	for qemu-trivial@nongnu.org; Mon, 20 Aug 2018 10:49:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.williamson@redhat.com>) id 1frlUi-0002XW-7v
	for qemu-trivial@nongnu.org; Mon, 20 Aug 2018 10:49:24 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:54322 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alex.williamson@redhat.com>)
	id 1frlUV-0002Ht-DF; Mon, 20 Aug 2018 10:49:13 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 148D8402178A;
	Mon, 20 Aug 2018 14:49:07 +0000 (UTC)
Received: from gimli.home (ovpn-120-10.rdu2.redhat.com [10.10.120.10])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1EC552157F4A;
	Mon, 20 Aug 2018 14:49:03 +0000 (UTC)
From: Alex Williamson <alex.williamson@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Date: Mon, 20 Aug 2018 08:49:03 -0600
Message-ID: <153477652845.3413.12518068251159818959.stgit@gimli.home>
User-Agent: StGit/0.18-136-gffd7-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Mon, 20 Aug 2018 14:49:07 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Mon, 20 Aug 2018 14:49:07 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'alex.williamson@redhat.com'
	RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.187.233.73
Subject: [Qemu-trivial] [PATCH] vfio/pci: Handle subsystem realpath()
 returning NULL
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
X-List-Received-Date: Mon, 20 Aug 2018 14:49:25 -0000

Fix error reported by Coverity where realpath can return NULL,
resulting in a segfault in strcmp().  This should never happen given
that we're working through regularly structured sysfs paths, but
trivial enough to easily avoid.

Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
---
 hw/vfio/pci.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 056f3a887a8f..866f0deeb7eb 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -2879,7 +2879,7 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
     tmp = g_strdup_printf("%s/subsystem", vdev->vbasedev.sysfsdev);
     subsys = realpath(tmp, NULL);
     g_free(tmp);
-    is_mdev = (strcmp(subsys, "/sys/bus/mdev") == 0);
+    is_mdev = subsys && (strcmp(subsys, "/sys/bus/mdev") == 0);
     free(subsys);
 
     trace_vfio_mdev(vdev->vbasedev.name, is_mdev);


