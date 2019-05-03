Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hMWLV-0007aC-Nn
	for mharc-qemu-trivial@gnu.org; Fri, 03 May 2019 07:27:17 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33738)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hMWLS-0007VU-NY
	for qemu-trivial@nongnu.org; Fri, 03 May 2019 07:27:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hMWLR-0002zh-QZ
	for qemu-trivial@nongnu.org; Fri, 03 May 2019 07:27:14 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:45443)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1hMWLP-0002vf-O2; Fri, 03 May 2019 07:27:11 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MsJXG-1gUI620Kd8-00tilO; Fri, 03 May 2019 13:27:00 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
	Fabien Chouteau <chouteau@adacore.com>, qemu-trivial@nongnu.org,
	Richard Henderson <rth@twiddle.net>, Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Michael Tokarev <mjt@tls.msk.ru>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
	Michael Roth <mdroth@linux.vnet.ibm.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Thomas Huth <thuth@redhat.com>
Date: Fri,  3 May 2019 13:26:43 +0200
Message-Id: <20190503112654.4393-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190503112654.4393-1-laurent@vivier.eu>
References: <20190503112654.4393-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:FwDBsksgwr3Ro8wFHhTMgwol3cUCD/ilGRHQs4MAiGl1UtjiqFF
	P3XBYBVYtRXQrlY3wlVNFlUDSIMYOOKFgvqUKJWDLifVc28d1pkpgAFd2+Xx5CrOPa4zIrp
	jXbbP+8W/L58IVc1241l8sHMGugi/MplAaGDDgmSkSRPj4GFQHsjc0IPodDWXAd55FmJSZG
	n/gkGbWdbtuhMZlgq8xVw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:3Uc4m6XBooE=:C8mQ6489mMY17Dd/pk5DSV
	M/kpYAVR1WSwAQLdvhNEvtsVQuIsiquUQ8GAP6NjcY7bo08kn4S9G3MmbSlITXv+g4gFLyW8R
	ac5LxyOxXRsNzZ9RU1Wl0hEeZAHYHW9smt8DeI45IvzmhVm0LGMOQLskuqVmsKIOBcY2Grcc0
	GTGQ8QO2kuvUV2ED/wnMVcvfdrDnhXjAr4fyTfZ2pu/387vZU0mts2h8Tv4KMBaAKKJMQ+7VL
	tZpBgmw/6EUr+2+tEMV5C93gyo3pzCv5jNHkMYgDFrqBVaqQj2RiMVH8zGF2JDuvIfTCYJQia
	D18o3NI7dl8rlj5bOTyL2RkmY9lcC5azv1blG1l2XcwPMhRSF0XHFJsavPDpIsyzk2eKpckR/
	XlFJmdy2MSp6m2tOWuz9q8yjbsxy0jBolrrAkeaK1Iqy2Ln5fSa0NO4WDiu6G4Mao1m38lXg4
	3HEdjzRkD55tvY0+GVzQbTiBEMLLoyZcx1owxDs0e0WOrnBRj5OcZDGR+9PrVOhuBoUnuvDgV
	O0mqxvPbr070Vti/LGZYrct5Jyxi1/hon2Z785dzldqIlq1uvTQaDAZ4GJWZGtXVbLSt84Bzt
	CBU/jSCxD87/ONr2jajbstjUVQARFZ+PbLpAml3nWpaaSNCeKhdb/S25qGr/bzbw5akYiFujj
	rgy0OgZkDxmSop6j/+gAxaNAK3VQcGa6ZGl5xxceB58d1v3o+TqaZubIosV/nh8OHAr8f8ayO
	92qD6/APoUXk+6fqXGHD5qKRWWhZP85mHbuxlkhe9TQ6hSIsk0JBDUno2LE=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.135
Subject: [Qemu-trivial] [PULL v2 01/12] hw/net/pcnet: Use
 qemu_log_mask(GUEST_ERROR) instead of printf
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
X-List-Received-Date: Fri, 03 May 2019 11:27:16 -0000

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Avoid to clutter stdout until explicitly requested
(with -d guest_errors):

  $ qemu-system-mips -M malta -m 512 -kernel vmlinux-3.2.0-4-4kc-malta
  Bad SWSTYLE=0x04

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20190311102712.8572-1-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/net/pcnet.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/net/pcnet.c b/hw/net/pcnet.c
index d9ba04bdfc62..16683091c939 100644
--- a/hw/net/pcnet.c
+++ b/hw/net/pcnet.c
@@ -36,6 +36,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "hw/qdev.h"
 #include "net/net.h"
 #include "net/eth.h"
@@ -1501,7 +1502,8 @@ static void pcnet_bcr_writew(PCNetState *s, uint32_t rap, uint32_t val)
             val |= 0x0300;
             break;
         default:
-            printf("Bad SWSTYLE=0x%02x\n", val & 0xff);
+            qemu_log_mask(LOG_GUEST_ERROR, "pcnet: Bad SWSTYLE=0x%02x\n",
+                          val & 0xff);
             val = 0x0200;
             break;
         }
-- 
2.20.1


