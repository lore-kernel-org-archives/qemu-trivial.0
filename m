Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iNv5A-00012c-5o
	for mharc-qemu-trivial@gnu.org; Fri, 25 Oct 2019 04:36:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50038)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1iNv57-0000x2-2j
 for qemu-trivial@nongnu.org; Fri, 25 Oct 2019 04:36:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1iNv56-0007zc-2R
 for qemu-trivial@nongnu.org; Fri, 25 Oct 2019 04:36:24 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:59807)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1iNv4z-0007sV-Mm; Fri, 25 Oct 2019 04:36:17 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MUGyh-1iWTVR1uV9-00REYB; Fri, 25 Oct 2019 10:35:30 +0200
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
 Stefan Hajnoczi <stefanha@redhat.com>,
 Frediano Ziglio <fziglio@redhat.com>, Eric Blake <eblake@redhat.com>
Subject: [PULL 05/19] qemu-timer: reuse MIN macro in qemu_timeout_ns_to_ms
Date: Fri, 25 Oct 2019 10:34:57 +0200
Message-Id: <20191025083511.11463-6-laurent@vivier.eu>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191025083511.11463-1-laurent@vivier.eu>
References: <20191025083511.11463-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:uBpOxXMuLPxHKWK6/kD7EFF3c9UQZLvuAXfyn9fhAoa/clsGmUA
 K55b5ayMJJ4ds1bIRDXooVDF9dB2H3+0+zqjNy3OBx07di4AlLlQ4J9st0OPM0Re+ss4RYy
 zrw7Lr9je/Sz9awOZYYkQu1X8HLdZAeYIrHK1GbcqFZ/kJCbEvEtJMkbil2t0W/wPpHx8UX
 4+U0vZbfLQjurmXs6scJg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:yW8U9yc4Kh0=:7oXwoqjFFLnDYPJG07KtHS
 /JMkSNQJF/7qCculq4xK7/PBaJEU+4LbJKTn5tyBsqpBp/OkqYrK9424puhfi66VTB+0uFZM3
 cO0DpIWNnErxZhh9FSxDXgRLzWvSS4e2tUFltxN/aER8he/Y6O9giH8DhmjiPwV7W/NiORlPN
 0mjhkWI4qaQezpvL+1ssS5cSggm/fqmnUnP4QzEgUKnotLRU+QUabDFgftn+RRPQKFeKONAPh
 ISX7koluDhGcz7hGx2yAOJw+erchTBJ3OX2s1Lg0BAsYczkQ88p9Lw0DLmwRce8EQkhrsT0B9
 AOB9Ju6Q6fSKiWOFW5m4qoq+kQ+12uK6JXgBGTZGQyWrmgQ6/Y+ww6MYG/dSrjAjtqvjn3Xg8
 01nfLN8ODwih56jbeesczywVMzi3VXyYPZQYlpT1Fm2TzdBfAnvCIQI8c4GoJFaVaPw0XoGuJ
 +z6Kdm6RC+kAgtG5ZT04tObCNPSEF6YSGmJ1thCKvPzvf0T+n11Ss6lrjCeSY5nG9Afda8mKp
 KHxz3RtRg5JX9GhMkuDMU61QHaOIqYqs2nB0p4hcPKCoLe9UvscQPSs97YH0LfeHp3/aDs60j
 KNfYHs4ZKOC3+aU3bjpo42HGAfuVE7qKaz/x5O6RyYsjudt3Qiwt4ubWmlBP+q+yDVekSrucy
 QGP1nvkdyRTAhRm3224vQdDvyDpJBeoJEIff0gqs1EKNtCz3R8Xl+69KmOPVkDC2mp0aOjcY5
 TKioR2/aO2T7xu14TJWK8ebe7DkhYPNmZuWAAKLu4JqAqXU11gVDidnwyQ0TkXwm3VNprJGw3
 Gu+6mQSTIB2Pl+XsVFbL6NT2gi6lwUVjj8mn4I10G+TODDIzl1321zkULQKWRNRWK05sxD3PH
 b/TLPtdOomhaZSPmIk0Q==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 212.227.126.134
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
X-List-Received-Date: Fri, 25 Oct 2019 08:36:27 -0000

From: Frediano Ziglio <fziglio@redhat.com>

Signed-off-by: Frediano Ziglio <fziglio@redhat.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20191023122652.2999-3-fziglio@redhat.com>
[lv: removed the two useless casts]
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 util/qemu-timer.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/util/qemu-timer.c b/util/qemu-timer.c
index d428fec56772..ef52d28d3753 100644
--- a/util/qemu-timer.c
+++ b/util/qemu-timer.c
@@ -322,11 +322,7 @@ int qemu_timeout_ns_to_ms(int64_t ns)
     ms = DIV_ROUND_UP(ns, SCALE_MS);
 
     /* To avoid overflow problems, limit this to 2^31, i.e. approx 25 days */
-    if (ms > (int64_t) INT32_MAX) {
-        ms = INT32_MAX;
-    }
-
-    return (int) ms;
+    return MIN(ms, INT32_MAX);
 }
 
 
-- 
2.21.0


