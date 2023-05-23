Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1q1LG1-00007N-ME
	for mharc-qemu-trivial@gnu.org; Tue, 23 May 2023 02:12:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q1LFl-0008SO-R4
 for qemu-trivial@nongnu.org; Tue, 23 May 2023 02:12:14 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q1LFk-0005Ff-Dk
 for qemu-trivial@nongnu.org; Tue, 23 May 2023 02:12:13 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3f41d087a84so30990265e9.1
 for <qemu-trivial@nongnu.org>; Mon, 22 May 2023 23:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684822330; x=1687414330;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dVduBQdrAQ/JitmbuXJOwhpd3wkRFgWVzK14sta4Hho=;
 b=vCePpB1tAOUKUDaavDFVn3RTGCYQA7+ia8SH5XeZXmCUbdkl6Pc//7WTUCT3CmJmXs
 7ARwdmqLBetrfYsaHz6zCcc+OCTVaN/U1crtM1KYPkTTa4cUVY47Sw2ueYAQRooVTV54
 wqUs7uVdM1CFGDnTV7VGzrD3xZA1fiH3gfzH6ikMEUE5Q2Clon1nSVSuH1p8HUwvOnp1
 nwxhMJlgdAj6Ga31jPH3/4uSxGX202lbQmNhR9fjKzQRUSnip0VUGTkyfam2b22c9wKj
 twXR3bBKjZyJlo7xtfa8frQPjD9pZNCfADZBm8ipbVioBDWF48eigM2ZTk9T3SVtpWyW
 K1NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684822330; x=1687414330;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dVduBQdrAQ/JitmbuXJOwhpd3wkRFgWVzK14sta4Hho=;
 b=dib1mgg8l1eqwe3RA9n/k35YLgR3EjNCVtYBg9vGl/Gagw8c0NyUiijYe8qsb8/sBB
 uofzl4ZUDnWMo6s4E3vpz2RCFXBMcnpM7HieB4h0mO5gW4Jg4mkEN1nUHqvg7bBSxhhJ
 y1P23LOq04wDl9Om4fIKlR3yaEvQXZKiAOYBBaYrfkNCzbJHDwG/BoP2NlRBLGoZbW3r
 iDr7u5KmRQ7z58xect6Yuk26gWwqyVHaRqu/DYhuDi6wipM2lpZkNtamMAROxmhtFNJV
 vkif0TOhh4N0xv3CtbsfReHvAaVg5qkfKMB/ZsHjVVoFyeJDlXqs2NZF66IHx6voEjid
 rr2Q==
X-Gm-Message-State: AC+VfDyzXwIrOXSDNXl3wh+gISk/A/zkn3P5/XWYOFwP2Xvg2acDnnyI
 Q1yFP8pn3XBviaDEYJQlDvohEw==
X-Google-Smtp-Source: ACHHUZ5NYcIuw2v2H/oXDL7QaBofJ/TuFZA5JC1GbnEyNApzUjEMsEuuT/V58BzXAfTwoZr0wJLkcw==
X-Received: by 2002:a05:600c:2256:b0:3f1:7848:6740 with SMTP id
 a22-20020a05600c225600b003f178486740mr9184172wmm.8.1684822330351; 
 Mon, 22 May 2023 23:12:10 -0700 (PDT)
Received: from localhost.localdomain
 (vil69-h02-176-184-48-94.dsl.sta.abo.bbox.fr. [176.184.48.94])
 by smtp.gmail.com with ESMTPSA id
 h19-20020a05600c28d300b003f427cba193sm13674971wmd.41.2023.05.22.23.12.08
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 22 May 2023 23:12:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-trivial@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/4] hw: Minor simplifications using proper QOM getter macros
Date: Tue, 23 May 2023 08:12:03 +0200
Message-Id: <20230523061207.48818-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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
X-List-Received-Date: Tue, 23 May 2023 06:12:17 -0000

Enforce QOM style. Besides, using the proper QOM macros
slightly simplifies the code.

Philippe Mathieu-Daudé (4):
  hw/core/cpu: Simplify realize() using MACHINE_GET_CLASS() macro
  hw/i386/microvm: Simplify using object_dynamic_cast()
  hw/pci/pci: Simplify pci_bar_address() using MACHINE_GET_CLASS() macro
  hw/usb/hcd-ehci-pci: Simplify using DEVICE_GET_CLASS() macro

 hw/core/cpu-common.c  | 3 +--
 hw/i386/microvm.c     | 3 +--
 hw/pci/pci.c          | 4 +---
 hw/usb/hcd-ehci-pci.c | 2 +-
 4 files changed, 4 insertions(+), 8 deletions(-)

-- 
2.38.1


