Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lL7o3-0005DB-5t
	for mharc-qemu-trivial@gnu.org; Sat, 13 Mar 2021 12:12:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lL7nx-00056z-E6; Sat, 13 Mar 2021 12:11:58 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:40848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lL7nv-0001uQ-Vy; Sat, 13 Mar 2021 12:11:57 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 y124-20020a1c32820000b029010c93864955so17632316wmy.5; 
 Sat, 13 Mar 2021 09:11:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YUEARRun798+nh7MINi50vXMqDU+cTmUPB2cqCr7TCU=;
 b=TAOYj8E5L4hYB0STOiauw0k5ue2hv3kAyvz8n8QFezr2fKxq6rg0tG4i6OLndqDWWV
 2t4CNP5qxF8AnuApR1ESnk2X8DQHuTpusEdnMwxGWorDInxQmS8tTZyzaeJbNSI61ru8
 Kuvf58pcNbBpeAoeM4vVS/cuj7zvDen3NDSgGxgaaHlQmZ0CqS089L+DGdV32YdAze8C
 O7QI56ZRaFNjChCXDIkA6oU59r2l9eCpN67spgecN4x8h0pC1z3pqn9VYEfkfYUlnuZc
 Jx4LGHK3SYmNqxfK0LUv8wTBaEObHBlLaFSnx9F1W+uKIKSw1QOaxq/3PHmkkj9xg8yo
 djwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=YUEARRun798+nh7MINi50vXMqDU+cTmUPB2cqCr7TCU=;
 b=OfqsYt/iEvpWfoQHXHZX0fGg4mAlIoYXJRjOwmOSbSXowoYbWFZPzUQTu3cmcttahc
 AwQHqurbj2Rttzc9xqGTPpfi5x8aXJkbNzCBHnJK6s662GSrDCOA2zVhOBkP8w7GzHNG
 JIX+LfW8pOXH909dWle3C13aL0FVKCNeaj0A2E0hEpfrbydtDGDGqflPUXaTOt6hYRKV
 m6Now/rWuVxoPbuIPYPzxY3Xehfp8H5GYxWHE8WpYwfzriVuKLNcuWy4W6SNhxCA0vfu
 w8LWTNfSocWsjC2Lq2U5xceQlUppjzJoiUzeMFBut6CpxqdemhYyvPKoIRMlNPO2Vm/R
 oSRA==
X-Gm-Message-State: AOAM532RAZBnQtoteT0P+atD4asCZ+HZNj8SVkrsPMI5Vy+g7p8YQhSW
 9BhLEneZr6IzvvnvJzPktVRUDnlekKrifQ==
X-Google-Smtp-Source: ABdhPJxLJbwEg/9WG397aUihh/bANLY91f/oluZrJupjFtAOWrTktNy7RKm1Kw0l51xbN3OsSUUrWg==
X-Received: by 2002:a1c:3b42:: with SMTP id i63mr18843594wma.124.1615655513158; 
 Sat, 13 Mar 2021 09:11:53 -0800 (PST)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id o188sm7470325wme.7.2021.03.13.09.11.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Mar 2021 09:11:52 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Andrzej Zaborowski <balrogg@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Rob Herring <robh@kernel.org>, qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 0/3] hw: Constify VMStateDescription
Date: Sat, 13 Mar 2021 18:11:47 +0100
Message-Id: <20210313171150.2122409-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
X-List-Received-Date: Sat, 13 Mar 2021 17:12:01 -0000

VMStateDescription isn't supposed to be modified.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (3):=0D
  hw/arm: Constify VMStateDescription=0D
  hw/display/qxl: Constify VMStateDescription=0D
  hw/usb: Constify VMStateDescription=0D
=0D
 hw/arm/highbank.c             | 2 +-=0D
 hw/arm/pxa2xx_pic.c           | 2 +-=0D
 hw/arm/spitz.c                | 4 ++--=0D
 hw/arm/strongarm.c            | 2 +-=0D
 hw/arm/z2.c                   | 4 ++--=0D
 hw/display/qxl.c              | 8 ++++----=0D
 hw/dma/pxa2xx_dma.c           | 4 ++--=0D
 hw/misc/mst_fpga.c            | 2 +-=0D
 hw/usb/ccid-card-passthru.c   | 2 +-=0D
 hw/usb/dev-smartcard-reader.c | 8 ++++----=0D
 10 files changed, 19 insertions(+), 19 deletions(-)=0D
=0D
-- =0D
2.26.2=0D
=0D

