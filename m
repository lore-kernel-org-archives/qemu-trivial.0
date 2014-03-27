Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WTCqt-00063Q-Vy
	for mharc-qemu-trivial@gnu.org; Thu, 27 Mar 2014 12:08:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45596)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WTCqo-0005sf-J0
	for qemu-trivial@nongnu.org; Thu, 27 Mar 2014 12:08:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WTCqk-0000yt-Fa
	for qemu-trivial@nongnu.org; Thu, 27 Mar 2014 12:08:18 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:36723)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WTCqZ-0000uJ-MO; Thu, 27 Mar 2014 12:08:03 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id A82A543732;
	Thu, 27 Mar 2014 20:08:02 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 9B3C4671;
	Thu, 27 Mar 2014 19:28:30 +0400 (MSK)
Received: (nullmailer pid 1767 invoked by uid 1000);
	Thu, 27 Mar 2014 15:28:29 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 27 Mar 2014 19:28:06 +0400
Message-Id: <1395934108-1694-2-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1395934108-1694-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1395934108-1694-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 01/23] target-s390x: Add missing 'static' and
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
X-List-Received-Date: Thu, 27 Mar 2014 16:08:22 -0000

From: Stefan Weil <sw@weilnetz.de>

This fixes warnings from the static code analysis (smatch).

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Richard Henderson <rth@twiddle.net>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
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


