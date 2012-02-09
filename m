Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RvU4a-0005DM-IV
	for mharc-qemu-trivial@gnu.org; Thu, 09 Feb 2012 08:30:04 -0500
Received: from eggs.gnu.org ([140.186.70.92]:43626)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1RvU4Q-0004lJ-4A
	for qemu-trivial@nongnu.org; Thu, 09 Feb 2012 08:30:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1RvU4I-0005yf-1K
	for qemu-trivial@nongnu.org; Thu, 09 Feb 2012 08:29:54 -0500
Received: from mx1.redhat.com ([209.132.183.28]:21840)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>)
	id 1RvU4H-0005yW-Ka; Thu, 09 Feb 2012 08:29:45 -0500
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q19DTi5P031109
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Thu, 9 Feb 2012 08:29:44 -0500
Received: from doriath.home (ovpn-116-73.ams2.redhat.com [10.36.116.73])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q19DTgVO022080; Thu, 9 Feb 2012 08:29:43 -0500
Date: Thu, 9 Feb 2012 11:29:42 -0200
From: Luiz Capitulino <lcapitulino@redhat.com>
To: qemu-trivial <qemu-trivial@nongnu.org>
Message-ID: <20120209112942.77ce62bf@doriath.home>
Organization: Red Hat
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-devel@nongnu.org
Subject: [Qemu-trivial] [TRIVIAL] virtio_cleanup(): Remove unneeded g_free()
 parameter check
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
X-List-Received-Date: Thu, 09 Feb 2012 13:30:03 -0000


Signed-off-by: Luiz Capitulino <lcapitulino@redhat.com>
---
 hw/virtio.c |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/hw/virtio.c b/hw/virtio.c
index 74cc038..064aecf 100644
--- a/hw/virtio.c
+++ b/hw/virtio.c
@@ -845,8 +845,7 @@ int virtio_load(VirtIODevice *vdev, QEMUFile *f)
 void virtio_cleanup(VirtIODevice *vdev)
 {
     qemu_del_vm_change_state_handler(vdev->vmstate);
-    if (vdev->config)
-        g_free(vdev->config);
+    g_free(vdev->config);
     g_free(vdev->vq);
     g_free(vdev);
 }
-- 
1.7.9.111.gf3fb0.dirty


