Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UI9vP-0000GG-Cm
	for mharc-qemu-trivial@gnu.org; Tue, 19 Mar 2013 23:42:51 -0400
Received: from eggs.gnu.org ([208.118.235.92]:39884)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1UI9vF-0008Pz-Uk
	for qemu-trivial@nongnu.org; Tue, 19 Mar 2013 23:42:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1UI9v9-00088K-4u
	for qemu-trivial@nongnu.org; Tue, 19 Mar 2013 23:42:41 -0400
Received: from csmailer.cs.nctu.edu.tw ([140.113.235.130]:54037)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>)
	id 1UI9uv-00086M-K8; Tue, 19 Mar 2013 23:42:22 -0400
Received: from csmailer.cs.nctu.edu.tw (localhost [127.0.0.1])
	by csmailer.cs.nctu.edu.tw (Postfix) with ESMTP id C9191EBD;
	Wed, 20 Mar 2013 11:42:10 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=cs.nctu.edu.tw; h=date
	:from:to:cc:subject:message-id:mime-version:content-type
	:content-transfer-encoding; s=rsa1024; bh=wawljgHAyBjSFg/k8ouoW0
	1hpHM=; b=jUA/YGklqsoQHFyYK77MCwXc7pGnNP4VUY8guaTDN61i8kqiZIBKwQ
	vkFK5A8FUuPJ8K25IBVTCZSAhw+hhFoiDL+i8HRPHw95WbRiywG0z6KOxDdZBseO
	PNhog0DIcmeV7h/hI0Rs+OpOJfdP2aDM2Z6U/PUl8YNqRyGeKKPwQ=
Received: from alumni.cs.nctu.edu.tw (alumni.cs.nctu.edu.tw [140.113.235.116])
	by csmailer.cs.nctu.edu.tw (Postfix) with ESMTP id A2206EBC;
	Wed, 20 Mar 2013 11:42:10 +0800 (CST)
Received: (from chenwj@localhost)
	by alumni.cs.nctu.edu.tw (8.14.5/8.14.5/Submit) id r2K3g8Vn029723;
	Wed, 20 Mar 2013 11:42:08 +0800 (CST) (envelope-from chenwj)
Date: Wed, 20 Mar 2013 11:42:08 +0800
From: =?utf-8?B?6Zmz6Z+L5Lu7IChXZWktUmVuIENoZW4p?= <chenwj@iis.sinica.edu.tw>
To: qemu-trivial@nongnu.org
Message-ID: <20130320034208.GA29514@cs.nctu.edu.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: FreeBSD 8.x
X-Received-From: 140.113.235.130
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Subject: [Qemu-trivial] [PATCH v3] Use proper term in TCG README
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
X-List-Received-Date: Wed, 20 Mar 2013 03:42:50 -0000

  In TCG, "target" means the host architecture for which TCG generates
the code. Using "guest" rather than "target" to make the document more
consistent.

Signed-off-by: Chen Wei-Ren <chenwj@iis.sinica.edu.tw>
---
v3: Adopt Peter's suggestion on sentence and typo.

v2: Correct all wrong usage of the term "target" in this document.
 =20

 tcg/README | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/tcg/README b/tcg/README
index 934e7af..063aeb9 100644
--- a/tcg/README
+++ b/tcg/README
@@ -14,6 +14,10 @@ the emulated architecture. As TCG started as a generic=
 C backend used
 for cross compiling, it is assumed that the TCG target is different
 from the host, although it is never the case for QEMU.
=20
+In this document, we use "guest" to specify what architecture we are
+emulating; "target" always means the TCG target, the machine on which
+we are running QEMU.
+
 A TCG "function" corresponds to a QEMU Translated Block (TB).
=20
 A TCG "temporary" is a variable only live in a basic
@@ -379,7 +383,7 @@ double-word product T0.  The later is returned in two=
 single-word outputs.
=20
 Similar to mulu2, except the two inputs T1 and T2 are signed.
=20
-********* 64-bit target on 32-bit host support
+********* 64-bit guest on 32-bit host support
=20
 The following opcodes are internal to TCG.  Thus they are to be implemen=
ted by
 32-bit host code generators, but are not to be emitted by guest translat=
ors.
@@ -521,9 +525,9 @@ register.
   a better generated code, but it reduces the memory usage of TCG and
   the speed of the translation.
=20
-- Don't hesitate to use helpers for complicated or seldom used target
+- Don't hesitate to use helpers for complicated or seldom used guest
   instructions. There is little performance advantage in using TCG to
-  implement target instructions taking more than about twenty TCG
+  implement guest instructions taking more than about twenty TCG
   instructions. Note that this rule of thumb is more applicable to
   helpers doing complex logic or arithmetic, where the C compiler has
   scope to do a good job of optimisation; it is less relevant where
@@ -531,9 +535,9 @@ register.
   inline TCG may still be faster for longer sequences.
=20
 - The hard limit on the number of TCG instructions you can generate
-  per target instruction is set by MAX_OP_PER_INSTR in exec-all.h --
+  per guest instruction is set by MAX_OP_PER_INSTR in exec-all.h --
   you cannot exceed this without risking a buffer overrun.
=20
 - Use the 'discard' instruction if you know that TCG won't be able to
   prove that a given global is "dead" at a given program point. The
-  x86 target uses it to improve the condition codes optimisation.
+  x86 guest uses it to improve the condition codes optimisation.
--=20
1.7.12.3


--=20
Wei-Ren Chen (=E9=99=B3=E9=9F=8B=E4=BB=BB)
Computer Systems Lab, Institute of Information Science,
Academia Sinica, Taiwan (R.O.C.)
Tel:886-2-2788-3799 #1667
Homepage: http://people.cs.nctu.edu.tw/~chenwj

