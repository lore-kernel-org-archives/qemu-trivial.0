Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WPBRL-00071r-Kc
	for mharc-qemu-trivial@gnu.org; Sun, 16 Mar 2014 09:49:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60699)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1WPBRI-0006xI-CO
	for qemu-trivial@nongnu.org; Sun, 16 Mar 2014 09:49:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1WPBRH-0006XV-HG
	for qemu-trivial@nongnu.org; Sun, 16 Mar 2014 09:49:20 -0400
Received: from qemu.weilnetz.de ([2a03:4000:2:362::1]:51705
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1WPBRF-0006XE-FI; Sun, 16 Mar 2014 09:49:17 -0400
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id EBB8417FF89; Sun, 16 Mar 2014 14:49:12 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org
Date: Sun, 16 Mar 2014 14:49:11 +0100
Message-Id: <1394977751-18881-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:2:362::1
Cc: Alexander Graf <agraf@suse.de>, Stefan Weil <sw@weilnetz.de>,
	qemu-devel@nongnu.org, Richard Henderson <rth@twiddle.net>
Subject: [Qemu-trivial] [PATCH] target-s390x: Add missing 'static' and
	'const' attributes
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
X-List-Received-Date: Sun, 16 Mar 2014 13:49:21 -0000

This fixes warnings from the static code analysis (smatch).

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 target-s390x/arch_dump.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target-s390x/arch_dump.c b/target-s390x/arch_dump.c
index 5cbb53c..a1554f5 100644
--- a/target-s390x/arch_dump.c
+++ b/target-s390x/arch_dump.c
@@ -123,7 +123,7 @@ static void s390x_write_elf64_prefix(Note *note, S390CPU *cpu)
 }
 
 
-struct NoteFuncDescStruct {
+static const struct NoteFuncDescStruct {
     int contents_size;
     void (*note_contents_func)(Note *note, S390CPU *cpu);
 } note_func[] = {
@@ -146,7 +146,7 @@ static int s390x_write_all_elf64_notes(const char *note_name,
                                        void *opaque)
 {
     Note note;
-    NoteFuncDesc *nf;
+    const NoteFuncDesc *nf;
     int note_size;
     int ret = -1;
 
@@ -192,7 +192,7 @@ ssize_t cpu_get_note_size(int class, int machine, int nr_cpus)
     int name_size = 8; /* "CORE" or "QEMU" rounded */
     size_t elf_note_size = 0;
     int note_head_size;
-    NoteFuncDesc *nf;
+    const NoteFuncDesc *nf;
 
     assert(class == ELFCLASS64);
     assert(machine == EM_S390);
-- 
1.7.10.4


