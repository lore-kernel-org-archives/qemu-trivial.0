Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1goppZ-0001Hi-Ug
	for mharc-qemu-trivial@gnu.org; Wed, 30 Jan 2019 08:23:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36635)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1goppW-0001Fs-6B
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2019 08:23:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1goppU-0006EG-87
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2019 08:23:02 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:48071)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1goppS-0006B3-AS; Wed, 30 Jan 2019 08:23:00 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MbRXd-1hPpOl27AH-00buBg; Wed, 30 Jan 2019 14:22:34 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Jiri Slaby <jslaby@suse.cz>, qemu-s390x@nongnu.org,
	Cornelia Huck <cohuck@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
	Richard Henderson <rth@twiddle.net>, Igor Mammedov <imammedo@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Riku Voipio <riku.voipio@iki.fi>, Stefan Hajnoczi <stefanha@redhat.com>,
	Stafford Horne <shorne@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
	qemu-trivial@nongnu.org, Max Reitz <mreitz@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Michael Tokarev <mjt@tls.msk.ru>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	kumar sourav <sourav.jb1988@gmail.com>, Thomas Huth <thuth@redhat.com>
Date: Wed, 30 Jan 2019 14:22:02 +0100
Message-Id: <20190130132214.25493-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190130132214.25493-1-laurent@vivier.eu>
References: <20190130132214.25493-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:8gDcRmh3jQtuu67BPEx05q00OFzwmc0ij8PAQEbE2ALSkIsB09M
	2b6GGygFs6pWAqFqBuhC0jgsqBkSlFqsBqSLXbFTyJcI5KIljrkgdWyR2Rq+DDV/RN8oJcV
	2jMGJTOJPAOqBtVIU2zCI583LytTZUY6S7gzQnyscazuDOQnM5N8ijguqq+rgqcLJu1t0SU
	J684yO9NDuZbQsSGy36oA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:VFYX8yAkqMk=:CPfqciEvBRmJTe6rtQyhNr
	pZ74XBHghgB1UMXGvGXuBqHLIv2iwQZym3m/iv/cOa9bxVqLy3jd6yUe095YIVfq8tb6MF7Ic
	rP1M9Zd1QVZ5c66h+5SRVbL6ZvI51gcEC7wEdUwfylaDgt4mFEZwewRKULBA0Ua9e5BIlE2Y0
	QNSTGiaK2nFm6gRmcCPunMXemLC/58dI5QcvwBVVDPKJ/w089Oqg7Nvxqvh5qvWL/C+R/vcsM
	vqkHjUTWkkQM1BFfqu1/k5X5UKVxSJbtcAKjJOR4TPwww43NCiHu1RRB81npmfsjNcNbVyhug
	uf9RGIQLZlPsxg1kXmL8Zd0bEJo6HwiGYHMSx7+90YbgCn2hKMRX62648FFOuyidQNlHJjQNj
	SfmHeq1PKrijfv/cz5stySHDimyG2YoxW5eR99q/AIq75Fa1OkA2SU8dRzUpNGZ75lZCUqnMV
	qQoWX/cnZqwCQeuksssv6skT4tZy0bHQau5u9mhpYTQr26iEdID6d1lKxMvcK2qFKuDNKadK+
	0Q1EIalT8woirTqJFslGVk4+orgcEXSyUDBY4v5oQvUfUbuhwHRPtqktN3MdduLgeO9fgB5v0
	m4fpOBtjc0FzgA7EzEqFOH75CirqU3lGvHEizaxrjq9iGg4nyZ0m5BE/s39j2DS2CdTss/0hm
	ISg0PYCiQKBT+igDqyrYM5Igba85OduY7ARHheqSO5ltigZCHnjwKnepqLfeAIU/jb3aLCyUD
	FJ+K34ABXD0nrnlONhQoWx2ePpo7x1MA8CkMWg==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.187
Subject: [Qemu-trivial] [PULL 01/13] hw: edu: set category of the edu device
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
X-List-Received-Date: Wed, 30 Jan 2019 13:23:03 -0000

From: kumar sourav <sourav.jb1988@gmail.com>

Sets the category of edu device as DEVICE_CATEGORY_MISC.
Devices should be assigned to one of DEVICE_CATEGORY_XXXX.

Signed-off-by: kumar sourav <sourav.jb1988@gmail.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20190124144606.4352-1-sourav.jb1988@gmail.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/misc/edu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/misc/edu.c b/hw/misc/edu.c
index ceaf688bfb..91af452c9e 100644
--- a/hw/misc/edu.c
+++ b/hw/misc/edu.c
@@ -399,6 +399,7 @@ static void edu_instance_init(Object *obj)
 
 static void edu_class_init(ObjectClass *class, void *data)
 {
+    DeviceClass *dc = DEVICE_CLASS(class);
     PCIDeviceClass *k = PCI_DEVICE_CLASS(class);
 
     k->realize = pci_edu_realize;
@@ -407,6 +408,7 @@ static void edu_class_init(ObjectClass *class, void *data)
     k->device_id = 0x11e8;
     k->revision = 0x10;
     k->class_id = PCI_CLASS_OTHERS;
+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
 }
 
 static void pci_edu_register_types(void)
-- 
2.20.1


