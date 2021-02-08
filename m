Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l96wl-0004io-Nw
	for mharc-qemu-trivial@gnu.org; Mon, 08 Feb 2021 08:51:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l96wU-0004fM-8z; Mon, 08 Feb 2021 08:51:09 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:33036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l96wJ-0008Jd-7g; Mon, 08 Feb 2021 08:51:01 -0500
Received: by mail-wm1-x330.google.com with SMTP id a16so12311372wmm.0;
 Mon, 08 Feb 2021 05:50:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1uCobYcGSVNB8TQacek97MrKEc6pVdRGLmlF6GDAN7o=;
 b=vQK63CagjssC2D62gckSUQy2N0/Warafn3FtiOysIvSUf92cCWC+FaA4Zq5CEqUZgY
 Zd5bTJIQWtizajc7zX63ZD7/7U0zGBzbOYFnYDnJniFIJpBVM0FSnSWiqFdH+dO0KU5C
 s+rbwfu5LL3d+MlN/pttmXsftBAMFSlH+Wl6PPgpxofCsqHSkfsQX0d5u5Ii3JhsJJ75
 6dhTh6pZUJPVb3hcJbXuau23hTn9VWKSsj80hJSF/x25nCHXMMttOc8UlCqz3aSX0tKU
 I+pPXE6OsjfAcbKAc+FU77MkKpEwk/TIgFxR2qvi3TUY9OKkqmbJuZze4uR3+iNnOTkB
 4iDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=1uCobYcGSVNB8TQacek97MrKEc6pVdRGLmlF6GDAN7o=;
 b=sDnVwrQAkxw6EXBaPr/DqdBpp07oy/5GeS2fuc3d2Oxf8++h850eE9UjLuvpAqSEyL
 VvdFaYKtWUnA4Eh0pqjudnNENJBamRiBkKkrLqFN1cu1sOMaYjRvpIEO5e6bPsiTypVh
 gsEK7xBu7TlksBFvVgmCzHIAM0iH7mm+1OY+JeC23YthYo8Z6yc3gGfm7B4B1dleOH7o
 7E2Cx3JCaxtObjo4eDLCt4DlQW854G6zP259urc066y0bK7qscHB3lSoiPQEI+Yydwc2
 8jfCyAAN9URlJ76VcU42Jh/A9VbTRKcdenX1DX45UCEkKEI1v1vLtwwcvIM5WJkWlRbv
 gPhg==
X-Gm-Message-State: AOAM533A/M0vpUnJ6JSExElroeWPelrrdFjefRDyGM4Is2XQpt0jp70Q
 Vyem13dSqWjkK4KA6BZyRO02iiiNkpY=
X-Google-Smtp-Source: ABdhPJws9Qd1Z4LQbANL2f0V6CQ8mfOWbE1EY0z7FhgglxdxEJAiDT95nPaW0Y6ic7QOctLtbaIIEg==
X-Received: by 2002:a1c:40d4:: with SMTP id n203mr14921730wma.46.1612792250144; 
 Mon, 08 Feb 2021 05:50:50 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id c9sm32500815wrw.76.2021.02.08.05.50.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 05:50:49 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Max Reitz <mreitz@redhat.com>, Michael Walle <michael@walle.cc>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 BALATON Zoltan <balaton@eik.bme.hu>, qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 0/4] hw/{lm32,sh4}: Kconfig cleanups
Date: Mon,  8 Feb 2021 14:50:44 +0100
Message-Id: <20210208135048.2601693-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
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
X-List-Received-Date: Mon, 08 Feb 2021 13:51:15 -0000

Patches extracted from "target: Provide target-specific Kconfig":=0D
https://www.mail-archive.com/qemu-block@nongnu.org/msg79924.html=0D
=0D
Single change, renamed PERIPHERALS as DEVICES as suggested by=0D
Zoltan.=0D
=0D
Since LM32/SH4 are not very active, can it go via qemu-trivial@?=0D
=0D
Thanks,=0D
=0D
Phil.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (4):=0D
  hw/sh4/Kconfig: Rename CONFIG_SH4 -> CONFIG_SH4_DEVICES=0D
  hw/lm32/Kconfig: Introduce CONFIG_LM32_EVR for lm32-evr/uclinux boards=0D
  hw/lm32/Kconfig: Rename CONFIG_LM32 -> CONFIG_LM32_DEVICES=0D
  hw/lm32/Kconfig: Have MILKYMIST select LM32_DEVICES=0D
=0D
 default-configs/devices/lm32-softmmu.mak |  2 +-=0D
 hw/block/meson.build                     |  2 +-=0D
 hw/char/meson.build                      |  6 +++---=0D
 hw/intc/meson.build                      |  4 ++--=0D
 hw/lm32/Kconfig                          | 10 +++++++---=0D
 hw/lm32/meson.build                      |  2 +-=0D
 hw/sh4/Kconfig                           |  6 +++---=0D
 hw/timer/meson.build                     |  4 ++--=0D
 8 files changed, 20 insertions(+), 16 deletions(-)=0D
=0D
-- =0D
2.26.2=0D
=0D

