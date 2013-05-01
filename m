Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UXPm6-0005mN-U5
	for mharc-qemu-trivial@gnu.org; Wed, 01 May 2013 01:40:19 -0400
Received: from eggs.gnu.org ([208.118.235.92]:57547)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hpoussin@reactos.org>) id 1UXPm4-0005ee-5t
	for qemu-trivial@nongnu.org; Wed, 01 May 2013 01:40:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hpoussin@reactos.org>) id 1UXPm2-0005o2-Co
	for qemu-trivial@nongnu.org; Wed, 01 May 2013 01:40:16 -0400
Received: from smtp1-g21.free.fr ([2a01:e0c:1:1599::10]:48676)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hpoussin@reactos.org>)
	id 1UXPly-0005if-U6; Wed, 01 May 2013 01:40:11 -0400
Received: from localhost.localdomain (unknown [82.227.227.196])
	by smtp1-g21.free.fr (Postfix) with ESMTP id 763C294013F;
	Wed,  1 May 2013 07:40:03 +0200 (CEST)
From: =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>
To: qemu-devel@nongnu.org
Date: Wed,  1 May 2013 07:41:26 +0200
Message-Id: <1367386886-6839-1-git-send-email-hpoussin@reactos.org>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a01:e0c:1:1599::10
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>
Subject: [Qemu-trivial] =?utf-8?q?=5BPATCH_for_1=2E5=5D_pvscsi=3A_fix_comp?=
	=?utf-8?q?ilation_on_32_bit_hosts?=
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 01 May 2013 05:40:17 -0000

This fixes the following error:
In file included from qemu/include/trace.h:4:0,
                 from trace/generated-events.c:3:
./trace/generated-tracers.h: In function =E2=80=98trace_pvscsi_get_sg_lis=
t=E2=80=99:
./trace/generated-tracers.h:4271:9: error: format =E2=80=98%lu=E2=80=99 e=
xpects argument of
type =E2=80=98long unsigned int=E2=80=99, but argument 4 has type =E2=80=98=
size_t=E2=80=99 [-Werror=3Dformat]

Signed-off-by: Herv=C3=A9 Poussineau <hpoussin@reactos.org>

---
 trace-events |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/trace-events b/trace-events
index ffaa3f4..55e80be 100644
--- a/trace-events
+++ b/trace-events
@@ -776,7 +776,7 @@ pvscsi_update_irq_msi(void) "sending MSI notification=
"
 pvscsi_cmp_ring_put(unsigned long addr) "got completion descriptor 0x%lx=
"
 pvscsi_msg_ring_put(unsigned long addr) "got message descriptor 0x%lx"
 pvscsi_complete_request(uint64_t context, uint64_t len, uint8_t sense_ke=
y) "completion: ctx: 0x%"PRIx64", len: 0x%"PRIx64", sense key: %u"
-pvscsi_get_sg_list(int nsg, size_t size) "get SG list: depth: %u, size: =
%lu"
+pvscsi_get_sg_list(int nsg, size_t size) "get SG list: depth: %u, size: =
%zu"
 pvscsi_get_next_sg_elem(uint32_t flags) "unknown flags in SG element (va=
l: 0x%x)"
 pvscsi_command_complete_not_found(uint32_t tag) "can't find request for =
tag 0x%x"
 pvscsi_command_complete_data_run(void) "not all data required for comman=
d transferred"
--=20
1.7.10.4


