Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gHS9h-0002d8-6N
	for mharc-qemu-trivial@gnu.org; Tue, 30 Oct 2018 07:25:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58817)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gHS9a-0002XQ-GK
	for qemu-trivial@nongnu.org; Tue, 30 Oct 2018 07:25:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gHS9N-00046L-9d
	for qemu-trivial@nongnu.org; Tue, 30 Oct 2018 07:25:40 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:56611)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gHS8n-0002rr-PV; Tue, 30 Oct 2018 07:24:58 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1M7sUE-1gDaFi25T8-0053ea; Tue, 30 Oct 2018 12:24:20 +0100
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1M7sUE-1gDaFi25T8-0053ea; Tue, 30 Oct 2018 12:24:20 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Cleber Rosa <crosa@redhat.com>,
	Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>, Anthony Perard <anthony.perard@citrix.com>,
	Aurelien Jarno <aurelien@aurel32.net>, Max Reitz <mreitz@redhat.com>,
	Fam Zheng <famz@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
	Kevin Wolf <kwolf@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Stefano Stabellini <sstabellini@kernel.org>, qemu-trivial@nongnu.org,
	qemu-block@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
	xen-devel@lists.xenproject.org, Gerd Hoffmann <kraxel@redhat.com>,
	Riku Voipio <riku.voipio@iki.fi>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <lvivier@redhat.com>,
	Michael Walle <michael@walle.cc>, Markus Armbruster <armbru@redhat.com>
Date: Tue, 30 Oct 2018 12:23:34 +0100
Message-Id: <20181030112337.17973-18-laurent@vivier.eu>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181030112337.17973-1-laurent@vivier.eu>
References: <20181030112337.17973-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:g0UQ27pPr0n6Gyo7LTiu2X1b3crfe9Pm3advV87kTAPQ4NK+fWJ
	Xf5appWG1VLn8k/+NN/WlIJdCitF4we8ARZSBbgZjCUBo9MzBEObQS8igCkGdA3ZjazEjzD
	XCyq7a86LpzUywGmv/CifZsacBvlToGprSzrt9oqVZ/6w6WKZ46XCdbaLn0GX66UZ+dgsXZ
	jhhqWwVQByojY7GTVTPpQ==
X-UI-Out-Filterresults: notjunk:1;V01:K0:mntFo7Cu7ps=:9qbwB0tB8iavhB2cnZRZV6
	R30MtderFv6PZ7irMB6ijohG3Vhe3c4X5W3O+FHMNMgTbayqVGurCXRJ1I8vRRWc1sT/T2ggu
	jvVeofrclBb7uiOFLO87v1MseYkSNkNl8AqPEj0f0POZyNgse24eUXv94VFOTZGKuhGlVB+rz
	gwg3eWpWEmtARaOWfw7GXWKPcWTdExERgFwGf89AybkWwhNOeBzQRQoV69Y8+1uCvaA28XQQb
	O58rrDhqRt6JLSCrqHUoIBmPV/qS+bTcTdFuoZIgpPM+krSKD8HWgR74r16A5Fq+sZD/ajtZd
	tHxvKYq6H1u/3VWnJ7a8q7scgTdMzX6+bTSoiMm9v8UmP0Z4pQHZ8UscWNWS0912jQSxyxjpc
	CYAaryo7LgutjbDe8CBR/WEZOxEFr2tHPZ/rliQiXF82hmPj5/8n2th/Ez81u3ozpf0GCrZLK
	VYAEvMINgtKkJ0rz6wS9QfklzoGgruNugWRicYBheTbSPGqBL4bERILoqrTtkXfDBUX1m9Agj
	jbGn/RN3PfZJvGxJgPD8FLbbOQTuGU43vQyRurxD2UvNjOsfP2hXLaFEW9ioRGd6EFvP3sGxA
	6c7BzsIWA7WGa7QtrmF7/KPVEfhbn/36sR8Gk+P9gT4IdZMq+JAFcHE9vjPUw7ZnlSg9X3sUB
	k7ZfXHDGL3O+Z0csxnMRdhXVMOzfFFhsqcO3MRF7BqNRbcbSicsmCTMlzevmSFo437/XQCtjF
	+eHIIdQTqYqEO3xj
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.135
Subject: [Qemu-trivial] [PULL v2 17/20] hw/pci-host: Remove useless
 parenthesis around DIV_ROUND_UP macro
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
X-List-Received-Date: Tue, 30 Oct 2018 11:25:51 -0000

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Patch created mechanically by rerunning:

  $  spatch --sp-file scripts/coccinelle/round.cocci \
            --macro-file scripts/cocci-macro-file.h \
            --dir . --in-place

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20180705155811.20366-7-f4bug@amsat.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/pci-host/piix.c | 2 +-
 hw/pci-host/q35.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/pci-host/piix.c b/hw/pci-host/piix.c
index da73743fa2..47293a3915 100644
--- a/hw/pci-host/piix.c
+++ b/hw/pci-host/piix.c
@@ -144,7 +144,7 @@ static void i440fx_update_memory_mappings(PCII440FXState *d)
     memory_region_transaction_begin();
     for (i = 0; i < 13; i++) {
         pam_update(&d->pam_regions[i], i,
-                   pd->config[I440FX_PAM + (DIV_ROUND_UP(i, 2))]);
+                   pd->config[I440FX_PAM + DIV_ROUND_UP(i, 2)]);
     }
     memory_region_set_enabled(&d->smram_region,
                               !(pd->config[I440FX_SMRAM] & SMRAM_D_OPEN));
diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
index 8ce1e09932..966a7cf92d 100644
--- a/hw/pci-host/q35.c
+++ b/hw/pci-host/q35.c
@@ -356,7 +356,7 @@ static void mch_update_pam(MCHPCIState *mch)
     memory_region_transaction_begin();
     for (i = 0; i < 13; i++) {
         pam_update(&mch->pam_regions[i], i,
-                   pd->config[MCH_HOST_BRIDGE_PAM0 + (DIV_ROUND_UP(i, 2))]);
+                   pd->config[MCH_HOST_BRIDGE_PAM0 + DIV_ROUND_UP(i, 2)]);
     }
     memory_region_transaction_commit();
 }
-- 
2.17.2


