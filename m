Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dHXpb-0006wT-Qw
	for mharc-qemu-trivial@gnu.org; Sun, 04 Jun 2017 11:52:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32780)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dHXpY-0006sY-KF
	for qemu-trivial@nongnu.org; Sun, 04 Jun 2017 11:52:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dHXpX-0005At-Lv
	for qemu-trivial@nongnu.org; Sun, 04 Jun 2017 11:52:40 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:58581)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dHXpS-0004yB-5u; Sun, 04 Jun 2017 11:52:34 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 6467E404E4;
	Sun,  4 Jun 2017 18:52:33 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id AFE9D5F1;
	Sun,  4 Jun 2017 18:45:29 +0300 (MSK)
Received: (nullmailer pid 16377 invoked by uid 1000);
	Sun, 04 Jun 2017 15:45:27 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Max Filippov <jcmvbkbc@gmail.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sun,  4 Jun 2017 18:45:15 +0300
Message-Id: <bb0b6f39c032c18e3a72c5ebef4e4968a9dcb4d0.1496591095.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1496591095.git.mjt@msgid.tls.msk.ru>
References: <cover.1496591095.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1496591095.git.mjt@msgid.tls.msk.ru>
References: <cover.1496591095.git.mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 11/22] hw/xtensa: sim: use g_string/g_new
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
X-List-Received-Date: Sun, 04 Jun 2017 15:52:41 -0000

From: Max Filippov <jcmvbkbc@gmail.com>

Replace malloc/free/sprintf with g_string/g_string_printf/g_string_free.
Replace g_malloc with g_new when allocating the MemoryRegion to get more
type safety.

Suggested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/xtensa/sim.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/xtensa/sim.c b/hw/xtensa/sim.c
index d2d1d3a6fd..b27e28d802 100644
--- a/hw/xtensa/sim.c
+++ b/hw/xtensa/sim.c
@@ -41,21 +41,21 @@ static void xtensa_create_memory_regions(const Xtensa=
Memory *memory,
                                          const char *name)
 {
     unsigned i;
-    char *num_name =3D malloc(strlen(name) + sizeof(i) * 3 + 1);
+    GString *num_name =3D g_string_new(NULL);
=20
     for (i =3D 0; i < memory->num; ++i) {
         MemoryRegion *m;
=20
-        sprintf(num_name, "%s%u", name, i);
-        m =3D g_malloc(sizeof(*m));
-        memory_region_init_ram(m, NULL, num_name,
+        g_string_printf(num_name, "%s%u", name, i);
+        m =3D g_new(MemoryRegion, 1);
+        memory_region_init_ram(m, NULL, num_name->str,
                                memory->location[i].size,
                                &error_fatal);
         vmstate_register_ram_global(m);
         memory_region_add_subregion(get_system_memory(),
                                     memory->location[i].addr, m);
     }
-    free(num_name);
+    g_string_free(num_name, true);
 }
=20
 static uint64_t translate_phys_addr(void *opaque, uint64_t addr)
--=20
2.11.0


