Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rZkZW-0008Qv-T4
	for mharc-qemu-trivial@gnu.org; Mon, 12 Feb 2024 23:39:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rZkZV-0008Qf-ME
 for qemu-trivial@nongnu.org; Mon, 12 Feb 2024 23:39:05 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rZkZU-0005z0-8V
 for qemu-trivial@nongnu.org; Mon, 12 Feb 2024 23:39:05 -0500
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a3c309236c1so318821766b.2
 for <qemu-trivial@nongnu.org>; Mon, 12 Feb 2024 20:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707799141; x=1708403941; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7Wm46KM/NAIWJF++yg0yIrF9QjHH77y/sF/vTwHbHMI=;
 b=UfujSw+TG8Fl/weRESGEi4E00eLBfIojCbbJ+Ef5KDgnCupS3Kvpurxkt3Ij8kixjI
 s8tVgje3y8eOs6GX6ueEGU1MeVTOtzcjdqiyQS2IWCqAZNA/+bpF6TctnCyZSjidDvFH
 /HRMHpuFbaELhjloPIoQGjm3B9r1FuFpY4QRq7llAN2M8kUWTDvfAQBqTCewlBNZLdij
 AwDDrSu5yfpXp3g3/xVq0HUhQoG7NfxxFOBeQdQkpRJ1PgJso6jbpPB198IfwfvTaz6k
 uUGz5jeb+nQwccTohhQICX796+lDaXSIyns1kPWfKqvnw9AV1uBlMamMeLydRRpdmYGB
 safQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707799141; x=1708403941;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7Wm46KM/NAIWJF++yg0yIrF9QjHH77y/sF/vTwHbHMI=;
 b=c49qSOMr6Fy5tK7WAW2twxko7JK0128Y/fx39fFoUJ9zTLfvRG3C1jrLBqtyG4EerU
 J/oLXdhUSJQk/fQxVGdNdg1AIOtFTLdR8M39bI4wqxuii/rsAVYVYSet3SsOGk2fH5N2
 ys7csEth1Mw24/5mONpkA9XynNVUjI0zLvEmYWCxH2g8FgneDMzA6J/Xm/xlmHuHn51Q
 ihsY7jfsplgrcYpMlPGNxKj6SSuUnf8UMg1HGiUTI9aa4FoEgXQWpKHWQy76/Ts9U6ps
 EUXp7WTY6+7/ypm1uJC3pJyOF4IF+KrwhgQjcda340i3vjfnQe/LRXJedrd9nP+xl+aH
 Kbpg==
X-Gm-Message-State: AOJu0Yze8A/k7MuJW+RUuF/8QuH6QJ8uYqdWWMraCFutQ1Zsu2DAQ8Hl
 Q77kR1GYE+0F7XSF9WqORtOnMd+ah54sJCZV/enLlhlLQHezLfVF3tEQ9JQBVnU=
X-Google-Smtp-Source: AGHT+IHqhyFy6PHWEstv95T1MckVhZ1ZT6cgX4m1E8rSPLdNuZtuJYeEjHzLZ765e7zJQ4CwdCseMw==
X-Received: by 2002:a17:906:f2cb:b0:a3b:aa21:a803 with SMTP id
 gz11-20020a170906f2cb00b00a3baa21a803mr6330441ejb.53.1707799141520; 
 Mon, 12 Feb 2024 20:39:01 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXqFyAmh4bhsUjHlpVpTBHtbi0goEEJO1oo/jJBmQNu4BG6gU7mMCcU/tZqwtTPijI1BUw4xG5pVQVjjNATHEcmRV+ziF+VAWOjaNYlKVu/iQ0R2yA=
Received: from m1x-phil.lan ([176.176.128.243])
 by smtp.gmail.com with ESMTPSA id
 tl19-20020a170907c31300b00a3cea63f7efsm572316ejc.30.2024.02.12.20.39.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 12 Feb 2024 20:39:01 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/3] hw/usb: Rename NB_PORTS -> UHCI_PORTS / EHCI_PORTS
Date: Tue, 13 Feb 2024 05:38:56 +0100
Message-ID: <20240213043859.61019-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 13 Feb 2024 04:39:06 -0000

Rename variables to avoid clashing when including both
"hw/usb/hcd-ehci.h" and "hw/usb/hcd-uhci.h" in the same
file.

Philippe Mathieu-Daudé (3):
  hw/usb: Style cleanup
  hw/usb/uhci: Rename NB_PORTS -> UHCI_PORTS
  hw/usb/ehci: Rename NB_PORTS -> EHCI_PORTS

 hw/usb/hcd-ehci.h        |  8 ++++----
 hw/usb/hcd-uhci.h        |  4 ++--
 hw/usb/hcd-ehci-pci.c    |  2 +-
 hw/usb/hcd-ehci-sysbus.c |  2 +-
 hw/usb/hcd-ehci.c        | 21 +++++++++++----------
 hw/usb/hcd-uhci.c        | 24 +++++++++++++-----------
 6 files changed, 32 insertions(+), 29 deletions(-)

-- 
2.41.0


