Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hYqF3-00006B-Uf
	for mharc-qemu-trivial@gnu.org; Thu, 06 Jun 2019 07:07:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60189)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hYqF0-0008Uf-Oo
	for qemu-trivial@nongnu.org; Thu, 06 Jun 2019 07:07:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hYqEz-0002xr-Nx
	for qemu-trivial@nongnu.org; Thu, 06 Jun 2019 07:07:30 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:59695)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1hYqEz-0002uI-DY; Thu, 06 Jun 2019 07:07:29 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA
	(Nemesis)
	id 1MTzOe-1h8t6B2imY-00R0Q2; Thu, 06 Jun 2019 13:06:49 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Aleksandar Rikalo <arikalo@wavecomp.com>,
	Juan Quintela <quintela@redhat.com>,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Fam Zheng <fam@euphon.net>, Michael Walle <michael@walle.cc>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>, David Hildenbrand <david@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Yuval Shaia <yuval.shaia@oracle.com>, qemu-trivial@nongnu.org,
	Halil Pasic <pasic@linux.ibm.com>, Richard Henderson <rth@twiddle.net>,
	qemu-s390x@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>,
	Dmitry Fleytman <dmitry.fleytman@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Date: Thu,  6 Jun 2019 13:06:16 +0200
Message-Id: <20190606110625.32127-8-laurent@vivier.eu>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190606110625.32127-1-laurent@vivier.eu>
References: <20190606110625.32127-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:wUnOf9ABFcZPIdu6WP+ydyND6/T7AEWzdtKYRCuFesgdbDO+pWV
	bscKmJLVjodYrfN8t9iS1cRpPoCDfV+1mf45ZCBA0YdeGPvJXrr2kqU85fI/RCIAeKkf8Jg
	ubdzGz+CcwdO7d2x7jUoCesWsXskwq52BSz9noUg54VgWoR9cGbPPJseEril9oBCNCI+tRH
	L5CUmfTnWIO1Dy5v6GQ1w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:PsnsnShj0z4=:G7S6rys+wtd5sUWMA/PkgR
	lfvSW1K9nLgLNl/tGLs0aGnp4VvdO5/LOTBI0aiabPu9ARvuoatC6cxNPlW5n2z0hdcOiF9Wi
	y1VmiJAItG34MlcinYh2/E2kT57r0uQijv7//EeUn2E4FVTXESQy+iUq5U/5q1LLURaNQt/eF
	jARx/NawnA0BNvRlisSTiIVXVXW/1plgAcZWV/H9+9f63llE7F9EBkAwOIyDOP3ZQw2NEYNh/
	8WC9qhwe8/AT+IlPOmGwHXxA1ypI4vd71H29OBk58psaqnxXAld4uxl3HZpj7J5PhZaSS6HuM
	CICOud97dMRjjnYQSq5XcT3SYcjUMJt/h91bAy+c0501mrxy4f9ZOJoSZgS9ZrFubFmvsdll3
	a1c8r4PkFOC9b2q1MTCIVlHrum3itWxporQBDjZaEFFEHjt6ircdnjEER5joOGy/O7ftMKfSJ
	wCumsZiJ2mIbgmq8pYX+hpZLh4l9K7Kuccs9OqqulUhLaZSmMhMzY2CmlUYmZ+CDbMpOKj14E
	nqTf3yKvwhXeEyAkzyNiP6ePbJjEN9GWYVGojba8P1RDcyM/PdAw0amdrd1xvfkKQoxWw10zf
	LfcnH118f4YeFKzp1IVc11aUosTNwp5wIvFxc9LzSENS2788Ds8eaeKl3xPbEePAPLy16Vxdk
	zTfn7zZKQl9NmPzhigTgU2ceoMBtj31vi+cA4U/ve8mvuRsFiqHqChRRvc0Q2G0+LkgJrOWnq
	jgzQMG2ERAx9l0yay8jw2bkWS6GaWZJU8Owp6sYvJm8+DFxaspYnn7KaQ8Y=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.24
Subject: [Qemu-trivial] [PULL 07/16] hw/scsi/vmw_pvscsi: Use
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
X-List-Received-Date: Thu, 06 Jun 2019 11:07:31 -0000

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Since the BusState is accesible from the SCSIBus object,
it is pointless to use qbus_reset_all_fn.
Use qbus_reset_all() directly.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Dmitry Fleytman <dmitry.fleytman@gmail.com>
Message-Id: <20190528164020.32250-2-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/scsi/vmw_pvscsi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/scsi/vmw_pvscsi.c b/hw/scsi/vmw_pvscsi.c
index 584b4be07e79..c39e33fa3599 100644
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
 
     s->resetting++;
-    qbus_reset_all_fn(&s->bus);
+    qbus_reset_all(BUS(&s->bus));
     s->resetting--;
     return PVSCSI_COMMAND_PROCESSING_SUCCEEDED;
 }
-- 
2.21.0


