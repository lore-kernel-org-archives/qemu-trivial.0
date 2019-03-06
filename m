Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h1UPO-00051u-Bx
	for mharc-qemu-trivial@gnu.org; Wed, 06 Mar 2019 06:08:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35348)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1h1UPM-00050b-MZ
	for qemu-trivial@nongnu.org; Wed, 06 Mar 2019 06:08:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1h1UPH-0002CL-5H
	for qemu-trivial@nongnu.org; Wed, 06 Mar 2019 06:08:18 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:52477)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1h1UP8-00027U-Py; Wed, 06 Mar 2019 06:08:07 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA
	(Nemesis)
	id 1MlNgx-1hO8QT1yyz-00lj4S; Wed, 06 Mar 2019 12:07:32 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
	Zhang Chen <zhangckid@gmail.com>,
	zhanghailiang <zhang.zhanghailiang@huawei.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Cornelia Huck <cohuck@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
	Richard Henderson <rth@twiddle.net>, Thomas Huth <thuth@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>, Li Zhijian <lizhijian@cn.fujitsu.com>,
	John Snow <jsnow@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Laurent Vivier <laurent@vivier.eu>, Eduardo Habkost <ehabkost@redhat.com>,
	qemu-block@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Tony Krowiak <akrowiak@linux.ibm.com>, Max Reitz <mreitz@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	Laurent Vivier <lvivier@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-s390x@nongnu.org, Corey Minyard <minyard@acm.org>,
	Pierre Morel <pmorel@linux.ibm.com>,
	Stephen Checkoway <stephen.checkoway@oberlin.edu>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Wei Yang <richardw.yang@linux.intel.com>
Date: Wed,  6 Mar 2019 12:07:06 +0100
Message-Id: <20190306110711.309-6-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190306110711.309-1-laurent@vivier.eu>
References: <20190306110711.309-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:s071umxow7gW3bvndjA7oh42MFeQuqJhqDtONzEWjTpO/qN/ykg
	iKC6R+Jo8hBEhR37tckqu/fSHwvJ33/xkvo/ErRhZa/LWeqCoOsIEUgoO3PVg4Yeu8TCb/F
	5AWiyU7iFTj6EdpqMu6TL7npMtVcOwEB33ANvjKalvKUBy+h5a6GU+RUnszrzGLICNcZ9fq
	EJtzh6iZWV8zk/HzF42LA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:r9JSroEDBPw=:E63HMxcj/JCD427e3URLqA
	plene3L/E/zw7OxUACamFbq3TTqL7TcNHVkLHTFhD+Vh5OwoPow0F1zbjGs1RV5yZ9igF1cYF
	OKh6nTP88HgmzU1TJIg2yoeIuM9ewsYdGDjK3wIr9p/GtA8F46GaR+9U0fXi8ZOXMnnfKbU5z
	gv4i3Ct+DMlOLZpZWoylJH2CEI5ZQNwUPUzXdH2UbQmqe4hiJBPBIdgRURWYYKQntnYr2bNP7
	nvRWnxi5IsSYWQA4qJ+Qx+Sx/RXwXvDHR1EjBqWqbhX4RQ0Dw6ZysBHgiPXGvVTFk3e6vcq2j
	tEm6eiBsU4tYJ/sHvkMJHhFWCSbQXCKLkkUvSk/tMgz92dWg0jHFM1DWSCNeOeuUWBJ5WvX94
	l1/L2a5y52niX0URUMnrUsFEUm9GtcDtBc/puLBXllHLd/tvqvnfOwemzyrc48rg3n75PxXYe
	NDPGQ9AHtJ8uk24n3iU1zz8NxquA4CgxVAaMlHQJpMRGPPfYSBaF4inIkfBbAjH9lvSZygF7y
	qa8NP7Vfqs5tJ5wh76KwJvWxar2NfnGnUPf9eQ+238uyjvUQSLaK2NgIECw07EMFZNdC2Jb16
	91vHbuSeKxvKJiv9Z7+D7iXVs3helO2of/bNPOCErIiRvGzYKHFJcsis9M3AS9whz77aSYQjs
	7zEOS4WT4siZR5NPNWD+1jUBZd5IqttedqCuVoyGyYA7MoWO4VjV4hJ1OJc5A28usHvf5yKHP
	ejSy2r7okbP7qFXQ9vH4oU8wJ4wuxD/h8CklURPVkbJEX3Wk62mfeQ6p6v4=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.10
Subject: [Qemu-trivial] [PULL 05/10] block/pflash_cfi02: Fix memory leak and
 potential use-after-free
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
X-List-Received-Date: Wed, 06 Mar 2019 11:08:21 -0000

From: Stephen Checkoway <stephen.checkoway@oberlin.edu>

Don't dynamically allocate the pflash's timer. But do use timer_del in
an unrealize function to make sure that the timer can't fire after the
pflash_t has been freed.

Signed-off-by: Stephen Checkoway <stephen.checkoway@oberlin.edu>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Wei Yang <richardw.yang@linux.intel.com>
Message-Id: <20190219153727.62279-1-stephen.checkoway@oberlin.edu>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/block/pflash_cfi02.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index 0f8b7b8c7b36..1588aeff5a95 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -84,7 +84,7 @@ struct pflash_t {
     uint16_t unlock_addr0;
     uint16_t unlock_addr1;
     uint8_t cfi_table[0x52];
-    QEMUTimer *timer;
+    QEMUTimer timer;
     /* The device replicates the flash memory across its memory space.  Emulate
      * that by having a container (.mem) filled with an array of aliases
      * (.mem_mappings) pointing to the flash memory (.orig_mem).
@@ -429,7 +429,7 @@ static void pflash_write (pflash_t *pfl, hwaddr offset,
             }
             pfl->status = 0x00;
             /* Let's wait 5 seconds before chip erase is done */
-            timer_mod(pfl->timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
+            timer_mod(&pfl->timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
                       (NANOSECONDS_PER_SECOND * 5));
             break;
         case 0x30:
@@ -444,7 +444,7 @@ static void pflash_write (pflash_t *pfl, hwaddr offset,
             }
             pfl->status = 0x00;
             /* Let's wait 1/2 second before sector erase is done */
-            timer_mod(pfl->timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
+            timer_mod(&pfl->timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
                       (NANOSECONDS_PER_SECOND / 2));
             break;
         default:
@@ -596,7 +596,7 @@ static void pflash_cfi02_realize(DeviceState *dev, Error **errp)
     pfl->rom_mode = 1;
     sysbus_init_mmio(SYS_BUS_DEVICE(dev), &pfl->mem);
 
-    pfl->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, pflash_timer, pfl);
+    timer_init_ns(&pfl->timer, QEMU_CLOCK_VIRTUAL, pflash_timer, pfl);
     pfl->wcycle = 0;
     pfl->cmd = 0;
     pfl->status = 0;
@@ -695,11 +695,18 @@ static Property pflash_cfi02_properties[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
+static void pflash_cfi02_unrealize(DeviceState *dev, Error **errp)
+{
+    pflash_t *pfl = CFI_PFLASH02(dev);
+    timer_del(&pfl->timer);
+}
+
 static void pflash_cfi02_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
 
     dc->realize = pflash_cfi02_realize;
+    dc->unrealize = pflash_cfi02_unrealize;
     dc->props = pflash_cfi02_properties;
     set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
 }
-- 
2.20.1


