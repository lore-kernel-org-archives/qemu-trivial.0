Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iS03O-0008V6-CZ
	for mharc-qemu-trivial@gnu.org; Tue, 05 Nov 2019 09:43:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54736)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1iS03K-0008On-Pt
 for qemu-trivial@nongnu.org; Tue, 05 Nov 2019 09:43:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1iS03J-0002iO-I3
 for qemu-trivial@nongnu.org; Tue, 05 Nov 2019 09:43:26 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:48787)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1iS03B-0002dM-UL; Tue, 05 Nov 2019 09:43:18 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MUD7D-1iJZpb3pFD-00RF8p; Tue, 05 Nov 2019 15:42:57 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Fabien Chouteau <chouteau@adacore.com>, qemu-ppc@nongnu.org,
 Paul Durrant <paul@xen.org>, Michael Tokarev <mjt@tls.msk.ru>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Cleber Rosa <crosa@redhat.com>,
 Claudio Fontana <claudio.fontana@huawei.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PULL 1/4] hw/misc/grlib_ahb_apb_pnp: Avoid crash when writing to PnP
 registers
Date: Tue,  5 Nov 2019 15:42:44 +0100
Message-Id: <20191105144247.10301-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191105144247.10301-1-laurent@vivier.eu>
References: <20191105144247.10301-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Ml/MHDlWxXyppXpZMCGFBDj/O++YcL10kd1yqebCkUb1KJkFOVS
 lxZqglzv7krRW55VEUF8rKzJJeH8WGkLaDCt/e81/sxi5CkxuEtyq7sM5ofLr5H6/zIalIB
 iLnze1k1sKg2MMFCZZwcDgjjMvJ9BCMevYZop6WdlieYNOduUNE2tmhxm3TrqZFsuMHfiKq
 XXMUNfnZM3rRTyEbEjLWA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:wAwd8f1ozMU=:3tGAlFcrRzVUy4stv1h2Kj
 DOfwVb62tvFhpMbcNeMQMmnYRRpXCrgHBKbpocMPQIIJfNhFSFXnqMpE2EytXFj11gHw36Iqs
 4ExOhLmy30jCgD1gvqhHkjsfLAgqFDKuG09mC9eZqdnD7uC6la3DdV4zxOxoXPGale+2VA9wW
 cfFphRt1Y2Nh9sII63JhOb1G/zJrKdbandh6cZYyQhtcDHF6FSJGKYvGnWpQBT5ElDzzfpVRD
 nxS4Y3Nz9QFLPT80E7iq1CjyLfrACRXGNYyl4k9ulT8ZIxYisvOPsi6PWGlqamPxvgAAoPEBR
 5Yi6RUK+zY4IFnoIpgKVktwk4Aa5EdP0Efdf1rbaGN9n7MnQCWVD88sRDqhZ7+lkV2dgZa08E
 SEKOB68JmKVcow9nkvCHUHkwvgeIqoh672T2fank2pNtbIJfa9K73EnsPQXPV15gqLpQC1fzw
 vzTZnQErBvGt7TVq8AFwXpAtdXXrjHh1I3mcBTNk0uk5AyUVPl7+qum29PwyA1CeOQkTRK2t2
 nvmnxG3LC7G1O1bmtATDf/e5KB3qzrYE0RGWBy76AkZ2KIRBmuOIYrtdiO0TSh6nkWGoU9y85
 Fsgt0Kv/ZGyJ3DInGx7rvKMdiQtHEB6rqOEutG0XOjcwdloG/X8tO/rg5u9LIPqBTVfDTOUEv
 1vaoiJnulMeMFsO2v7kUFJuPDfP09PBru2EumJdm29q73lGEvEJUebE0QFKTlM0UXL4wIwyoa
 t71rYj8mpNKbWswgITuI0blS56FVzyCqugZhzS5N+TPYhmHXVtyBREjdGarv89AsNyXqxOI1H
 TQQZlM2ZJejhydPM8QDb7WwvuRN28ANscaXT7gSUYbGrgAClqjAeFPpdxrtGS1p52PHhmEBlO
 nU38rCnhbWAcbf3/vYaPi3rtE1FX7wE27Bd64jaq4=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 212.227.126.131
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Nov 2019 14:43:29 -0000

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Guests can crash QEMU when writting to PnP registers:

  $ echo 'writeb 0x800ff042 69' | qemu-system-sparc -M leon3_generic -S -bios /etc/magic -qtest stdio
  [I 1571938309.932255] OPENED
  [R +0.063474] writeb 0x800ff042 69
  Segmentation fault (core dumped)

  (gdb) bt
  #0  0x0000000000000000 in  ()
  #1  0x0000555f4bcdf0bc in memory_region_write_with_attrs_accessor (mr=0x555f4d7be8c0, addr=66, value=0x7fff07d00f08, size=1, shift=0, mask=255, attrs=...) at memory.c:503
  #2  0x0000555f4bcdf185 in access_with_adjusted_size (addr=66, value=0x7fff07d00f08, size=1, access_size_min=1, access_size_max=4, access_fn=0x555f4bcdeff4 <memory_region_write_with_attrs_accessor>, mr=0x555f4d7be8c0, attrs=...) at memory.c:539
  #3  0x0000555f4bce2243 in memory_region_dispatch_write (mr=0x555f4d7be8c0, addr=66, data=69, op=MO_8, attrs=...) at memory.c:1489
  #4  0x0000555f4bc80b20 in flatview_write_continue (fv=0x555f4d92c400, addr=2148528194, attrs=..., buf=0x7fff07d01120 "E", len=1, addr1=66, l=1, mr=0x555f4d7be8c0) at exec.c:3161
  #5  0x0000555f4bc80c65 in flatview_write (fv=0x555f4d92c400, addr=2148528194, attrs=..., buf=0x7fff07d01120 "E", len=1) at exec.c:3201
  #6  0x0000555f4bc80fb0 in address_space_write (as=0x555f4d7aa460, addr=2148528194, attrs=..., buf=0x7fff07d01120 "E", len=1) at exec.c:3291
  #7  0x0000555f4bc8101d in address_space_rw (as=0x555f4d7aa460, addr=2148528194, attrs=..., buf=0x7fff07d01120 "E", len=1, is_write=true) at exec.c:3301
  #8  0x0000555f4bcdb388 in qtest_process_command (chr=0x555f4c2ed7e0 <qtest_chr>, words=0x555f4db0c5d0) at qtest.c:432

