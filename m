Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jFcaG-0000FQ-Dt
	for mharc-qemu-trivial@gnu.org; Sat, 21 Mar 2020 07:46:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34454)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jFcaE-0000EX-7W
 for qemu-trivial@nongnu.org; Sat, 21 Mar 2020 07:46:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jFcaC-0006Gx-Rz
 for qemu-trivial@nongnu.org; Sat, 21 Mar 2020 07:46:29 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:45389)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jFcaC-0006Ge-Ne
 for qemu-trivial@nongnu.org; Sat, 21 Mar 2020 07:46:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584791188;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=H/kvBiPyxCh595bpD+FYmGkaOOWay12gFZX+EGKqT6I=;
 b=MK282tFuILqCW9uBZTiJ9UmKJep/iJrOqYIhu3bjL+KwG1pTbI+zvcPhhDDZZNdYEB2HdU
 V/6zBSA8qMZXp02EVDdePaawTl5JEP8wBt/GJNYdaoqZSdOfYgC3JjLpOGcXKwFvKYuSUo
 hz5GQaYoE67V4MboctMwEcD026oVjc8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-91-aOwVOnh1P3-7hhXwlpazKQ-1; Sat, 21 Mar 2020 07:46:26 -0400
X-MC-Unique: aOwVOnh1P3-7hhXwlpazKQ-1
Received: by mail-wr1-f69.google.com with SMTP id p2so4173869wrw.8
 for <qemu-trivial@nongnu.org>; Sat, 21 Mar 2020 04:46:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9dXP4N8TyULZAzjZYqxK/uANHHgjWwDCR4io6WeB96U=;
 b=ZLouHR6hPJFsRYI504ukkMfrn5XTMTqPNfuEh4nb6nAYzK0j7I00T/LlmfyihkchL5
 KpT0BqQA5wCU5IEQ1LwePSKxFPXvQSPX2idHZ8bFMbBQd4eG0tUtJmxNIu8gnIHEwGAW
 CZNAf5KdXVAxvDyUpmuJaOG0KHTAeFUjJoqtfwzX79dTqGEw5WBqioa3wQcZLFFKRJiR
 099Alb4u4o7Q400T8SrzIpJzZfsj56dIB/BhkklpT4FDnQuCtX26V6Erx65+JdDWXpTO
 WLS8r9yC/Wk9vl4WNIduBCECgJ7KIs4exhBL0AAjpd//qth2kIi1n69yx+4avV9j6/3o
 ceZA==
X-Gm-Message-State: ANhLgQ0G9r1QkZmKxMIOPlOY1x1jhS4Uis5yFDjBB19udfo5D9kVv9OQ
 uNZkRU/rRv9wCapSrEEyj6SlVM/lixdROxiwWDvZ3vqUYDYEhs0HbNyHFEbMOMMbres+pFsn//4
 q/72/6zZ/mRn6j1AhKQ==
X-Received: by 2002:a7b:c5d9:: with SMTP id n25mr16445017wmk.160.1584791185176; 
 Sat, 21 Mar 2020 04:46:25 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsSWCMAhwipawfBMfkPl4+F8HWrgcbof15lyslD5n9fBr4SnAzQxKtSsuZj7e5L0nZTE/KW3g==
X-Received: by 2002:a7b:c5d9:: with SMTP id n25mr16444963wmk.160.1584791184820; 
 Sat, 21 Mar 2020 04:46:24 -0700 (PDT)
Received: from localhost.localdomain (37.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.37])
 by smtp.gmail.com with ESMTPSA id d21sm12882125wrb.51.2020.03.21.04.46.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Mar 2020 04:46:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 BALATON Zoltan <balaton@eik.bme.hu>, Andrew Jeffery <andrew@aj.id.au>,
 Andrzej Zaborowski <balrogg@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Fam Zheng <fam@euphon.net>, qemu-trivial@nongnu.org,
 Max Reitz <mreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 qemu-ppc@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Kevin Wolf <kwolf@redhat.com>, Joel Stanley <joel@jms.id.au>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH-for-5.0 00/11] misc: Trivial static code analyzer fixes
Date: Sat, 21 Mar 2020 12:46:04 +0100
Message-Id: <20200321114615.5360-1-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 216.205.24.74
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
X-List-Received-Date: Sat, 21 Mar 2020 11:46:31 -0000

Fix trivial warnings reported by the Clang static code analyzer.

Philippe Mathieu-Daud=C3=A9 (11):
  block: Remove dead assignment
  blockdev: Remove dead assignment
  hw/i2c/pm_smbus: Remove dead assignment
  hw/input/adb-kbd: Remove dead assignment
  hw/ide/sii3112: Remove dead assignment
  hw/isa/i82378: Remove dead assignment
  hw/gpio/aspeed_gpio: Remove dead assignment
  hw/timer/exynos4210_mct: Remove dead assignments
  hw/timer/stm32f2xx_timer: Remove dead assignment
  hw/timer/pxa2xx_timer: Add assertion to silent static analyzer warning
  hw/scsi/esp-pci: Remove dead assignment

 block.c                    | 2 +-
 blockdev.c                 | 2 +-
 hw/gpio/aspeed_gpio.c      | 4 ++--
 hw/i2c/pm_smbus.c          | 1 -
 hw/ide/sii3112.c           | 2 +-
 hw/input/adb-kbd.c         | 1 -
 hw/isa/i82378.c            | 8 ++++----
 hw/scsi/esp-pci.c          | 1 -
 hw/timer/exynos4210_mct.c  | 3 ---
 hw/timer/pxa2xx_timer.c    | 1 +
 hw/timer/stm32f2xx_timer.c | 1 -
 11 files changed, 10 insertions(+), 16 deletions(-)

--=20
2.21.1


