Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iNv4v-0000cR-B1
	for mharc-qemu-trivial@gnu.org; Fri, 25 Oct 2019 04:36:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49648)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1iNv4r-0000WK-FZ
 for qemu-trivial@nongnu.org; Fri, 25 Oct 2019 04:36:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1iNv4q-0007ja-Ef
 for qemu-trivial@nongnu.org; Fri, 25 Oct 2019 04:36:09 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:45989)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1iNv4q-0007iR-4Q; Fri, 25 Oct 2019 04:36:08 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MjjSt-1hhgEX0pvH-00lEJL; Fri, 25 Oct 2019 10:35:26 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Artyom Tarasenko <atar4qemu@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 Joel Stanley <joel@jms.id.au>, "Michael S. Tsirkin" <mst@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Laurent Vivier <laurent@vivier.eu>, Michael Tokarev <mjt@tls.msk.ru>,
 Richard Henderson <rth@twiddle.net>, qemu-block@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-arm@nongnu.org,
 qemu-trivial@nongnu.org, Fam Zheng <fam@euphon.net>,
 Aleksandar Rikalo <arikalo@wavecomp.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Andrew Jeffery <andrew@aj.id.au>, Helge Deller <deller@gmx.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-ppc@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Frediano Ziglio <fziglio@redhat.com>
Subject: [PULL 03/19] util/async: avoid useless cast
Date: Fri, 25 Oct 2019 10:34:55 +0200
Message-Id: <20191025083511.11463-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191025083511.11463-1-laurent@vivier.eu>
References: <20191025083511.11463-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:onD7UkbNa4WcqpkfMRXh4f2hRmOW8C3mwnPjy0VAImYEeEq4nPu
 CRId/qUyJGNBiOyQrpE42eC0YEtBLhHV1xBd2Wffq14aJN/oPhNh+kc4cvLQ+ivT9F22XXl
 lDjx0DXU8p2SPkXv76zBwuekgZvvsQRT2mR2E0LVvOujtpk898IVmzH0e5ZH4cmAVvSCXK4
 SVx9vBNb1IbomK50Es03Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:tAM5+AlWd3M=:Ig6AfLJCT3dRBJ4ri7kM2+
 5Qg+vq29NwIQM0mwgZ4blaw9zON5OXQtUfOPCBRBiIUGBWmDtZWapmCZtI+r9y8bUjCgvi22O
 GJmZbY5SRFjn5tFwTdIeBODiaFKZCR+jjntsWQPPBsyTWbgY3sLbFqP3yx1hPnbpDFyCMuqPW
 qMRBCSQLzVWqckdABMgkzIDUHmYw1vw9UhfM2NFerDOnsTGR768lpFyA4MmTOt8tb4GpHTQH5
 SCokWHcLEhcfmKuK8NqjFIxaC2ZEVyqK1e0AA83co2ocC79q7cUmge4ncTbW08Buy9jmduOb3
 308dURjYoPKWZ1awRyKERjrZ0WIxI85rfIFT2gZfQFhjnFQdVzTHtXgA4CfZ2+/TpkM4J0Bwc
 RDVh0zeZtSl1rKF4F17p8ijKAT3gc1UGqxFu9RimAXf7mdCB09za8mR/z5Lnm4BevNIG5tjiP
 Bo4Y8/gb3k09fYjgf7w8gsuQkxNCQiTWHplwyYtS77XhhYSdLwTb+yi0IU1UXJK7DjkvhcDxk
 6+Z2U1OUtdP6iK3vEUStq1e19U71OdZoKml5GEfpDGg/0mjp0OqbYjuL0aMmSIsybRQ1i0U8m
 0BnG2KXsxMwza7+WdPyuE5dgZQh1jmZQP6uVPGfGdJPDZAx3+w79EckcF8wYwbXxNvEDP/oej
 QrjXL+x+K+XA04jmptHK0/XZEmQqvBuNsyxp4YJEoH6IEmwsAdskxEzYmSd1xe3tbIWwomRxh
 S9tQ74hwRsCNzMuP6wy3egTBzrCamPXTb2wV9QNH2ZaJHm1xPUvIQINZ6jJUAM3rSi/RuA2DA
 I+8+oYS/BYnYyaHQ2UzqFn2JqX2DnW5Tc5ajgScL7x15FNk4EYGErJRNk7baEJBoycPUIqloR
 60b12qJaMcJHlyLy/z8A==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 212.227.126.135
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
X-List-Received-Date: Fri, 25 Oct 2019 08:36:11 -0000

From: Frediano Ziglio <fziglio@redhat.com>

event_notifier_dummy_cb is already compatible with EventNotifierHandler.

Signed-off-by: Frediano Ziglio <fziglio@redhat.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20191023122652.2999-1-fziglio@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 util/async.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/util/async.c b/util/async.c
index ca83e32c7fa1..b1fa5319e5bc 100644
--- a/util/async.c
+++ b/util/async.c
@@ -429,7 +429,6 @@ AioContext *aio_context_new(Error **errp)
 
     aio_set_event_notifier(ctx, &ctx->notifier,
                            false,
-                           (EventNotifierHandler *)
                            event_notifier_dummy_cb,
                            event_notifier_poll);
 #ifdef CONFIG_LINUX_AIO
-- 
2.21.0


