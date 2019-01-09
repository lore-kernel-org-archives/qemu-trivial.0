Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ghDeY-00031P-6s
	for mharc-qemu-trivial@gnu.org; Wed, 09 Jan 2019 08:12:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46864)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1ghDeW-0002z4-DY
	for qemu-trivial@nongnu.org; Wed, 09 Jan 2019 08:12:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1ghDc6-0000Tr-OU
	for qemu-trivial@nongnu.org; Wed, 09 Jan 2019 08:09:43 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:57903)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1ghDbz-0000EK-Go; Wed, 09 Jan 2019 08:09:35 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1N0Zfg-1hSIRt1kTU-00wV7j; Wed, 09 Jan 2019 14:09:01 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
	Richard Henderson <rth@twiddle.net>,
	David Gibson <david@gibson.dropbear.id.au>,
	Anthony Green <green@moxielogic.com>, John Snow <jsnow@redhat.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Laszlo Ersek <lersek@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
	qemu-block@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	qemu-ppc@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Gerd Hoffmann <kraxel@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=83=C2=A9?= <philmd@redhat.com>,
	Thomas Huth <thuth@redhat.com>
Date: Wed,  9 Jan 2019 14:08:42 +0100
Message-Id: <20190109130844.5172-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190109130844.5172-1-laurent@vivier.eu>
References: <20190109130844.5172-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:zFog74qFr6jfDAJZtrQ8v/ricCXyaU1qOwsOdl6f61yAcj3eXVx
	UaE10aN29i8tu8vUIk30YYrozosVeHAyVsgAF/tjR6BFPA4F5oC7nGtow4XkJviL/dJA96H
	fwe+B1hKy6yoZlNY80ctHlDAub6iuVW8CBgte2IGTUeSh2zEDsa3MnxwILfV3t3y778v06M
	fu8EyL7US3o/QIMr4MgqA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:s5K+itDi2t8=:zXTgCpmPVHshVvd7QWjMj+
	zu53DkRgu7MgACu3NVowpsIrpsm4ToKOz6FlU8fY7vLpf2RhS1iBrtydc5wL9UdXY4tC1BB05
	0tlbAnAnLGOxtO7McFy7hYNzgEztK53OQEoPp2GfCQzCHMBkb8K3imQ6mf0npZSZJCbuScau4
	jwv49iIEsxBgVuBedQFIZ1npd9KYuEjblVKvpj2zjI6mdYCwh5KptZbHH4ml0DsQGr/4Hg60q
	d9y1OFLx1RDyvEzgww1RujQTOLz/wyzvbd9CNuWQWvdfpcujLEhZnBNMh0uJ9ABj7nDnX3CXP
	HqWWQUVyCzNls1WfXryMzuua5ngWqTuJpwJqnySSY1qU0zj5bZO4wIaB3wWuUQXCWPjie6Jdy
	rF5rFftLazsLWxYs1ZDhDOY5Bq5upJHvrYyFJI5Lphb5bJNTihAQxH8/ryh3mz9MlffHuSbJh
	q8fpflfFUKXhXbt8+mlJUi0pfxp58XzSYXs6V6+Fb7AIBOpMcYj1+2r4MsRA0Ya8lxtmQcGrg
	xAp8gvR+6t6cnXSkjl100tDbDD5YsYZt7yjEVuXmjW7PqyTL1Fconnsu0mwfF8+2onTE80dpi
	3GZHNKBTSAFxJXhB71SORahji94zpO34RyKxdH1eDhBqiCSZev+7h6Nrw8u96p9qpgWWv/hu8
	ikvL9qwuC9tZ33alFVGfBU5PIBBGtV607fg/+bgqFf2x+2Z8CJiRUHCZA5PyLOl67cPhb8dwt
	YWYBuPDFMPdBOYUMGJezgynZvo3u0LPz26vDnQ==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.135
Subject: [Qemu-trivial] [PULL 4/6] hw/audio/marvell: Don't include
 unnecessary i2c.h header file
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
X-List-Received-Date: Wed, 09 Jan 2019 13:12:13 -0000

From: Thomas Huth <thuth@redhat.com>

This device does not use I2C, so no need to include the header file here.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <1546614146-10525-1-git-send-email-thuth@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/audio/marvell_88w8618.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/audio/marvell_88w8618.c b/hw/audio/marvell_88w8618.c
index 6600ab4851..035dd76cbf 100644
--- a/hw/audio/marvell_88w8618.c
+++ b/hw/audio/marvell_88w8618.c
@@ -12,7 +12,6 @@
 #include "qemu/osdep.h"
 #include "hw/sysbus.h"
 #include "hw/hw.h"
-#include "hw/i2c/i2c.h"
 #include "hw/audio/wm8750.h"
 #include "audio/audio.h"
 #include "qapi/error.h"
-- 
2.20.1


