Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dZi6d-0000wZ-5v
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jul 2017 14:29:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50685)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZi6b-0000uf-DS
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 14:29:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZi6Y-0005a1-AN
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 14:29:21 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:35823)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZi6W-0005YU-4P; Mon, 24 Jul 2017 14:29:16 -0400
Received: by mail-qt0-x243.google.com with SMTP id 21so5057382qtx.2;
	Mon, 24 Jul 2017 11:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=WFFxs9Ooa+6tnGMZjdkX8R1GjF584z52PtKnRrsI1Co=;
	b=HcR0L+xniGXi8jHsdAel+6pzGlgyk8QoUt6ur69yL6FKU5WB+CDXRdbyjJEwxyPA5v
	yWOXURvoycUlmeapnG45pQCaDxQAc7SdRv9Mo8x9Ud7n4riMAAzaY+oRv1ZKoGfbckHX
	5pYHdP0fO8m/l9CspKPm9IDlA4luKKsFE0BMs0ZQPnuXoNw2/BJVGuM0QG5a/ViKCKeV
	aBw6sHCqVWslRE2gW8NQc9oD2mzMiOCEY3eBAvc6vJoihfYOJYpaobgSss9Su6apzr3G
	nz2+2yy2s4q17Z4gWznw0IuPFfe0pTR1Ntl0xcPUjUPpxnrrTFyvTerwD2wLYY17F/Dp
	99cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=WFFxs9Ooa+6tnGMZjdkX8R1GjF584z52PtKnRrsI1Co=;
	b=g64Ndlan+VUorNpC2tRCk4ep/xKCLDG06qzbdWykTcWjdvd/o/NtS7St/NnT+WKnan
	9HCAwBlOSM82ZL0OQU91of7WwHVfJ52HSCRSL60+U+62A8jbljgogTMeBTGVto1ArV4V
	7RCAjRTtCqT0JOGteCAL+RzHeWfbu1t5QiOUF0zA4vEtpVEk9dxNsDLdmYa7Jrl3MtVQ
	DWR7NhckrM7044hLIrT0EtUzZnOI5Z6p6wOoWlJhFkEtQwh612OFVi6uRyO/3gltg79s
	HCm0wLdouBdJDdjuW+V1G2gdyR4rrxK5rUVS6dTXaEzctN4dEtYfrAlrDFbnYr7P+7wA
	BqZw==
X-Gm-Message-State: AIVw111+8T56MYGJa31LOJXNuWVyJfR//LpQ/2riPekvXpmMlH5i4VOS
	6p/sp+/uB7Shxw==
X-Received: by 10.200.50.133 with SMTP id z5mr2799674qta.78.1500920955695;
	Mon, 24 Jul 2017 11:29:15 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	t57sm9033799qtt.18.2017.07.24.11.29.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Jul 2017 11:29:15 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>, Richard Henderson <rth@twiddle.net>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Mon, 24 Jul 2017 15:27:39 -0300
Message-Id: <20170724182751.18261-24-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170724182751.18261-1-f4bug@amsat.org>
References: <20170724182751.18261-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-trivial] [PATCH for 2.10 23/35] m68k/translate: fix incorrect
 copy/paste
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
X-List-Received-Date: Mon, 24 Jul 2017 18:29:22 -0000

db3d7945ae extended gen_cc_cond() for cond [6, 7, 9, 10] but misswrote [4, 5]

target/m68k/translate.c:1323:70: warning: identical expressions on both sides of logical operator
        if (op == CC_OP_ADDB || op == CC_OP_ADDW || op == CC_OP_ADDL ||
            op == CC_OP_ADDB || op == CC_OP_ADDW || op == CC_OP_ADDL) {
            ~~~~~~~~~~~~~~~~    ~~~~~~~~~~~~~~~~    ~~~~~~~~~~~~~~~~ ^

Reported-by: Clang Static Analyzer
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/m68k/translate.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index ada2a91b64..1a2f421aab 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -1321,7 +1321,8 @@ static void gen_cc_cond(DisasCompare *c, DisasContext *s, int cond)
     case 5: /* CS (C) */
         /* Some cases fold C into X.  */
         if (op == CC_OP_ADDB || op == CC_OP_ADDW || op == CC_OP_ADDL ||
-            op == CC_OP_ADDB || op == CC_OP_ADDW || op == CC_OP_ADDL) {
+            op == CC_OP_SUBB || op == CC_OP_SUBW || op == CC_OP_SUBL ||
+            op == CC_OP_LOGIC) {
             tcond = TCG_COND_NE;
             c->v1 = QREG_CC_X;
             goto done;
-- 
2.13.3


