Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U1gjD-0002j9-7L
	for mharc-qemu-trivial@gnu.org; Sat, 02 Feb 2013 12:18:11 -0500
Received: from eggs.gnu.org ([208.118.235.92]:50762)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1U1gj8-0002YH-Qw
	for qemu-trivial@nongnu.org; Sat, 02 Feb 2013 12:18:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1U1gj5-0006Mq-Io
	for qemu-trivial@nongnu.org; Sat, 02 Feb 2013 12:18:06 -0500
Received: from
	1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.d.1.0.0.b.8.0.1.0.0.2.ip6.arpa
	([2001:8b0:1d0::1]:60226 helo=mnementh.archaic.org.uk)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1U1giz-0006Lp-JQ; Sat, 02 Feb 2013 12:17:57 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.72)
	(envelope-from <pm215@archaic.org.uk>)
	id 1U1giw-0006wS-Qz; Sat, 02 Feb 2013 17:17:54 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat,  2 Feb 2013 17:17:54 +0000
Message-Id: <1359825474-26661-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2001:8b0:1d0::1
Cc: qemu-trivial@nongnu.org,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <andreas.faerber@web.de>,
	patches@linaro.org
Subject: [Qemu-trivial] [PATCH] disas/i386.c: Add explicit braces round
	empty for-loop body
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
X-List-Received-Date: Sat, 02 Feb 2013 17:18:09 -0000

Add explicit braces round an empty for-loop body; this fits
QEMU style and is easier to read than an inconspicuous semicolon
at the end of the line. It also silences a clang warning:

disas/i386.c:4723:49: warning: for loop has empty body [-Wempty-body]
          for (i = 0; tmp[i] == '0' && tmp[i + 1]; i++);
                                                       ^
disas/i386.c:4723:49: note: put the semicolon on a separate line to silence this warning [-Wempty-body]

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
This is the only clang warning on MacOSX apart from the ones about
deprecated features in audio/coreaudio.c and ui/cocoa.m, which is why
I think it's worth zapping despite it being a style issue in one of the
bits of disassembler code we got from binutils and which aren't generally
in QEMU style.

checkpatch complains about the non-multiple-of-4 indent:
WARNING: suspect code indent for conditional statements (10, 10)
#27: FILE: disas/i386.c:4723:
+          for (i = 0; tmp[i] == '0' && tmp[i + 1]; i++) {
+          }

but I didn't see any value in reindenting the whole function just to
shut it up.

At some point in the 1.5 cycle maybe we could update the code to avoid
the deprecated MacOS functions and then we could enable warnings-are-errors
on MacOS too.

 disas/i386.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/disas/i386.c b/disas/i386.c
index 3b006b1..dbecf1f 100644
--- a/disas/i386.c
+++ b/disas/i386.c
@@ -4720,7 +4720,8 @@ print_operand_value (char *buf, size_t bufsize, int hex, bfd_vma disp)
 	  buf[0] = '0';
 	  buf[1] = 'x';
           snprintf_vma (tmp, sizeof(tmp), disp);
-	  for (i = 0; tmp[i] == '0' && tmp[i + 1]; i++);
+          for (i = 0; tmp[i] == '0' && tmp[i + 1]; i++) {
+          }
           pstrcpy (buf + 2, bufsize - 2, tmp + i);
 	}
       else
-- 
1.7.11.4


