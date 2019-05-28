Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hVfCn-0002x9-RL
	for mharc-qemu-trivial@gnu.org; Tue, 28 May 2019 12:44:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57235)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hVfCl-0002ux-MY
	for qemu-trivial@nongnu.org; Tue, 28 May 2019 12:44:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hVfCf-00025c-74
	for qemu-trivial@nongnu.org; Tue, 28 May 2019 12:44:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:4031)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1hVfC3-0000WJ-Kd; Tue, 28 May 2019 12:43:19 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5EB8F772EE;
	Tue, 28 May 2019 16:41:34 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.206.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D0E644251;
	Tue, 28 May 2019 16:41:25 +0000 (UTC)
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
Date: Tue, 28 May 2019 18:40:12 +0200
Message-Id: <20190528164020.32250-3-philmd@redhat.com>
In-Reply-To: <20190528164020.32250-1-philmd@redhat.com>
References: <20190528164020.32250-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Tue, 28 May 2019 16:41:34 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH v2 02/10] hw/scsi: Use the QOM BUS() macro to
 access BusState.qbus
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
X-List-Received-Date: Tue, 28 May 2019 16:44:05 -0000

Rather than looking inside the definition of a BusState with "s->bus.qbus=
",
use the QOM prefered style: "BUS(&s->bus)".

This patch was generated using the following Coccinelle script:

    // Use BUS() macros to access BusState.qbus
    @use_bus_macro_to_access_qbus@
    expression obj;
    identifier bus;
    @@
    -&obj->bus.qbus
    +BUS(&obj->bus)

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/scsi/lsi53c895a.c  | 2 +-
 hw/scsi/mptsas.c      | 4 ++--
 hw/scsi/virtio-scsi.c | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/scsi/lsi53c895a.c b/hw/scsi/lsi53c895a.c
index da7239d94f..a8b7a199f9 100644
--- a/hw/scsi/lsi53c895a.c
+++ b/hw/scsi/lsi53c895a.c
@@ -1860,7 +1860,7 @@ static void lsi_reg_writeb(LSIState *s, int offset,=
 uint8_t val)
         }
         if (val & LSI_SCNTL1_RST) {
             if (!(s->sstat0 & LSI_SSTAT0_RST)) {
-                qbus_reset_all(&s->bus.qbus);
+                qbus_reset_all(BUS(&s->bus));
                 s->sstat0 |=3D LSI_SSTAT0_RST;
                 lsi_script_scsi_interrupt(s, LSI_SIST0_RST, 0);
             }
diff --git a/hw/scsi/mptsas.c b/hw/scsi/mptsas.c
index 929404fb48..e800683e91 100644
--- a/hw/scsi/mptsas.c
+++ b/hw/scsi/mptsas.c
@@ -540,7 +540,7 @@ reply_maybe_async:
         break;
=20
     case MPI_SCSITASKMGMT_TASKTYPE_RESET_BUS:
-        qbus_reset_all(&s->bus.qbus);
+        qbus_reset_all(BUS(&s->bus));
         break;
=20
     default:
@@ -803,7 +803,7 @@ static void mptsas_soft_reset(MPTSASState *s)
     s->intr_mask =3D MPI_HIM_DIM | MPI_HIM_RIM;
     mptsas_update_interrupt(s);
=20
-    qbus_reset_all(&s->bus.qbus);
+    qbus_reset_all(BUS(&s->bus));
     s->intr_status =3D 0;
     s->intr_mask =3D save_mask;
=20
diff --git a/hw/scsi/virtio-scsi.c b/hw/scsi/virtio-scsi.c
index 839f120256..2a71b78e22 100644
--- a/hw/scsi/virtio-scsi.c
+++ b/hw/scsi/virtio-scsi.c
@@ -696,7 +696,7 @@ static void virtio_scsi_reset(VirtIODevice *vdev)
=20
     assert(!s->dataplane_started);
     s->resetting++;
-    qbus_reset_all(&s->bus.qbus);
+    qbus_reset_all(BUS(&s->bus));
     s->resetting--;
=20
     vs->sense_size =3D VIRTIO_SCSI_SENSE_DEFAULT_SIZE;
--=20
2.20.1


