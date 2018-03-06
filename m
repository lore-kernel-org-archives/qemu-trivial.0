Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1etCtC-00038C-Lf
	for mharc-qemu-trivial@gnu.org; Tue, 06 Mar 2018 08:44:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53608)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1etCtA-00035g-94
	for qemu-trivial@nongnu.org; Tue, 06 Mar 2018 08:44:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1etCt9-0007gf-AM
	for qemu-trivial@nongnu.org; Tue, 06 Mar 2018 08:44:20 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:49530 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1etCt4-0007a3-Ls; Tue, 06 Mar 2018 08:44:14 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 14EED84222;
	Tue,  6 Mar 2018 13:44:11 +0000 (UTC)
Received: from t460.redhat.com (unknown [10.33.36.54])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 165141C710;
	Tue,  6 Mar 2018 13:44:05 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Date: Tue,  6 Mar 2018 13:44:02 +0000
Message-Id: <20180306134402.997-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Tue, 06 Mar 2018 13:44:11 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Tue, 06 Mar 2018 13:44:11 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'berrange@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-trivial] [PATCH] misc,
 ide: remove use of HWADDR_PRIx in trace events
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
X-List-Received-Date: Tue, 06 Mar 2018 13:44:21 -0000

The trace events all use a uint64_t data type, so should be using the
corresponding PRIx64 format, not HWADDR_PRIx which is intended for use
with the 'hwaddr' type.

Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
---
 hw/ide/trace-events  | 4 ++--
 hw/misc/trace-events | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/ide/trace-events b/hw/ide/trace-events
index 0c39cabe72..5c0e59ec42 100644
--- a/hw/ide/trace-events
+++ b/hw/ide/trace-events
@@ -108,8 +108,8 @@ ahci_dma_prepare_buf_fail(void *s, int port) "ahci(%p=
)[%d]: sglist population fa
 ahci_dma_rw_buf(void *s, int port, int l) "ahci(%p)[%d] len=3D0x%x"
 ahci_cmd_done(void *s, int port) "ahci(%p)[%d]: cmd done"
 ahci_reset(void *s) "ahci(%p): HBA reset"
-allwinner_ahci_mem_read(void *s, void *a, uint64_t addr, uint64_t val, u=
nsigned size) "ahci(%p): read a=3D%p addr=3D0x%"HWADDR_PRIx" val=3D0x%"PR=
Ix64", size=3D%d"
-allwinner_ahci_mem_write(void *s, void *a, uint64_t addr, uint64_t val, =
unsigned size) "ahci(%p): write a=3D%p addr=3D0x%"HWADDR_PRIx" val=3D0x%"=
PRIx64", size=3D%d"
+allwinner_ahci_mem_read(void *s, void *a, uint64_t addr, uint64_t val, u=
nsigned size) "ahci(%p): read a=3D%p addr=3D0x%"PRIx64" val=3D0x%"PRIx64"=
, size=3D%d"
+allwinner_ahci_mem_write(void *s, void *a, uint64_t addr, uint64_t val, =
unsigned size) "ahci(%p): write a=3D%p addr=3D0x%"PRIx64" val=3D0x%"PRIx6=
4", size=3D%d"
=20
 # Warning: Verbose
 handle_reg_h2d_fis_dump(void *s, int port, const char *fis) "ahci(%p)[%d=
]: %s"
diff --git a/hw/misc/trace-events b/hw/misc/trace-events
index 562d9ed005..ec5a9f0da1 100644
--- a/hw/misc/trace-events
+++ b/hw/misc/trace-events
@@ -69,13 +69,13 @@ mps2_fpgaio_reset(void) "MPS2 FPGAIO: reset"
 mps2_fpgaio_leds(char led1, char led0) "MPS2 FPGAIO LEDs: %c%c"
=20
 # hw/misc/msf2-sysreg.c
-msf2_sysreg_write(uint64_t offset, uint32_t val, uint32_t prev) "msf2-sy=
sreg write: addr 0x%08" HWADDR_PRIx " data 0x%" PRIx32 " prev 0x%" PRIx32
-msf2_sysreg_read(uint64_t offset, uint32_t val) "msf2-sysreg read: addr =
0x%08" HWADDR_PRIx " data 0x%08" PRIx32
+msf2_sysreg_write(uint64_t offset, uint32_t val, uint32_t prev) "msf2-sy=
sreg write: addr 0x%08" PRIx64 " data 0x%" PRIx32 " prev 0x%" PRIx32
+msf2_sysreg_read(uint64_t offset, uint32_t val) "msf2-sysreg read: addr =
0x%08" PRIx64 " data 0x%08" PRIx32
 msf2_sysreg_write_pll_status(void) "Invalid write to read only PLL statu=
s register"
=20
 #hw/misc/imx7_gpr.c
-imx7_gpr_read(uint64_t offset) "addr 0x%08" HWADDR_PRIx
-imx7_gpr_write(uint64_t offset, uint64_t value) "addr 0x%08" HWADDR_PRIx=
 "value 0x%08" HWADDR_PRIx
+imx7_gpr_read(uint64_t offset) "addr 0x%08" PRIx64
+imx7_gpr_write(uint64_t offset, uint64_t value) "addr 0x%08" PRIx64 "val=
ue 0x%08" PRIx64
=20
 # hw/misc/mos6522.c
 mos6522_set_counter(int index, unsigned int val) "T%d.counter=3D%d"
--=20
2.14.3


