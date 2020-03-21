Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jFfJR-0004Mp-5y
	for mharc-qemu-trivial@gnu.org; Sat, 21 Mar 2020 10:41:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59504)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jFfJP-0004MZ-Aw
 for qemu-trivial@nongnu.org; Sat, 21 Mar 2020 10:41:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jFfJO-000787-2j
 for qemu-trivial@nongnu.org; Sat, 21 Mar 2020 10:41:18 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:26816)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jFfJN-00077e-Uz
 for qemu-trivial@nongnu.org; Sat, 21 Mar 2020 10:41:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584801677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=XjYHy8EAEyVWWAj6PcQzbMtUCcBiHqB3U8PD6B93nsg=;
 b=gUY9TuDrSYZVkbv1dzU1rk48ojq277pAiqH0bsb7Oq7IJVDttsWQfzVXt+Z4jcfv9gYQBd
 Wrt7smv8RQi70i1qPDKJh9T4310ow3kX5h+P3RKqsw6GDM881yiep017fBjxYUjb4de7GW
 3jDvFpIV5OrOgqOmUECVKpL2cSF57nk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-TEA1aTnkOxavlkDsQJNeew-1; Sat, 21 Mar 2020 10:41:15 -0400
X-MC-Unique: TEA1aTnkOxavlkDsQJNeew-1
Received: by mail-wm1-f69.google.com with SMTP id 20so3119873wmk.1
 for <qemu-trivial@nongnu.org>; Sat, 21 Mar 2020 07:41:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VXdFqIF/MgdCDNguoL8cH2BaYWlik8rbXVsmqvrTHJE=;
 b=njGTS3Xa7o+/tjG3zxyrcHq/G0myN0Xx84GV2vP+1g2qCANXuAw9aUpK4QFzhS2xqP
 ik8HEJwpIoV015mF6ge7WGRM9l5L3P65PMj8tgVnGa94gIl+Fmw7eEfRkeHL42FtZOgT
 Qydjkp7gAa8gHs2i9u45WNU64zToha98ew6kQ7KP33G1zcMMifFT5TwrVsx2crLwSQa+
 j4nZmd/TyewLQW/MCnEJMWZZOTwA49gHbSA9hdNCda/4zllYWtWPW+XXjysFQwFZYOnN
 Axd3AfwxHJ5hwUvPDkdNrnrPuffOhHCz92Kn/fF+VUoGBBcMg2+nfHYcLV7UvY5K7UyD
 WqLw==
X-Gm-Message-State: ANhLgQ2pr292N7ryIqbcuAaLI/kPBIpbw6gce4W1Pp5tEt8xzLlfbXBu
 WaNbbM4zn1thx8YZQ6ZC+/Nd5GDoI5c7r6n1dnNpQN+VcjeZywKvg3HtnnsRqL8XtA8TTmE5yMp
 4zUE0u7VhvLZ0aSYpLg==
X-Received: by 2002:a7b:c0cf:: with SMTP id s15mr17311421wmh.106.1584801674425; 
 Sat, 21 Mar 2020 07:41:14 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vv6uMxgkNcpJBwBUlvjZaxH1fKsb/YKC4A6BQiDtHKspDaLkC4B04qIib2r3hYSSDAFWI+oXg==
X-Received: by 2002:a7b:c0cf:: with SMTP id s15mr17311376wmh.106.1584801674111; 
 Sat, 21 Mar 2020 07:41:14 -0700 (PDT)
Received: from localhost.localdomain (37.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.37])
 by smtp.gmail.com with ESMTPSA id n2sm13181619wrr.62.2020.03.21.07.41.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Mar 2020 07:41:13 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-ppc@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>, Markus Armbruster <armbru@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Max Reitz <mreitz@redhat.com>,
 Andrzej Zaborowski <balrogg@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
 Alistair Francis <alistair@alistair23.me>, Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>, qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH-for-5.0 v2 00/11] misc: Trivial static code analyzer fixes
Date: Sat, 21 Mar 2020 15:40:59 +0100
Message-Id: <20200321144110.5010-1-philmd@redhat.com>
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
X-List-Received-Date: Sat, 21 Mar 2020 14:41:20 -0000

Fix trivial warnings reported by the Clang static code analyzer.

Since v1:
- Addressed Markus/Zoltan/Aleksandar review comments

Philippe Mathieu-Daud=C3=A9 (11):
  block: Avoid dead assignment
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
 hw/gpio/aspeed_gpio.c      | 2 +-
 hw/i2c/pm_smbus.c          | 1 -
 hw/ide/sii3112.c           | 5 +++--
 hw/input/adb-kbd.c         | 6 +-----
 hw/isa/i82378.c            | 8 ++++----
 hw/scsi/esp-pci.c          | 1 -
 hw/timer/exynos4210_mct.c  | 3 ---
 hw/timer/pxa2xx_timer.c    | 1 +
 hw/timer/stm32f2xx_timer.c | 1 -
 11 files changed, 12 insertions(+), 20 deletions(-)

--=20
2.21.1


