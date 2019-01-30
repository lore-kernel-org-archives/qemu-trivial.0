Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1goppy-0001gx-Ny
	for mharc-qemu-trivial@gnu.org; Wed, 30 Jan 2019 08:23:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37061)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1goppw-0001en-Sf
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2019 08:23:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1goppt-0006d0-16
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2019 08:23:27 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:37347)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1goppd-0006Et-OE; Wed, 30 Jan 2019 08:23:11 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1McY0L-1hQvKL1tBF-00d0eG; Wed, 30 Jan 2019 14:22:36 +0100
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
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Date: Wed, 30 Jan 2019 14:22:03 +0100
Message-Id: <20190130132214.25493-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190130132214.25493-1-laurent@vivier.eu>
References: <20190130132214.25493-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:8EK8MrWzuT304246ph8T2czJsWQXVzbhoPsIK4aV92xulwPYTjh
	puUPO3H1g686gJbAtou6MbKbILve50ePprU6MiWMtkRDODCqJNPoetKCoCZp3mPEmevaEX2
	p0cEPD1yEomYkh053dV++HAxL9AH8cW6qgChf+n+m1eT6R5HdjlHTk4AilwkF+OiGD6PejN
	pyIaoESef3+vOYs68quHA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:M9VQKc9rpMM=:B7uQqpbmZNBhhCWzz9/vTQ
	uoiWI4YZUtsMUXl0+tFsZQSTH0PjtrNg+N5AWgcySshGp8R9LcWCyDBcrE3Fl6G7FD7WdyYys
	VDJ3wKOnHoR+DkFV26aaZgSyM62jFv/BN5UxZjntMFjD65QvEey5jJzMvgNz6YHROOjNn/B10
	nlW3Ynt81idO4mUCq/VdmFs/lGuBII3wwuLGlDbeG+/6gPdLH4aS2S/quraOXtLoRRqpa3WpV
	M8Iud9zSnu34WTEN6/YvC2fMzSeNng5qnzBmQwq3A4EnDNCZIazWSDES2fZN7HgUa9FLdZeTT
	LyO2vNXafFCvFlndpMzEoTRZiss34MoO8GT39eZ5yfEQYgncf+BL1gLsNR7/x/8Bj0RiXshuK
	71f7G8k4Qfdj6c7xNASCBaPcvuFqkTxI9cl3VW+MCJmdunUyINj3LKeh/lA9y+QAKIJcnpQI5
	F0ygj2cy7An++Kr4ekgh0LVzk4xRx2WwQXOHZrPQf1Z3/S/n854VORUlgBLHgqK5HENC8OWvF
	bamvwUzXZNj1iqkygpGiWDXNINJUEfyYj9OFp2I3Ff+sKls3RWwfOa1WdZ090UJqj9tpvwY8I
	yZQQWMH0UvJTv9xe7+zdt9wyjpX6zi5TCDxt/bDDewlXUZbtL8xbez6OSDy7QPwNK4b1y5SQ1
	+20pP0jWdqnGuO16m4Lk3+MJCQFYzH3lpP5WsCDG20xmhfcgUaqb7wAT25RrMwIms1G66PUVO
	IFYsjYWJvrxiDo7MJ0wCu+2ISdz1JzWnp7oE0zqo7NmB3doCOJw32ZE3wFc=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.130
Subject: [Qemu-trivial] [PULL 02/13] typo: apci->acpi
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
X-List-Received-Date: Wed, 30 Jan 2019 13:23:29 -0000

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

apci_1_compatible should be acpi_1_compatible.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20190125094047.22276-1-dgilbert@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/acpi/cpu.c         | 2 +-
 hw/i386/acpi-build.c  | 2 +-
 include/hw/acpi/cpu.h | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
index f10b190019..a0a43fe6b5 100644
--- a/hw/acpi/cpu.c
+++ b/hw/acpi/cpu.c
@@ -508,7 +508,7 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
             GArray *madt_buf = g_array_new(0, 1, 1);
             int arch_id = arch_ids->cpus[i].arch_id;
 
-            if (opts.apci_1_compatible && arch_id < 255) {
+            if (opts.acpi_1_compatible && arch_id < 255) {
                 dev = aml_processor(i, 0, 0, CPU_NAME_FMT, i);
             } else {
                 dev = aml_device(CPU_NAME_FMT, i);
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 2e21a31f82..d60603abd7 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1847,7 +1847,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
         build_legacy_cpu_hotplug_aml(dsdt, machine, pm->cpu_hp_io_base);
     } else {
         CPUHotplugFeatures opts = {
-            .apci_1_compatible = true, .has_legacy_cphp = true
+            .acpi_1_compatible = true, .has_legacy_cphp = true
         };
         build_cpus_aml(dsdt, machine, opts, pm->cpu_hp_io_base,
                        "\\_SB.PCI0", "\\_GPE._E02");
diff --git a/include/hw/acpi/cpu.h b/include/hw/acpi/cpu.h
index 89ce172941..62f0278ba2 100644
--- a/include/hw/acpi/cpu.h
+++ b/include/hw/acpi/cpu.h
@@ -48,7 +48,7 @@ void cpu_hotplug_hw_init(MemoryRegion *as, Object *owner,
                          CPUHotplugState *state, hwaddr base_addr);
 
 typedef struct CPUHotplugFeatures {
-    bool apci_1_compatible;
+    bool acpi_1_compatible;
     bool has_legacy_cphp;
 } CPUHotplugFeatures;
 
-- 
2.20.1


