Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gG4Jp-0005RV-0w
	for mharc-qemu-trivial@gnu.org; Fri, 26 Oct 2018 11:46:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50642)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gG4Jl-0004sw-IU
	for qemu-trivial@nongnu.org; Fri, 26 Oct 2018 11:46:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gG46b-000569-RS
	for qemu-trivial@nongnu.org; Fri, 26 Oct 2018 11:32:59 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:42695)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gG46b-0004x2-7R; Fri, 26 Oct 2018 11:32:57 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MyvFC-1fKVQL0l0M-00vyS1; Fri, 26 Oct 2018 17:32:15 +0200
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MyvFC-1fKVQL0l0M-00vyS1; Fri, 26 Oct 2018 17:32:15 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
	Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org,
	Michael Walle <michael@walle.cc>, Laurent Vivier <lvivier@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, Cleber Rosa <crosa@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>, xen-devel@lists.xenproject.org,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
	Fam Zheng <famz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Aurelien Jarno <aurelien@aurel32.net>, Kevin Wolf <kwolf@redhat.com>,
	qemu-block@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
	qemu-trivial@nongnu.org, Riku Voipio <riku.voipio@iki.fi>,
	Eduardo Habkost <ehabkost@redhat.com>
Date: Fri, 26 Oct 2018 17:31:22 +0200
Message-Id: <20181026153125.24738-18-laurent@vivier.eu>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181026153125.24738-1-laurent@vivier.eu>
References: <20181026153125.24738-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:+i9Bmgk1IwQUv0MsCRCyQhrt4v9377EbiyAgWwyN+GK3Ka67Uwc
	YTeH4mU8BLVpCOUY9aKO+ZRqTWJUjPIj6fxmgPwvxkX85DJcw4aKfnE9bphEJlQss8M1MDi
	9DS8GuY7l8dCB8ktIvBkdMv/8dXcs2DLiDuhmRZL/Yf7FnFuD3PvOPam/Kj+VW8ixwy4AG+
	eBFkvKCStAnisgNt+o9bg==
X-UI-Out-Filterresults: notjunk:1;V01:K0:XmlXAmcRL4g=:KUSW9NWdAz/RjQzT10cBel
	oyM7NeKHFGR0Hi8+Lh6N2OI/21Q8LBP/9H6a+DZzk5PKt/9jf0l4iOajmxAnF3PgWz/xZodrL
	TA4BADz7pegVmfru0fTQ5aOZ2w5UXGvTPFI9tm5qNChVJ52VkOyVY0aDTQPu5RhRps9L2cBnF
	T1RToV3bACvarYCbYbAyR6ZC8GXB6iE4gSwokEnXm3zpWnJDOdugPwdkNkvPVul1g+KsLbgkC
	PsTxZaWA7zLknlcNLDBPg6kmhe774/k+L3EJMsTliBkzs7+JOWr4Qpxk24qTdUu8wqGrGAh07
	deWqSBxD3MAObcNWA9/n7E/0BI14dL8A3cyqCr6dWPP8xvTbLrFyCnWJaRAu8EsCaPFS2e5AJ
	kfGAZ1H2jsTBo2KuBp+41J+hdV/UNSBNLvT6vNHQlsBDbmjGEFImCzKLNNHWTsULk4SAhluFl
	fNjU9uN1syOseVb/R7oFsSmNma2u0B7lscb6SVFiQBAyKcyQXr0FjDNax8KT1p4xiUc1OO19f
	/n3j4QnwEncpmBVSGZhQ0t1LJQJlpD10Fyhrnh/SUA3Uyi8gkzJvtRuOccVGNjs+NI8cAylTJ
	Pru3W1G65yvNJHTtLvhZgRWj3kCBGuRvRTSyiXOX920vu/DBptYNxNX9FGgU4pqB7oCqsrJKr
	2WpciZlD5A+IyHYBns7hGfKI0RdAMhIYYgFDVHB9PhCImXzYvZGwaCPIgneLDi1PmgPix0g36
	pMJJEoDceB9fLR5n
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.131
Subject: [Qemu-trivial] [PULL 17/20] hw/pci-host: Remove useless parenthesis
 around DIV_ROUND_UP macro
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
X-List-Received-Date: Fri, 26 Oct 2018 15:46:34 -0000

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


