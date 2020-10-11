Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kRhLj-00032j-2x
	for mharc-qemu-trivial@gnu.org; Sun, 11 Oct 2020 15:49:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kRhLc-0002z9-Rg; Sun, 11 Oct 2020 15:49:38 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:45115)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kRhLZ-0000Hz-Em; Sun, 11 Oct 2020 15:49:35 -0400
Received: by mail-wr1-x441.google.com with SMTP id e17so16582133wru.12;
 Sun, 11 Oct 2020 12:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JY3Ndr1SwLa4aQQZxdcgHQ230u1S4q1Vxx6foe4GpMc=;
 b=b5U728+2oqLyxZLK4gVj4hJFF5c7HoW2X5d0QI2a87MHPnJgyvbKCwWg8T53YDnYO7
 KjIgq/5JFyG0MP5wq7hPVoPsYn4moSSjhsha7EpKdldGOrhmmhvL2uzFc8buzf9qGKRI
 GjDSJCoiqrYM/+ChzcaJeyQ5965bSm8S0KR2iOM+1FbiKTntdQoOd4CrBxdzo/wuuSFs
 Qvx1VW69GKaxcgxgM1RmZNd6E51sagjsNXFhE+vLpEyn6VnPSZwmjClikToWDlsnR5Rj
 kIIuk65udgF1FRQzqHUR4nEJ0lgbU/ANVyeLdDkYfKv/xKdeSiY1zHgNeilymXP25Kt1
 lWSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=JY3Ndr1SwLa4aQQZxdcgHQ230u1S4q1Vxx6foe4GpMc=;
 b=kwqtw+tBcBT+ygASApoUBPyoU+R/G3CvPpxXHWyN7xicpQyCYMf/vZlMnhwnaNLcZN
 /DzMqoZayQutH70CttUKzRW4OnC/v0MWnhdvSlRuTv8OAkxj+EWW2lkGtjbuI9chWF3P
 aaKrtz1X0fv15n2ysWCz496COzU1TG62rImqHm4iPrc+/RwRSCT0qCo2/DKM8H2ITvxY
 j/Iei4PVcFtKci5K7s7OOMq+jEw68fiaOWXMuojvSEwm+yNyvP1f8aoq46WECiPXmGxF
 tjZGpZW2POHMao+qzWKmR0Rrs6RyfaMa20NE7w+BbnCR1NTMCavpTHOm0HR61i7qcqXt
 QsRA==
X-Gm-Message-State: AOAM5309QbNYX8niMqNE1d9Rwca1qupmQ24rUc1wvKrV9XbX9+fEhFe+
 PO40fhdhwf2XQnnWhMbWEXL7xYFivDY=
X-Google-Smtp-Source: ABdhPJxhe4c/Rrv2QOxu3KWA6WEA0ZbB+4sMM43H46rAAHhqNpE96oGJiyinUINbzNT8ZV8E1p7JSw==
X-Received: by 2002:a5d:4282:: with SMTP id k2mr24940583wrq.270.1602445770381; 
 Sun, 11 Oct 2020 12:49:30 -0700 (PDT)
Received: from localhost.localdomain
 (106.red-83-59-162.dynamicip.rima-tde.net. [83.59.162.106])
 by smtp.gmail.com with ESMTPSA id i33sm23103929wri.79.2020.10.11.12.49.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Oct 2020 12:49:29 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 qemu-trivial@nongnu.org
Subject: [PATCH 2/4] hw/pci-host/pam: Use ARRAY_SIZE() instead of magic value
Date: Sun, 11 Oct 2020 21:49:16 +0200
Message-Id: <20201011194918.3219195-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201011194918.3219195-1-f4bug@amsat.org>
References: <20201011194918.3219195-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
X-List-Received-Date: Sun, 11 Oct 2020 19:49:40 -0000

Replace the magic '4' by ARRAY_SIZE(mem->alias) which is more explicit.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/pci-host/pam.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/pci-host/pam.c b/hw/pci-host/pam.c
index a4962057833..4712260025a 100644
--- a/hw/pci-host/pam.c
+++ b/hw/pci-host/pam.c
@@ -51,7 +51,7 @@ void init_pam(DeviceState *dev, MemoryRegion *ram_memory,
                              start, size);
 
     memory_region_transaction_begin();
-    for (i = 0; i < 4; ++i) {
+    for (i = 0; i < ARRAY_SIZE(mem->alias); ++i) {
         memory_region_set_enabled(&mem->alias[i], false);
         memory_region_add_subregion_overlap(system_memory, start,
                                             &mem->alias[i], 1);
-- 
2.26.2


