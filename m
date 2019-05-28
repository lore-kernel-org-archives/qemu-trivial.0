Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hVfCo-0002yc-Ne
	for mharc-qemu-trivial@gnu.org; Tue, 28 May 2019 12:44:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57242)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hVfCl-0002v1-Na
	for qemu-trivial@nongnu.org; Tue, 28 May 2019 12:44:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hVfCh-0002A9-3A
	for qemu-trivial@nongnu.org; Tue, 28 May 2019 12:44:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49516)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1hVfC4-0001QA-83; Tue, 28 May 2019 12:43:20 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 148829FFD4;
	Tue, 28 May 2019 16:43:12 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.206.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 20E1060BDF;
	Tue, 28 May 2019 16:42:49 +0000 (UTC)
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
Date: Tue, 28 May 2019 18:40:20 +0200
Message-Id: <20190528164020.32250-11-philmd@redhat.com>
In-Reply-To: <20190528164020.32250-1-philmd@redhat.com>
References: <20190528164020.32250-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Tue, 28 May 2019 16:43:12 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH v2 10/10] hw/watchdog/wdt_i6300esb: Use
 DEVICE() macro to access DeviceState.qdev
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
 hw/watchdog/wdt_i6300esb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/watchdog/wdt_i6300esb.c b/hw/watchdog/wdt_i6300esb.c
index 1c6eddf86a..f2d1e86526 100644
--- a/hw/watchdog/wdt_i6300esb.c
+++ b/hw/watchdog/wdt_i6300esb.c
@@ -200,7 +200,7 @@ static void i6300esb_timer_expired(void *vp)
         if (d->reboot_enabled) {
             d->previous_reboot_flag =3D 1;
             watchdog_perform_action(); /* This reboots, exits, etc */
-            i6300esb_reset(&d->dev.qdev);
+            i6300esb_reset(DEVICE(d));
         }
=20
         /* In "free running mode" we start stage 1 again. */
--=20
2.20.1


