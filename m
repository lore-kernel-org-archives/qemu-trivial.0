Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1goppu-0001bX-4T
	for mharc-qemu-trivial@gnu.org; Wed, 30 Jan 2019 08:23:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36971)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gopps-0001XQ-G2
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2019 08:23:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1goppr-0006aa-Ey
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2019 08:23:24 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:40919)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1goppZ-0006Ex-TX; Wed, 30 Jan 2019 08:23:07 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1N8GIa-1hAkSk2DNw-014ASL; Wed, 30 Jan 2019 14:22:38 +0100
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
	kumar sourav <sourav.jb1988@gmail.com>, Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Date: Wed, 30 Jan 2019 14:22:04 +0100
Message-Id: <20190130132214.25493-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190130132214.25493-1-laurent@vivier.eu>
References: <20190130132214.25493-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:snUypJG3Jv6UdPUKdZjHdzbJN3MQE2HD/LeXCH/ASb+61viyd9i
	VB4Ypxkdwge7p1IKUA+2GBwvh1+KUcJquqCTggPSr03hASLW7825UZSmOKNNVCc3ypZYSKT
	aTqqMUus7ertxPehgy5lAXqriE7HWJsJfrYpCKVRPU/6JPcJMOoWceIIroEO+ZnkdsX0vNQ
	28ZIb7x0dC7vihcxQ+WBg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:AhzrMwdN23I=:nDntWtZ1HElk7C1DYdwG+m
	k0HFEPOiKOn7SfAkCkpJEE4P636Ict6tSj5CNdfP4QGPdFDgL8vY6ggL9eYVmi7OadtP2dDov
	9dP9jT1JUwdGVG/vEaf99QtQHzARu+KlYV88ZlSoeo47NgFrNkIco1gou7L5qHZaC8UGvE1KI
	0wXQD2u4bcYJ24W/DHnwnZcOioTg+vX/yP6rVzbuEAdSMwH238FslE97cZCZlaZHot36Q0EmD
	pecgD0w/gEyRdXBmyWAdKVU+T5cX+bQ3TyB45jgmEEsdet3K97eo13c4aRMx/LeaCBHt1sTDw
	NAhBxPCX0gminelmD7f4/Hr9vztje66PQYCgVeHPFH2yBoATvpPCWw/IisFVfmH3MYl9lcsQL
	GOdA7yMmk0qxskUpgdKyajoIxAdTueI2FjzY1IfHuxaW5Y1cr0b63RRujUiIIrTO4fg43qZix
	SSKAo9v5lDrZFTU5V7GCNHXO5vIackdHaOxjDq+cPEgSeMJDyxaoqXKy4oMNdWyEqrBfoWZ6g
	GfQlRdpKkMYNXh+KZx1DYvBKyzljE2lkoVr3OoAc6RLjTX5BM9LJ0/HjF89BbCGlEeHCk9/OV
	F+c5cH5jhYjBIC0YGNucNv4HYiUoLlV9MZv1oFVP7aUXdP2bY+UohjNwvxl/L0ye5/AzA0yda
	u1Zgx6g1RDf9j5ROG9JHSxr/itkpdlABUeJ9HPtgbdgM+rRa0woRPe8GHRBsSjLGTWIA8Q48A
	aPkp4csryUrx5Sx9CRILqh+OOFDv+jJXVZq6kMUxuZ+cmxb3/p+ns+JB2wg=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.130
Subject: [Qemu-trivial] [PULL 03/13] hw: input: set category of the i8042
 device
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
X-List-Received-Date: Wed, 30 Jan 2019 13:23:25 -0000

From: kumar sourav <sourav.jb1988@gmail.com>

Sets the category of i8042 device as DEVICE_CATEGORY_INPUT
Devices should be assigned to one of DEVICE_CATEGORY_XXXX.

Signed-off-by: kumar sourav <sourav.jb1988@gmail.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20190125151440.13794-1-sourav.jb1988@gmail.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/input/pckbd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index 3e66713b47..72e7d5f6cc 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -574,6 +574,7 @@ static void i8042_class_initfn(ObjectClass *klass, void *data)
 
     dc->realize = i8042_realizefn;
     dc->vmsd = &vmstate_kbd_isa;
+    set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
 }
 
 static const TypeInfo i8042_info = {
-- 
2.20.1


