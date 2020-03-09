Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jBK2h-0008OH-L0
	for mharc-qemu-trivial@gnu.org; Mon, 09 Mar 2020 11:10:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33623)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1jBK2e-0008Hk-Qj
 for qemu-trivial@nongnu.org; Mon, 09 Mar 2020 11:10:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1jBK2d-0007sv-Rh
 for qemu-trivial@nongnu.org; Mon, 09 Mar 2020 11:10:04 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:35461)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1jBK2d-0007rk-IW; Mon, 09 Mar 2020 11:10:03 -0400
Received: from localhost.localdomain ([82.252.135.106]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MEFnP-1j1jFw47PR-00AGA7; Mon, 09 Mar 2020 16:09:18 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Greg Kurz <groug@kaod.org>, qemu-block@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <rth@twiddle.net>, Jason Wang <jasowang@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Michael Tokarev <mjt@tls.msk.ru>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Fam Zheng <fam@euphon.net>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Andrzej Zaborowski <balrogg@gmail.com>, Helge Deller <deller@gmx.de>,
 qemu-trivial@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 15/33] hw/alpha/dp264: Include "net/net.h"
Date: Mon,  9 Mar 2020 16:08:19 +0100
Message-Id: <20200309150837.3193387-16-laurent@vivier.eu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200309150837.3193387-1-laurent@vivier.eu>
References: <20200309150837.3193387-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Qy8dcMwwtUXzYmqFBfNdLJNJpn0fDJ0i7xEZv3GBUnpNHUQO6fa
 52H+Kjx0NGVYL1LrxPuw7Z5hA1A4vUqDTOc8MVi4WFiIs0chg9vgc8ZM04ZggWXzkxZyKoT
 ZSBVIKWfxb/6sKLoHQ5scQRqLEK7TH/BlY8NiwF/f8RNdMMd/ocTwmfGbMkfsr1dKcVGZiN
 06JcC2P8NG+T7P4USm3GA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:B9T+aPOVI74=:0WogXzCK4G497PiKiGrCRN
 eK6zINIoGXrHkpUejdK1lvJdYmRVhyeqUw38ZtjviqOln/BG8o1aNTSHW982N7KMmhYyln7RP
 4EEhZ1RUBgitaA4AA5QE2YzCJSuKzR2zonqwNF4KNE2s5rGh+gGglL1ixI5egPSwSNa1a0wNF
 l9Ohoiofm5ocW+JQVTCIVl6wUkUa1lickWvQC1UofTZ258ztoHxNBDfb8TYnn/s34gtHXOmhv
 vq9l9p8c+MLVvVZO0jkh/SXMByg0xjc/rpUl/Z2xE2DFM5i3/TJe5pNSi795Jj773nNwvBER7
 X3dZAQm4l1ZAOprBZCe0BwoE6NpaxCOkgU0jLYRFrosrUlmHSdS7fFUnGJ8EQidk6rMa3jybx
 5AtFUlx6V1I1YrX2qzyzoIx74DM4EVljseBbvL7eu6ZFe4hFXc6KExpZRiUQzC5w1RvV7Ovwi
 2SiLmcLiCP6c3ZpKUZKRVNv6j+Kf687cqaSsbTXfn1tWWHKBOSExIAG8tgNm95ET1DeZDd1QP
 0z6SR+MxMaTmL9yMmbgfwtJ1UgJX4kijPsxnx7LSFb89+m7sQ2bjBkuZiyyH8Mues9lGQQ3GQ
 /rqJ/hdTwjNsa1O5O69DYgmzQhfHmec9ESY2JB2/53ITstzV8OOO4sg4EA3e/WchLYNYSqW4f
 dNiw9Z3a8tSYOfXGMV9cPvvlfYvwlbQEapZvVRXH/nCnbhqmO3sA7IoZCPM6O2Gjwde3ffTsl
 9k0yTak3+CSf5n9SFZ05/4izd9io8oMbLkGLC5ofmZWUGmLbsMnnuWFpSbaUwddekPLNj8aMW
 YSTgqnIKx/avQUacpsZ1A/HdXbvtKtY+ANLmvxm2gXazbd9KdYJFkvgebJgowZDkg+cG141
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.73
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
X-List-Received-Date: Mon, 09 Mar 2020 15:10:06 -0000

From: Philippe Mathieu-Daudé <philmd@redhat.com>

hw/alpha/dp264.c uses NICInfo variables which are declared in
"net/net.h". Include it.

This fixes (when modifying unrelated headers):

  hw/alpha/dp264.c:89:21: error: use of undeclared identifier 'nb_nics'
      for (i = 0; i < nb_nics; i++) {
                      ^
  hw/alpha/dp264.c:90:30: error: use of undeclared identifier 'nd_table'
          pci_nic_init_nofail(&nd_table[i], pci_bus, "e1000", NULL);
                               ^

Acked-by: John Snow <jsnow@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20200228114649.12818-9-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/alpha/dp264.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/alpha/dp264.c b/hw/alpha/dp264.c
index d28f57199fa1..e5350a287f73 100644
--- a/hw/alpha/dp264.c
+++ b/hw/alpha/dp264.c
@@ -21,6 +21,7 @@
 #include "hw/dma/i8257.h"
 #include "net/net.h"
 #include "qemu/cutils.h"
+#include "net/net.h"
 
 #define MAX_IDE_BUS 2
 
-- 
2.24.1


