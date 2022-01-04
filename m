Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n4rhh-0003Lf-0i
	for mharc-qemu-trivial@gnu.org; Tue, 04 Jan 2022 16:50:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n4rhW-0003GA-Cj; Tue, 04 Jan 2022 16:50:40 -0500
Received: from [2a00:1450:4864:20::429] (port=35647
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n4rhQ-0004XH-44; Tue, 04 Jan 2022 16:50:34 -0500
Received: by mail-wr1-x429.google.com with SMTP id j18so78832485wrd.2;
 Tue, 04 Jan 2022 13:50:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CKRFGK/nQbJSO9eH4vCzDs3frMk9TG9xrgiou6/dFxQ=;
 b=H+s4xYLBvW4eeeXr3hAw3ptmkPoEOaFbt6nwqLZaPfmfiSzWlg/0kUFzl9tpDVoZI+
 QJCk2IYJO6bWK+fpudq3TAIaFVlQqbBdBrRg9dDh8vZR13vS2vHk4vmvcLKwEEZfNR1l
 UBfQf64EsWqeUrHlGk6r6Xyqj+CgvOJQ7QauYhY4scGakO0XG/fDguFRwhrb3v0mIaKr
 oCvv+IcBRScP3Cduy24r1yAbqZzw3Ow+M8Z2BdocNXsvNfY0hmkeBVWWtL19vvNnMrZ0
 xCS07DZJrKjnzJrrqj/UT7ns3P7ioTPsbIt1JtfF4mpNG41ca63dM26r7rf1kEHiWI6L
 q70g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=CKRFGK/nQbJSO9eH4vCzDs3frMk9TG9xrgiou6/dFxQ=;
 b=6eHuTscLhAPF7yFRD9W4fSuY6L6IEyxWJea31oPGk4psfBRUdmGarzo+N8q0yINGVV
 +EaC0v+X3WI44+AiRl2IMhQMtVGjNi+txQeKQG3FnMl32IPTrLxwi6FVCj1qJz56bWUF
 FSJ6iF1vZb93N/xAImMf4TJ7Fi/NoAuEa5YjPQCpdFgnfFzbKpZfF5JODMwTUPB+t1xM
 y8LvD8V4zTGYOItWHLS7TVuhANONse++PrUzuq4TknIyHvpuIA28TnFDHUp3E2nW5cCG
 DGXvHstFHMSFfRMzHNY3UgJIYgU01KeRgZ+FN0oPTYHnG85x8XM9/LPKC8m0oAGLSxh/
 hqQQ==
X-Gm-Message-State: AOAM531kRG7p8kDwEBAxxENNqhWtsxI27phHWgk6dbt3nOx8NRQp73B0
 Q1ArwaTPSZGBKCrmvloxn2EM6A5NoDc=
X-Google-Smtp-Source: ABdhPJyW7nwCVZE03wLWlyJEoM7FjY+evtSXj/v5so2cyHbLiEjhHb8GHQYEDYG5ZuGN7UZ3kwe5nQ==
X-Received: by 2002:adf:aac7:: with SMTP id i7mr44556716wrc.537.1641333029395; 
 Tue, 04 Jan 2022 13:50:29 -0800 (PST)
Received: from x1w.. (83.red-83-50-87.dynamicip.rima-tde.net. [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id y1sm38872710wrm.3.2022.01.04.13.50.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 13:50:29 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 qemu-trivial@nongnu.org, WANG Xuerui <git@xen0n.name>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Song Gao <gaosong@loongson.cn>
Subject: [PATCH v2] linux-user: Fix trivial build error on loongarch64 hosts
Date: Tue,  4 Jan 2022 22:50:27 +0100
Message-Id: <20220104215027.2180972-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Jan 2022 21:50:46 -0000

When building using GCC 8.3.0 on loongarch64 (Loongnix) we get:

  In file included from ../linux-user/signal.c:33:
  ../linux-user/host/loongarch64/host-signal.h: In function ‘host_signal_write’:
  ../linux-user/host/loongarch64/host-signal.h:57:9: error: a label can only be part of a statement and a declaration is not a statement
         uint32_t sel = (insn >> 15) & 0b11111111111;
         ^~~~~~~~

We don't use the 'sel' variable more than once, so drop it.

Meson output for the record:

  Host machine cpu family: loongarch64
  Host machine cpu: loongarch64
  C compiler for the host machine: cc (gcc 8.3.0 "cc (Loongnix 8.3.0-6.lnd.vec.27) 8.3.0")
  C linker for the host machine: cc ld.bfd 2.31.1-system

Fixes: ad812c3bd65 ("linux-user: Implement CPU-specific signal handler for loongarch64 hosts")
Reported-by: Song Gao <gaosong@loongson.cn>
Suggested-by: Song Gao <gaosong@loongson.cn>
Reviewed-by: WANG Xuerui <git@xen0n.name>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 linux-user/host/loongarch64/host-signal.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/linux-user/host/loongarch64/host-signal.h b/linux-user/host/loongarch64/host-signal.h
index 05e2c823717..7effa242515 100644
--- a/linux-user/host/loongarch64/host-signal.h
+++ b/linux-user/host/loongarch64/host-signal.h
@@ -54,9 +54,7 @@ static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)
         }
         break;
     case 0b001110: /* indexed, atomic, bounds-checking memory operations */
-        uint32_t sel = (insn >> 15) & 0b11111111111;
-
-        switch (sel) {
+        switch ((insn >> 15) & 0b11111111111) {
         case 0b00000100000: /* stx.b */
         case 0b00000101000: /* stx.h */
         case 0b00000110000: /* stx.w */
-- 
2.33.1


