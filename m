Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1q1LGW-0000Lc-Kz
	for mharc-qemu-trivial@gnu.org; Tue, 23 May 2023 02:13:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q1LFw-000050-R8
 for qemu-trivial@nongnu.org; Tue, 23 May 2023 02:12:28 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q1LFv-0005H2-7c
 for qemu-trivial@nongnu.org; Tue, 23 May 2023 02:12:24 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3f603ff9c02so13953315e9.2
 for <qemu-trivial@nongnu.org>; Mon, 22 May 2023 23:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684822341; x=1687414341;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rQwCIhldMwC77ntdeaeg6sH3aScyUcbooXBZJsXEYow=;
 b=Yeb5fJ899eSOVzWUQqQyU1B7T8QMepA6aHQyF0ZqFxmvauCEok2oxk7EnRoPf4eW63
 ewHT8q/aPGmJM01UU54a5byzgyodo1ERoDAl6wn4WKTmB2L3nFSo6aLlFS08AcHXpWu8
 ZRFfHVTj7whIlD2+v/Abh7+bW9DJr9zV01nxlLtUWViDo5YzYBV30uC6j0aLh837X4F3
 xzTZAjyur9422cT00+ama/ZqWVJ5dOjbI2xaKzEbdqCl+OVHtAuYZuvqcWeF1YT1iesb
 Yqbi4fXITwtnVKnFI1DM34dBtrTE/dCh6AJx8rrcRwMkB2xapEyApiEYnBGaVhwwJlvD
 rMjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684822341; x=1687414341;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rQwCIhldMwC77ntdeaeg6sH3aScyUcbooXBZJsXEYow=;
 b=P3/tqYL40Stt2fIEey1FqJOfoTKrdzuvtwzzWO/eDr9ng5ZnZu3F2ONDWdiqrl92G+
 e/oNiNuZ246bGt9HcnVw+JeT3EQFQp02fbsD5k3MM8LoSQSBHJQt9CFYAMIhcB8S5hlZ
 xqE0OSmxqqBg+nzzjGkvKji/ol4g8ExUIZ8eZJ4rj9vqyjxGoDaKAx9pL4GP8PsIDnIN
 BZ1qGNMMLu85V3Es/trEoMhVxNQN5jYordyNdMBLYmzRigiLjboMUKuekuR5ytSNh4U/
 Gyobxyj8v1y+5y90xlLJCGw3k6a7V/llrdTgQHPCQXICLxSVFTWuEYwQ9DSgiUpuJSQI
 S0LQ==
X-Gm-Message-State: AC+VfDwNUStrYGRt5pvdUXsnTcSSItwLBt7nN228cdk9lSaqoaXxLfd+
 PLo/DYHZxR87ev1mzsDI5EtdCw==
X-Google-Smtp-Source: ACHHUZ7X2Bpdi24QntO1VaFfirz/g7xOAk27Evvm0MohxWlFyE/F/I3i3sSkHCt4edBu6sMmsDbARg==
X-Received: by 2002:a7b:c8cb:0:b0:3f6:2d8:4823 with SMTP id
 f11-20020a7bc8cb000000b003f602d84823mr5043528wml.3.1684822341801; 
 Mon, 22 May 2023 23:12:21 -0700 (PDT)
Received: from localhost.localdomain
 (vil69-h02-176-184-48-94.dsl.sta.abo.bbox.fr. [176.184.48.94])
 by smtp.gmail.com with ESMTPSA id
 n16-20020a1c7210000000b003f6042d6d92sm5888628wmc.46.2023.05.22.23.12.20
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 22 May 2023 23:12:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-trivial@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 2/4] hw/i386/microvm: Simplify using object_dynamic_cast()
Date: Tue, 23 May 2023 08:12:05 +0200
Message-Id: <20230523061207.48818-3-philmd@linaro.org>
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
X-List-Received-Date: Tue, 23 May 2023 06:12:29 -0000
X-List-Received-Date: Tue, 23 May 2023 06:12:29 -0000

Use object_dynamic_cast() to determine if 'dev' is a TYPE_VIRTIO_MMIO.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i386/microvm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index 3d606a20b4..7227a2156c 100644
--- a/hw/i386/microvm.c
+++ b/hw/i386/microvm.c
@@ -389,9 +389,8 @@ static void microvm_fix_kernel_cmdline(MachineState *machine)
     bus = sysbus_get_default();
     QTAILQ_FOREACH(kid, &bus->children, sibling) {
         DeviceState *dev = kid->child;
-        ObjectClass *class = object_get_class(OBJECT(dev));
 
-        if (class == object_class_by_name(TYPE_VIRTIO_MMIO)) {
+        if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MMIO)) {
             VirtIOMMIOProxy *mmio = VIRTIO_MMIO(OBJECT(dev));
             VirtioBusState *mmio_virtio_bus = &mmio->bus;
             BusState *mmio_bus = &mmio_virtio_bus->parent_obj;
-- 
2.38.1


