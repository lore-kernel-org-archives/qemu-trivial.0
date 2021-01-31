Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l6HjW-0002FV-Uc
	for mharc-qemu-trivial@gnu.org; Sun, 31 Jan 2021 13:46:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6Hin-0001yc-Vw; Sun, 31 Jan 2021 13:45:22 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:39522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6Him-0007c5-Lv; Sun, 31 Jan 2021 13:45:17 -0500
Received: by mail-wm1-x32a.google.com with SMTP id u14so11322068wmq.4;
 Sun, 31 Jan 2021 10:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dNCf/fnSg4i/RlVqvC4tpeAa/bGn7I/5i5RyvqlkfeM=;
 b=fm19mkj0jseLfnTszAPO7p6gj1tm7wIOqL2VuFSCAIXWsbmSABwfpdKaz1VQ7gGPCk
 bjlBOwASltuCQ971kuwmkacU5564b9IXM5DqZJdil7kFc2Vmuvfsi6L1rab8ZWhpYpCo
 c0GHQtk9OXdVI9sd9gZKb2MblWu6psSPGfZ9c+M9sRMOcLIe6KX+/751+j+KvKO61pEw
 knfG+Hl1uH4wWoBJDhq4bThOxBRssJ0VuQ7PIybgAoxKPg98r+wadKZg1GfQ6vAKKlRc
 2Lc8BPAiH9MN9SZAGp7dJRTBgZP/Ja0680mOdGM/THHmeHu+TRqJPz7ayCpv/SzVrf/B
 hJwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=dNCf/fnSg4i/RlVqvC4tpeAa/bGn7I/5i5RyvqlkfeM=;
 b=C8GCurOFdp9TX8jAQZhNLWhYghGgN51fzUAKDVUhj6jr/Urq3R6P4a1JLpb/uQZEri
 J/0VC1VcjxNW74ZpdEaupY9P4sQnabZly47NNQNJPY0GaFHzmu8oQFE0jtck6FWNnE/f
 Xr7TEk/pCqJ3Y1CJ5kAVaK1u1xwgcICDmf7feIy2rdfWe2bGulB30vmtXJFwwgb7457d
 H3q1lbrxI1Hxzf2oHj4cm9chMSVSlz3QtrAV79vEGKE3IHBBQFB3IE09+LmbXqoxlWF9
 Pdl5t7hCYPHuwcO6hOkjMNzQi6zHXWtCr/CUKZEpHZ3WSxY7DCBihEjxM4wvMzT5szCN
 OODw==
X-Gm-Message-State: AOAM532Kb5v3Jxx5eDBn2gbOjK/v8LU34ZpYtcM8LYYGZiGusird6OQh
 LBIaB741Pi8BS1X8mWLODggh2OSOgKk=
X-Google-Smtp-Source: ABdhPJxvohrFT03xquIXL3mgZHbueGWaf183+KT7lJtfXbBT3NpbMWwjJQhNLgDJR/6Dh98B8OuJ+w==
X-Received: by 2002:a1c:65d5:: with SMTP id z204mr6641246wmb.184.1612118713233; 
 Sun, 31 Jan 2021 10:45:13 -0800 (PST)
Received: from localhost.localdomain (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id b18sm23653374wrm.57.2021.01.31.10.45.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jan 2021 10:45:12 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Niek Linnenbank <nieklinnenbank@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Michael Tokarev <mjt@tls.msk.ru>,
 qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
 Alistair Francis <alistair@alistair23.me>, qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: [PATCH v3 4/6] hw/arm/xlnx-versal: Versal SoC requires ZynqMP
 peripherals
Date: Sun, 31 Jan 2021 19:44:47 +0100
Message-Id: <20210131184449.382425-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210131184449.382425-1-f4bug@amsat.org>
References: <20210131184449.382425-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
X-List-Received-Date: Sun, 31 Jan 2021 18:45:44 -0000

The Versal SoC instantiates the TYPE_XLNX_ZYNQMP_RTC object in
versal_create_rtc()(). Select CONFIG_XLNX_ZYNQMP to fix:

  $ make check-qtest-aarch64
  ...
  Running test qtest-aarch64/qom-test
  qemu-system-aarch64: missing object type 'xlnx-zynmp.rtc'
  Broken pipe

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Cc: Alistair Francis <alistair@alistair23.me>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
---
 hw/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 09298881f2f..be017b997ab 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -364,6 +364,7 @@ config XLNX_VERSAL
     select VIRTIO_MMIO
     select UNIMP
     select XLNX_ZDMA
+    select XLNX_ZYNQMP
 
 config NPCM7XX
     bool
-- 
2.26.2


