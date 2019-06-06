Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hYqFi-0000jP-5w
	for mharc-qemu-trivial@gnu.org; Thu, 06 Jun 2019 07:08:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60813)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hYqFd-0000dd-PF
	for qemu-trivial@nongnu.org; Thu, 06 Jun 2019 07:08:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hYqFc-00042j-Fh
	for qemu-trivial@nongnu.org; Thu, 06 Jun 2019 07:08:09 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:55263)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1hYqFV-0003op-VF; Thu, 06 Jun 2019 07:08:02 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA
	(Nemesis)
	id 1MVMJ7-1hAGXq33Ul-00SNSl; Thu, 06 Jun 2019 13:07:02 +0200
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
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
Date: Thu,  6 Jun 2019 13:06:23 +0200
Message-Id: <20190606110625.32127-15-laurent@vivier.eu>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190606110625.32127-1-laurent@vivier.eu>
References: <20190606110625.32127-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:6yAVocbjKkdBthOG0ZynWAA9tjWYhTGgRctHDWFppOnRh6f2oMI
	/vBXPjYl9uytwxPm04GLkOO7j2odwptj220yrssmmYDeu0p6f+nOslYEn2YV9RLY0AFoTwk
	/Js5BQh+wgbFrluk1P3muu+XHFGrYBEikXnFBGguEjXFynE/RZr1ORbtbU3QrJfWVYTOjV3
	XxNsfe0AepBWa+PepxPEQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:a7UhvE8kYu0=:HOw3Hj6Z+A6PP6wACCkwe9
	h3cyl3LZAPts2BrmQ/Rcd31UoLU6jx31hJSCCGgbUC1g2CrBY3jegxvu8YVXXNBiuNwFUS+39
	+NuWw015mgPDFwXEVPEDQM0ypqp17ulEa9LOzgTXqBnGEXujsQRncbHmWAAeU9ajurvchszGa
	otlD7e9F6Wle+N/jgjgTbrdiI1FAqDjzpnVcdJFjPrUYML2gGkEpliu6/V9KKCiLsVVEjqqgG
	HzIQj1xL6bTjDp2Ln2016N8dmg1pGMcD3crtSOn0qMabF/6cBezy2Ovo4eo1Rq2/rkZJlH0Hj
	7BiMiuoDY3EAskoJj6l3nq1sHgVzkey3oEMXp4qpwCXbXbeqCouEsPouaEcVty5Wk2b/Ufoch
	csvi8lzHGBDMM/P8mLvfgzWvUS/ktbSVViNZ3c+8Fv/154D90h7Ix1pueVFBASTyqYHpsEEHe
	VPqnmuy1auUwIhcz2nFuXAFdwlS3VVPxMLRqkZKTdijfnRuXvDNPL7L5FvbAS28fCBa7d3xC2
	UQkD52h9vNZ/hY5vcpFPJYPhOfC94ptFvolcAgB3XzHEoPmb3yQ5DiSPdHivRuQLV5hrnTYgE
	MchukZicxKLDe5d3WNrliGpf2W9gCpS8SrEaGVHRJsVIQ4eMlumt80ShKfLtSaS4zUSg0+CTG
	uxORGPOE3Ltsy+SEzjGF/g/YUfVh5miWlOLPcwaDgjtJ8KzS2swqtlLTDomgZ3x+JQ1vMPrAY
	Ca/fe1I+ZmBs0B/r1hl4T7LVpC1cCcFg2yTGFNqysDvF2zW/YQ18TTOUmvY=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.10
Subject: [Qemu-trivial] [PULL 14/16] hw/sd: Use the QOM BUS() macro to
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
X-List-Received-Date: Thu, 06 Jun 2019 11:08:10 -0000

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Rather than looking inside the definition of a BusState with "s->bus.qbus",
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
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20190528164020.32250-6-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/sd/milkymist-memcard.c | 2 +-
 hw/sd/ssi-sd.c            | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/sd/milkymist-memcard.c b/hw/sd/milkymist-memcard.c
index df42aa1c545b..dd1ba649d9c0 100644
--- a/hw/sd/milkymist-memcard.c
+++ b/hw/sd/milkymist-memcard.c
@@ -277,7 +277,7 @@ static void milkymist_memcard_realize(DeviceState *dev, Error **errp)
     /* FIXME use a qdev drive property instead of drive_get_next() */
     dinfo = drive_get_next(IF_SD);
     blk = dinfo ? blk_by_legacy_dinfo(dinfo) : NULL;
-    carddev = qdev_create(&s->sdbus.qbus, TYPE_SD_CARD);
+    carddev = qdev_create(BUS(&s->sdbus), TYPE_SD_CARD);
     qdev_prop_set_drive(carddev, "drive", blk, &err);
     object_property_set_bool(OBJECT(carddev), true, "realized", &err);
     if (err) {
diff --git a/hw/sd/ssi-sd.c b/hw/sd/ssi-sd.c
index 623d0333e863..25e1009277ed 100644
--- a/hw/sd/ssi-sd.c
+++ b/hw/sd/ssi-sd.c
@@ -249,7 +249,7 @@ static void ssi_sd_realize(SSISlave *d, Error **errp)
     /* Create and plug in the sd card */
     /* FIXME use a qdev drive property instead of drive_get_next() */
     dinfo = drive_get_next(IF_SD);
-    carddev = qdev_create(&s->sdbus.qbus, TYPE_SD_CARD);
+    carddev = qdev_create(BUS(&s->sdbus), TYPE_SD_CARD);
     if (dinfo) {
         qdev_prop_set_drive(carddev, "drive", blk_by_legacy_dinfo(dinfo), &err);
     }
-- 
2.21.0


