Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gWmPP-0008WF-Gg
	for mharc-qemu-trivial@gnu.org; Tue, 11 Dec 2018 13:05:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43090)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gWmPH-0008Fv-2i
	for qemu-trivial@nongnu.org; Tue, 11 Dec 2018 13:05:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gWmPG-0007bI-3A
	for qemu-trivial@nongnu.org; Tue, 11 Dec 2018 13:05:19 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:42819)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gWmP3-0007J2-NK; Tue, 11 Dec 2018 13:05:08 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MYtoe-1h1SQh1ST2-00Upav; Tue, 11 Dec 2018 19:04:15 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>, Richard Henderson <rth@twiddle.net>,
	Eduardo Habkost <ehabkost@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Date: Tue, 11 Dec 2018 19:03:39 +0100
Message-Id: <20181211180352.19644-18-laurent@vivier.eu>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181211180352.19644-1-laurent@vivier.eu>
References: <20181211180352.19644-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:G6DARRIaEkXpJZGxAXWoMjpTKhmA1qXG0EnCQMFYUH3ybd3bdn2
	NriWFg6hqxVH0Y7ZNfdi/NLPHgOopBiTv+1zlef+oizAUJq8JNEuBkPfygOUO9elt8rXHfk
	W0NxgCqg/+wHPTeykbRjlcmtenePjvhxwgShKG1AzD4UxEoekWiB/INa05lnVXeoVJwj/Yl
	FB1gFrd9pHDuRJ97eulNg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:V9TPE2iKtjA=:T579+/eNypk3uUo2lIsCmD
	asJAzRabMvr82gHOmRHOKYGpQo2EbCOPxN/jp1VIcvRHbQH1pEoKLqPogkzRVBubwqj63Y7ai
	CiPedxGeSxMTTdrn7a8Z8JvwO3fNl2U85SZCoNmCazx/69mm6gMeeHJ9pKRbIBRakG+CjEfS1
	YFqgEJudthrB8oYhjBGhrl4JLmbrVlavvyKctdEmS2vH8pWhbYCzzSMwUhgQmai53kVd+Z0KR
	R4dh6I0qLuV8cz9Wpa4nwZLBqqW5wJkTlmWwwcO7Tqrhb+lSQ2abKOqgMMXYtG2Xw0c4PRBYL
	d85USnesleAnOae5p6Lm8IgwHRddCO0Gl9m639LudimeBbW7a12I3PO/diobP0v6JErg0Cfdw
	TNFNOOvymUe+nT232vfNXdJUUqjsF7klOCtHlfiVYvQHc3mH+ArgcbUTKwPA6Ri7kRHqdB3pR
	j1jCHBYTKhaiatdIjcGLufilpurMS0RHztKuJnIR67qjyhI+MKvTxtS7VlWIjJ/nM1fxeGTFM
	wbN+/YBiDGcmmuslAzF6mtP2bwbLnWpFxo6asobhcgoxK7i+GBrohThv+E3uwIYK+4ahlMeru
	sscXy332+VWXaQ4bAVaIZcR3ukbVPRE8gePzrFrNXWGjlqw8M1xHyxBAprO7XhA0Rpnj4Ah+k
	S1hCA72EY4UmLrOUlGPIhDhQrLID4naGJ3mp+ixz/CXZTGQU85mYDwdI9ts8voxrskuY/PYGj
	1hgcBkQHyEXroHy1nJpvA2nFVsAAM/A/vQdsknlc1wNyw46flMpmIe7tKYE=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.130
Subject: [Qemu-trivial] [PULL 17/30] MAINTAINERS: Add missing entries to the
 PC Chipset section
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
X-List-Received-Date: Tue, 11 Dec 2018 18:05:24 -0000

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20181125205000.10324-13-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index bfd4ddd93b..a7bf9c42a9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1151,11 +1151,13 @@ F: hw/timer/hpet*
 F: hw/timer/i8254*
 F: hw/timer/mc146818rtc*
 F: hw/watchdog/wdt_ib700.c
+F: hw/watchdog/wdt_i6300esb.c
 F: include/hw/display/vga.h
 F: include/hw/char/parallel.h
 F: include/hw/dma/i8257.h
 F: include/hw/i2c/pm_smbus.h
 F: include/hw/input/i8042.h
+F: include/hw/isa/i8259_internal.h
 F: include/hw/isa/superio.h
 F: include/hw/timer/hpet.h
 F: include/hw/timer/i8254*
-- 
2.19.2


