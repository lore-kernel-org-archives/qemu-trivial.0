Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1grP8F-0000VQ-GF
	for mharc-qemu-trivial@gnu.org; Wed, 06 Feb 2019 10:28:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56039)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1grP8A-0000Ih-Rq
	for qemu-trivial@nongnu.org; Wed, 06 Feb 2019 10:28:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1grP88-0004WS-AW
	for qemu-trivial@nongnu.org; Wed, 06 Feb 2019 10:28:54 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:40983)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1grP7w-0004M1-6H; Wed, 06 Feb 2019 10:28:42 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MZkxj-1geuHZ1lyx-00Wknr; Wed, 06 Feb 2019 16:28:22 +0100
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
Date: Wed,  6 Feb 2019 16:28:05 +0100
Message-Id: <20190206152807.31896-6-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190206152807.31896-1-laurent@vivier.eu>
References: <20190206152807.31896-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:I/l1wIG9RgiSe/mg3CqvszPKZgpos3TLowNggKqzG/ZxR/4yIix
	tCE8cOy04FcHkmI+grDa0F7dgWZayGkwKExnS9E4Th2J/crbGXXacXFOW3SWzM/ZrLkvToL
	4noTWFwPvRJCmbpYs2K3ZDiBIaPFiVKBd7P3Z16fqUkmQEYEbpI83bM0PNYg1Nr4HDGcD9h
	2qt8gH0yTOR2Q89K8UdkQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:+ExGxIGhJE0=:OqSyYalCLaI0QciLXQOSHE
	auo7UiJVqAnIccrKjrhsPCCuMPSrKPUdB8mA2oTGj4kFrM3BTouDxPtRIXu0X36NOyAMpDv1h
	/zZHr/hcuYfpBNil9ohYoCCfjCg+tXxMe+oErtoolD5w68rn5XQz35Jb+cA0GPv7GHriw6VvW
	eHococZHF6ijKsZfHdLyz05ZziHojHUBZg41ShEY/AvoURbZvSDB8fMZRBv7TDFASED3UKvBD
	tD2JljqdVAE3MqP6epIGmh2ycGFSVFg9oYdT3BaOCmtJchIUopL8dULeCdOyaKlC76VIsS5iL
	D9DvWo4rXyjBmqUGAFCHRi9kC5lH57ZlsZua0g/QImy5Rr8DMmbS6sc0D5A+jxuPBZRS9L0KY
	rgSIl9lylnZmDBvCAaZGb5Zp3GVHC03t0qQs9OVwmxXJnasLPjJVKn51AIUUcIs/puML9TJ1+
	xYt/GCQJrJUN5XEy1jzDU7A54zx3sEdmbzCOWYYDawh0p1l0dUlQKFIRZVkhSgYoYZoPKUCKE
	n3YEHwgoth+w1NcEWcAjkS1h/TxZioEySRGJr8lYvyi7Rj71R11UtMLHO5pIKF2/CSLEqu2nJ
	6szJwsMJdr5ojeDkpEIs/Vl2H58KbzoE3NEkcoB2Oys6B32c50xWj5n9H4m4Bpj9OC6swqeIj
	4UkfQw57WiLzR+2hdThEI0EnrB49/x8me7jZivoRKb4uVfZvc6ZNfLaUMnkqB+KgBFDXunUJb
	Z8U8CWEZgu5OQbDGMfmRqfe5FBfc5ah0fLCdEzTNlVfLNw/Qf/4ZooutMHY=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.187
Subject: [Qemu-trivial] [PULL 5/7] hw/unicore32/puv3: Drop useless inclusion
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
X-List-Received-Date: Wed, 06 Feb 2019 15:28:55 -0000

From: Philippe Mathieu-Daudé <philmd@redhat.com>

In 47973a2dbf we split the last generic chipset out of the PC
board, but forgot to remove the include of "hw/i386/pc.h".
Since it is now unused, remove it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20190204210433.26088-3-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/unicore32/puv3.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/unicore32/puv3.c b/hw/unicore32/puv3.c
index 830fe3face..b42e600f74 100644
--- a/hw/unicore32/puv3.c
+++ b/hw/unicore32/puv3.c
@@ -15,7 +15,6 @@
 #include "ui/console.h"
 #include "hw/boards.h"
 #include "hw/loader.h"
-#include "hw/i386/pc.h"
 #include "sysemu/qtest.h"
 
 #undef DEBUG_PUV3
-- 
2.20.1


