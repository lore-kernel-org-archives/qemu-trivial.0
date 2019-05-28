Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hVfD5-0003IY-0f
	for mharc-qemu-trivial@gnu.org; Tue, 28 May 2019 12:44:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57692)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hVfD2-0003FV-Df
	for qemu-trivial@nongnu.org; Tue, 28 May 2019 12:44:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hVfCx-0002wL-5q
	for qemu-trivial@nongnu.org; Tue, 28 May 2019 12:44:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53380)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1hVfCp-0000yI-Mz; Tue, 28 May 2019 12:44:07 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AE8F4C05D419;
	Tue, 28 May 2019 16:42:21 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.206.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F7F960BDF;
	Tue, 28 May 2019 16:42:13 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: Dmitry Fleytman <dmitry.fleytman@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
	Aleksandar Rikalo <arikalo@wavecomp.com>,
	Halil Pasic <pasic@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Michael Walle <michael@walle.cc>, Richard Henderson <rth@twiddle.net>,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Cornelia Huck <cohuck@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, Fam Zheng <fam@euphon.net>,
	qemu-s390x@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Date: Tue, 28 May 2019 18:40:17 +0200
Message-Id: <20190528164020.32250-8-philmd@redhat.com>
In-Reply-To: <20190528164020.32250-1-philmd@redhat.com>
References: <20190528164020.32250-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Tue, 28 May 2019 16:42:21 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH v2 07/10] hw/isa: Use the QOM DEVICE() macro
 to access DeviceState.qdev
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
X-List-Received-Date: Tue, 28 May 2019 16:44:21 -0000

Rather than looking inside the definition of a DeviceState with
"s->qdev", use the QOM prefered style: "DEVICE(s)".

This patch was generated using the following Coccinelle script:

    // Use DEVICE() macros to access DeviceState.qdev
    @use_device_macro_to_access_qdev@
    expression obj;
    identifier dev;
    @@
    -&obj->dev.qdev
    +DEVICE(obj)

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/isa/lpc_ich9.c | 2 +-
 hw/isa/vt82c686.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
index 031ee9cd93..35d17246e9 100644
--- a/hw/isa/lpc_ich9.c
+++ b/hw/isa/lpc_ich9.c
@@ -412,7 +412,7 @@ void ich9_lpc_pm_init(PCIDevice *lpc_pci, bool smm_en=
abled)
                                  true);
     }
=20
-    ich9_lpc_reset(&lpc->d.qdev);
+    ich9_lpc_reset(DEVICE(lpc));
 }
=20
 /* APM */
diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 85d0532dd5..d46754f61c 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -369,7 +369,7 @@ static void vt82c686b_pm_realize(PCIDevice *dev, Erro=
r **errp)
     pci_conf[0x90] =3D s->smb_io_base | 1;
     pci_conf[0x91] =3D s->smb_io_base >> 8;
     pci_conf[0xd2] =3D 0x90;
-    pm_smbus_init(&s->dev.qdev, &s->smb, false);
+    pm_smbus_init(DEVICE(s), &s->smb, false);
     memory_region_add_subregion(get_system_io(), s->smb_io_base, &s->smb=
.io);
=20
     apm_init(dev, &s->apm, NULL, s);
--=20
2.20.1


