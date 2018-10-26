Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gG4Jg-0005EK-4P
	for mharc-qemu-trivial@gnu.org; Fri, 26 Oct 2018 11:46:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50000)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gG4JR-00041v-81
	for qemu-trivial@nongnu.org; Fri, 26 Oct 2018 11:46:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gG46j-0005H1-Hf
	for qemu-trivial@nongnu.org; Fri, 26 Oct 2018 11:33:07 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:35693)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gG46b-0004vo-0C; Fri, 26 Oct 2018 11:32:57 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1N3Xvv-1fXPaK0qXL-010fOy; Fri, 26 Oct 2018 17:32:11 +0200
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1N3Xvv-1fXPaK0qXL-010fOy; Fri, 26 Oct 2018 17:32:11 +0200
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
Date: Fri, 26 Oct 2018 17:31:20 +0200
Message-Id: <20181026153125.24738-16-laurent@vivier.eu>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181026153125.24738-1-laurent@vivier.eu>
References: <20181026153125.24738-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ujcQMLVnNdlA+bT6z6rODRtkZg/zsDEqRdCnz0gVnaZ9/UQrReP
	yYwtX/6ZZtTkN6YZvVq54IrtX1iqx1Xkwd5t2OJ98jNQ1a4UmWDICn6a7FyQKjgJF7W+Ctn
	QhTDR0tSekyjaYRLrbiYdL3X6UDp5aoM44K76g4syHvKF2eQxJRCBHixUz5iJDvpc3V9THi
	BBKc9sIV3voKPz5VYe5HA==
X-UI-Out-Filterresults: notjunk:1;V01:K0:mDkSnPqe98M=:915bT4UpaXUVeT5R6liQYf
	w/dv7Ug2RSxa3KsGn+7+8g4f1ywSgyhZLKn7vYN0GfwmGhQArERISpZTBitmSAY/82mJJmPsB
	NvNdFf4tNjCK5ssXJsNtv4ZxU3h6e8CLvgCrGYxPKh7ON6DvOHEghV97LQUtR2E6sJxPGbrEZ
	ZRlftgPq3oJ8N7oFLRto2bVzIkVNDQOsWcxilAaFgKkd69mz/O60aiqy5qkym+i4hnDr7uMY/
	9Bty4ZbNp8mf1y3rtQc1uP1s7RWAf8BuDXeXiuSduAVbuwXcyUw5eMnWDkeJcgB2HdrMFYsxI
	vOPGdwsLZJqj+TLxiozh3y9lfi1YknPb7Nng/4fj0Z9nHsSJCGrJzacfFvYHyp/5YRuusD7Sk
	QDnBpWVYTJMnyyAVrNS9S+l2kR3n51RrIXDY6HjJ9GwcySHizBRyu8W3Ztj5QreLn/pYPvpS2
	JuOJj0emB9SmQ6hwpmHc7LUwYSCzX1fQK4stbEF0T0+/Aeyk/SL95f+fuoJhrN9vZVtTTCqjH
	7FHhGf525pC5VBpO0KCdiFwCDn5lEz3jfF5FGRgSVj2nqarRkJHS0cVsD1dUb9NCdAu4yCzSH
	CTOXdBv7ZjNZnlzw1rTTha8FTBVxwBEsgRVwSFOGR97Ilorc3IWMoWTq/HkwO/V8CFb9ERV1K
	RtoS1dDCoMkV+DEU4xVCJs5o1o9hNYzAlmnp1F9m1kIUuvD+OX+edWjILFNP//jnYmbq/OIji
	qt4DZM7g+prHqIIV
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.134
Subject: [Qemu-trivial] [PULL 15/20] xen: Use the PCI_DEVICE macro
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
X-List-Received-Date: Fri, 26 Oct 2018 15:46:20 -0000

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

TYPE_XEN_PT_DEVICE is a subclass of TYPE_PCI_DEVICE, the clean way
to access the PCIDevice pointer is using the PCI_DEVICE() macro.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Acked-by: Anthony PERARD <anthony.perard@citrix.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20180705155811.20366-4-f4bug@amsat.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/xen/xen_pt_config_init.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/xen/xen_pt_config_init.c b/hw/xen/xen_pt_config_init.c
index aee31c62bb..47f9010c75 100644
--- a/hw/xen/xen_pt_config_init.c
+++ b/hw/xen/xen_pt_config_init.c
@@ -358,7 +358,7 @@ static uint64_t xen_pt_get_bar_size(PCIIORegion *r)
 static XenPTBarFlag xen_pt_bar_reg_parse(XenPCIPassthroughState *s,
                                          int index)
 {
-    PCIDevice *d = &s->dev;
+    PCIDevice *d = PCI_DEVICE(s);
     XenPTRegion *region = NULL;
     PCIIORegion *r;
 
@@ -469,7 +469,7 @@ static int xen_pt_bar_reg_write(XenPCIPassthroughState *s, XenPTReg *cfg_entry,
 {
     XenPTRegInfo *reg = cfg_entry->reg;
     XenPTRegion *base = NULL;
-    PCIDevice *d = &s->dev;
+    PCIDevice *d = PCI_DEVICE(s);
     const PCIIORegion *r;
     uint32_t writable_mask = 0;
     uint32_t bar_emu_mask = 0;
@@ -543,7 +543,7 @@ static int xen_pt_exp_rom_bar_reg_write(XenPCIPassthroughState *s,
 {
     XenPTRegInfo *reg = cfg_entry->reg;
     XenPTRegion *base = NULL;
-    PCIDevice *d = (PCIDevice *)&s->dev;
+    PCIDevice *d = PCI_DEVICE(s);
     uint32_t writable_mask = 0;
     uint32_t throughable_mask = get_throughable_mask(s, reg, valid_mask);
     pcibus_t r_size = 0;
@@ -1587,7 +1587,7 @@ static int xen_pt_pcie_size_init(XenPCIPassthroughState *s,
                                  const XenPTRegGroupInfo *grp_reg,
                                  uint32_t base_offset, uint8_t *size)
 {
-    PCIDevice *d = &s->dev;
+    PCIDevice *d = PCI_DEVICE(s);
     uint8_t version = get_capability_version(s, base_offset);
     uint8_t type = get_device_type(s, base_offset);
     uint8_t pcie_size = 0;
-- 
2.17.2


