Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ghDeg-00038I-Ss
	for mharc-qemu-trivial@gnu.org; Wed, 09 Jan 2019 08:12:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46864)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1ghDeb-0002z4-1b
	for qemu-trivial@nongnu.org; Wed, 09 Jan 2019 08:12:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1ghDc1-0000Js-TR
	for qemu-trivial@nongnu.org; Wed, 09 Jan 2019 08:09:38 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:37887)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1ghDbx-0000EN-Mx; Wed, 09 Jan 2019 08:09:35 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1Mxpqo-1hV3Kq3UQo-00zEwb; Wed, 09 Jan 2019 14:09:03 +0100
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
Date: Wed,  9 Jan 2019 14:08:43 +0100
Message-Id: <20190109130844.5172-6-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190109130844.5172-1-laurent@vivier.eu>
References: <20190109130844.5172-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Z8jMPlYuPWwSDIj+swcdxAEI7yNcBv1vVC/uYq9gmcHQIHPx0AE
	64hGQFGoiz5NThPZcUrV7nhQt1UyInoiZMEehW4wJRAditBe+AVgFNHGeOLjYYeaG4OOf6g
	Ryb0W8U0fjAIdzkbazicr7G5CSIQukHzpVj4re0m3Z+Vmyz83FCKpFybOSZMfns4AKek41m
	EM5i9QGyQPxMlNf4zPMkw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:tCg1ywP6uSk=:ccZNcbNNrDZ/raMV5zk2vI
	B7J8zLHfygO08VZyytZ7grL5lVnjJG5ZHpaCkQGanJCPmiF5XZPVC6bEZooDL8UMWVCxMsBIP
	kvs0dJtE1kObUYLyqLvz+sfLCnHcg4+DBgOxrwAfQsZLdyQWwaQur/cyy+BBYUtEXZ69cwZAq
	g3ar/HmewP2HptNKOHMH+JUle1jg92c0T6JIN9yNnseb3ChWMZf+e1jfJZOmDOBtr59EbaAAL
	i08OfUg5nZy9WvX5oJBjZq8hPaEH4++dGYp1ClVU5d7NW8RIux1mIbLuwyly8/UpwKM1KCfSW
	O5BdH99S5/ksHIWWSLAyF5XI9+pSRIApoYFfhYPXID4GyyWGyjuYv7jmMYl/HTp85CBPTOIjd
	rM/nN0TJ2PnHgOECiv4uhfziTW10+OgZgOitaezMp/wBGRRiFnAcOUW+7oRU4Tq1mXjfFz37k
	ha7KnOxiFPl0iBqOAL5MNjLircnBadm2YNtt4ipxc0/AHzqLJxhS6cgX6HuZOh5vjC6eNeY30
	BTHg1EM7sqlFyfRVQe6Daz3mlBbWVZUNVDwFtNtf1ECzKxdi4KsRfu4wLh4I/KBZbMgEEYDC7
	c74EE7Lp+7YC81JZokX0hF4YiBZ1ZIEa9owk5WG6bjOhiwdbgwCmPEA5sIdHlQFAJcLXqdG5u
	vecFC0y1aygMrcUeKyzKGq4FPlI75FTwmq7K/sLLL1g61BLU2YkZFpEl4OQfm0pYKzQbdE3BS
	41rFAR3mgurR4sXBLg6G3O079/5+qIVpXfzHFQ==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.133
Subject: [Qemu-trivial] [PULL 5/6] trivial: Don't include isa.h if it is not
 really necessary
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
X-List-Received-Date: Wed, 09 Jan 2019 13:12:18 -0000

From: Thomas Huth <thuth@redhat.com>

These files don't seem to do anything related to ISA directly, so
there is no need to include isa.h here.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <1546615943-16274-1-git-send-email-thuth@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/display/ramfb-standalone.c | 1 -
 hw/ide/pci.c                  | 1 -
 hw/ide/piix.c                 | 1 -
 hw/ide/via.c                  | 1 -
 hw/misc/macio/mac_dbdma.c     | 1 -
 hw/moxie/moxiesim.c           | 1 -
 hw/nvram/fw_cfg.c             | 1 -
 hw/sparc/sun4m.c              | 1 -
 hw/timer/i8254.c              | 1 -
 9 files changed, 9 deletions(-)

