Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gG4Jd-0005C6-WE
	for mharc-qemu-trivial@gnu.org; Fri, 26 Oct 2018 11:46:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50666)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gG4JR-0004ut-7z
	for qemu-trivial@nongnu.org; Fri, 26 Oct 2018 11:46:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gG46l-0005Ii-Mt
	for qemu-trivial@nongnu.org; Fri, 26 Oct 2018 11:33:09 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:45491)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gG46b-0004zg-Ic; Fri, 26 Oct 2018 11:32:57 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1N62mG-1fW2030jY8-016T6J; Fri, 26 Oct 2018 17:32:19 +0200
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1N62mG-1fW2030jY8-016T6J; Fri, 26 Oct 2018 17:32:19 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
	Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org,
	Michael Walle <michael@walle.cc>, Laurent Vivier <lvivier@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, Cleber Rosa <crosa@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>, xen-devel@lists.xenproject.org,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
	Fam Zheng <famz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Aurelien Jarno <aurelien@aurel32.net>, Kevin Wolf <kwolf@redhat.com>,
	qemu-block@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
	qemu-trivial@nongnu.org, Riku Voipio <riku.voipio@iki.fi>,
	Eduardo Habkost <ehabkost@redhat.com>
Date: Fri, 26 Oct 2018 17:31:24 +0200
Message-Id: <20181026153125.24738-20-laurent@vivier.eu>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181026153125.24738-1-laurent@vivier.eu>
References: <20181026153125.24738-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:peG9vs6GsMt7FvJ9IOcJtpr6YQ/f1NgGwuxCXLS10Tzwh7VvfDj
	bumB+gWdPNWZw6tKFratVmDSwhx5bzldZ0O4v00tNLyAm8FG+3+ljvGTfditOJ2aGYQXi78
	xo9z6fuF8lhjoTnQ/BEZx0tGvwNDs/NqAMEfI/RdnZUzbAAT/Nm79xVwnJ/7sSDYSPJGHb9
	LOIUKPcwnf0R6LBzrrJww==
X-UI-Out-Filterresults: notjunk:1;V01:K0:Wmacvs2eZ1k=:3W4TmCzU9ZcT1LHL9taMaS
	AMPowxQE21LLEE0iygB5vtvM+3A8KTVZkIXddciNyIC5AGDSuKT3D99st/Z0ALRGkuTHSTdiY
	1gIpMQbcmuKCPcm38Hbph+QG+miYgVBbYezydmHajI+vSMW00D+t4v+FJ0ZIbkG8lV7hixG5V
	dWtboDiLCgRT9tw8NH9oQVOqOuw3cOPmxG1XK7etdJ1/oOaCeGrayEMIkzkii6zuFxEpChQK9
	lQhcllu29uiOER8BnjLxRGM/wwfqA7VVk+n4TEntn+KzAA2ZaqZAtonUwusfw7PfsfjVawNMJ
	npC6rYxYSZPL8PyAxXlolSC1uKW345ma6WhoWTaPqPBbUAG+oW95l/5tKpWSwBHHVGfS4EHlw
	dbYNr7zsv0iGiV+CICcE47Yebc/UjUNpcCkTFCKQPC/l/OJr58NdQs0kbX5gQsk/Pr7hyKRkD
	896fLW/uApf7+6YL+wz/nt28ZHKEj0w6u00Zgy1dZ0cgFeL+sv0shGL6+JXJzg4MESR1zAodL
	+1gqMXBGelfL/T4FYpypaMa6bhOQfu0V2WfR5oyJV1BYhr4s5tCO8HdkwZRDuzS0B9dnMYiU8
	zOOB1he6vkqTXeHJGMx/XT1aVOHqTRRHpYSzam+kqGdDV6wfCUwC8xtIefiH4hmzVwtPrrR6o
	X+D0sH95Ge56tgvFjKJwhr40j79u7gRsyxaUjL+1Y1DgRQdtiSOw+thGiOELiRdRHM7YC+jkc
	n4IZuoP+NmpIK5b8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.133
Subject: [Qemu-trivial] [PULL 19/20] milkymist-minimac2: Use
 qemu_log_mask(GUEST_ERROR) instead of error_report
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
X-List-Received-Date: Fri, 26 Oct 2018 15:46:20 -0000

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

qemu_log_mask(GUEST_ERROR) is more appropriate:

  $ qemu -d help
  Log items (comma separated):
  guest_errors    log when the guest OS does something invalid (eg accessing a non-existent register)

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Michael Walle <michael@walle.cc>
Message-Id: <20180702014022.12395-1-f4bug@amsat.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/net/milkymist-minimac2.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/hw/net/milkymist-minimac2.c b/hw/net/milkymist-minimac2.c
index 3eaa19dfde..322fb77e46 100644
--- a/hw/net/milkymist-minimac2.c
+++ b/hw/net/milkymist-minimac2.c
@@ -30,6 +30,7 @@
 #include "hw/sysbus.h"
 #include "trace.h"
 #include "net/net.h"
+#include "qemu/log.h"
 #include "qemu/error-report.h"
 
 #include <zlib.h>
@@ -214,7 +215,8 @@ static size_t assemble_frame(uint8_t *buf, size_t size,
     uint32_t crc;
 
     if (size < payload_size + 12) {
-        error_report("milkymist_minimac2: received too big ethernet frame");
+        qemu_log_mask(LOG_GUEST_ERROR, "milkymist_minimac2: frame too big "
+                      "(%zd bytes)\n", payload_size);
         return 0;
     }
 
@@ -347,8 +349,9 @@ minimac2_read(void *opaque, hwaddr addr, unsigned size)
         break;
 
     default:
-        error_report("milkymist_minimac2: read access to unknown register 0x"
-                TARGET_FMT_plx, addr << 2);
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "milkymist_minimac2_rd%d: 0x%" HWADDR_PRIx "\n",
+                      size, addr << 2);
         break;
     }
 
@@ -413,8 +416,9 @@ minimac2_write(void *opaque, hwaddr addr, uint64_t value,
         break;
 
     default:
-        error_report("milkymist_minimac2: write access to unknown register 0x"
-                TARGET_FMT_plx, addr << 2);
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "milkymist_minimac2_wr%d: 0x%" HWADDR_PRIx " = 0x%lx\n",
+                      size, addr << 2, value);
         break;
     }
 }
-- 
2.17.2


