Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hTTnI-0002XE-7k
	for mharc-qemu-trivial@gnu.org; Wed, 22 May 2019 12:08:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57775)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hTTnF-0002Uo-Jt
	for qemu-trivial@nongnu.org; Wed, 22 May 2019 12:08:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hTTnC-0004ij-1A
	for qemu-trivial@nongnu.org; Wed, 22 May 2019 12:08:40 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:44495)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1hTTn5-0004MV-W7; Wed, 22 May 2019 12:08:32 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA
	(Nemesis)
	id 1MvJwN-1gcTU43eTp-00rGba; Wed, 22 May 2019 18:07:42 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Tony Krowiak <akrowiak@linux.ibm.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Cornelia Huck <cohuck@redhat.com>, Farhan Ali <alifm@linux.ibm.com>,
	qemu-s390x@nongnu.org, Eric Farman <farman@linux.ibm.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Halil Pasic <pasic@linux.ibm.com>, Laurent Vivier <laurent@vivier.eu>,
	qemu-trivial@nongnu.org, Juan Quintela <quintela@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Michael Tokarev <mjt@tls.msk.ru>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Pierre Morel <pmorel@linux.ibm.com>, Li Qiang <liq3ea@163.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Eric Auger <eric.auger@redhat.com>
Date: Wed, 22 May 2019 18:07:22 +0200
Message-Id: <20190522160723.31484-9-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190522160723.31484-1-laurent@vivier.eu>
References: <20190522160723.31484-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:+ZChZFfv+eCwtpcDNMLO86V5TAbr9pktjbX2aXPLYuF3TJoCCZe
	ALr0kcPcWykJ5tQM2eoNiWbZtJB/5Hu1u9fdM4+f+SdnocSHi1HgNcNegzL+6fwjkY5WE39
	ZzNDQDmFlzd5CHwqOQUqOBwjcmxQua70HuWmk+rQG0DpIfjRmEkBfxloi7fze7NnPGxGeWr
	BX5mKa6l+pZVpDkXI6R0Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:VOaKk3DyyEU=:EwbnMNB9XruZpw5CFtMOm8
	QUdGs7/vbOpeGF1Y5Hx4oZ28B4BO5mnqmo6+P0YjgZVTeNnOZzYkNcEFrXYpbV5oxb7StiM5b
	NK/azhBBOS551b6kk0Evb7a0kwPZcnXPvGzupf4eEqxDBBfA8CO4VyxR/41CdQw0ThJ4zF4sl
	43La3HQdWgNO1h8yxqPCnQ/qSFDonOmJe30QsdLawvEKizYFiaZA+GSaBB0vt1Y5oimg16EOh
	q+ygPXz7DqGxLKqsVmaoM3KbqSyXCRousNAGFNuqrGs+0p3N8xv3uh9TevtnVTcxboeTqpea6
	Vcd65AZrPxua0tBLOlnwcxb3UmaPNz8Tmn4Mgw6oiIcatv5WDxWm72ohII9dPrMbJ+09pixyb
	GZhdeKV/EZ6wnbyvXkOEHrUOAdjc1SQsAS+AscX4TnvGbebkGa5TtUNyEspF6ppBo+MNre6gP
	10Z5NEuo7o/EtRflX2rP19rRidVZM5HFW8MhVTFAdasiHZwSvhO61IJIKLr8J8MDbkxmtiIZO
	9jM3S40/6CUH6qGfYM088TKXa+Mk61i+tzdD8M1lCRhVV7FhnAlxa06JeUXVCQT6eCV7p3wdo
	qUH0ef3mr6cXY60QeYN9Y5tzf/vUTAUbkFDqhWyANYajhvGea1mgW7gRv6VwrKdXQlslBzMfU
	spVmMMsx8TtIQzXL3AcIU0nab7H4d8RqbxK/Fdhm+sJcJHqHAFHsKj58ELElcRwRjtJz6FXeD
	P91cpyg/bxDyyosPgDcA7FR4DLtnmK4eUDhVStGRBpP7cM/+bTMFaGMjfUQ=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.74
Subject: [Qemu-trivial] [PULL 8/9] vfio: platform: fix a typo
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
X-List-Received-Date: Wed, 22 May 2019 16:08:42 -0000

From: Li Qiang <liq3ea@163.com>

'eventd' should be 'eventfd'.

CC: qemu-trivial@nongnu.org
Signed-off-by: Li Qiang <liq3ea@163.com>
Message-Id: <20190521151543.92274-4-liq3ea@163.com>
Acked-by: Alex Williamson <alex.williamson@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/vfio/platform.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/vfio/platform.c b/hw/vfio/platform.c
index e59a0234dd87..d52d6552e089 100644
--- a/hw/vfio/platform.c
+++ b/hw/vfio/platform.c
@@ -72,7 +72,7 @@ static VFIOINTp *vfio_init_intp(VFIODevice *vbasedev,
         g_free(intp->interrupt);
         g_free(intp);
         error_setg_errno(errp, -ret,
-                         "failed to initialize trigger eventd notifier");
+                         "failed to initialize trigger eventfd notifier");
         return NULL;
     }
     if (vfio_irq_is_automasked(intp)) {
@@ -84,7 +84,7 @@ static VFIOINTp *vfio_init_intp(VFIODevice *vbasedev,
             g_free(intp->unmask);
             g_free(intp);
             error_setg_errno(errp, -ret,
-                             "failed to initialize resample eventd notifier");
+                             "failed to initialize resample eventfd notifier");
             return NULL;
         }
     }
-- 
2.20.1


