Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jBK3D-0000pJ-EM
	for mharc-qemu-trivial@gnu.org; Mon, 09 Mar 2020 11:10:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34196)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1jBK3A-0000iJ-U0
 for qemu-trivial@nongnu.org; Mon, 09 Mar 2020 11:10:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1jBK35-0008B4-Rl
 for qemu-trivial@nongnu.org; Mon, 09 Mar 2020 11:10:36 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:58415)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1jBK2v-0007zo-C1; Mon, 09 Mar 2020 11:10:21 -0400
Received: from localhost.localdomain ([82.252.135.106]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1Mv2tK-1jSzTQ44v2-00qzTi; Mon, 09 Mar 2020 16:09:25 +0100
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
Subject: [PULL 18/33] hw/timer/hpet: Include "exec/address-spaces.h"
Date: Mon,  9 Mar 2020 16:08:22 +0100
Message-Id: <20200309150837.3193387-19-laurent@vivier.eu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200309150837.3193387-1-laurent@vivier.eu>
References: <20200309150837.3193387-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:O5ktA5u/pvyBqK+lJEE+rKA/tVmNCUJ8OU4Z4k0rTqvuYlimz6i
 zz5oDt9n7A5K5U6qdBg+9And87yDAwyhK9O4lur6RV8vEajaOF+C8CsCQBL3n7+T3N31dTV
 G1pRP6Htz2hbJt7FWPJNyDHsqKaic4trqLzYucN6GzIBjQTPgCbRXIpJfnap/Zzg3Wg5mtg
 8EvDCJ+xA1OdsbxcQtiqQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:515utrpxNXo=:RiGyt17IZdJ98n0ovCeb4p
 I3JIIC5TapNk/BxUyyZ0u33IlpH42C4UYBtNGtbHRaE3yLlvja2v6459g0Gxm7/3MPvwUBqqa
 XkSVXaZJevXpHFocvlkvuq967E/ppVlhjbhkmOJXkT0juDsvn2A0M+k58mFSC/6SleYLpYZaM
 9KfAdza59Gg9MINcDQ7wuI8HTB0AztnjO+nvIYM8sXO+X6+f53YrZKdvkbrfhs2Ytf15lK5/8
 k40qP2Ds8V9Or7ZPX6n8K2Xa1VDCTZJtrEqOElZZYG3jcUImQtiBJF/wRheSLdvbgCJd7/aE+
 ZvMc7WdfcJskgKWUWq5AJtk2URs6KbUeLL0amun2501bMehfAs/ocpXzT8joXm63webEMOBA+
 RyjaDCuk8zzuC9vXZUK3FsOtsVh2rfnZNgF9FUcgcY8QN7izrD/iI3efDF4vowEBHT5AdEvhQ
 OE3aNSR2hSCBZpXkifG20W1TJh8s1CUNXj1Qg7f0PGDA/qCOJDL1evsbD0eCavIOxju3mZZct
 MA+JjYpkvN9fDH/lwxemkkeAVLuRk2s+sGW8LmsdA9wwEMWRsbvD5q0HJo0Lk4sx8N8gITo2U
 F51qmdfWW18MNNLOqPN5EmnFsEzZZFBscuMUG17X4Ys5j+bXzjjnWfHDKB02o9fTAznEint5o
 aIm5DzlODVRAV+pjVZNq/77T0oKWTm2p4tgRhhdgQICnjbSbwCdIIBCOcWDZTPcBDZvFgWHk7
 Qi4P+WvcPAT6AOs3QxA0gGSoh5QPV+GEqT49Qp9FhRi1XR20q56Mq2O6324sHUXHIpBPKCoVL
 O71gEHKw5XxiBJpu5KDXqAg0KXGTbju2tdh+ILPGw8YxAXcr1T5uK6L4fBezgB805fE/NJZ
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.13
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
X-List-Received-Date: Mon, 09 Mar 2020 15:10:38 -0000

From: Philippe Mathieu-Daudé <philmd@redhat.com>

hw/timer/hpet.c calls address_space_stl_le() declared in
"exec/address-spaces.h". Include it.

This fixes (when modifying unrelated headers):

  hw/timer/hpet.c:210:31: error: use of undeclared identifier 'address_space_memory'
          address_space_stl_le(&address_space_memory, timer->fsb >> 32,
                               ^~~~~~~~~~~~~~~~~~~~

Acked-by: John Snow <jsnow@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20200228114649.12818-12-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/timer/hpet.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/timer/hpet.c b/hw/timer/hpet.c
index 4f30dd50a40a..380acfa7c8a5 100644
--- a/hw/timer/hpet.c
+++ b/hw/timer/hpet.c
@@ -36,6 +36,7 @@
 #include "hw/rtc/mc146818rtc_regs.h"
 #include "migration/vmstate.h"
 #include "hw/timer/i8254.h"
+#include "exec/address-spaces.h"
 
 //#define HPET_DEBUG
 #ifdef HPET_DEBUG
-- 
2.24.1


