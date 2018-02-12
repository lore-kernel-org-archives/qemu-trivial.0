Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1elEw4-0001NH-Kp
	for mharc-qemu-trivial@gnu.org; Mon, 12 Feb 2018 09:18:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46721)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <groug@kaod.org>) id 1elEw1-0001JB-Kp
	for qemu-trivial@nongnu.org; Mon, 12 Feb 2018 09:18:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <groug@kaod.org>) id 1elEvy-0003ju-Tp
	for qemu-trivial@nongnu.org; Mon, 12 Feb 2018 09:18:21 -0500
Received: from 4.mo179.mail-out.ovh.net ([46.105.36.149]:33673)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <groug@kaod.org>) id 1elEvy-0003fw-Ns
	for qemu-trivial@nongnu.org; Mon, 12 Feb 2018 09:18:18 -0500
Received: from player755.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo179.mail-out.ovh.net (Postfix) with ESMTP id 17ABCA1B8A
	for <qemu-trivial@nongnu.org>; Mon, 12 Feb 2018 15:18:16 +0100 (CET)
Received: from [192.168.0.243] (lns-bzn-46-82-253-208-248.adsl.proxad.net
	[82.253.208.248]) (Authenticated sender: groug@kaod.org)
	by player755.ha.ovh.net (Postfix) with ESMTPA id 4773D2600B2;
	Mon, 12 Feb 2018 15:18:14 +0100 (CET)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Date: Mon, 12 Feb 2018 15:18:08 +0100
Message-ID: <151844508814.7999.5257918627784684957.stgit@bahia>
User-Agent: StGit/0.17.1-46-g6855-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 11684589235233331691
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtfedrvdeigdeihecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecu
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.36.149
Subject: [Qemu-trivial] [PATCH] virtio-pci: trivial fixes in error message
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
X-List-Received-Date: Mon, 12 Feb 2018 14:18:23 -0000

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 hw/virtio/virtio-pci.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index c20537f31de7..ae3e8e1ca9b8 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -1585,7 +1585,7 @@ static void virtio_pci_device_plugged(DeviceState *d, Error **errp)
     if (legacy) {
         if (virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM)) {
             error_setg(errp, "VIRTIO_F_IOMMU_PLATFORM was supported by"
-                       "neither legacy nor transitional device.");
+                       " neither legacy nor transitional device");
             return ;
         }
         /*


