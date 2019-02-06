Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1grP84-0000CU-5F
	for mharc-qemu-trivial@gnu.org; Wed, 06 Feb 2019 10:28:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55866)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1grP81-00009M-TF
	for qemu-trivial@nongnu.org; Wed, 06 Feb 2019 10:28:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1grP80-0004Q0-7w
	for qemu-trivial@nongnu.org; Wed, 06 Feb 2019 10:28:45 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:36805)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1grP7y-0004LY-83; Wed, 06 Feb 2019 10:28:43 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MCbMx-1gztaB3u5b-009hc7; Wed, 06 Feb 2019 16:28:21 +0100
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
	Thomas Huth <thuth@redhat.com>
Date: Wed,  6 Feb 2019 16:28:04 +0100
Message-Id: <20190206152807.31896-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190206152807.31896-1-laurent@vivier.eu>
References: <20190206152807.31896-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:bKdTrc9mrqwbl4GZgE3NVIEcluiPnApM95YC1fDj/QTrRmobN3V
	dG/u2K7a8HyTQSrJ7i7/2XFSkjyptgLIABjl+mop/XjG8gToRxQ1od0o1YVRB9B7codCT2s
	jidWk50pWxiR6DDFjiLGSwncbdu1dH9/lNuwjSYCARDKByUR83mTILmyXrR949YIBoshGCU
	1ReVSvdCaliIIhG/71dSQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:yb+Fau6AAYc=:4+LU9Pxf1yPfBVZp8wygvM
	ZUeH/yZJOPT52Wfe0YeCj8rv7ZF6PN6DggaeshwXc5fki++BJwakvE6g587D5GvpmEPp4MAzg
	jj9VWNTF+ACSWjLYI/h86NR0DuoEBvFLEHSGa4tzgU0ZtDupXECqCX5MbDJPymU+hdIRps2Rd
	KaHiSrRCWwZ2Keswf9yiGW7AApiHDgrWxZWAYEiXYVq0jlN509H1urKfnWcMMLQsPL6GDAI+c
	9z+AXVudbx4IrB6a2DdciOY8zFOVkj5uLNqMPycpeDMYwCz0mAC3Zpx2+x1I9cq+Dr+sD3cjZ
	gtkck+YEe/au6bOT2h3LNysmXnTsYa1P5n0Zuxomd831uChrOqEIWJ8YCR4m4nwsjQyWfJhVz
	RkyJ87J+D1ZEGRe4+jHtvfU0eUp+Oq1HK/tE7NBOZE65+QBXmO0ByTrKgwWb6u2KmqEA9MDAo
	nxgKDfjP6sm6roJL8IMo78cY7gmqOZx8lb9mUztGb/s50XxvzGwnLi7t4tq7TxVEnEbgMZXtH
	dnrwOt7vDeKfk7qV187bAMEFaZpNRHdd7tyQBIhq3fRGdAu+82i10K75VXrH6VAlfzu+zfpWn
	ZnOGKSRQcaXNQWFmhod9wyy80bb+E4/hkVt18PQbOo80OKzmKNvJ9j/K/eLetqorrmJUAVp8w
	VUFEf8h1a5VfMiA55W91z0UTS0u1kkP7D7vNSv4KEvKaO0pgd444OUDKRVGMQmynm5Py9T4BT
	sJua+27b6Quy1ObLl2VtbCX3DnsCNlUrzEJzMnjHfN2f64/LLzjy6sJMijQ=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.135
Subject: [Qemu-trivial] [PULL 4/7] hw/sparc64/sun4u: Drop useless inclusion
 of "hw/i386/pc.h"
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
X-List-Received-Date: Wed, 06 Feb 2019 15:28:47 -0000

From: Philippe Mathieu-Daudé <philmd@redhat.com>

In 47973a2dbf we split the last generic chipset out of the PC
board, but forgot to remove the include of "hw/i386/pc.h".
Since it is now unused, remove it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-Id: <20190204210433.26088-2-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/sparc64/sun4u.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
index f76b19e4e9..fdf3f14a29 100644
--- a/hw/sparc64/sun4u.c
+++ b/hw/sparc64/sun4u.c
@@ -33,7 +33,6 @@
 #include "hw/pci/pci_bus.h"
 #include "hw/pci/pci_host.h"
 #include "hw/pci-host/sabre.h"
-#include "hw/i386/pc.h"
 #include "hw/char/serial.h"
 #include "hw/char/parallel.h"
 #include "hw/timer/m48t59.h"
-- 
2.20.1


