Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gHS9V-0002SL-0V
	for mharc-qemu-trivial@gnu.org; Tue, 30 Oct 2018 07:25:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58724)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gHS9J-0002K3-HR
	for qemu-trivial@nongnu.org; Tue, 30 Oct 2018 07:25:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gHS9D-0003lo-RA
	for qemu-trivial@nongnu.org; Tue, 30 Oct 2018 07:25:26 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:41459)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gHS8n-0002qI-UW; Tue, 30 Oct 2018 07:24:58 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MBDSg-1gPeXG0HrK-00CkD6; Tue, 30 Oct 2018 12:23:52 +0100
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MBDSg-1gPeXG0HrK-00CkD6; Tue, 30 Oct 2018 12:23:52 +0100
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
	Michael Walle <michael@walle.cc>, Markus Armbruster <armbru@redhat.com>,
	Li Qiang <liq3ea@gmail.com>
Date: Tue, 30 Oct 2018 12:23:20 +0100
Message-Id: <20181030112337.17973-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181030112337.17973-1-laurent@vivier.eu>
References: <20181030112337.17973-1-laurent@vivier.eu>
X-Provags-ID: V03:K1:HBV5Oe768CROwcgkYs8F4WrMsfUq3swxoVTPbJS52XmjQTYOUg/
	eTVVWAqDKvgkEQGNiKHNMy8IZGaiGbbGEW+0aPPL3oE7Q1mIQkZ5spo05gsoG+ZxoBIA/Ha
	dNTxSlsX5Vu5s+VQgd6OakOVBljzGmBrmqLUoNhfBe8//o7jBUiRyZKy+Kxmq2/3lZo4gNY
	Kbjme8dMgUacGwLo3Xx8Q==
X-UI-Out-Filterresults: notjunk:1;V01:K0:ry5LPF+NyDE=:jfS2YQ0jlbPQX+wXY2FMQY
	BCVa8D8yCRnw6VJEVi9GVOjozKSiNHGxI5rXGx4E4DNvi+JlE1MglK61DiiXd+F18dfEu7SWr
	GFerDkJQIX2Ze18RlEPvkVXg/DZxKWATttezhY+GPSru/6RwKZdPchyOfjzdunFCZveG2QPZ0
	0alLvrI1NOxRvOJ7Jdruz5Ucecw1B1cqwgi9CItUb91lzBW9D6EL4yL67ifhvxnA2S4qn0w2m
	B4/XXBiiEXO3fxhyX78lys9msP0MWya4Jp4m157ui9cR/RUxsLJci2oSSjI2JtWBdvE9QBN2w
	726uALHqVdPNEfIn0EILFvCxQb5gFqX6lDH8C8JAuGHL6Ce0cM0Dd4EiNXY8h160f7z0zN5bV
	4VlXZ8Y0O3rAAjmOMZ5asHsXbyIps4Vs5e2XMJaj85KLgJD4ipql0eXZ54GdQShUk9z1cux7R
	9AStll3MrryeiuEo3qxhCLPMnzX1kX/LtIJXv4Q3JCUD9i0T9iyHUv3fJrDGQyhCq4LxNbVHe
	5Qz2ejkmBYirV6zLX9wpKzYRxixoEHpoKCceSowx0njorrXoePO1JBm87NyPPiN5tMHxlHWc4
	R7SkgV7X/0NeyLFBn+lC9AsqRdPFXsRDQ9y34333VgE+wqFrpnVYqSlTvqJky46AMsIvwrxIr
	Ykwb15N62IwcnaY07OsCUZ9a6yqkCkoeENVK891eiggUy63ubH6YxEdV24UyoxTNwB6A=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.130
Subject: [Qemu-trivial] [PULL v2 03/20] memory.h: fix typos in comments
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
X-List-Received-Date: Tue, 30 Oct 2018 11:25:36 -0000

From: Li Qiang <liq3ea@gmail.com>

Signed-off-by: Li Qiang <liq3ea@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <1539080467-2976-1-git-send-email-liq3ea@gmail.com>
[lv: s/types/typos/]
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 include/exec/memory.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 667466b8f3..d0c7f0d9e9 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -935,7 +935,7 @@ uint64_t memory_region_size(MemoryRegion *mr);
 /**
  * memory_region_is_ram: check whether a memory region is random access
  *
- * Returns %true is a memory region is random access.
+ * Returns %true if a memory region is random access.
  *
  * @mr: the memory region being queried
  */
@@ -947,7 +947,7 @@ static inline bool memory_region_is_ram(MemoryRegion *mr)
 /**
  * memory_region_is_ram_device: check whether a memory region is a ram device
  *
- * Returns %true is a memory region is a device backed ram region
+ * Returns %true if a memory region is a device backed ram region
  *
  * @mr: the memory region being queried
  */
@@ -1161,7 +1161,7 @@ uint8_t memory_region_get_dirty_log_mask(MemoryRegion *mr);
 /**
  * memory_region_is_rom: check whether a memory region is ROM
  *
- * Returns %true is a memory region is read-only memory.
+ * Returns %true if a memory region is read-only memory.
  *
  * @mr: the memory region being queried
  */
-- 
2.17.2


