Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cZNUM-0004k3-Lp
	for mharc-qemu-trivial@gnu.org; Thu, 02 Feb 2017 14:56:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58282)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1cZNUK-0004ik-BF
	for qemu-trivial@nongnu.org; Thu, 02 Feb 2017 14:56:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1cZNUJ-0006A0-KV
	for qemu-trivial@nongnu.org; Thu, 02 Feb 2017 14:56:12 -0500
Received: from mail.weilnetz.de ([37.120.169.71]:49448
	helo=v2201612906741603.powersrv.de)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefan@weilnetz.de>)
	id 1cZNUF-000645-6T; Thu, 02 Feb 2017 14:56:07 -0500
Received: from localhost (localhost [127.0.0.1])
	by v2201612906741603.powersrv.de (Postfix) with ESMTP id A5EE4DA0D55;
	Thu,  2 Feb 2017 20:56:04 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at v2201612906741603.powersrv.de
Received: from v2201612906741603.powersrv.de ([127.0.0.1])
	by localhost (mail.powersrv.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8kSEbfiChEc8; Thu,  2 Feb 2017 20:56:03 +0100 (CET)
Received: from qemu.weilnetz.de (qemu.weilnetz.de [188.68.58.204])
	by v2201612906741603.powersrv.de (Postfix) with ESMTP id 2C74DDA03B7;
	Thu,  2 Feb 2017 20:56:03 +0100 (CET)
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id 20D81460018; Thu,  2 Feb 2017 20:56:03 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: Richard Henderson <rth@twiddle.net>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>
Date: Thu,  2 Feb 2017 20:56:01 +0100
Message-Id: <20170202195601.11286-1-sw@weilnetz.de>
X-Mailer: git-send-email 2.11.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 37.120.169.71
Subject: [Qemu-trivial] [PATCH] tci: Remove invalid assertions
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
X-List-Received-Date: Thu, 02 Feb 2017 19:56:13 -0000

tb_jmp_insn_offset and tb_jmp_reset_offset are pointers
and cannot be used with ARRAY_SIZE.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 tcg/tci/tcg-target.inc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tcg/tci/tcg-target.inc.c b/tcg/tci/tcg-target.inc.c
index 26ee9b1664..b6a15569f8 100644
--- a/tcg/tci/tcg-target.inc.c
+++ b/tcg/tci/tcg-target.inc.c
@@ -566,7 +566,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
     case INDEX_op_goto_tb:
         if (s->tb_jmp_insn_offset) {
             /* Direct jump method. */
-            tcg_debug_assert(args[0] < ARRAY_SIZE(s->tb_jmp_insn_offset));
             /* Align for atomic patching and thread safety */
             s->code_ptr = QEMU_ALIGN_PTR_UP(s->code_ptr, 4);
             s->tb_jmp_insn_offset[args[0]] = tcg_current_code_size(s);
@@ -575,7 +574,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
             /* Indirect jump method. */
             TODO();
         }
-        tcg_debug_assert(args[0] < ARRAY_SIZE(s->tb_jmp_reset_offset));
         s->tb_jmp_reset_offset[args[0]] = tcg_current_code_size(s);
         break;
     case INDEX_op_br:
-- 
2.11.0


