Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gFTvT-0004H3-9G
	for mharc-qemu-trivial@gnu.org; Wed, 24 Oct 2018 20:55:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58531)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1gFTvQ-0004El-IC
	for qemu-trivial@nongnu.org; Wed, 24 Oct 2018 20:55:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1gFTvP-0006s3-S2
	for qemu-trivial@nongnu.org; Wed, 24 Oct 2018 20:55:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59266)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1gFTvM-0006kt-Ig; Wed, 24 Oct 2018 20:54:56 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A0968308FEC9;
	Thu, 25 Oct 2018 00:54:55 +0000 (UTC)
Received: from redhat.com (ovpn-120-69.rdu2.redhat.com [10.10.120.69])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 388436031B;
	Thu, 25 Oct 2018 00:54:54 +0000 (UTC)
Date: Wed, 24 Oct 2018 20:54:53 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Li Qiang <liq3ea@gmail.com>,
	qemu-trivial@nongnu.org,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Message-ID: <20181025005110.249256-26-mst@redhat.com>
References: <20181025005110.249256-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20181025005110.249256-1-mst@redhat.com>
X-Mutt-Fcc: =sent
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Thu, 25 Oct 2018 00:54:55 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PULL v2 25/28] i440fx: use ARRAY_SIZE for
 pam_regions
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
X-List-Received-Date: Thu, 25 Oct 2018 00:55:01 -0000

From: Li Qiang <liq3ea@gmail.com>

Cc: qemu-trivial@nongnu.org

Signed-off-by: Li Qiang <liq3ea@gmail.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/pci-host/piix.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/pci-host/piix.c b/hw/pci-host/piix.c
index 999db824da..82421a86e3 100644
--- a/hw/pci-host/piix.c
+++ b/hw/pci-host/piix.c
@@ -142,7 +142,7 @@ static void i440fx_update_memory_mappings(PCII440FXSt=
ate *d)
     PCIDevice *pd =3D PCI_DEVICE(d);
=20
     memory_region_transaction_begin();
-    for (i =3D 0; i < 13; i++) {
+    for (i =3D 0; i < ARRAY_SIZE(d->pam_regions); i++) {
         pam_update(&d->pam_regions[i], i,
                    pd->config[I440FX_PAM + (DIV_ROUND_UP(i, 2))]);
     }
@@ -412,7 +412,7 @@ PCIBus *i440fx_init(const char *host_type, const char=
 *pci_type,
=20
     init_pam(dev, f->ram_memory, f->system_memory, f->pci_address_space,
              &f->pam_regions[0], PAM_BIOS_BASE, PAM_BIOS_SIZE);
-    for (i =3D 0; i < 12; ++i) {
+    for (i =3D 0; i < ARRAY_SIZE(f->pam_regions) - 1; ++i) {
         init_pam(dev, f->ram_memory, f->system_memory, f->pci_address_sp=
ace,
                  &f->pam_regions[i+1], PAM_EXPAN_BASE + i * PAM_EXPAN_SI=
ZE,
                  PAM_EXPAN_SIZE);
--=20
MST


