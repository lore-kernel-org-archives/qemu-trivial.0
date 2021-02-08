Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l96xY-0004mH-Ck
	for mharc-qemu-trivial@gnu.org; Mon, 08 Feb 2021 08:52:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l96wn-0004jK-NG; Mon, 08 Feb 2021 08:51:28 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:40330)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l96wS-0008LS-NN; Mon, 08 Feb 2021 08:51:14 -0500
Received: by mail-wm1-x32d.google.com with SMTP id o24so5605167wmh.5;
 Mon, 08 Feb 2021 05:51:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FxFFuRHhcoSHA/Qg7nBmJ5yFviRbeYpeHFIYqJuSlbI=;
 b=h9VcQuX2tIbBVDG7swh/lo9z93HzUWBzNPJFIj63xLolWjbFprYwFGBRJvkZkO1XS5
 YqJt3cX6g4m4DY2Tua5x/UMfO6+5mqfkYENa0oVDvq/YHJ9051c2cg6zo6F58cscRZ0w
 w/swr+zwz2PSV8JpRYPXff78YPwWUzQNZE0ZOqN/EsXCWysiuLFNAM2bPABsz+RHs4II
 8dBDVbwL14yf0Tn40xll9R+8ruBKj7CpsxD6Mr4DBt/B+66QBFCEfNMeOBRMaPUnigHc
 2W5CLtqhDF3OgUeiX7sup3FbokxurogmGYGrESTqzm90xKP832tdmwB8B6BZIufKurdf
 /+HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=FxFFuRHhcoSHA/Qg7nBmJ5yFviRbeYpeHFIYqJuSlbI=;
 b=o1PjaijOInOKAF05KO/i0IqrfO/AXG+HXivHc25PbUuAD2gzUv2jwWcxLnBA4Uw0fZ
 j5VFaX2Y459LumTjZULdMEVA+/cwOvq7QhUHFR5EENGaY2YE0Ykb7Aye24vqjmHa45hS
 9/pOvHgGCQG/T3kWYOQef6XcNdcO4DIMbqyxiEyKdBWSV0p40SCMqdJT10EWM/gVjNvD
 bV7jVv7Y27aGtOV8QUoJPpBEYpdIsLKECQAptWNquTb3E6CKpT1RVMg314pnTm5oX4Nm
 Y7OFUbI9u67Dkr32AsHwesv0bv+D6lnwAfg1S6kDfUpDjqpQupTqG/+a7nT9tpZnINo/
 h1HQ==
X-Gm-Message-State: AOAM533v8t9VEFP8IKvvJ0ja/ffr3f7xKO0k5mST2nqjBCTxO9bhIbbu
 KMWF8bl9he0YlBIeJhEK0+cpeXJFWEM=
X-Google-Smtp-Source: ABdhPJxxlrxSBX4Masaf2RgQneEBe/n/C1uVOaK2iEjPvVTCi2QAnhSmZlEfZQAue3H2Ib0PSY7fdg==
X-Received: by 2002:a7b:c4c1:: with SMTP id g1mr14589895wmk.145.1612792260140; 
 Mon, 08 Feb 2021 05:51:00 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id y83sm21220331wmc.12.2021.02.08.05.50.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 05:50:59 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Max Reitz <mreitz@redhat.com>, Michael Walle <michael@walle.cc>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 BALATON Zoltan <balaton@eik.bme.hu>, qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 2/4] hw/lm32/Kconfig: Introduce CONFIG_LM32_EVR for
 lm32-evr/uclinux boards
Date: Mon,  8 Feb 2021 14:50:46 +0100
Message-Id: <20210208135048.2601693-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210208135048.2601693-1-f4bug@amsat.org>
References: <20210208135048.2601693-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 08 Feb 2021 13:51:45 -0000

We want to be able to use the 'LM32' config for architecture
specific features. Introduce CONFIG_LM32_EVR to select the
lm32-evr / lm32-uclinux boards.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 default-configs/devices/lm32-softmmu.mak | 2 +-
 hw/lm32/Kconfig                          | 6 +++++-
 hw/lm32/meson.build                      | 2 +-
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/default-configs/devices/lm32-softmmu.mak b/default-configs/devices/lm32-softmmu.mak
index 115b3e34c98..1bce3f6e8b6 100644
--- a/default-configs/devices/lm32-softmmu.mak
+++ b/default-configs/devices/lm32-softmmu.mak
@@ -8,5 +8,5 @@ CONFIG_SEMIHOSTING=y
 
 # Boards:
 #
-CONFIG_LM32=y
+CONFIG_LM32_EVR=y
 CONFIG_MILKYMIST=y
diff --git a/hw/lm32/Kconfig b/hw/lm32/Kconfig
index ed2e3060b04..20c36edc402 100644
--- a/hw/lm32/Kconfig
+++ b/hw/lm32/Kconfig
@@ -1,7 +1,6 @@
 config LM32
     bool
     select PTIMER
-    select PFLASH_CFI02
 
 config MILKYMIST
     bool
@@ -12,3 +11,8 @@ config MILKYMIST
     select FRAMEBUFFER
     select SD
     select USB_OHCI
+
+config LM32_EVR
+    bool
+    select LM32
+    select PFLASH_CFI02
diff --git a/hw/lm32/meson.build b/hw/lm32/meson.build
index 8caf0a727ff..42d6f8db3d9 100644
--- a/hw/lm32/meson.build
+++ b/hw/lm32/meson.build
@@ -1,6 +1,6 @@
 lm32_ss = ss.source_set()
 # LM32 boards
-lm32_ss.add(when: 'CONFIG_LM32', if_true: files('lm32_boards.c'))
+lm32_ss.add(when: 'CONFIG_LM32_EVR', if_true: files('lm32_boards.c'))
 lm32_ss.add(when: 'CONFIG_MILKYMIST', if_true: files('milkymist.c'))
 
 hw_arch += {'lm32': lm32_ss}
-- 
2.26.2


