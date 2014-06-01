Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wr4LL-0001TU-9A
	for mharc-qemu-trivial@gnu.org; Sun, 01 Jun 2014 07:54:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48689)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kroosec@gmail.com>) id 1Wr4LE-0001LQ-5z
	for qemu-trivial@nongnu.org; Sun, 01 Jun 2014 07:54:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kroosec@gmail.com>) id 1Wr4L8-0003Ke-6C
	for qemu-trivial@nongnu.org; Sun, 01 Jun 2014 07:54:20 -0400
Received: from mail-we0-x234.google.com ([2a00:1450:400c:c03::234]:41301)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kroosec@gmail.com>)
	id 1Wr4Kv-0003JE-VN; Sun, 01 Jun 2014 07:54:02 -0400
Received: by mail-we0-f180.google.com with SMTP id q58so3968808wes.11
	for <multiple recipients>; Sun, 01 Jun 2014 04:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=MxTrgyLrIeJm5RPfD8hi/TXi2l+GPuK/ayK/LAvTxfg=;
	b=dEmjWsr83sY4BC2aeh60Js3iceskjuDeM9U20oDRewWFKo0k92SuitFaS/2vD51qQ/
	LKNQYVo6dmAEmuEjGJ5Dh8rj6iHgjQQyu9CVr/BiflFF4TnsUVJP7szfwtUqGjwuLnvP
	C4fMgcDTQUKKycgP8Fc+VGwnhc6CxGsayYuylIvP8+R8KLTiLXBlGqekf7hzmG+9c3Fi
	EHWY9c1O3wI3vrGiXhCQg4euuoib5xB5OzjldeSa3hxDE5Ekzen2WKpbqy8sQkJuIa2H
	bhCmjy82E+1RdAealbtH3ByeJa3hRj6XjUZzFp+50qiyardJpLGdFHqkjz1xo9tbPxtG
	suYQ==
X-Received: by 10.180.14.72 with SMTP id n8mr13610993wic.53.1401623640884;
	Sun, 01 Jun 2014 04:54:00 -0700 (PDT)
Received: from localhost.localdomain ([41.103.115.112])
	by mx.google.com with ESMTPSA id b19sm22995930wic.5.2014.06.01.04.53.59
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 01 Jun 2014 04:54:00 -0700 (PDT)
From: Hani Benhabiles <kroosec@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun,  1 Jun 2014 12:53:35 +0100
Message-Id: <1401623615-7548-1-git-send-email-kroosec@gmail.com>
X-Mailer: git-send-email 1.8.3.2
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c03::234
Cc: kwolf@redhat.com, qemu-trivial@nongnu.org, lcapitulino@redhat.com,
	stefanha@redhat.com, eblake@redhat.com, xiawenc@linux.vnet.ibm.com
Subject: [Qemu-trivial] [PATCH] readline: Clear screen on form feed.
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
X-List-Received-Date: Sun, 01 Jun 2014 11:54:26 -0000

Signed-off-by: Hani Benhabiles <hani@linux.com>
---
 util/readline.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/util/readline.c b/util/readline.c
index 8baec55..08d07e3 100644
--- a/util/readline.c
+++ b/util/readline.c
@@ -345,6 +345,12 @@ static void readline_completion(ReadLineState *rs)
     }
 }
 
+static void readline_clear_screen(ReadLineState *rs)
+{
+    rs->printf_func(rs->opaque, "\033[2J\033[1;1H");
+    readline_show_prompt(rs);
+}
+
 /* return true if command handled */
 void readline_handle_byte(ReadLineState *rs, int ch)
 {
@@ -363,6 +369,9 @@ void readline_handle_byte(ReadLineState *rs, int ch)
         case 9:
             readline_completion(rs);
             break;
+        case 12:
+            readline_clear_screen(rs);
+            break;
         case 10:
         case 13:
             rs->cmd_buf[rs->cmd_buf_size] = '\0';
-- 
1.8.3.2


