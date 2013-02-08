Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U3msD-0000ui-JZ
	for mharc-qemu-trivial@gnu.org; Fri, 08 Feb 2013 07:16:09 -0500
Received: from eggs.gnu.org ([208.118.235.92]:33350)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1U3ms3-0000Oz-AV
	for qemu-trivial@nongnu.org; Fri, 08 Feb 2013 07:16:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1U3ms1-0007C6-UT
	for qemu-trivial@nongnu.org; Fri, 08 Feb 2013 07:15:59 -0500
Received: from oxygen.pond.sub.org ([2a01:4f8:121:10e4::3]:38997)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>)
	id 1U3mrw-00079l-Lx; Fri, 08 Feb 2013 07:15:52 -0500
Received: from blackfin.pond.sub.org (p5B32B25A.dip.t-dialin.net
	[91.50.178.90])
	by oxygen.pond.sub.org (Postfix) with ESMTPA id 3120B9FE7B;
	Fri,  8 Feb 2013 13:15:49 +0100 (CET)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 54C80200A9; Fri,  8 Feb 2013 13:15:49 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri,  8 Feb 2013 13:15:45 +0100
Message-Id: <1360325749-1989-3-git-send-email-armbru@redhat.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <1360325749-1989-1-git-send-email-armbru@redhat.com>
References: <1360325749-1989-1-git-send-email-armbru@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a01:4f8:121:10e4::3
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH for-1.4 2/6] error: Clean up abuse of
	error_report() for help
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
X-List-Received-Date: Fri, 08 Feb 2013 12:16:01 -0000

Use error_printf() instead, so the help gets presented more nicely.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/vfio_pci.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/vfio_pci.c b/hw/vfio_pci.c
index 66537b7..a934f13 100644
--- a/hw/vfio_pci.c
+++ b/hw/vfio_pci.c
@@ -1806,9 +1806,9 @@ static int vfio_get_device(VFIOGroup *group, const char *name, VFIODevice *vdev)
 
     ret = ioctl(group->fd, VFIO_GROUP_GET_DEVICE_FD, name);
     if (ret < 0) {
-        error_report("vfio: error getting device %s from group %d: %m\n",
+        error_report("vfio: error getting device %s from group %d: %m",
                      name, group->groupid);
-        error_report("Verify all devices in group %d are bound to vfio-pci "
+        error_printf("Verify all devices in group %d are bound to vfio-pci "
                      "or pci-stub and not already in use\n", group->groupid);
         return ret;
     }
-- 
1.7.11.7