Instead of crashing, log the access as unimplemented.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: KONRAD Frederic <frederic.konrad@adacore.com>
Message-Id: <20191025110114.27091-2-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/misc/grlib_ahb_apb_pnp.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/misc/grlib_ahb_apb_pnp.c b/hw/misc/grlib_ahb_apb_pnp.c
index 7338461694c9..f3c015d2c35f 100644
--- a/hw/misc/grlib_ahb_apb_pnp.c
+++ b/hw/misc/grlib_ahb_apb_pnp.c
@@ -22,6 +22,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "hw/sysbus.h"
 #include "hw/misc/grlib_ahb_apb_pnp.h"
 
@@ -231,8 +232,15 @@ static uint64_t grlib_apb_pnp_read(void *opaque, hwaddr offset, unsigned size)
     return apb_pnp->regs[offset >> 2];
 }
 
+static void grlib_apb_pnp_write(void *opaque, hwaddr addr,
+                                uint64_t val, unsigned size)
+{
+    qemu_log_mask(LOG_UNIMP, "%s not implemented\n", __func__);
+}
+
 static const MemoryRegionOps grlib_apb_pnp_ops = {
     .read       = grlib_apb_pnp_read,
+    .write      = grlib_apb_pnp_write,
     .endianness = DEVICE_BIG_ENDIAN,
 };
 
-- 
2.21.0


