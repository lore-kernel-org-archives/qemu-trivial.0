Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kD3ie-0004Vw-28
	for mharc-qemu-trivial@gnu.org; Tue, 01 Sep 2020 06:40:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kD3ic-0004VC-NG; Tue, 01 Sep 2020 06:40:50 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:40848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kD3ib-0001rU-8i; Tue, 01 Sep 2020 06:40:50 -0400
Received: by mail-wm1-x343.google.com with SMTP id v4so659720wmj.5;
 Tue, 01 Sep 2020 03:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AS9iE5jICxt728QvQddccBLJxmpLmZSe3J8QH1ar4ec=;
 b=pWbeLGIUG6DEWzohVYh0R3MPCT/wYTFQff8wIJt3ANIJTFzgkRIqJC76+yYfXX0DRK
 ap7/sLZ/97/yXBAfeUbeNHqICanWYLTYZFr17HHBGcspdXfa0XD6mR6sDw+mgE9811Xc
 Ol29xXEj1U1lAGw+xO59p/bQYP5N7tPaKgDz6ZiZ/OV6oBVC9e3cStMJKRrZaDhicctI
 k9/Ll0ktPxTtAIVp2pXE8sD2OoV1KWAAn7dP72jlpSpgLkKUDafpph0nnjIR517RSsdY
 6RkCeaE2eYMBYDr3QT7lU9DHBf7W9hMfF0LkV0ui3R3rBF8q1/GwmeTkvXa7tQGBztip
 VhFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=AS9iE5jICxt728QvQddccBLJxmpLmZSe3J8QH1ar4ec=;
 b=ImbQdPNQtQ5pApZMlW2Gym4w/JNp5NNYJXoSheaVQf/rDF9le72Dzhgzb+W9iTHvG9
 WKs5Tck2xD5p+NtpOdbUHbFMKJKFs5BfTV5wwrSMYuNK4QNikAxkU156fAtpdqgkaURV
 VwDvqq/oqF+Y6HN80rxTLptFzZqBYaK5FwycBbXUKAwRkCTK2hIYGEpQ075cC0vHaqxd
 NBMzzZ/15eKGN9eVW7cbZREr03v05HTyXg+Xay10e3Yv5kf7joPNwIZLuWEzbhuGZALe
 CNiiN0wfH51pCh2djtMOvY1VB0n6Uwo+qLbGZKtfA3M3uSkGpGxdVvqJibexAnaRa+x2
 kkIw==
X-Gm-Message-State: AOAM531sn+BqZj2X8M4b+L5+qno1f05d9Pje2r+AYfMnVq1SW6XSOuTd
 tq8u+KHZrtCzLgDrl8l2cOmce11vJMo=
X-Google-Smtp-Source: ABdhPJy+00Mwj/k3JHchfxDpB++xNiiepqxnw7B4l6xczQWOmbmg4x59eB4/MknpCMdSKMesvbnygA==
X-Received: by 2002:a1c:4187:: with SMTP id o129mr1107714wma.113.1598956846547; 
 Tue, 01 Sep 2020 03:40:46 -0700 (PDT)
Received: from localhost.localdomain (50.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.50])
 by smtp.gmail.com with ESMTPSA id o9sm1541461wrw.58.2020.09.01.03.40.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2020 03:40:45 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Andrzej Zaborowski <balrogg@gmail.com>, Huacai Chen <chenhc@lemote.com>,
 qemu-trivial@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 0/5] hw: Replace some impossible checks by assertions
Date: Tue,  1 Sep 2020 12:40:38 +0200
Message-Id: <20200901104043.91383-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
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
X-List-Received-Date: Tue, 01 Sep 2020 10:40:51 -0000

Trivial patches removing unreachable code.

Philippe Mathieu-Daudé (5):
  hw/gpio/max7310: Remove impossible check
  hw/mips/fuloong2e: Convert pointless error message to an assert()
  hw/ppc/ppc4xx_pci: Use ARRAY_SIZE() instead of magic value
  hw/ppc/ppc4xx_pci: Replace pointless warning by assert()
  hw/isa/isa-bus: Replace hw_error() by assert()

 hw/gpio/max7310.c   | 4 ----
 hw/isa/isa-bus.c    | 9 ++-------
 hw/mips/fuloong2e.c | 5 +----
 hw/ppc/ppc4xx_pci.c | 8 +++-----
 4 files changed, 6 insertions(+), 20 deletions(-)

-- 
2.26.2


