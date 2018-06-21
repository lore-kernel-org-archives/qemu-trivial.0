Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fW3ut-0000QE-6U
	for mharc-qemu-trivial@gnu.org; Thu, 21 Jun 2018 14:02:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59116)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fW3ur-0000On-AL
	for qemu-trivial@nongnu.org; Thu, 21 Jun 2018 14:02:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fW3uq-0006R5-G3
	for qemu-trivial@nongnu.org; Thu, 21 Jun 2018 14:02:41 -0400
Received: from mail-qt0-x230.google.com ([2607:f8b0:400d:c0d::230]:39060)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fW3um-0006Q2-63; Thu, 21 Jun 2018 14:02:36 -0400
Received: by mail-qt0-x230.google.com with SMTP id p23-v6so3664507qtn.6;
	Thu, 21 Jun 2018 11:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=DMRxpurs0O6SQaofjNj8qhq/fUQQ+sk9CUt/ldhsPnQ=;
	b=RoIGga5lBSZLUcnf6SfKjTPLZjv2UWslXZT4SJ/Gd5+QMYle5rDWEnhLKFJisNHhcV
	4hyPwWNNkL2uado/cPT1xWCqbiPS6Jmo1OT2mtyPRQH89xIAmNe0FqZ4X3/TIHcQGNAK
	epW0tLJE6Yy7Fl5cKB0Cq7GCJdDfMTkWUVWB2p1hqixQGFWfk1/w9SJt7j5vtV1acAtE
	CExxv0bswTNI0Af21WWRDeUHcbxDc/Mhnt53diIgWe4Qh9dopJnWWOHpq7Ze+saZ/Som
	fgXJpl1i+FpXcBIukbwdAdQLz1RPjKG/3jqvtFoI+ghZkIXITZaNmkSF5xr0tCCEByRr
	+UoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=DMRxpurs0O6SQaofjNj8qhq/fUQQ+sk9CUt/ldhsPnQ=;
	b=aeMYcgzZJsk+MeKXSPbR/4VEkJc5/RdV2bdDA+x6ZNOWBT692R+YsNDquOTR9SuuFi
	85o8cHi9KdCo0PhQwEPGtBdwHiuuJMb0ZYcvWJTQqNMubXaI1+o08ABNSEx6JUp7Mrxp
	ZCu2V9L2LXTiPLffgmuHV8N6zTzt4Gyp4oFutJ/Y/2sbQKlySgWYZGK6x+CXmFL8YZKc
	5FuTEkq/2r32wQpsFiZrrC+2cBmft5VEOityznCLgwyxe+6tcy0AeD+fMgoHSpRNfI/9
	4ctjrBOoUXvkA4q5+o3q1BrJbRJZN25Zw8KoopssN1myv79rCrDc0w8w86YJMqtCvHXk
	FCPg==
X-Gm-Message-State: APt69E12VE5zm5T6jH6XB6JO2koqPN4iBBTzjtthJfasOOOgc887T9Qw
	VMwMwA9cOqoyjhNGd1poRws=
X-Google-Smtp-Source: ADUXVKL4QENWkeJ82xYDwWnxClbcQ3vkwY0ZVVX+uCXPTIu1pN3NFwUb6vKeIotNQ37wcF/FbqKdwA==
X-Received: by 2002:ac8:2c23:: with SMTP id
	d32-v6mr24047307qta.54.1529604155471; 
	Thu, 21 Jun 2018 11:02:35 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	w51-v6sm2469469qta.12.2018.06.21.11.02.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Jun 2018 11:02:34 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair@alistair23.me>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Jason Wang <jasowang@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-arm@nongnu.org
Date: Thu, 21 Jun 2018 15:02:13 -0300
Message-Id: <20180621180224.8312-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0.rc2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::230
Subject: [Qemu-trivial] [PATCH 00/11] hw/arm: use qemu_log_mask instead of
 fprintf
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Jun 2018 18:02:42 -0000

Hi,

This series is another collection of trivial patches from
different stagnating branches, OMAP and Stellaris. Time to
share before loosing them.

Regards,

Phil.

Philippe Mathieu-Daudé (11):
  hw/input/pckbd: Use qemu_log_mask(GUEST_ERROR) instead of fprintf
  hw/input/tsc2005: Use qemu_log_mask(GUEST_ERROR) instead of fprintf
  hw/dma/omap_dma: Use qemu_log_mask(UNIMP) instead of printf
  hw/dma/omap_dma: Use qemu_log_mask(GUEST_ERROR) instead of fprintf
  hw/ssi/omap_spi: Use qemu_log_mask(GUEST_ERROR) instead of fprintf
  hw/sd/omap_mmc: Use qemu_log_mask(UNIMP) instead of printf
  hw/i2c/omap_i2c: Use qemu_log_mask(UNIMP) instead of fprintf
  hw/arm/omap: Use qemu_log_mask(GUEST_ERROR) instead of fprintf
  hw/arm/stellaris: Use qemu_log_mask(UNIMP) instead of fprintf
  hw/net/stellaris_enet: Use qemu_log_mask(GUEST_ERROR) instead of hw_error
  hw/net/smc91c111: Use qemu_log_mask(GUEST_ERROR) instead of hw_error

 include/hw/arm/omap.h   | 20 +++++++-----
 hw/arm/stellaris.c      |  2 +-
 hw/dma/omap_dma.c       | 72 ++++++++++++++++++++++++++---------------
 hw/i2c/omap_i2c.c       | 23 ++++++++-----
 hw/input/pckbd.c        |  4 ++-
 hw/input/tsc2005.c      | 14 +++++---
 hw/net/smc91c111.c      |  9 ++++--
 hw/net/stellaris_enet.c |  9 ++++--
 hw/sd/omap_mmc.c        | 13 +++++---
 hw/ssi/omap_spi.c       | 15 ++++++---
 10 files changed, 119 insertions(+), 62 deletions(-)

-- 
2.18.0.rc2


