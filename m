Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jiDfI-0004sj-4n
	for mharc-qemu-trivial@gnu.org; Mon, 08 Jun 2020 05:01:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jiDfG-0004qF-Dq; Mon, 08 Jun 2020 05:01:54 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:42843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jiDfF-0004IO-FG; Mon, 08 Jun 2020 05:01:54 -0400
Received: by mail-wr1-x441.google.com with SMTP id p5so16469992wrw.9;
 Mon, 08 Jun 2020 02:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PQjX/hJ8Xj+F0qXfJ1YqTt2l5LpKtjI08M8rVL/0QmY=;
 b=mJQHDLXvaoI8riHnsnlL/1FTHibwiM4bepiDpg4wXxyQjLeNeGoyWjCFimCBwgK/0P
 IotHKvtbeILYblRaNbtbPmiCyXtcHmTLs69Sri8m+8rKgR93StN302kNyXzkuXOInARO
 JYrABbr7GMuKXJO84wykYt/naenHc4lCWbh7VR/02+VaQM1PouJNOFPaC7RYXfp2Deay
 ylg5Z7ntFjz0hUCql397ZXSZlo3GbBr1F/ts6D5Iyuz8VUbkGYp9UY8vhAkzgP/FU13i
 s4MbRnpGiCjFh2zpEJqz1aMS1ycbtVb9vmjpSbarCR5TgLA2ekE1nkB658+uMLWBz4Aq
 AEuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=PQjX/hJ8Xj+F0qXfJ1YqTt2l5LpKtjI08M8rVL/0QmY=;
 b=qGZum2npNd0Izb9lATEBfD3/qaQ5fFQ5KFHOv8fdbsDdSlx5HT1DHCbd0TEGqH9sgW
 rE0kF7mSkDlx7BIsDgEFKMHpczQcCyTiBFoDRm2GB89637StSmQ9E65r9XVZ8xzBlL9Y
 SJg7UAvu1hbi/Igrn3rcY7ZP9geL8SPQvW0SwjZs/KkrlsjhDrwwGc8Zhrkh+l9XJkeX
 tLSod6aq6ZHzr4Ei38TwZ23AoxyQXtZQOFZONcbL4mYC1hG3ESd/kDUFRPwdUY/VxKFc
 qutnxTEezg7ES7QlCMIWaRlaJdtyjCsyJcTTAuUzCYnwh825lWsLUch+ANYk/vloewBP
 gGBA==
X-Gm-Message-State: AOAM533M0U8PngAOKY0Ph5JBbPKMAIzpmcxdt7S1+thsSDAA/PHxjhz4
 IxXpUokBCKJhpNLM2aybv8+FLlPu
X-Google-Smtp-Source: ABdhPJy7omzwN2JjFfX54Zn9Q/u2CeHEpxxfTpNii8yzCvFn9uMQ3IpxmbnFzapXI8iqvbWRFKwFIQ==
X-Received: by 2002:adf:a283:: with SMTP id s3mr21221673wra.147.1591606910756; 
 Mon, 08 Jun 2020 02:01:50 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id t8sm22192989wro.56.2020.06.08.02.01.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 02:01:49 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Markus Armbruster <armbru@redhat.com>,
 Fam Zheng <fam@euphon.net>, Michael Tokarev <mjt@tls.msk.ru>,
 Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aleksandar Markovic <aleksandar.m.mail@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2 3/8] MAINTAINERS: Mark SH4 TCG target orphan
Date: Mon,  8 Jun 2020 11:01:37 +0200
Message-Id: <20200608090142.6793-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200608090142.6793-1-f4bug@amsat.org>
References: <20200608090142.6793-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 08 Jun 2020 09:01:55 -0000

Aurelien Jarno expressed his desire to orphan the SH4 target [*]:

  I don't mind being [...] removed from there.
  I do not really have time to work on that.

Mark the SH4 TCG target orphan.

Many thanks to Aurelien for his substantial contributions to QEMU,
and for maintaining the SH4 TCG target for various years!

[*] https://www.mail-archive.com/qemu-devel@nongnu.org/msg708400.html

Message-Id: <20200601214125.GA1924990@aurel32.net>
Acked-by: Aurelien Jarno <aurelien@aurel32.net>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index a012d9b74e..cd65bce72b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -296,8 +296,7 @@ F: tests/tcg/s390x/
 L: qemu-s390x@nongnu.org
 
 SH4 TCG CPUs
-M: Aurelien Jarno <aurelien@aurel32.net>
-S: Odd Fixes
+S: Orphan
 F: target/sh4/
 F: disas/sh4.c
 
-- 
2.21.3


