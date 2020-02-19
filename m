Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j4MQ2-0003tA-Oo
	for mharc-qemu-trivial@gnu.org; Wed, 19 Feb 2020 05:17:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53428)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1j4MPn-0003eq-N8
 for qemu-trivial@nongnu.org; Wed, 19 Feb 2020 05:17:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1j4MPm-0005IX-5k
 for qemu-trivial@nongnu.org; Wed, 19 Feb 2020 05:17:11 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:44969)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1j4MPl-0005Gl-TE; Wed, 19 Feb 2020 05:17:10 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1Mk178-1jkK0e0YCu-00kMBz; Wed, 19 Feb 2020 11:16:48 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Marek Vasut <marex@denx.de>,
 Thomas Huth <thuth@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Jiri Pirko <jiri@resnulli.us>, qemu-arm@nongnu.org,
 Alistair Francis <alistair@alistair23.me>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>,
 Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-trivial@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Thomas Huth <huth@tuxfamily.org>,
 qemu-block@nongnu.org, Chris Wulff <crwulff@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>,
 Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PULL 15/17] hw/net/rocker: Report unimplemented feature with
 qemu_log_mask(UNIMP)
Date: Wed, 19 Feb 2020 11:16:10 +0100
Message-Id: <20200219101612.1033925-16-laurent@vivier.eu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200219101612.1033925-1-laurent@vivier.eu>
References: <20200219101612.1033925-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:duAcb355ECFPnNuZgkT11wz2BIZvCxzcAZlcm39hkXWB3RYN+Lv
 1TbbRN/Dcextyh8eKlj0fCir7CJsYi4jJCFxLZd/CC41HCDKH1Xi0fuZ4NCIO5/+U9jDEal
 nLPv2L1ODWfjOK4qBrLi8uBfCBKlUMSqA3cSG4CiGIYyO5ssOxc5skVMs+bH7moZS8+AcS3
 rmM7+LpOPDntiil4qFaeA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:mdaeES3PDsM=:b/BG0e9SXww0sJCuQ8MCTT
 QE2qVIEL0RXs+i+4U7i4jL4h/89O+KyO8qx/A6rQ5h/dQFLi7y9PFLnj2xmBfRyl35p/jNb3l
 9vD9yVvPaB1D7uqmWfl1r/WtOvekYFyKf8i45MzHqlVc7+WiSuftQFQ633w/efaU1SAYdliU+
 SzpuvRuwV0HI3BqhV8GDORTCoP/6lNsNn1IN+52LM0B0Mnhks/NBDwvHGHif2DFE4SmrTxV/h
 ZdGwHSLO0ry/aQ8qcxBQ6ok0ExT+9WoOZ53zqC4hVjqmWSN816ga2+THoye/q+St54pc83E1/
 WLfS9B7ZXWdSDgHNqtGCbTByX671QeBr3QZRrBOEOuKiDtcpNNtv1tSTfxuCQm81xBSegV08j
 a4pUE0MFRYqYc9Z3r+Hh0WtgLsIRfnsHzErw/Y662EgJO+mxyxiakpV1x4Yl2Rx5nVcXV2D2H
 yvSothDc4Y2+t+7VGS/WciPGQ6W5e6OZMFK56uJ6lchoK+KBYEYJaqXeFW40Qh71bciPFmVA8
 DEvfXicO6fGUMwNAwhMvU8yysxwz/58cNwpsY3t/oUHIO+/j0eJ4dlfN2GfEaa64+vp7HOmh2
 q2DvY/zXXc8b4bZId+8lmUcA4kMUrwyw9/djxXxGB6CFxvZP9Tr+XQb3+eFfvBmkCp5aGC4Ij
 OuRZA8ctEAr0Kc8c+an1K5++Jbm8vHCyeVjS0H8RK61NJN05sjP3+7DioMy5pPvW8yPeC9oNw
 Ov4UtfGU+YCeQQeBGk7s2JviPBDplQ6E/0EUk4kbQzAtm6uCXsZi8kzYrk+jEipn+K5gyCDn0
 54IW3HB8kmuL1fR0JNwL6XXXgVB2ee7Yglcx/gXwHmUlYSxTW//aAw+Lkylt8XfmqObunby
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.74
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
X-List-Received-Date: Wed, 19 Feb 2020 10:17:16 -0000

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Fix warnings reported by Clang static code analyzer:

    CC      hw/net/rocker/rocker.o
  hw/net/rocker/rocker.c:213:9: warning: Value stored to 'tx_tso_mss' is never read
          tx_tso_mss = rocker_tlv_get_le16(tlvs[ROCKER_TLV_TX_TSO_MSS]);
          ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  hw/net/rocker/rocker.c:217:9: warning: Value stored to 'tx_tso_hdr_len' is never read
          tx_tso_hdr_len = rocker_tlv_get_le16(tlvs[ROCKER_TLV_TX_TSO_HDR_LEN]);
          ^                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  hw/net/rocker/rocker.c:255:9: warning: Value stored to 'tx_l3_csum_off' is never read
          tx_l3_csum_off += tx_tso_mss = tx_tso_hdr_len = 0;
          ^                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Fixes: dc488f888
