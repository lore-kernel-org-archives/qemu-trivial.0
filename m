Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1daYlc-0005f0-5w
	for mharc-qemu-trivial@gnu.org; Wed, 26 Jul 2017 22:43:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54797)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daYlZ-0005cO-B3
	for qemu-trivial@nongnu.org; Wed, 26 Jul 2017 22:43:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daYlY-00083S-E9
	for qemu-trivial@nongnu.org; Wed, 26 Jul 2017 22:43:09 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:35742)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daYlU-000808-Gq; Wed, 26 Jul 2017 22:43:04 -0400
Received: by mail-qk0-x244.google.com with SMTP id k2so9706518qkf.2;
	Wed, 26 Jul 2017 19:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=CHr4kd++24Ot3/a/V/t4juFWGLOyUcYiGFmSODiiAqA=;
	b=oZOQ/mdny8H5EkStd5KwJ+9Yc1s9VpfiQbo7IA3xdW8RqNBAMPkq2anUgoFHtWhj36
	jWvJEM2rZQBbJl9q8/qWzAgyRDvtt5NRzBDASgaYnVIsVzItJakIL1AZidg8fjD3EfTC
	XfN70W0YT9EeSz88HqFNyFzL35ZTRLOTYyHLGqZApqSUjMI4MyO28Bas8M7buL9v0rHk
	QQqRniWSyVx8P/vH4KSAUOSMa6+ULFBw7mLMBilHwSWcJJi36Jq7hWMGU403OK8pUrDD
	jaVgNVph4GXB5nNJoFoPe9WOaOse/RTUAcpP0wV5B2TkKsbF3fvgWq3DxirUhKjwY/c3
	YP2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=CHr4kd++24Ot3/a/V/t4juFWGLOyUcYiGFmSODiiAqA=;
	b=LXotSN94nLqYlQzWJPsWRyWRjvdnnX7b7QF6fEIY9NH4hi8u7lGhcLjDsCv3P4/SXO
	3Bp5unGm3kroqTnmdvUdFU3FzchbY31EWn3x3t//HjigOQ23s3dtBMP6nhpMjMPYEQH4
	tqaBy4/fC4pg+ZrBMne8wmGvfsUODRiQdka6RlEox+jp5bDcLA8yvJGwGzZeGGkIaLq8
	XPeOdzYl/qOGUF0G183mIr04Ii33yIVkwuD76C+d+5X/RD1IHZfw2HQJLL8nDT+AX/vS
	d8ZHCPQrvqtaDXUstEdOg7RL4ulecOMPKJ6+MMa2CAa/ZFlK1VOV28h7ouXCudlcG/RT
	xJ1g==
X-Gm-Message-State: AIVw113lgAyvMHc6u00IK/nB4thXFjQ+QWrnDDjIbFqvDT2cLvSAc0FW
	/tsn7oN3rKtT/w==
X-Received: by 10.55.42.216 with SMTP id q85mr3701474qkq.202.1501123384022;
	Wed, 26 Jul 2017 19:43:04 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	g27sm13221147qtg.84.2017.07.26.19.43.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Jul 2017 19:43:02 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>, Richard Henderson <rth@twiddle.net>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Aurelien Jarno <aurelien@aurel32.net>
Date: Wed, 26 Jul 2017 23:42:15 -0300
Message-Id: <20170727024224.22900-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170727024224.22900-1-f4bug@amsat.org>
References: <20170727024224.22900-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-trivial] [PATCH for 2.10 v2 10/20] m68k/translate: fix
 incorrect copy/paste
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
X-List-Received-Date: Thu, 27 Jul 2017 02:43:10 -0000

db3d7945ae extended gen_cc_cond() for cond [6, 7, 9, 10] but misswrote [4, 5]

target/m68k/translate.c:1323:70: warning: identical expressions on both sides of logical operator
        if (op == CC_OP_ADDB || op == CC_OP_ADDW || op == CC_OP_ADDL ||
            op == CC_OP_ADDB || op == CC_OP_ADDW || op == CC_OP_ADDL) {
            ~~~~~~~~~~~~~~~~    ~~~~~~~~~~~~~~~~    ~~~~~~~~~~~~~~~~ ^

Reported-by: Clang Static Analyzer
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
---
 target/m68k/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index ada2a91b64..be24355080 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -1321,7 +1321,7 @@ static void gen_cc_cond(DisasCompare *c, DisasContext *s, int cond)
     case 5: /* CS (C) */
         /* Some cases fold C into X.  */
         if (op == CC_OP_ADDB || op == CC_OP_ADDW || op == CC_OP_ADDL ||
-            op == CC_OP_ADDB || op == CC_OP_ADDW || op == CC_OP_ADDL) {
+            op == CC_OP_SUBB || op == CC_OP_SUBW || op == CC_OP_SUBL) {
             tcond = TCG_COND_NE;
             c->v1 = QREG_CC_X;
             goto done;
-- 
2.13.3


