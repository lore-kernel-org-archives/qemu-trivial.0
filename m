Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1grP8C-0000NZ-SS
	for mharc-qemu-trivial@gnu.org; Wed, 06 Feb 2019 10:28:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56038)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1grP8A-0000Ig-Rp
	for qemu-trivial@nongnu.org; Wed, 06 Feb 2019 10:28:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1grP88-0004Wh-OW
	for qemu-trivial@nongnu.org; Wed, 06 Feb 2019 10:28:54 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:54505)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1grP7y-0004MF-7T; Wed, 06 Feb 2019 10:28:43 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1Mdvyo-1hR0rH2Ah4-00b6Hi; Wed, 06 Feb 2019 16:28:25 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Eduardo Habkost <ehabkost@redhat.com>,
	qemu-trivial@nongnu.org, Anthony Green <green@moxielogic.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-arm@nongnu.org,
	Andrzej Zaborowski <balrogg@gmail.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
	Michael Tokarev <mjt@tls.msk.ru>, Peter Maydell <peter.maydell@linaro.org>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Thomas Huth <thuth@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
Date: Wed,  6 Feb 2019 16:28:07 +0100
Message-Id: <20190206152807.31896-8-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190206152807.31896-1-laurent@vivier.eu>
References: <20190206152807.31896-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:phOavywWNVsBXnFLU/hFHxIScoTktw3Qh/cVYO372smu4BBlmfV
	XUNo2yZVTe/BsPKV/y/aH3A1JX7WQsx93NvEXfuTAokUN9QkxOjXSMiHwTivcYWdExj9NNL
	QhLIH23R1KLOyamY7xPolasgu52p2sSMZli94sXl6a2e3giG6pxSGx+GOoy2zkfXF6L/HIA
	oMKqUfAGcp9J5XK+7WS4g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:sdjldisaT/0=:X/4oGKqGeTTdlov8fhN/Ke
	IQoqbwXHMiJ6v1ywy/NiLpo7nc9u3+DF730xIpzqcMgWQMAfn2GGpcW96t/c5UHbSMcK+8R/i
	omziyUBz7sCmpGnjOnOIEeMW7Xtx3uZBlP4zzlhxq0QBfFFMRI0I1T5ua97bNThgR8h4O+wMY
	SKB/8WQyqkyflj5/B25SUt/1NVSRuKD1CoA3ioL6m8tL33hnajgTtvA/mys1UdUb2CCZ/GZLD
	u1OqevcVVcSbloRxh7nYX/3a8+zTT3fBiDe1dhxtA3FhNFhA8gE4VaeAtIwQGrNxuDI4XH69M
	LqVyawOZZy522PClRruNp7JF8Hf+69WpcUNIgdieDdNmaHVi/YuzZeaR/kwTiLmpkF5eNNh81
	W7tclnk0kySxybCXxK29zQTLuyWaV6BNgPy6z2Pt5Nz+2vzCpLCjU4IFgjBeOmcmJ2nS3v6BD
	tzNC+Ph8DHifE/A55TYFuOneYBNmjoDrBOpC86q/wel5OMfzP9qmG7y9gB9RfQVt1gu7kmC65
	vWmwMmQIey4W0PxgyKzWAkyTeW5An4bs9ri7gKXQSBjw1DqUY9UL4Rw3a0hNzJWvUc/SmFTbw
	nlOBKXrUuQSwr0H+yWtR5qhj0Lyvt2RVVmDEVDpzkIMyimyRMhucwQSPZNjSiFBMTMHUeBonQ
	8K3gsFc8ACZqTPhK1lFbxM28uLnxOJWZllnYkhL9zKj1jV9g5qd+DH5zWPcU6YBhN+wwlE0DM
	9sJwB9o+sFQZopacDLDAhmj6OXrvfRHnEVr3e4ellcRCBAxAyJQmSvYPYj4=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.133
Subject: [Qemu-trivial] [PULL 7/7] hw/input/tsc210x: Fix building with no
 verbosity
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
X-List-Received-Date: Wed, 06 Feb 2019 15:28:55 -0000

From: Philippe Mathieu-Daudé <philmd@redhat.com>

When building with TSC_VERBOSE not defined, we get:
      CC      arm-softmmu/hw/input/tsc210x.o
    hw/input/tsc210x.c: In function ‘tsc2102_data_register_write’:
    hw/input/tsc210x.c:554:5: error: label at end of compound statement
         default:
         ^~~~~~~
    hw/input/tsc210x.c: In function ‘tsc2102_control_register_write’:
    hw/input/tsc210x.c:638:5: error: label at end of compound statement
         bad_reg:
         ^~~~~~~
    hw/input/tsc210x.c: In function ‘tsc2102_audio_register_write’:
    hw/input/tsc210x.c:766:5: error: label at end of compound statement
         default:
         ^~~~~~~
    make[1]: *** [rules.mak:69: hw/input/tsc210x.o] Error 1

Fix this by replacing the culprit fprintf(stderr) calls by a more
recent API: qemu_log_mask(LOG_GUEST_ERROR). Other fprintf() calls
are left untouched.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Message-Id: <20190204204517.23698-1-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/input/tsc210x.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/hw/input/tsc210x.c b/hw/input/tsc210x.c
index ded0db9351..2eb3cb9518 100644
--- a/hw/input/tsc210x.c
+++ b/hw/input/tsc210x.c
@@ -552,10 +552,8 @@ static void tsc2102_data_register_write(
         return;
 
     default:
-#ifdef TSC_VERBOSE
-        fprintf(stderr, "tsc2102_data_register_write: "
-                        "no such register: 0x%02x\n", reg);
-#endif
+        qemu_log_mask(LOG_GUEST_ERROR, "tsc2102_data_register_write: "
+                                       "no such register: 0x%02x\n", reg);
     }
 }
 
@@ -636,10 +634,8 @@ static void tsc2102_control_register_write(
 
     default:
     bad_reg:
-#ifdef TSC_VERBOSE
-        fprintf(stderr, "tsc2102_control_register_write: "
-                        "no such register: 0x%02x\n", reg);
-#endif
+        qemu_log_mask(LOG_GUEST_ERROR, "tsc2102_control_register_write: "
+                                       "no such register: 0x%02x\n", reg);
     }
 }
 
@@ -764,10 +760,8 @@ static void tsc2102_audio_register_write(
         return;
 
     default:
-#ifdef TSC_VERBOSE
-        fprintf(stderr, "tsc2102_audio_register_write: "
-                        "no such register: 0x%02x\n", reg);
-#endif
+        qemu_log_mask(LOG_GUEST_ERROR, "tsc2102_audio_register_write: "
+                                       "no such register: 0x%02x\n", reg);
     }
 }
 
-- 
2.20.1


