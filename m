Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U3qdq-0000yH-Mj
	for mharc-qemu-trivial@gnu.org; Fri, 08 Feb 2013 11:17:34 -0500
Received: from eggs.gnu.org ([208.118.235.92]:33574)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1U3qdg-0000Wo-OM
	for qemu-trivial@nongnu.org; Fri, 08 Feb 2013 11:17:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1U3qdd-0008Iq-LA
	for qemu-trivial@nongnu.org; Fri, 08 Feb 2013 11:17:24 -0500
Received: from oxygen.pond.sub.org ([2a01:4f8:121:10e4::3]:39702)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>)
	id 1U3qdX-0008FZ-7O; Fri, 08 Feb 2013 11:17:15 -0500
Received: from blackfin.pond.sub.org (p5B32B25A.dip.t-dialin.net
	[91.50.178.90])
	by oxygen.pond.sub.org (Postfix) with ESMTPA id 4C2A49FE7B;
	Fri,  8 Feb 2013 17:17:13 +0100 (CET)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id A6DA8200AB; Fri,  8 Feb 2013 17:17:12 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri,  8 Feb 2013 17:17:08 +0100
Message-Id: <1360340232-4670-3-git-send-email-armbru@redhat.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <1360340232-4670-1-git-send-email-armbru@redhat.com>
References: <1360340232-4670-1-git-send-email-armbru@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a01:4f8:121:10e4::3
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org, lcapitulino@redhat.com
Subject: [Qemu-trivial] [PATCH for-1.4 v2 2/6] error: Clean up abuse of
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
X-List-Received-Date: Fri, 08 Feb 2013 16:17:29 -0000

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


