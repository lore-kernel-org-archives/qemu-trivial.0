Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hGNTC-0000ED-95
	for mharc-qemu-trivial@gnu.org; Tue, 16 Apr 2019 08:45:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59598)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pixo@polepetko.eu>) id 1hGNTA-0000CT-2X
	for qemu-trivial@nongnu.org; Tue, 16 Apr 2019 08:45:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pixo@polepetko.eu>) id 1hGNT9-0001N9-85
	for qemu-trivial@nongnu.org; Tue, 16 Apr 2019 08:45:48 -0400
Received: from [77.247.229.177] (port=48276 helo=neth.polepetko.eu)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pixo@polepetko.eu>)
	id 1hGNT6-0001DC-8e; Tue, 16 Apr 2019 08:45:44 -0400
Received: from localhost.localdomain (unknown [77.247.229.177])
	(Authenticated sender: pixo@polepetko.eu)
	by neth.polepetko.eu (Postfix) with ESMTPSA id 06CCA2A6F04;
	Tue, 16 Apr 2019 14:39:34 +0200 (CEST)
From: Stanislav Lanci <pixo@polepetko.eu>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Stanislav Lanci <pixo@polepetko.eu>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Eduardo Habkost <ehabkost@redhat.com>
Date: Tue, 16 Apr 2019 14:38:33 +0200
Message-Id: <20190416123833.60649-1-pixo@polepetko.eu>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 77.247.229.177
Subject: [Qemu-trivial] [PATCH] Pass through cache information for TOPOEXT
 CPUs
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
X-List-Received-Date: Tue, 16 Apr 2019 12:45:49 -0000

Signed-off-by: Stanislav Lanci <pixo@polepetko.eu>
---
 target/i386/cpu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index d6bb57d210..bc0559fc51 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -4546,6 +4546,11 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t inde=
x, uint32_t count,
         break;
     case 0x8000001D:
         *eax =3D 0;
+        /* pass through cache information */
+        if (cpu->cache_info_passthrough) {
+            host_cpuid(index, count, eax, ebx, ecx, edx);
+            break;
+        }
         switch (count) {
         case 0: /* L1 dcache info */
             encode_cache_cpuid8000001d(env->cache_info_amd.l1d_cache, cs=
,
--=20
2.21.0


