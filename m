Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i0guR-0005XP-OX
	for mharc-qemu-trivial@gnu.org; Thu, 22 Aug 2019 02:49:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38458)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tgfbeta@me.com>) id 1i0guO-0005RZ-6N
 for qemu-trivial@nongnu.org; Thu, 22 Aug 2019 02:49:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tgfbeta@me.com>) id 1i0guM-0007HR-1m
 for qemu-trivial@nongnu.org; Thu, 22 Aug 2019 02:49:20 -0400
Received: from pv50p00im-ztdg10012101.me.com ([17.58.6.49]:51724)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tgfbeta@me.com>) id 1i0guL-0007CU-SN
 for qemu-trivial@nongnu.org; Thu, 22 Aug 2019 02:49:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
 t=1566456553; bh=6PUVU1MZHFFpo0CsMyHLeCK1tngokKtt2DOZ2uG+hzQ=;
 h=From:Content-Type:Subject:Message-Id:Date:To;
 b=v44yjRa/dh6QtrKApkdJYFdQsnUOydnJo8QWrzXqyIc4KCp0vURp2m3cQf1RN/NQD
 ZFOhPNqE2T+jp0R3r+Xee8hUMlWXOtyMKggH2Ja6skW7xVcthNRsXRNlXSjkxhzXE8
 qG7DrHK/fjh+idEV4VwmvQbSc3aFDoh7DXPTLTpQG0/Ys1uuingrpf3m7M1c461B9F
 eQxdz0WxQFot+AdPqvLSaJ5QNKH8WjZJlMtWB3a8UnCa8swE7TvpnIwhklHgqAODJa
 yc2VCnSqfKAsFTiedJu0hiDkOVIIWVqXBCPmFYDwje4Vq6teCP0T9a1EUoK1ufL2qN
 xP0fYxvZnLgKQ==
Received: from [172.16.10.130] (unknown [36.106.167.236])
 by pv50p00im-ztdg10012101.me.com (Postfix) with ESMTPSA id B9D5F840807;
 Thu, 22 Aug 2019 06:49:12 +0000 (UTC)
From: Chen Zhang <tgfbeta@me.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Message-Id: <8E5A9C27-C76D-46CF-85B0-79121A00B05F@me.com>
Date: Thu, 22 Aug 2019 14:49:09 +0800
Cc: Alex Williamson <alex.williamson@redhat.com>,
 qemu-trivial@nongnu.org
To: qemu-devel@nongnu.org
X-Mailer: Apple Mail (2.3445.104.11)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-22_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=873 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1812120000 definitions=main-1908220074
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 17.58.6.49
Subject: [Qemu-trivial] [PATCH] vfio: fix a typo
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Aug 2019 06:49:21 -0000

Signed-off-by: Chen Zhang <tgfbeta@me.com>
---
 hw/vfio/pci.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index dc3479c..c5e6fe6 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -44,7 +44,7 @@
 #define TYPE_VFIO_PCI "vfio-pci"
 #define PCI_VFIO(obj)    OBJECT_CHECK(VFIOPCIDevice, obj, =
TYPE_VFIO_PCI)
=20
-#define TYPE_VIFO_PCI_NOHOTPLUG "vfio-pci-nohotplug"
+#define TYPE_VFIO_PCI_NOHOTPLUG "vfio-pci-nohotplug"
=20
 static void vfio_disable_interrupts(VFIOPCIDevice *vdev);
 static void vfio_mmap_set_enabled(VFIOPCIDevice *vdev, bool enabled);
@@ -3199,7 +3199,7 @@ static void =
vfio_pci_nohotplug_dev_class_init(ObjectClass *klass, void *data)
 }
=20
 static const TypeInfo vfio_pci_nohotplug_dev_info =3D {=20
-    .name =3D TYPE_VIFO_PCI_NOHOTPLUG,
+    .name =3D TYPE_VFIO_PCI_NOHOTPLUG,
     .parent =3D TYPE_VFIO_PCI,
     .instance_size =3D sizeof(VFIOPCIDevice),
     .class_init =3D vfio_pci_nohotplug_dev_class_init,
--=20
2.7.4



