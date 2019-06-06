Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hYqF6-000090-Oq
	for mharc-qemu-trivial@gnu.org; Thu, 06 Jun 2019 07:07:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60272)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hYqF4-00006x-Ta
	for qemu-trivial@nongnu.org; Thu, 06 Jun 2019 07:07:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hYqF3-0003Ab-TG
	for qemu-trivial@nongnu.org; Thu, 06 Jun 2019 07:07:34 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:59545)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1hYqF3-00037Y-JN; Thu, 06 Jun 2019 07:07:33 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA
	(Nemesis)
	id 1N3KDM-1gZYHa2AiY-010LEk; Thu, 06 Jun 2019 13:06:56 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Aleksandar Rikalo <arikalo@wavecomp.com>,
	Juan Quintela <quintela@redhat.com>,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Fam Zheng <fam@euphon.net>, Michael Walle <michael@walle.cc>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>, David Hildenbrand <david@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Yuval Shaia <yuval.shaia@oracle.com>, qemu-trivial@nongnu.org,
	Halil Pasic <pasic@linux.ibm.com>, Richard Henderson <rth@twiddle.net>,
	qemu-s390x@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>,
	Dmitry Fleytman <dmitry.fleytman@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
Date: Thu,  6 Jun 2019 13:06:20 +0200
Message-Id: <20190606110625.32127-12-laurent@vivier.eu>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190606110625.32127-1-laurent@vivier.eu>
References: <20190606110625.32127-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:sJX7kOEASuUqzKMQ0rklS29mfRE7eUYEEoU/Bn7KIEsOMKwqJ2X
	YWBGxkVKP21No4MYqZEreaKD3SKmNr0IVXBWh40+U/9wjURMbjPqw8xeygGtw6C5ruUhURw
	5PTP2d1ArFFy1tfPiZ2v60S3hEqYzBDPMVDYHsP6/bOT7MTQFtMBMFBnNyiu2k8qqxW4zGN
	d5/gMCNINInwKR1/la0Hw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:wzw5+xshbZk=:eOln+xl+YM9UAHFJYpiARo
	kMAa5EWoxeJf34xxDTgqQC7fOaimZY1Apa9qaRK20b2mH5uttdGv5MT0xv8KkiEvQwmXTKOrI
	G2w9K0lP2YVN4PKXr3HXSK0hfP1ilcrHsjdI9FfPWdj40yGFwONc+PLcvGlkcsaqIextT69My
	rWsilrh0PqEV/gOa+bSvsZmd2o6oXtWzcINnTA2TM2kyejnf5FaobVGleekLnqui3iiB3KDdm
	+mrthPjiRiF+4ZoRmeNyHoQJadUmb1D9jXvzXFpkSk2FIaa3V+e4pEwGFocsoa+5Qziid1dXL
	G/hSg2quGyzbJoQizY0Is1jXorDCvkW1jORInWTjiYN+eXsJ0JSH0xCf9bGlS4niFydQTqsRu
	NfNWtaSO09TbKrjupcwPheqsAkmieZoeh7OtLq0lvDQSWXVObbQbzxUQTOsB0u5F0tCEnNQ+x
	KnarwqmnqkOCRTaNrbJJ/iGOaFAaWo/Ok/3OcNTC30q6TnYKqgV5pzyP814fkUGLUVJ9AczkQ
	wMRWKKLAifJ1iX+FYEu5sfFCAM5mw6I8j6qsXaHiYS+WDrO28oOUmtqwZ1r+Ced6EkQhr9Tah
	7OKszfHeqfKOaG7tEXrqVWN9gnCjLP1Lcr2AQ1KhdtQpCPZ437d1npzmQju6AyY11X2l4RDT2
	lOZtGC96V3nZOncQEtpZptxJsmP4A3jVp0PxHXvfVRwUadEL9507lG4oScg+uHRfOhJQxiupc
	+21hzqQAGybZD2uXCflfJLXdq9D7qS8WmCZrFi5lKSxFoCg+NiVzEQWCFi8=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.24
Subject: [Qemu-trivial] [PULL 11/16] hw/usb-storage: Use the QOM DEVICE()
 macro to access DeviceState.qdev
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
X-List-Received-Date: Thu, 06 Jun 2019 11:07:36 -0000

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Rather than looking inside the definition of a DeviceState with
"s->qdev", use the QOM prefered style: "DEVICE(s)".

This patch was generated using the following Coccinelle script:

    // Use DEVICE() macros to access DeviceState.qdev
    @use_device_macro_to_access_qdev@
    expression obj;
    identifier dev;
    @@
    -&obj->dev.qdev
    +DEVICE(obj)

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
Message-Id: <20190528164020.32250-9-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/usb/dev-storage.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/usb/dev-storage.c b/hw/usb/dev-storage.c
index cd5551d94f35..0e4e93ef1673 100644
--- a/hw/usb/dev-storage.c
+++ b/hw/usb/dev-storage.c
@@ -616,7 +616,7 @@ static void usb_msd_storage_realize(USBDevice *dev, Error **errp)
      * The hack is probably a bad idea.
      */
     blk_ref(blk);
-    blk_detach_dev(blk, &s->dev.qdev);
+    blk_detach_dev(blk, DEVICE(s));
     s->conf.blk = NULL;
 
     usb_desc_create_serial(dev);
-- 
2.21.0


