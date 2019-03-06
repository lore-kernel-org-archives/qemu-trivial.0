Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h1UPW-000584-MA
	for mharc-qemu-trivial@gnu.org; Wed, 06 Mar 2019 06:08:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35472)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1h1UPT-00054a-QT
	for qemu-trivial@nongnu.org; Wed, 06 Mar 2019 06:08:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1h1UPS-0002JW-SH
	for qemu-trivial@nongnu.org; Wed, 06 Mar 2019 06:08:27 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:57765)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1h1UPS-0002I1-Gy; Wed, 06 Mar 2019 06:08:26 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA
	(Nemesis)
	id 1McpW8-1ha08F3JYI-00Zx6t; Wed, 06 Mar 2019 12:07:26 +0100
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
	Wei Yang <richardw.yang@linux.intel.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Date: Wed,  6 Mar 2019 12:07:03 +0100
Message-Id: <20190306110711.309-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190306110711.309-1-laurent@vivier.eu>
References: <20190306110711.309-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:K8jwCMHpr/yeiE8L8NfUcyrgc47rLyjNuppYIMES66UEazF+X75
	qvM8ThwuP0nvoQG9DTv30NRha9/M2yx/4t1K16W5V2eb4BeoU5xqGXlzeTLs1AqJnB3pL9h
	Mu7ElDgQdOOCmulTdrDDX5m7sgvZqc1/rCLDPkdXzH10d4CMxYLLBKL6blUR7CRYNQ+cuOF
	JRq0JGycH4HkI+znqZR+w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:AExTLNaBz7Q=:mVd6j+Hz/Oxsn9aQqBfQrz
	lX0Re+u+n/9kqwSeLegFhKl/tfXnTF04TS+0x4Ya6HuOFeqp/Ee2Hqt7kOEQ9k3cbsZ9lxuCS
	qSqYklIa2VGi09aTx75Is+70hpOi5KKwyp5SMRoPyeDf1KjYTvMVLF3XZbp1dST17fGzOAjpM
	6sxLsaWknXUedxYfoP0q3d2tyUxvTG3sv4W3qVucwTWSOXJxAd6E8B7qTSg2z2uE5WkQ3pMPZ
	/WLriKIFq7NxuBYxeJpizbT02sIejpMvu6MdswjCwoOk7YOOwT2LXnTemwHzm87ZQcqEVYesR
	X5ojBDy6UKFXkHitbbIGMlvyYQIukqjd9XFZmovZCxrmvx4WquNEyoxyrhXGCqJQo0lCltWzJ
	J+4dGoSzp3e+fAvz8nxIMhS3kxryO5+hDmLXS810d7sufJwfnX8C0XKpSVWfUQN/B6udA3FDU
	DYdu9SubvMZJ6gtdH8qxZUn0zdU2mG8l1HseidzWy4dqmCXRJcbbXVtxhOxzUwn7GCoG+RKPG
	TN315nI/ZFFA3oM/vWR4GV3XFDnFCMk4BfslEZdS1pxOPfeb2C/aWY4/1W2LMGYR2wjOm6xxl
	p0wravFSiXswAfqUPB3aQIzjt4pJF2fwrhNhbugMlZQOCrjWEC3TfPMsQzm0LBidJGefz6kgz
	KD1/1sftMf3AI76vawOKDaiXr3XzJFbco4nQg/6tTQfsHCrWSwayYKUH8XwUd+XWx/zqfzAUG
	DV/oIO3T4y2zF+HEPzyaYNhHe9GmUzjttoehe2Q/jT3Qwh16weA1LeC+Ypw=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.13
Subject: [Qemu-trivial] [PULL 02/10] hw/i386/pc.c: remove unused function
 pc_acpi_init()
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
X-List-Received-Date: Wed, 06 Mar 2019 11:08:29 -0000

From: Wei Yang <richardw.yang@linux.intel.com>

Function pc_acpi_init() is not used anymore.

Remove the definition and declaration.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20190214084939.20640-2-richardw.yang@linux.intel.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/i386/pc.c         | 27 ---------------------------
 include/hw/i386/pc.h |  1 -
 2 files changed, 28 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 3889eccdc322..578f772e7ce2 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1688,33 +1688,6 @@ void pc_pci_as_mapping_init(Object *owner, MemoryRegion *system_memory,
                                         pci_address_space, -1);
 }
 
-void pc_acpi_init(const char *default_dsdt)
-{
-    char *filename;
-
-    if (acpi_tables != NULL) {
-        /* manually set via -acpitable, leave it alone */
-        return;
-    }
-
-    filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, default_dsdt);
-    if (filename == NULL) {
-        warn_report("failed to find %s", default_dsdt);
-    } else {
-        QemuOpts *opts = qemu_opts_create(qemu_find_opts("acpi"), NULL, 0,
-                                          &error_abort);
-        Error *err = NULL;
-
-        qemu_opt_set(opts, "file", filename, &error_abort);
-
-        acpi_table_add_builtin(opts, &err);
-        if (err) {
-            warn_reportf_err(err, "failed to load %s: ", filename);
-        }
-        g_free(filename);
-    }
-}
-
 void xen_load_linux(PCMachineState *pcms)
 {
     int i;
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 3ff127ebd037..54222a202d33 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -189,7 +189,6 @@ void pc_acpi_smi_interrupt(void *opaque, int irq, int level);
 
 void pc_cpus_init(PCMachineState *pcms);
 void pc_hot_add_cpu(const int64_t id, Error **errp);
-void pc_acpi_init(const char *default_dsdt);
 
 void pc_guest_info_init(PCMachineState *pcms);
 
-- 
2.20.1