diff --git a/hw/display/ramfb-standalone.c b/hw/display/ramfb-standalone.c
index c0d241ba01..da3229a1f6 100644
--- a/hw/display/ramfb-standalone.c
+++ b/hw/display/ramfb-standalone.c
@@ -1,7 +1,6 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "hw/loader.h"
-#include "hw/isa/isa.h"
 #include "hw/display/ramfb.h"
 #include "ui/console.h"
 #include "sysemu/sysemu.h"
diff --git a/hw/ide/pci.c b/hw/ide/pci.c
index fe1ceeb0cd..b75154f99f 100644
--- a/hw/ide/pci.c
+++ b/hw/ide/pci.c
@@ -25,7 +25,6 @@
 #include "qemu/osdep.h"
 #include "hw/hw.h"
 #include "hw/pci/pci.h"
-#include "hw/isa/isa.h"
 #include "sysemu/dma.h"
 #include "qemu/error-report.h"
 #include "hw/ide/pci.h"
diff --git a/hw/ide/piix.c b/hw/ide/piix.c
index a3afe1fd29..885c16e938 100644
--- a/hw/ide/piix.c
+++ b/hw/ide/piix.c
@@ -26,7 +26,6 @@
 #include "qemu/osdep.h"
 #include "hw/hw.h"
 #include "hw/pci/pci.h"
-#include "hw/isa/isa.h"
 #include "sysemu/block-backend.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/blockdev.h"
diff --git a/hw/ide/via.c b/hw/ide/via.c
index 238f038d72..987d99c5ec 100644
--- a/hw/ide/via.c
+++ b/hw/ide/via.c
@@ -26,7 +26,6 @@
 #include "qemu/osdep.h"
 #include "hw/hw.h"
 #include "hw/pci/pci.h"
-#include "hw/isa/isa.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/dma.h"
 
diff --git a/hw/misc/macio/mac_dbdma.c b/hw/misc/macio/mac_dbdma.c
index 87ae246d37..e5917d8f2e 100644
--- a/hw/misc/macio/mac_dbdma.c
+++ b/hw/misc/macio/mac_dbdma.c
@@ -38,7 +38,6 @@
  */
 #include "qemu/osdep.h"
 #include "hw/hw.h"
-#include "hw/isa/isa.h"
 #include "hw/ppc/mac_dbdma.h"
 #include "qemu/main-loop.h"
 #include "qemu/log.h"
diff --git a/hw/moxie/moxiesim.c b/hw/moxie/moxiesim.c
index 4b0ce09c5e..c6b6f7262d 100644
--- a/hw/moxie/moxiesim.c
+++ b/hw/moxie/moxiesim.c
@@ -31,7 +31,6 @@
 #include "cpu.h"
 #include "hw/sysbus.h"
 #include "hw/hw.h"
-#include "hw/isa/isa.h"
 #include "net/net.h"
 #include "sysemu/sysemu.h"
 #include "hw/boards.h"
diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
index de58c7be46..53e8e010a8 100644
--- a/hw/nvram/fw_cfg.c
+++ b/hw/nvram/fw_cfg.c
@@ -27,7 +27,6 @@
 #include "sysemu/sysemu.h"
 #include "sysemu/dma.h"
 #include "hw/boards.h"
-#include "hw/isa/isa.h"
 #include "hw/nvram/fw_cfg.h"
 #include "hw/sysbus.h"
 #include "trace.h"
diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
index 639906cca3..709ee37e08 100644
--- a/hw/sparc/sun4m.c
+++ b/hw/sparc/sun4m.c
@@ -37,7 +37,6 @@
 #include "net/net.h"
 #include "hw/boards.h"
 #include "hw/scsi/esp.h"
-#include "hw/isa/isa.h"
 #include "hw/nvram/sun_nvram.h"
 #include "hw/nvram/chrp_nvram.h"
 #include "hw/nvram/fw_cfg.h"
diff --git a/hw/timer/i8254.c b/hw/timer/i8254.c
index 1057850808..20f834e7da 100644
--- a/hw/timer/i8254.c
+++ b/hw/timer/i8254.c
@@ -23,7 +23,6 @@
  */
 #include "qemu/osdep.h"
 #include "hw/hw.h"
-#include "hw/isa/isa.h"
 #include "qemu/timer.h"
 #include "hw/timer/i8254.h"
 #include "hw/timer/i8254_internal.h"
-- 
2.20.1


