Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ghDei-0003A5-Af
	for mharc-qemu-trivial@gnu.org; Wed, 09 Jan 2019 08:12:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47063)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1ghDef-00036E-LV
	for qemu-trivial@nongnu.org; Wed, 09 Jan 2019 08:12:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1ghDc1-0000J6-MJ
	for qemu-trivial@nongnu.org; Wed, 09 Jan 2019 08:09:38 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:46249)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1ghDbz-0000Ec-Gw; Wed, 09 Jan 2019 08:09:35 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MjBNV-1hAUcI46VR-00fFFq; Wed, 09 Jan 2019 14:09:00 +0100
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
	Priit Laes <plaes@plaes.org>
Date: Wed,  9 Jan 2019 14:08:41 +0100
Message-Id: <20190109130844.5172-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190109130844.5172-1-laurent@vivier.eu>
References: <20190109130844.5172-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:z+DJUB0MWDZdmTm0vS6X3uH8zc+yGvWaOXH2QX6XImucEK1XHSS
	MlOCPa+FrKgmMTXwAkxDR/0dpSSgul/r4iZlBln456dQig06goaUVAsH7f5br0OnF3yjtwE
	pPsT5jfReJ4O6m0ZEoizAO4oiXCLrcDfQ32Z5+2KeJk/nTNAsiK7aHqQJwKfwnsjAb2IarR
	genDbgrHj+16cMdhVdHig==
X-UI-Out-Filterresults: notjunk:1;V03:K0:rbcjEW9bXYY=:/7opPXSoOeezOOiV0guBO8
	ctbQ6MMDVfufAX6t0hYLl1BXhliiAQkvKezA7AFtDPXpAK3hskrXrppgXioeCLDG/Nf7P1OA4
	yoChDdOzGiHlftShug7GcSMZDNmQXz7hA1BhxJz4/CntXcwo7ilLL/prAEpQM3hfpGW0d7bTy
	CkjkmDb+1rvFEweAd4HSSGNgFYrIaLBpvqcnpvalAquDRI7JDsm050HFGTsIWnFlsX7JzIvSM
	52HbX6V/pN+/LBPXN7tx8MzDrHGaunRF875l2G51cs6nWSUuRmm0m5giOBxTyFWZLSNbcLuDu
	DsZYxLVor/M75BQt5GKoHQBn12ryovEo3dYkioYNpXt2ayWO32t9QGIPaKoOk3CPPjRCB4BdM
	Jz3uvbrPJQOFNm693j2TJoALvVCEZCRiERG/tuOfBQGMn4L3pJlnXcy9eOEKRNuOh4J1yCFMy
	kJJqTXuadT65C2QmcRhgE6qn6I11y8jahCSJITlRfynPfa0X38/AxULqO1IFk7ET433aNDwXw
	85evHgspSORyJSxJOQPZGNWWQ6aCcqyIC66mGtcaB9W/Fg2xX9Yt7i3ndXQ5xNCbZ63wRAoJw
	jgR7VRcRYPd8tL5QeSuxaMsrDR5vcLTI1paSawys324NOJ7dbjv9ZxQygXia2T3/kpWQj1h1c
	b45vNSSbs+7EaipTfl6AnY37SY/O6eO+aD+F6rcIAr4suEXy1PQJ8xmHVH2cePczfP6LSYw8L
	rWTi4CSQiEBpMEURjWJ1SmudZ6QZrfyftH0uKmkfETDOF0vhLmwDHnWf3fo=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.135
Subject: [Qemu-trivial] [PULL 3/6] qom: Include qemu/fprintf-fn.h in cpu.h
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
X-List-Received-Date: Wed, 09 Jan 2019 13:12:23 -0000

From: Priit Laes <plaes@plaes.org>

QOM cpu.h uses fprintf_function which requires Qemu's
qemu/fprintf-fn.h header. Include it.

Signed-off-by: Priit Laes <plaes@plaes.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20181226003722.31257-1-plaes@plaes.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 include/qom/cpu.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/qom/cpu.h b/include/qom/cpu.h
index 1396f53e5b..6d1ba53d72 100644
--- a/include/qom/cpu.h
+++ b/include/qom/cpu.h
@@ -26,6 +26,7 @@
 #include "exec/memattrs.h"
 #include "qapi/qapi-types-run-state.h"
 #include "qemu/bitmap.h"
+#include "qemu/fprintf-fn.h"
 #include "qemu/rcu_queue.h"
 #include "qemu/queue.h"
 #include "qemu/thread.h"
-- 
2.20.1


