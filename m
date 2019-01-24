Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gmeSQ-0001KM-J4
	for mharc-qemu-trivial@gnu.org; Thu, 24 Jan 2019 07:50:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44361)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gmeSO-0001Ei-2J
	for qemu-trivial@nongnu.org; Thu, 24 Jan 2019 07:50:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gmeSM-00017U-6V
	for qemu-trivial@nongnu.org; Thu, 24 Jan 2019 07:50:08 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:47021)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gmeSD-0000tP-Dw; Thu, 24 Jan 2019 07:49:57 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA
	(Nemesis)
	id 1MHWvH-1gzWcW2RO5-00DZIO; Thu, 24 Jan 2019 13:49:33 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org,
	"Michael S. Tsirkin" <mst@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-ppc@nongnu.org,
	Richard Henderson <rth@twiddle.net>, Michael Tokarev <mjt@tls.msk.ru>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Wei Yang <richardw.yang@linux.intel.com>,
	Stefano Garzarella <sgarzare@redhat.com>
Date: Thu, 24 Jan 2019 13:49:06 +0100
Message-Id: <20190124124906.16653-6-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190124124906.16653-1-laurent@vivier.eu>
References: <20190124124906.16653-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:1nVKMGmVPi9wuEGTdzvjddhUYretfOxqc3gepHZrUT7jSvv5uz6
	9ClQSW/lQsVGCc+2VLOZA1V3DkgjtHqQqx0HUmW11X8bdtY4XU1Q2NYWhd6q6JUIl+lA7sP
	9KyFwkpJowhZn1qPunenVVRp3gkqTTWlwGgWpgw0eo0K3pt0UdXZSh9Ovlyl7kCSybd/boC
	z1tmcmC9CRhvmPyshdhJg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:kKrINX4gifE=:joRkIAlzg3Ah+M9bgyWvWb
	4wOWY5B+L0a3+2fPy5JIAmxln7+cH2NvupVMjpwtGx77txrxAYlb2/48zFCmij7OmawDsnRRu
	fPHQxmkCrBzUYZEC9BpQoUsUQKsyYZxWj6oDqi6/XJeJPP7NfiVx6hcpc1zmi3QxWMCtJAtwE
	RavNXMW04luVmpyjUQ/ZT+4AmsZ2prmDxw/uYpD15oi2l+t90OTN8gWl3vAT+IZmsyTkGIufS
	kxs8nKWUxLhwrJq7CBYLzM9eJXxCEC0DhasxtR2cYroy/Jv5qCV+BmfPZ7GD1kLzMvj7j5E/K
	6xkW4AMHdJqFa29cdk0JT+EyGv7GAhFCJZzfpUiGSSH2oy18qbemVfG6KPCQIGcZsKHb2o0Wc
	1FokmWHfRtU2rTiwO3aNqlBPvDu10wjpGP2wdigxTyLxCGnHJgz/Va1U+pdYkTM5281wSqztj
	fJtzwUFeKP6sEjc8/VhMRFoKlNUFpwYgfO9KCX6JHVM5Ywjldg38QR9QvChZm0Wxojb8aa7Ep
	eXE8zekOGPHRzz7921Zf7+7ayr2amY/yu1Dagm+XsLy4IbHJABaq4prFjlexpI965e194BZfE
	dwz1bp2QD12W8zxY6pOFmL1ZnHuP/G+yNNNPhuNP8hLII9FjE/0uUrdazHbCenOy8ZZlfhGu2
	xuC59K86WuYbetCSy5yqeg2bf7otkFW6o4XKMqhJy6q4rs7j0GQ0Gh/CErID3y4CLuWbWWOA7
	U4P/NE3/YLcS5zIEBr+Uwv2ww8h+evgXa3wqvg==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.24
Subject: [Qemu-trivial] [PULL 5/5] hw/i386/pc.c: fix one typo in function
 name
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
X-List-Received-Date: Thu, 24 Jan 2019 12:50:09 -0000

From: Wei Yang <richardw.yang@linux.intel.com>

Rename pc_get_hotpug_handler to pc_get_hotplug_handler.

No functional change.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Message-Id: <20190124073626.20534-1-richardw.yang@linux.intel.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/i386/pc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 73d688f842..747548b7aa 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -2285,7 +2285,7 @@ static void pc_machine_device_unplug_cb(HotplugHandler *hotplug_dev,
     }
 }
 
-static HotplugHandler *pc_get_hotpug_handler(MachineState *machine,
+static HotplugHandler *pc_get_hotplug_handler(MachineState *machine,
                                              DeviceState *dev)
 {
     if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM) ||
@@ -2615,7 +2615,7 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
     pcmc->save_tsc_khz = true;
     pcmc->linuxboot_dma_enabled = true;
     assert(!mc->get_hotplug_handler);
-    mc->get_hotplug_handler = pc_get_hotpug_handler;
+    mc->get_hotplug_handler = pc_get_hotplug_handler;
     mc->cpu_index_to_instance_props = pc_cpu_index_to_props;
     mc->get_default_cpu_node_id = pc_get_default_cpu_node_id;
     mc->possible_cpu_arch_ids = pc_possible_cpu_arch_ids;
-- 
2.20.1


