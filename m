Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iNxLg-0002AP-LA
	for mharc-qemu-trivial@gnu.org; Fri, 25 Oct 2019 07:01:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40348)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iNxLd-00026B-Lc
 for qemu-trivial@nongnu.org; Fri, 25 Oct 2019 07:01:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iNxLb-0001Jg-QM
 for qemu-trivial@nongnu.org; Fri, 25 Oct 2019 07:01:37 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:23339
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iNxLb-0001JA-Hh
 for qemu-trivial@nongnu.org; Fri, 25 Oct 2019 07:01:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572001294;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3P1I3Nco4z27R0NZyTpP2qFN34PGE+3Hhbm/jLCWWOI=;
 b=ZC8s4c/uVbh+sTwwAg7003sB7DBoLDl696q1RyvNCkw9KVEZ1fEmC2lJxEzebJQd7h2/89
 rMmjdQg66i3ZC9CZF3moWHBbwV/ZpjTrIvp5pgekDV43p4LsBtK3qtbzs3rV4Xd4BF+UhE
 ikUFYDqwCmB18Hf+ctuF3eeVmWYmoSI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-32-DEPRfcQJOAGMc5rJoI8Q7Q-1; Fri, 25 Oct 2019 07:01:24 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BDDB6800D41;
 Fri, 25 Oct 2019 11:01:23 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.177])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 91ED35D9CA;
 Fri, 25 Oct 2019 11:01:21 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Fabien Chouteau <chouteau@adacore.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, qemu-devel@nongnu.org,
 KONRAD Frederic <frederic.konrad@adacore.com>
Cc: qemu-trivial@nongnu.org, Jiri Gaisler <jiri@gaisler.se>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH 1/2] hw/misc/grlib_ahb_apb_pnp: Avoid crash when writing to
 PnP registers
Date: Fri, 25 Oct 2019 13:01:13 +0200
Message-Id: <20191025110114.27091-2-philmd@redhat.com>
In-Reply-To: <20191025110114.27091-1-philmd@redhat.com>
References: <20191025110114.27091-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: DEPRfcQJOAGMc5rJoI8Q7Q-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
X-List-Received-Date: Fri, 25 Oct 2019 11:01:39 -0000

Guests can crash QEMU when writting to PnP registers:

  $ echo 'writeb 0x800ff042 69' | qemu-system-sparc -M leon3_generic -S -bi=
os /etc/magic -qtest stdio
  [I 1571938309.932255] OPENED
  [R +0.063474] writeb 0x800ff042 69
  Segmentation fault (core dumped)

  (gdb) bt
  #0  0x0000000000000000 in  ()
  #1  0x0000555f4bcdf0bc in memory_region_write_with_attrs_accessor (mr=3D0=
x555f4d7be8c0, addr=3D66, value=3D0x7fff07d00f08, size=3D1, shift=3D0, mask=
=3D255, attrs=3D...) at memory.c:503
  #2  0x0000555f4bcdf185 in access_with_adjusted_size (addr=3D66, value=3D0=
x7fff07d00f08, size=3D1, access_size_min=3D1, access_size_max=3D4, access_f=
n=3D0x555f4bcdeff4 <memory_region_write_with_attrs_accessor>, mr=3D0x555f4d=
7be8c0, attrs=3D...) at memory.c:539
  #3  0x0000555f4bce2243 in memory_region_dispatch_write (mr=3D0x555f4d7be8=
c0, addr=3D66, data=3D69, op=3DMO_8, attrs=3D...) at memory.c:1489
  #4  0x0000555f4bc80b20 in flatview_write_continue (fv=3D0x555f4d92c400, a=
ddr=3D2148528194, attrs=3D..., buf=3D0x7fff07d01120 "E", len=3D1, addr1=3D6=
6, l=3D1, mr=3D0x555f4d7be8c0) at exec.c:3161
  #5  0x0000555f4bc80c65 in flatview_write (fv=3D0x555f4d92c400, addr=3D214=
8528194, attrs=3D..., buf=3D0x7fff07d01120 "E", len=3D1) at exec.c:3201
  #6  0x0000555f4bc80fb0 in address_space_write (as=3D0x555f4d7aa460, addr=
=3D2148528194, attrs=3D..., buf=3D0x7fff07d01120 "E", len=3D1) at exec.c:32=
91
  #7  0x0000555f4bc8101d in address_space_rw (as=3D0x555f4d7aa460, addr=3D2=
148528194, attrs=3D..., buf=3D0x7fff07d01120 "E", len=3D1, is_write=3Dtrue)=
 at exec.c:3301
  #8  0x0000555f4bcdb388 in qtest_process_command (chr=3D0x555f4c2ed7e0 <qt=
est_chr>, words=3D0x555f4db0c5d0) at qtest.c:432

Instead of crashing, log the access as unimplemented.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/misc/grlib_ahb_apb_pnp.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/misc/grlib_ahb_apb_pnp.c b/hw/misc/grlib_ahb_apb_pnp.c
index 7338461694..f3c015d2c3 100644
--- a/hw/misc/grlib_ahb_apb_pnp.c
+++ b/hw/misc/grlib_ahb_apb_pnp.c
@@ -22,6 +22,7 @@
  */
=20
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "hw/sysbus.h"
 #include "hw/misc/grlib_ahb_apb_pnp.h"
=20
@@ -231,8 +232,15 @@ static uint64_t grlib_apb_pnp_read(void *opaque, hwadd=
r offset, unsigned size)
     return apb_pnp->regs[offset >> 2];
 }
=20
+static void grlib_apb_pnp_write(void *opaque, hwaddr addr,
+                                uint64_t val, unsigned size)
+{
+    qemu_log_mask(LOG_UNIMP, "%s not implemented\n", __func__);
+}
+
 static const MemoryRegionOps grlib_apb_pnp_ops =3D {
     .read       =3D grlib_apb_pnp_read,
+    .write      =3D grlib_apb_pnp_write,
     .endianness =3D DEVICE_BIG_ENDIAN,
 };
=20
--=20
2.21.0


