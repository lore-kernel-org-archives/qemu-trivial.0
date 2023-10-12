Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qqn42-0002mg-N4
	for mharc-qemu-trivial@gnu.org; Thu, 12 Oct 2023 00:12:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qqn40-0002ck-8l
 for qemu-trivial@nongnu.org; Thu, 12 Oct 2023 00:12:44 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qqn3y-0002Wk-0i
 for qemu-trivial@nongnu.org; Thu, 12 Oct 2023 00:12:43 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-51e28cac164so3520007a12.1
 for <qemu-trivial@nongnu.org>; Wed, 11 Oct 2023 21:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697083960; x=1697688760; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wqMnVC1PNKuiV5TnLAY6KW9Wm93FzcifyJIT73HOIHo=;
 b=QyPoAXWJZNs+ub+68n6H+EN3dHs61MfHRfxfrsJtVL/nLI8YY0B8sUS3T7A/dFFv5H
 Eu00WehaL0iTGpXb5uN5E7Etb8oKT46z+4Zl7XEiDYHSWrsqS70eb89zvodaQ+SuE7nT
 EzeUdsYesgg2aAhpS43y3dwtx6ong3TOwwwZtNqxW6EYeKibe8yYRpdlOGsLpprqTqIG
 AJ06EhvZffnfoMU67wHt36rj/DuQqSyPNo2OB8K6d/l8WNPS8orWHGUOrB08U3xxDj+6
 gmDuF/J5hlmlr3/cNDEy8HvTYdKl7zyW09s2VZNLqvul7+Q5ACCto2LeHMS+6eR+mYIK
 DtvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697083960; x=1697688760;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wqMnVC1PNKuiV5TnLAY6KW9Wm93FzcifyJIT73HOIHo=;
 b=O+Ky4LxGqZPihv29hDSuqmPPWvribaAY782zVNG0Jmp8/Y2ik3xCw2UJz1vPskEYpR
 5s82MFQYzj26J27klO2GaKMXeQeLSK0mcEGD71r3W7i1tDeAieKXf1n7Ym4WGc8/sMzQ
 tB1T+FwF6miTND9zGovSBMdd+HoCnHqMRWbzev6Z4W9IErFshundJhYXat15j9tamVzU
 LgnWqrVVPSzl4wpjhS+8eLiaGK6Oziw9zqVtf8a5bDgktnQrqI0Z+U8cjfNCM3y2k6LB
 ORndppbCz6RJivr00MWBCm1B+7cDd/sE/jye5+7owQdR+h3M5uOwn0AQKFUXnr5v3tQ3
 6Y4g==
X-Gm-Message-State: AOJu0YwOBZIA7qcqiSYTllFaDox08p5UaUBPkZkKxn9P9GLzydc87i9/
 r1pp0I6VTpENL2A6EAdBKoH2Fw==
X-Google-Smtp-Source: AGHT+IH43do4K+sJQSa+lfIAD3X/J9faqSAF4SQjrnftfstyMY311YsVWbF+M+fLpyqH2ZMQeK2BZA==
X-Received: by 2002:a05:6402:40c1:b0:527:1855:be59 with SMTP id
 z1-20020a05640240c100b005271855be59mr16549831edb.3.1697083959580; 
 Wed, 11 Oct 2023 21:12:39 -0700 (PDT)
Received: from m1x-phil.lan (dcs23-h01-176-173-173-31.dsl.sta.abo.bbox.fr.
 [176.173.173.31]) by smtp.gmail.com with ESMTPSA id
 bf14-20020a0564021a4e00b005362bcc089csm9417447edb.67.2023.10.11.21.12.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 11 Oct 2023 21:12:39 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>, qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/3] hw/pci-host/sh_pcic: Style cleanup
Date: Thu, 12 Oct 2023 06:12:34 +0200
Message-ID: <20231012041237.22281-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 12 Oct 2023 04:12:44 -0000

- Use QOM DEFINE_TYPES
- Rename few functions
- Replace magic value by definition

Philippe Mathieu-Daudé (3):
  hw/pci-host/sh_pcic: Declare CPU QOM types using DEFINE_TYPES() macro
  hw/pci-host/sh_pcic: Correct PCI host / devfn#0 function names
  hw/pci-host/sh_pcic: Replace magic value by proper definition

 hw/pci-host/sh_pci.c | 57 ++++++++++++++++++++------------------------
 1 file changed, 26 insertions(+), 31 deletions(-)

-- 
2.41.0


