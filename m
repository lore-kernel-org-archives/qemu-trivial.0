Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fQaGQ-00059L-Ps
	for mharc-qemu-trivial@gnu.org; Wed, 06 Jun 2018 11:22:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39500)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQaGN-00056G-My
	for qemu-trivial@nongnu.org; Wed, 06 Jun 2018 11:22:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQaGM-0003rY-7r
	for qemu-trivial@nongnu.org; Wed, 06 Jun 2018 11:22:15 -0400
Received: from mail-qk0-x229.google.com ([2607:f8b0:400d:c09::229]:46759)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQaGF-0003mO-E9; Wed, 06 Jun 2018 11:22:07 -0400
Received: by mail-qk0-x229.google.com with SMTP id k86-v6so4168894qkh.13;
	Wed, 06 Jun 2018 08:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=wYzZ381YdJXBuHJF+y3C4DuLfGgJljPo3pSosfnBnTI=;
	b=tAqem9XtfmHJjwA219MHfQMGabSIgvZuN9KszoizIl1xh5j0DB845xNFkQ2FBREmGQ
	/PfKiEYTbBwJbWhfxF/1vElOj5XUQzMxIm2qUx8GNhFEbMe0d0vQamg1fLXQpxhVhiyh
	ccPlu05+VkZ7pRfIuU9Cw/72Y8osBeGcXQc9eE87jV6JGDpTOEiE0vOHJznwQiAA5icD
	/tZ122axtkTIv+7AFzRCnjd69YDoXwjYhKrIC1BVCEgKsCRAyl0Xobp1nPcHhv6uKeRW
	Qjq78pRacXa5NJWC7A/KzPBJwaceA+IuBNDqFjGLNffdc03grxd3QaMl08yyhYQSPF8E
	wQTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=wYzZ381YdJXBuHJF+y3C4DuLfGgJljPo3pSosfnBnTI=;
	b=PT5+OUlafYcguh43fepB/OD4QXqvpK5X0RoyhnOcnxjfXQyeG66uy4Cf/png++T1SE
	nxunR72Sf4T//SvKZBm0llRy/k5qNPcqx073xAlDk6YvE3UXK0I8Eyx2kmvwwejsknKC
	vcg15heQInR8gC5SiFNsdzAlBnzNNGro6FtQQMqIFllPw7TMgTkVnj6MQSXaOxT0YHym
	l+XCeWKtJycnxtbT3Q+CLH/oTuBvFJZ6elhWbtITIdBMz741RHfvvu37NdtTmPkcr0O8
	IYGRZ1CtDHJwlw91Rir3A3wASpEUEJhDhb18g00wqcwKULin6tCbblwJv+iMsKilNQDT
	pNaA==
X-Gm-Message-State: APt69E2mpMdxr1KuyaGtDzcV219mcHLaLYz+Td4E/4toaszDm5+U9P8p
	aSUytq2J5liZoa0RVurcuZuMmEjI
X-Google-Smtp-Source: ADUXVKLeckM0r5vuqZebCWMLKWCLm/VN/TYJqTpE8ejO1tsGPMv8OTzkCuiAe8TOKQoJlCRyONM+IA==
X-Received: by 2002:a37:1b5f:: with SMTP id
	b92-v6mr2776937qkb.399.1528298526967; 
	Wed, 06 Jun 2018 08:22:06 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	i8-v6sm38756255qtb.11.2018.06.06.08.22.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Jun 2018 08:22:06 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Wed,  6 Jun 2018 12:21:28 -0300
Message-Id: <20180606152128.449-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180606152128.449-1-f4bug@amsat.org>
References: <20180606152128.449-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::229
Subject: [Qemu-trivial] [RFC PATCH 11/11] target/xtensa: Add trailing '\n'
 to qemu_log() calls
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
X-List-Received-Date: Wed, 06 Jun 2018 15:22:17 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
RFC because I think the qemu_log_mask() was previously intended to concatenate
output to stderr... (multiple registers described on a single line).

 target/xtensa/translate.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index 89db23852b..a11162eebe 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -2234,7 +2234,7 @@ static void translate_rur(DisasContext *dc, const uint32_t arg[],
         if (uregnames[par[0]].name) {
             tcg_gen_mov_i32(cpu_R[arg[0]], cpu_UR[par[0]]);
         } else {
-            qemu_log_mask(LOG_UNIMP, "RUR %d not implemented, ", par[0]);
+            qemu_log_mask(LOG_UNIMP, "RUR %d not implemented\n", par[0]);
         }
     }
 }
@@ -2375,7 +2375,7 @@ static void translate_slli(DisasContext *dc, const uint32_t arg[],
 {
     if (gen_window_check2(dc, arg[0], arg[1])) {
         if (arg[2] == 32) {
-            qemu_log_mask(LOG_GUEST_ERROR, "slli a%d, a%d, 32 is undefined",
+            qemu_log_mask(LOG_GUEST_ERROR, "slli a%d, a%d, 32 is undefined\n",
                           arg[0], arg[1]);
         }
         tcg_gen_shli_i32(cpu_R[arg[0]], cpu_R[arg[1]], arg[2] & 0x1f);
@@ -2571,7 +2571,7 @@ static void translate_wur(DisasContext *dc, const uint32_t arg[],
         if (uregnames[par[0]].name) {
             gen_wur(par[0], cpu_R[arg[0]]);
         } else {
-            qemu_log_mask(LOG_UNIMP, "WUR %d not implemented, ", par[0]);
+            qemu_log_mask(LOG_UNIMP, "WUR %d not implemented\n", par[0]);
         }
     }
 }
-- 
2.17.1


