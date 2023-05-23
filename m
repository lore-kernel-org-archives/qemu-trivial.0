Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1q1LGT-0000Ic-PA
	for mharc-qemu-trivial@gnu.org; Tue, 23 May 2023 02:12:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q1LG2-00007Z-5l
 for qemu-trivial@nongnu.org; Tue, 23 May 2023 02:12:34 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q1LG0-0005HW-Iq
 for qemu-trivial@nongnu.org; Tue, 23 May 2023 02:12:29 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3f509ec3196so29322325e9.1
 for <qemu-trivial@nongnu.org>; Mon, 22 May 2023 23:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684822347; x=1687414347;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=COK8ArK9HCGV7dddfTJnezNiZomsbkwCtC2egyZo1Mg=;
 b=Yq3/SmwS4ficbNhmaVHY92cqgGJxycWoEDAN0RmwiKiWSlLO2G22aYs++YYfZdxd1Z
 mRgkISUri+Q6vwNFoV4CYDXTJXHWLLPeG9zXLop/2FzB0bLmALSYLYmxpoKfHkEVd05f
 rh5MispZtv2jMlgniLg1sJTmqtsQ+2Sh8ICUmCcBvDelVFZ9IUqXqjvc5Av/rhyvDGXA
 CHJEk3sIAwnvYT65vAWpLb9zWU1oOs1gdUpxzodcQN2uJr6dVnUoUKq2rMNfc5YkbgEE
 B45v1bDoJ6HXvoKyVkyAjk3TEKW8NW6bZZ6yv9jW8kPC7+v/yJaiSv5vdI/qvSJ0ObaE
 WdTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684822347; x=1687414347;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=COK8ArK9HCGV7dddfTJnezNiZomsbkwCtC2egyZo1Mg=;
 b=gFnRW0SD1yKkA0CdD0Up5dSVbAEB8/clsJxwDujuy8F+iNYCs9vSvgHNWgkWcpgVyL
 8BElkR07FJzKI7yn5F/iLxoqymhHBXSPJkJjEBIdsUhBoqXxO0okKpsmevlKs1XI6BeV
 fxGNbp+hgHx+g1SqvB1+Dfr82aEcDnU3XCWoC4NAGNLo6sj3JSp9j1RiTqKoJ2uC7RcA
 SdUbqPHkQzBsglmf2Qloj0eI2pVyV5p5XAT3SwvHzWdFTKINFBOTm5GfgXm7vKUf8rN9
 zgeaI24AqWOrzmigO19PGfMRimSc1DUCm9o1b1SrcBQwa0X58yx9DyaPA7yj2MFGF56P
 CkUg==
X-Gm-Message-State: AC+VfDzavNwVkLXex1GNIJGh0/CckZSrWd4nuvEV4lIhjTBp457psLVi
 JxRQj5mvzcLrXP9MNUwq8kj79Q==
X-Google-Smtp-Source: ACHHUZ4NNg4+HRofy0XfFyG51ERFZNsg+mUP1EW8DabtBX+aOHR9k5C5wE/nZXBq9uXfU1sBpUdHKA==
X-Received: by 2002:a5d:4204:0:b0:307:7d1a:20fd with SMTP id
 n4-20020a5d4204000000b003077d1a20fdmr10396367wrq.12.1684822347356; 
 Mon, 22 May 2023 23:12:27 -0700 (PDT)
Received: from localhost.localdomain
 (vil69-h02-176-184-48-94.dsl.sta.abo.bbox.fr. [176.184.48.94])
 by smtp.gmail.com with ESMTPSA id
 o9-20020adfeac9000000b0030647d1f34bsm10031319wrn.1.2023.05.22.23.12.25
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 22 May 2023 23:12:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-trivial@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 3/4] hw/pci/pci: Simplify pci_bar_address() using
 MACHINE_GET_CLASS() macro
Date: Tue, 23 May 2023 08:12:06 +0200
Message-Id: <20230523061207.48818-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230523061207.48818-1-philmd@linaro.org>
References: <20230523061207.48818-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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
X-List-Received-Date: Tue, 23 May 2023 06:12:36 -0000

Remove unnecessary intermediate variables.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/pci/pci.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 1cc7c89036..a2cb6071cb 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -1444,9 +1444,7 @@ pcibus_t pci_bar_address(PCIDevice *d,
 {
     pcibus_t new_addr, last_addr;
     uint16_t cmd = pci_get_word(d->config + PCI_COMMAND);
-    Object *machine = qdev_get_machine();
-    ObjectClass *oc = object_get_class(machine);
-    MachineClass *mc = MACHINE_CLASS(oc);
+    MachineClass *mc = MACHINE_GET_CLASS(qdev_get_machine());
     bool allow_0_address = mc->pci_allow_0_address;
 
     if (type & PCI_BASE_ADDRESS_SPACE_IO) {
-- 
2.38.1


