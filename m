Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gG4Jo-0005QC-7A
	for mharc-qemu-trivial@gnu.org; Fri, 26 Oct 2018 11:46:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50571)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gG4Jj-0004py-3k
	for qemu-trivial@nongnu.org; Fri, 26 Oct 2018 11:46:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gG46a-00053W-MX
	for qemu-trivial@nongnu.org; Fri, 26 Oct 2018 11:33:00 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:58815)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gG46a-0004fJ-96; Fri, 26 Oct 2018 11:32:56 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MTOZQ-1gAc183Rs4-00ToMR; Fri, 26 Oct 2018 17:31:47 +0200
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MTOZQ-1gAc183Rs4-00ToMR; Fri, 26 Oct 2018 17:31:47 +0200
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
	Eduardo Habkost <ehabkost@redhat.com>, Li Qiang <liq3ea@gmail.com>
Date: Fri, 26 Oct 2018 17:31:08 +0200
Message-Id: <20181026153125.24738-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181026153125.24738-1-laurent@vivier.eu>
References: <20181026153125.24738-1-laurent@vivier.eu>
X-Provags-ID: V03:K1:kZEj9JglbRW2FesANw2/HZOsdrHk8/OHFw64y91KTz11EYf+3oK
	7ZzeSp8mMDCAQ6bF3DuoD3LlgGfGQCH0lj4lQUWko1GcelP2Dn1zQiqhyL0IoQb6oYg5LJU
	Psxa4KPYBA2DrW6aDL91hamu7kHwdOcATSbSjLa1Yd0pW8bjLxc1PlW0P1MKykgm46Zoexm
	X3SdiZg0xVzI3npVN/nEw==
X-UI-Out-Filterresults: notjunk:1;V01:K0:bdivrMHNBek=:2ZJEsyHlCb3wurBMkhn7N/
	4nCEuOhazb+/j0d6nHmbFA2m3oFMAdSFrBE+GkHMhwG2IQestGZJV5YWA8fxOHLZCwFIM/knW
	x3zMmB3mn/SpN+qTUo4C2rodcwYTUwb1lkSqWZmW5Kc8JJK+hnBwXkWreIcrY55T20rgjGkck
	uAi0zE3iaglbYC4HdLiC1LXnoBwphBEkzD3ScjrBEFBlpszewEwSCwn1HBVKUpGeMUwAgJyji
	iPWnIxXc2XW2gLv8E2r7yKsUGLFrfJL1+KF+x4n0YDkT3G7/RCVo8nrYubQvA+zBURLPILNSa
	ojophlfSRbU1shzrqBosYIn2w9AwWm8+rc9dvMOcWSu52aY+L+ywC0M5yfA98deZnlLV5/tue
	TVbSpXbL7+7FChM+2+PX7xfif0RzmIcgw6HElc2fKTVAE/AR6od/+wfHNLu0o8A512RjFw3uH
	VGAVeOrE50jzdxvO3OG5EvcOQNJ90xRhxns2KX6pz38TRc8gf251X7qnI2X95ad61B6TA9WAb
	kZ+OWBxb6b1yvTdn/8WQaQ/Uq3N8fUxh9ZWAnbkEHV2IzK7xITH4JpbgMc/wFRIDKlQbjD6Px
	m6Wo0HeMfAi8TpdHfOr22t/r7AV1x0bJeGxavhfLHdPo9Qxjw4e0CMaD5M50geOF6s8o+KIuq
	wLqCMS6gdbWLQJQ3F/M+lTnMZnPVgmPud7xXenNkr46++Wl/3i9fRe6Xo4yiX0yFqWzo=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.187
Subject: [Qemu-trivial] [PULL 03/20] memory.h: fix typos in comments
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


