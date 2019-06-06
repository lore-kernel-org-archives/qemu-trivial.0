Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hYqFc-0000bZ-Iw
	for mharc-qemu-trivial@gnu.org; Thu, 06 Jun 2019 07:08:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60617)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hYqFT-0000VF-GU
	for qemu-trivial@nongnu.org; Thu, 06 Jun 2019 07:08:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hYqFS-0003lJ-Ej
	for qemu-trivial@nongnu.org; Thu, 06 Jun 2019 07:07:59 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:60497)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1hYqFM-0003W7-7N; Thu, 06 Jun 2019 07:07:52 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA
	(Nemesis)
	id 1N3KDM-1gZYHX0OdG-010LEk; Thu, 06 Jun 2019 13:06:53 +0200
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
Date: Thu,  6 Jun 2019 13:06:18 +0200
Message-Id: <20190606110625.32127-10-laurent@vivier.eu>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190606110625.32127-1-laurent@vivier.eu>
References: <20190606110625.32127-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:8FmYLJqd6nXvaOA8F8eP5aRFDi4xgKrj8Ckn7so07AqnFefxKJf
	bufSPAvf+aYwQgR9cG5GMvWhk1VEnOVUWd0r0yy8RSAQEFd+XSPDnGH2YOHjoODZstbDNBP
	hfir2+Nxzizz1I6FPy4HeD4KhyTRzZQpBeTn7NODDPVZ6v91buO68l2eGYdtrRQKQARrDoj
	ZwU3gVtBTmY/hY52GKerQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:TXGh83A+BFc=:ZlfeUp7i3lWhZ1IXQbS3vy
	U2Bk0DiMUdTX8F+CvMczxQV8EQC+3NNdMMqRxki0S8iDZUb7knNsz+RY0/MWSRcL3sFAH2Qgs
	iTMU5zsY/fRk++iZpKBsLf/77weaz/JLdHmuebICDCZr88+/f1h7z4njGpe2gMQQkbBXxDmiD
	43VVnlr0AYXNUYcFubTEJHg1W+eBnaupuHDVbH5pKKfiKVZzYNukgrCyPJZHBSyC+o9dZMyh6
	oZwo60W8Fh6nQ8NjKCYhVZq00OE9wAjuDOwxZbhrIMqBl4EfQ9e5XWXjBKIEP1erub0XdDOuq
	PtMRlIP+O4osYQ0btM/Enw+jNZreHIjHP1MOfomcLVY0rzBra3aRUmEAuxmN2ziLaarW5pBQ1
	HnQYhQQ77S9QPuHVM/wHaeSQwgcWhW16lSy069RS9SHri6NHt4zNg21Xr+OSCuQo1YbbYjrnV
	BLXvD3MY2J3kPBmm+2lhDvjrxhKQajcLpQvHm72Ej49J7OXGtmD6UqPrlGxEM/Ny4hdVCZnSW
	9NJULwNw9yPSrmCbPtK9Lvzxl/pstrBQ/0FRU3QxVF0kDCbQwTl8ORd5+gjT5lNq2s64yejtt
	AWDONfS94OE1iPefipkTyvEtgQ/CCP3exZKiMuGSWVsaj/iMrHAJWqSU89Jiez3PyUzEOu+GC
	ld7sutLLk9ni1LAGO0pUVF3YimlAScZs5LEFeM0miGuK+hAI3DPbw6/8Od+kPeNuTsuoTcjUn
	UegRD73Qo5OO0CgaqpZPVkLwc1zfqhKugZUSxEQK5r2x0aqrFOI8d/4r0c8=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.13
Subject: [Qemu-trivial] [PULL 09/16] hw/s390x/event-facility: Use the QOM
 BUS() macro to access BusState.qbus
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
X-List-Received-Date: Thu, 06 Jun 2019 11:08:00 -0000

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Rather than looking inside the definition of a BusState with "s->bus.qbus",
use the QOM prefered style: "BUS(&s->bus)".

This patch was generated using the following Coccinelle script:

    // Use BUS() macros to access BusState.qbus
    @use_bus_macro_to_access_qbus@
    expression obj;
    identifier bus;
    @@
    -&obj->bus.qbus
    +BUS(&obj->bus)

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Message-Id: <20190528164020.32250-5-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/s390x/event-facility.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/s390x/event-facility.c b/hw/s390x/event-facility.c
index ee5b83448b11..e574223a226b 100644
--- a/hw/s390x/event-facility.c
+++ b/hw/s390x/event-facility.c
@@ -466,12 +466,12 @@ static void init_event_facility(Object *obj)
     new = object_new(TYPE_SCLP_QUIESCE);
     object_property_add_child(obj, TYPE_SCLP_QUIESCE, new, NULL);
     object_unref(new);
-    qdev_set_parent_bus(DEVICE(new), &event_facility->sbus.qbus);
+    qdev_set_parent_bus(DEVICE(new), BUS(&event_facility->sbus));
 
     new = object_new(TYPE_SCLP_CPU_HOTPLUG);
     object_property_add_child(obj, TYPE_SCLP_CPU_HOTPLUG, new, NULL);
     object_unref(new);
-    qdev_set_parent_bus(DEVICE(new), &event_facility->sbus.qbus);
+    qdev_set_parent_bus(DEVICE(new), BUS(&event_facility->sbus));
     /* the facility will automatically realize the devices via the bus */
 }
 
-- 
2.21.0


