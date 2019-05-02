Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hMGvR-0003Va-AA
	for mharc-qemu-trivial@gnu.org; Thu, 02 May 2019 14:59:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36131)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hMGvO-0003UO-Q3
	for qemu-trivial@nongnu.org; Thu, 02 May 2019 14:59:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hMGvN-0002wX-Sh
	for qemu-trivial@nongnu.org; Thu, 02 May 2019 14:59:18 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:48011)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1hMGvL-0002u6-Ou; Thu, 02 May 2019 14:59:15 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA
	(Nemesis)
	id 1Mrggc-1h1SDp3B6i-00njoP; Thu, 02 May 2019 20:58:46 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Fabien Chouteau <chouteau@adacore.com>,
	Viktor Prutyanov <viktor.prutyanov@phystech.edu>,
	Richard Henderson <rth@twiddle.net>, Thomas Huth <thuth@redhat.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Laurent Vivier <laurent@vivier.eu>, Eduardo Habkost <ehabkost@redhat.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>, Jason Wang <jasowang@redhat.com>,
	qemu-trivial@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>, Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Michael Roth <mdroth@linux.vnet.ibm.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Date: Thu,  2 May 2019 20:58:23 +0200
Message-Id: <20190502185835.15185-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190502185835.15185-1-laurent@vivier.eu>
References: <20190502185835.15185-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:oR1ObyDzheuCsJYSoWaCS0YXv/NblZRyYkeYRMY0/IHirEPRzri
	GQXfKFKKG9YdybfH3SpL6eYzYkK9mFXumKxJQTv0q1cQBaqrQMhyktlVL0s6VwPUDSU4MhJ
	1Jd9SZjuV/y7XvD0yCzxIjxCyvxmFjN//Pt+pbNlYTaUwO8tz5J6hIjOk6/p+wo80kXInYu
	WfDwKuUR287HlzGOE9AWg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:q4IYYtPfPiw=:Px5YNL/p0EsP4zXvcDDciV
	AoULs0Vh4aeJ/26Qj0VVpEfiUngffXUGM23tfJS5Oe1ft7K4zfiLCGtZrypNwA2JcT5n4faXC
	ve3+TZUl9vtbpg3Yb/bekle9nDMRqgMVsh6UwHl4K5TQsI42JalrI/E0OHej/KO9Akkkvl/rE
	h7EkKsXZiFPmNIgmo4HBmr20/PlLHfKcAsQoUNJnYafwZDiyzNPucyQ49udPFwtBo+qE4cNoa
	uvaEAcYzrWiTB3U9sgMkTzranaE0yUagJeiYa4g50l83PmK4hxy8X2R75UNzY0EbTGNOWvnM7
	8lDn3s1OyuOtwpqKsltat+tExVkRnLsL346jgPfShShezryWKzoNff2leq/2rrRyaiIVlSRPF
	UvldwMAXcqIRFnmB4u5hkTE1oGhUNs7o6WFYRV1SJMGk5iGDPBmD3lLr+WAaV/BHjhGoTqwjZ
	ASDk9U5HLB19xv5WfKdItVb5CbW4zsGQl9YxGUB42T3Sai0jm996RS4ODAlIJa57fHmMdoP8Z
	B6wNfZas+mKD7PB072oGRmM1gMe5kf0xqNBCkmUnREIKmtbWNEbbXewinlNq9j2bo5b9kajVN
	1S2OBtEmvcMXHfZASvyeCavoznqkVfHUQAA9mCngja0w5aof6gslv/oZQtiO4kWhwe5Kz+s3B
	5drosIK3ErzNOaMcMMiUNqPV3wbca1MS/BPLgUWr5KKIu/1Le/ha22sx1cw7IvlUTvVG6wn6v
	v2DctFfxZkzhU4JhaSJi3wrqENTBawkKN2J/LTqft6+t2uR9b62wIoff9wo=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.24
Subject: [Qemu-trivial] [PULL 01/13] hw/net/pcnet: Use
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
X-List-Received-Date: Thu, 02 May 2019 18:59:19 -0000

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


