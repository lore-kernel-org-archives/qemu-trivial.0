Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QyITj-0008VO-NN
	for mharc-qemu-trivial@gnu.org; Tue, 30 Aug 2011 03:11:23 -0400
Received: from eggs.gnu.org ([140.186.70.92]:44454)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <boris.figovsky@ravellosystems.com>)
	id 1QyITg-0008LJ-Eq
	for qemu-trivial@nongnu.org; Tue, 30 Aug 2011 03:11:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <boris.figovsky@ravellosystems.com>)
	id 1QyITf-000504-Ft
	for qemu-trivial@nongnu.org; Tue, 30 Aug 2011 03:11:20 -0400
Received: from na3sys010aog101.obsmtp.com ([74.125.245.70]:47112)
	by eggs.gnu.org with smtp (Exim 4.71)
	(envelope-from <boris.figovsky@ravellosystems.com>)
	id 1QyITc-0004zl-WC; Tue, 30 Aug 2011 03:11:17 -0400
Received: from mail-ww0-f51.google.com ([74.125.82.51]) (using TLSv1) by
	na3sys010aob101.postini.com ([74.125.244.12]) with SMTP
	ID DSNKTlyNAtD7cvld4LeUQUqSeMQ3q9Ab76GZ@postini.com;
	Tue, 30 Aug 2011 00:11:16 PDT
Received: by mail-ww0-f51.google.com with SMTP id 18so5889311wwi.8
	for <multiple recipients>; Tue, 30 Aug 2011 00:10:58 -0700 (PDT)
Received: by 10.216.1.200 with SMTP id 50mr465133wed.33.1314688258037;
	Tue, 30 Aug 2011 00:10:58 -0700 (PDT)
Received: from borf.ravello.local (bzq-218-203-82.red.bezeqint.net
	[81.218.203.82])
	by mx.google.com with ESMTPS id fg5sm4365078wbb.23.2011.08.30.00.10.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 30 Aug 2011 00:10:57 -0700 (PDT)
Message-ID: <4e5c8d01.05cbe30a.22c4.ffffe8ac@mx.google.com>
Received: by borf.ravello.local (sSMTP sendmail emulation);
	Tue, 30 Aug 2011 10:12:22 +0300
From: Boris Figovsky <boris.figovsky@ravellosystems.com>
Date: Tue, 30 Aug 2011 10:00:55 +0300
To: qemu-devel@nongnu.org
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6, seldom 2.4 (older,
	4)
X-Received-From: 74.125.245.70
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] x86: fix daa opcode for al register values
	higher than 0xf9
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
X-List-Received-Date: Tue, 30 Aug 2011 07:11:21 -0000

The second if statement should consider the original al register value,
and not the new one.

Signed-off-by: Boris Figovsky <boris.figovksy@ravellosystems.com>
---
 target-i386/op_helper.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/target-i386/op_helper.c b/target-i386/op_helper.c
index 1bbc3b5..1fc248f 100644
--- a/target-i386/op_helper.c
+++ b/target-i386/op_helper.c
@@ -1970,20 +1970,20 @@ void helper_aas(void)
 
 void helper_daa(void)
 {
-    int al, af, cf;
+    int old_al, al, af, cf;
     int eflags;
 
     eflags = helper_cc_compute_all(CC_OP);
     cf = eflags & CC_C;
     af = eflags & CC_A;
-    al = EAX & 0xff;
+    old_al = al = EAX & 0xff;
 
     eflags = 0;
     if (((al & 0x0f) > 9 ) || af) {
         al = (al + 6) & 0xff;
         eflags |= CC_A;
     }
-    if ((al > 0x9f) || cf) {
+    if ((old_al > 0x99) || cf) {
         al = (al + 0x60) & 0xff;
         eflags |= CC_C;
     }
-- 
1.7.0.4