Reported-by: Clang Static Analyzer
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20200217101637.27558-1-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/net/rocker/rocker.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/hw/net/rocker/rocker.c b/hw/net/rocker/rocker.c
index 81dd3b5f141d..15d66f6cbcf0 100644
--- a/hw/net/rocker/rocker.c
+++ b/hw/net/rocker/rocker.c
@@ -27,6 +27,7 @@
 #include "qemu/iov.h"
 #include "qemu/module.h"
 #include "qemu/bitops.h"
+#include "qemu/log.h"
 
 #include "rocker.h"
 #include "rocker_hw.h"
@@ -207,14 +208,22 @@ static int tx_consume(Rocker *r, DescInfo *info)
 
     if (tlvs[ROCKER_TLV_TX_L3_CSUM_OFF]) {
         tx_l3_csum_off = rocker_tlv_get_le16(tlvs[ROCKER_TLV_TX_L3_CSUM_OFF]);
+        qemu_log_mask(LOG_UNIMP, "rocker %s: L3 not implemented"
+                                 " (cksum off: %u)\n",
+                      __func__, tx_l3_csum_off);
     }
 
     if (tlvs[ROCKER_TLV_TX_TSO_MSS]) {
         tx_tso_mss = rocker_tlv_get_le16(tlvs[ROCKER_TLV_TX_TSO_MSS]);
+        qemu_log_mask(LOG_UNIMP, "rocker %s: TSO not implemented (MSS: %u)\n",
+                      __func__, tx_tso_mss);
     }
 
     if (tlvs[ROCKER_TLV_TX_TSO_HDR_LEN]) {
         tx_tso_hdr_len = rocker_tlv_get_le16(tlvs[ROCKER_TLV_TX_TSO_HDR_LEN]);
+        qemu_log_mask(LOG_UNIMP, "rocker %s: TSO not implemented"
+                                 " (hdr length: %u)\n",
+                      __func__, tx_tso_hdr_len);
     }
 
     rocker_tlv_for_each_nested(tlv_frag, tlvs[ROCKER_TLV_TX_FRAGS], rem) {
@@ -249,12 +258,6 @@ static int tx_consume(Rocker *r, DescInfo *info)
         iovcnt++;
     }
 
-    if (iovcnt) {
-        /* XXX perform Tx offloads */
-        /* XXX   silence compiler for now */
-        tx_l3_csum_off += tx_tso_mss = tx_tso_hdr_len = 0;
-    }
-
     err = fp_port_eg(r->fp_port[port], iov, iovcnt);
 
 err_too_many_frags:
-- 
2.24.1


