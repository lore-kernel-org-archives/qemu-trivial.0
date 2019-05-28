Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hVfD8-0003Ok-J3
	for mharc-qemu-trivial@gnu.org; Tue, 28 May 2019 12:44:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57805)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hVfD6-0003KT-BD
	for qemu-trivial@nongnu.org; Tue, 28 May 2019 12:44:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hVfD4-0003GJ-Df
	for qemu-trivial@nongnu.org; Tue, 28 May 2019 12:44:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42170)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1hVfCt-0000Q9-MC; Tue, 28 May 2019 12:44:11 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id ED7F230B337B;
	Tue, 28 May 2019 16:41:24 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.206.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E1EC60BDF;
	Tue, 28 May 2019 16:41:15 +0000 (UTC)
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
Date: Tue, 28 May 2019 18:40:11 +0200
Message-Id: <20190528164020.32250-2-philmd@redhat.com>
In-Reply-To: <20190528164020.32250-1-philmd@redhat.com>
References: <20190528164020.32250-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Tue, 28 May 2019 16:41:32 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH v2 01/10] hw/scsi/vmw_pvscsi: Use
 qbus_reset_all() directly
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
X-List-Received-Date: Tue, 28 May 2019 16:44:25 -0000

Since the BusState is accesible from the SCSIBus object,
it is pointless to use qbus_reset_all_fn.
Use qbus_reset_all() directly.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
v2: Use BUS() macro (Peter Maydell)

One step toward removing qbus_reset_all_fn()
---
 hw/scsi/vmw_pvscsi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/scsi/vmw_pvscsi.c b/hw/scsi/vmw_pvscsi.c
index 584b4be07e..c39e33fa35 100644
--- a/hw/scsi/vmw_pvscsi.c
+++ b/hw/scsi/vmw_pvscsi.c
@@ -440,7 +440,7 @@ static void
 pvscsi_reset_adapter(PVSCSIState *s)
 {
     s->resetting++;
-    qbus_reset_all_fn(&s->bus);
+    qbus_reset_all(BUS(&s->bus));
     s->resetting--;
     pvscsi_process_completion_queue(s);
     assert(QTAILQ_EMPTY(&s->pending_queue));
@@ -848,7 +848,7 @@ pvscsi_on_cmd_reset_bus(PVSCSIState *s)
     trace_pvscsi_on_cmd_arrived("PVSCSI_CMD_RESET_BUS");
=20
     s->resetting++;
-    qbus_reset_all_fn(&s->bus);
+    qbus_reset_all(BUS(&s->bus));
     s->resetting--;
     return PVSCSI_COMMAND_PROCESSING_SUCCEEDED;
 }
--=20
2.20.1


