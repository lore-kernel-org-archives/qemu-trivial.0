Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UG3CP-0002Oo-8x
	for mharc-qemu-trivial@gnu.org; Thu, 14 Mar 2013 04:07:41 -0400
Received: from eggs.gnu.org ([208.118.235.92]:47477)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1UG3CI-0002Fx-E3
	for qemu-trivial@nongnu.org; Thu, 14 Mar 2013 04:07:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1UG3CD-0008Lv-9v
	for qemu-trivial@nongnu.org; Thu, 14 Mar 2013 04:07:34 -0400
Received: from csmailer.cs.nctu.edu.tw ([140.113.235.130]:45282)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>)
	id 1UG3C0-0008Jq-Od; Thu, 14 Mar 2013 04:07:17 -0400
Received: from csmailer.cs.nctu.edu.tw (localhost [127.0.0.1])
	by csmailer.cs.nctu.edu.tw (Postfix) with ESMTP id 7E363601;
	Thu, 14 Mar 2013 16:06:56 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=cs.nctu.edu.tw; h=date
	:from:to:cc:subject:message-id:mime-version:content-type; s=
	rsa1024; bh=dVdUkV3Ki+w4RHJfKtE8zcPxGEI=; b=k5jwKlq381FnCoY9O56W
	ekjp9O1g4S9Y36YY5STe7nxFBvtWusiSWQCbcb/ZJ65wVJHnX+peODbfQXY8OLcR
	aDL0Vl/C3/HnM5EdPKejPaQCWGJ8yrUZU3H8Fgbbb2rxLeBEjU7ykLu1A/7PErvM
	HOz/XX3ablVt/UqkSDxOf9Y=
Received: from alumni.cs.nctu.edu.tw (alumni.cs.nctu.edu.tw [140.113.235.116])
	by csmailer.cs.nctu.edu.tw (Postfix) with ESMTP id 5A96F600;
	Thu, 14 Mar 2013 16:06:56 +0800 (CST)
Received: (from chenwj@localhost)
	by alumni.cs.nctu.edu.tw (8.14.5/8.14.5/Submit) id r2E86khu028572;
	Thu, 14 Mar 2013 16:06:46 +0800 (CST) (envelope-from chenwj)
Date: Thu, 14 Mar 2013 16:06:46 +0800
From: =?utf-8?B?6Zmz6Z+L5Lu7IChXZWktUmVuIENoZW4p?= <chenwj@iis.sinica.edu.tw>
To: qemu-trivial@nongnu.org
Message-ID: <20130314080646.GA28398@cs.nctu.edu.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: FreeBSD 8.x
X-Received-From: 140.113.235.130
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Subject: [Qemu-trivial] [PATCH v2] Use proper term in TCG README
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
X-List-Received-Date: Thu, 14 Mar 2013 08:07:40 -0000

  In TCG, "target" means the host architecture for which TCG generates
the code. Using "guest" rather than "target" to make the document more
consistent.

Signed-off-by: Chen Wei-Ren <chenwj@iis.sinica.edu.tw>
---
 tcg/README | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/tcg/README b/tcg/README
index 934e7af..00d4751 100644
--- a/tcg/README
+++ b/tcg/README
@@ -14,6 +14,9 @@ the emulated architecture. As TCG started as a generic C backend used
 for cross compiling, it is assumed that the TCG target is different
 from the host, although it is never the case for QEMU.
 
+In this document, we uses "guest" to specify what architecture we are
+emulating, and "target" means on what machine we are running QEMU.
+
 A TCG "function" corresponds to a QEMU Translated Block (TB).
 
 A TCG "temporary" is a variable only live in a basic
@@ -379,7 +382,7 @@ double-word product T0.  The later is returned in two single-word outputs.
 
 Similar to mulu2, except the two inputs T1 and T2 are signed.
 
-********* 64-bit target on 32-bit host support
+********* 64-bit guest on 32-bit host support
 
 The following opcodes are internal to TCG.  Thus they are to be implemented by
 32-bit host code generators, but are not to be emitted by guest translators.
@@ -521,9 +524,9 @@ register.
   a better generated code, but it reduces the memory usage of TCG and
   the speed of the translation.
 
-- Don't hesitate to use helpers for complicated or seldom used target
+- Don't hesitate to use helpers for complicated or seldom used guest
   instructions. There is little performance advantage in using TCG to
-  implement target instructions taking more than about twenty TCG
+  implement guest instructions taking more than about twenty TCG
   instructions. Note that this rule of thumb is more applicable to
   helpers doing complex logic or arithmetic, where the C compiler has
   scope to do a good job of optimisation; it is less relevant where
@@ -531,9 +534,9 @@ register.
   inline TCG may still be faster for longer sequences.
 
 - The hard limit on the number of TCG instructions you can generate
-  per target instruction is set by MAX_OP_PER_INSTR in exec-all.h --
+  per guest instruction is set by MAX_OP_PER_INSTR in exec-all.h --
   you cannot exceed this without risking a buffer overrun.
 
 - Use the 'discard' instruction if you know that TCG won't be able to
   prove that a given global is "dead" at a given program point. The
-  x86 target uses it to improve the condition codes optimisation.
+  x86 guest uses it to improve the condition codes optimisation.
-- 
1.7.12.3

