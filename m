Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hMGvo-0003lj-Ez
	for mharc-qemu-trivial@gnu.org; Thu, 02 May 2019 14:59:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36239)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hMGvk-0003jV-0U
	for qemu-trivial@nongnu.org; Thu, 02 May 2019 14:59:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hMGvf-00033m-Vd
	for qemu-trivial@nongnu.org; Thu, 02 May 2019 14:59:39 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:42833)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1hMGve-00030R-2c; Thu, 02 May 2019 14:59:35 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA
	(Nemesis)
	id 1McHQA-1gm69o2gvc-00cjJx; Thu, 02 May 2019 20:59:00 +0200
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
	Aruna Jayasena <aruna.15@cse.mrt.ac.lk>
Date: Thu,  2 May 2019 20:58:31 +0200
Message-Id: <20190502185835.15185-10-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190502185835.15185-1-laurent@vivier.eu>
References: <20190502185835.15185-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:PuriRZNUZFML41VXaNZWRCel79SGpp1LmytZAYC3+G2pC7PABVC
	4fbdHg/iUeowiTFVklAdZM1meAPzMhOx5Y0fjH2nwzAuXDMKTAhSHe3WXzJFai0k09YXVSb
	dpTg2+MIALR+F4gr0AsrFSMNC9J9LdFf+cDkILhDBzCc3cL2Wn9TybO9gJ5w2rcGwVVPL98
	+qbxiaO5RDSPyCqg8QNzQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:VKA+zKdUgW4=:O18ZjeSPBOeFxsOKQ0Mw1Z
	ryDcUh83BszOXOaIhOfdg7fDTtL9X3hC6qs0/5TzL2UlhwB2guP/ZJs5HJna7Q9DSmhGDP85o
	GCbJ59Z5UgQbPgVKe2sz04z5jNJGXm5GWOpvmEyDaEwf6EwgQHFZTswz/D7eseFN8davo/4Og
	qrHTcb/f1DL+1eSvShOEcfyXBy0rVgtA/b3TL5JKK0Qp4KO9m22m4ZK/ivimyF8D9JjHwtk0/
	ZZEYBk5hL5zEHEl/3zkVgqJV4GSZlgEGkDIbqLa7/45teROh8Vj/NasBALXTCJfGPbLLtN8Jo
	r4kJza9sGI2m2GJvHlYQSv7hAa3AlMJlq/SxEGEQ9DJrt72DGf2APCiXATrYjsuILYHxdpf0+
	RzvxERIQSWxUl2zxdabqSOhElYeCamGGvyClACNlHrnIc/QOeFHDNLkIjCYKPFbx37v0Xiep3
	xbmTRpHDJB3QnDK7cTH4drIDrkm4fro5ZUrcPXpq0lixJxJDMJ0EWWIcKDzVC9VXv2rIfANkd
	97WJ3jXYmgrb6vPCy9FdA01rBedmJO/IGA2oj4cYbupVYVIwaDcPgac01Xd0nwFqmngOcgGE0
	W6cltf+ZWpUlWvKMXs2o0OnJEWXNC70+sQ7XyCwcAwYalnc31WJOP+PjKIy8RT6iNI7F5fQjT
	rx2FGKibU8ohmIt7ZVgnS6JdJEz5YwvZRytbNK+eXyX+8C4YTHbxBj/mb3iCRt55/X7aCpm/U
	kJ2RoHX7VC2v3IaUGL1wTox4na8u5M8q9jC8aw==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.74
Subject: [Qemu-trivial] [PULL 09/13] Header cleanups
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
X-List-Received-Date: Thu, 02 May 2019 18:59:42 -0000

From: Aruna Jayasena <aruna.15@cse.mrt.ac.lk>

Removed unwanted includes from cpu-common.h
This task was under https://wiki.qemu.org/Contribute/BiteSizedTasks

Signed-off-by: Aruna Jayasena <aruna.15@cse.mrt.ac.lk>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20190409155635.10276-1-aruna.15@cse.mrt.ac.lk>
[lv: fix conflict on rebase]
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 include/exec/cpu-common.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
index 848a4b94ab73..f7dbe75fbc38 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -7,9 +7,6 @@
 #include "exec/hwaddr.h"
 #endif
 
-#include "qemu/bswap.h"
-#include "qemu/queue.h"
-
 /* The CPU list lock nests outside page_(un)lock or mmap_(un)lock */
 void qemu_init_cpu_list(void);
 void cpu_list_lock(void);
-- 
2.20.1


