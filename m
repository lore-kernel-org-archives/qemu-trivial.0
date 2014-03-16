Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WPBRz-0007xS-7M
	for mharc-qemu-trivial@gnu.org; Sun, 16 Mar 2014 09:50:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60747)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1WPBRx-0007qn-2J
	for qemu-trivial@nongnu.org; Sun, 16 Mar 2014 09:50:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1WPBRv-0006bm-Sh
	for qemu-trivial@nongnu.org; Sun, 16 Mar 2014 09:50:00 -0400
Received: from qemu.weilnetz.de ([2a03:4000:2:362::1]:51710
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1WPBRt-0006b8-I9; Sun, 16 Mar 2014 09:49:57 -0400
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id E1D071800C1; Sun, 16 Mar 2014 14:49:54 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org
Date: Sun, 16 Mar 2014 14:49:54 +0100
Message-Id: <1394977794-18939-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:2:362::1
Cc: Stefan Weil <sw@weilnetz.de>, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
	Alexander Graf <agraf@suse.de>
Subject: [Qemu-trivial] [PATCH] target-ppc: Add missing 'static' and 'const'
	attributes
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
X-List-Received-Date: Sun, 16 Mar 2014 13:50:02 -0000

This fixes warnings from the static code analysis (smatch).

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 target-ppc/arch_dump.c  |    6 +++---
 target-ppc/int_helper.c |    2 +-
 target-ppc/machine.c    |    4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/target-ppc/arch_dump.c b/target-ppc/arch_dump.c
index 17fd4c6..9dccf1a 100644
--- a/target-ppc/arch_dump.c
+++ b/target-ppc/arch_dump.c
@@ -164,7 +164,7 @@ static void ppc64_write_elf64_speregset(Note *note, PowerPCCPU *cpu)
     speregset->spe_fscr = cpu_to_be32(cpu->env.spe_fscr);
 }
 
-struct NoteFuncDescStruct {
+static const struct NoteFuncDescStruct {
     int contents_size;
     void (*note_contents_func)(Note *note, PowerPCCPU *cpu);
 } note_func[] = {
@@ -196,7 +196,7 @@ ssize_t cpu_get_note_size(int class, int machine, int nr_cpus)
     int name_size = 8; /* "CORE" or "QEMU" rounded */
     size_t elf_note_size = 0;
     int note_head_size;
-    NoteFuncDesc *nf;
+    const NoteFuncDesc *nf;
 
     if (class != ELFCLASS64) {
         return -1;
@@ -221,7 +221,7 @@ static int ppc64_write_all_elf64_notes(const char *note_name,
     Note note;
     int ret = -1;
     int note_size;
-    NoteFuncDesc *nf;
+    const NoteFuncDesc *nf;
 
     for (nf = note_func; nf->note_contents_func; nf++) {
         note.hdr.n_namesz = cpu_to_be32(sizeof(note.name));
diff --git a/target-ppc/int_helper.c b/target-ppc/int_helper.c
index 3a3b3f1..6811b03 100644
--- a/target-ppc/int_helper.c
+++ b/target-ppc/int_helper.c
@@ -1075,7 +1075,7 @@ void helper_vbpermq(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
 #undef VBPERMQ_INDEX
 #undef VBPERMQ_DW
 
-uint64_t VGBBD_MASKS[256] = {
+static const uint64_t VGBBD_MASKS[256] = {
     0x0000000000000000ull, /* 00 */
     0x0000000000000080ull, /* 01 */
     0x0000000000008000ull, /* 02 */
diff --git a/target-ppc/machine.c b/target-ppc/machine.c
index 2d46cec..063b379 100644
--- a/target-ppc/machine.c
+++ b/target-ppc/machine.c
@@ -114,7 +114,7 @@ static void put_avr(QEMUFile *f, void *pv, size_t size)
     qemu_put_be64(f, v->u64[1]);
 }
 
-const VMStateInfo vmstate_info_avr = {
+static const VMStateInfo vmstate_info_avr = {
     .name = "avr",
     .get  = get_avr,
     .put  = put_avr,
@@ -288,7 +288,7 @@ static void put_slbe(QEMUFile *f, void *pv, size_t size)
     qemu_put_be64(f, v->vsid);
 }
 
-const VMStateInfo vmstate_info_slbe = {
+static const VMStateInfo vmstate_info_slbe = {
     .name = "slbe",
     .get  = get_slbe,
     .put  = put_slbe,
-- 
1.7.10.4


