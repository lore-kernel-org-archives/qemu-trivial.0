Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fWMJ3-0005td-2P
	for mharc-qemu-trivial@gnu.org; Fri, 22 Jun 2018 09:40:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59486)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWMJ0-0005pl-6o
	for qemu-trivial@nongnu.org; Fri, 22 Jun 2018 09:40:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWMIz-0002uJ-6O
	for qemu-trivial@nongnu.org; Fri, 22 Jun 2018 09:40:50 -0400
Received: from mail-qk0-x22c.google.com ([2607:f8b0:400d:c09::22c]:39785)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWMIu-0002oW-Sg; Fri, 22 Jun 2018 09:40:44 -0400
Received: by mail-qk0-x22c.google.com with SMTP id g14-v6so3662294qkm.6;
	Fri, 22 Jun 2018 06:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=5P2rYwB+gPPqTvhwLqDEso75OIwGketRO2nbkX0KSKI=;
	b=iknWDfap/+O/h6SUPZU9gXoD6zM1Wk/8vG2Ptw8/GpXEGPwsvHMOAsI/lWVuvUyQlC
	t98OuKJSw9t8YX9JVML8xCn89HLBFfzWcCrLIXr8+2KUc948+eoby3IGRU3EfVh4xvYA
	hw2HagOyTvkal3m8AgvOLGys2xMrQqtbPRpqCXKzQrZaeaCY+E3jPS8678IVUkFFebge
	UJde8Wyqw3D+lUHDC7q3sU4k8yGfY2zNqLfqq4Uad6e4wfvyCkPdWDG1X9X+CEfAY2uv
	8GlJ3EICJVR+jhJkgbx2URZ2ixbKN28344tPA5VsXzmCpUU7T0TZ73yW9sIAbWsb61Rm
	KbLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=5P2rYwB+gPPqTvhwLqDEso75OIwGketRO2nbkX0KSKI=;
	b=TOYILYkqko2jl3sDR6o3bUZ4OBNZ733dYnshe6sldM9Nhm2bgw3QByaFkpkS3G7VlO
	wfGT0Y82/vEvuhart7zMVxyZt6nRBreF8XRFBm7Q0IBA0VBpQS8lKYTBsO5oQJ+v8YN8
	R26gU4EEA7SYzzQ57I2AOK2XM6k81IEWI3q1cbkxMnA1R9HKBZJ23L5fsbr05Q4kWmAQ
	i6CWIOI7XrFnFID+2KMr27ipw5vO5V9LWaU0hMcitCe3EbUkWibjHxXtdHq56B7a2Cgl
	87HUplabFCfpvwpb0gDV+VutpcgRHbPJoSTtZkojpSsqEOzM5+cZRlUi2+kpHiys0X1K
	khFA==
X-Gm-Message-State: APt69E0ffd7vua6QXfp/PMvXgXE1KWNUrMrO9OcKAjIVujQqneAqDw8o
	Ed4uYDMRgmSs3a9y4fzspuI=
X-Google-Smtp-Source: AAOMgpe8L+8dZ4g3gXBJs5DOCGxVF/bNcLUqPRrdW33YPCxF1jO7ALQLKNiX20nYFWW704gJbbr+Qg==
X-Received: by 2002:a37:6e83:: with SMTP id
	j125-v6mr1287932qkc.237.1529674844230; 
	Fri, 22 Jun 2018 06:40:44 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	s39-v6sm6006629qts.42.2018.06.22.06.40.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Jun 2018 06:40:43 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Jason Wang <jasowang@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-arm@nongnu.org
Date: Fri, 22 Jun 2018 10:40:22 -0300
Message-Id: <20180622134036.23182-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0.rc2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::22c
Subject: [Qemu-trivial] [PATCH v2 00/14] hw/arm: use qemu_log_mask instead
 of fprintf
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
X-List-Received-Date: Fri, 22 Jun 2018 13:40:51 -0000

Hi,

This series is another collection of trivial patches from
different stagnating branches, OMAP and Stellaris. Time to
share before loosing them.

Regards,

Phil.

Since v1:
- added Alistair R-b
- addressed Thomas Huth comments
- added one more change in smc91c111
- fixed gptm_write()

v1: http://lists.nongnu.org/archive/html/qemu-devel/2018-06/msg06324.html

[----] : patches are identical
[####] : number of functional differences between upstream/downstream patch
[down] : patch is downstream-only
The flags [FC] indicate (F)unctional and (C)ontextual differences, respectively

001/14:[0002] [FC] 'hw/input/pckbd: Use qemu_log_mask(GUEST_ERROR) instead of fprintf'
002/14:[0003] [FC] 'hw/input/tsc2005: Use qemu_log_mask(GUEST_ERROR) instead of fprintf'
003/14:[----] [--] 'hw/dma/omap_dma: Use qemu_log_mask(UNIMP) instead of printf'
004/14:[0006] [FC] 'hw/dma/omap_dma: Use qemu_log_mask(GUEST_ERROR) instead of fprintf'
005/14:[----] [--] 'hw/ssi/omap_spi: Use qemu_log_mask(GUEST_ERROR) instead of fprintf'
006/14:[----] [--] 'hw/sd/omap_mmc: Use qemu_log_mask(UNIMP) instead of printf'
007/14:[0009] [FC] 'hw/i2c/omap_i2c: Use qemu_log_mask(UNIMP) instead of fprintf'
008/14:[down] 'hw/arm/omap1: Use qemu_log_mask(GUEST_ERROR) instead of fprintf'
009/14:[0015] [FC] 'hw/arm/omap: Use qemu_log_mask(GUEST_ERROR) instead of fprintf'
010/14:[----] [--] 'hw/arm/stellaris: Use qemu_log_mask(UNIMP) instead of fprintf'
011/14:[0012] [FC] 'hw/net/stellaris_enet: Use qemu_log_mask(GUEST_ERROR) instead of hw_error'
012/14:[0008] [FC] 'hw/net/smc91c111: Use qemu_log_mask(GUEST_ERROR) instead of hw_error'
013/14:[down] 'hw/net/smc91c111: Use qemu_log_mask(UNIMP) instead of fprintf'
014/14:[down] 'hw/arm/stellaris: Fix gptm_write() error message'

Philippe Mathieu-Daudé (14):
  hw/input/pckbd: Use qemu_log_mask(GUEST_ERROR) instead of fprintf
  hw/input/tsc2005: Use qemu_log_mask(GUEST_ERROR) instead of fprintf
  hw/dma/omap_dma: Use qemu_log_mask(UNIMP) instead of printf
  hw/dma/omap_dma: Use qemu_log_mask(GUEST_ERROR) instead of fprintf
  hw/ssi/omap_spi: Use qemu_log_mask(GUEST_ERROR) instead of fprintf
  hw/sd/omap_mmc: Use qemu_log_mask(UNIMP) instead of printf
  hw/i2c/omap_i2c: Use qemu_log_mask(UNIMP) instead of fprintf
  hw/arm/omap1: Use qemu_log_mask(GUEST_ERROR) instead of fprintf
  hw/arm/omap: Use qemu_log_mask(GUEST_ERROR) instead of fprintf
  hw/arm/stellaris: Use qemu_log_mask(UNIMP) instead of fprintf
  hw/net/stellaris_enet: Use qemu_log_mask(GUEST_ERROR) instead of hw_error
  hw/net/smc91c111: Use qemu_log_mask(GUEST_ERROR) instead of hw_error
  hw/net/smc91c111: Use qemu_log_mask(UNIMP) instead of fprintf
  hw/arm/stellaris: Fix gptm_write() error message

 include/hw/arm/omap.h   | 23 ++------------
 hw/arm/omap1.c          | 18 +++++++----
 hw/arm/stellaris.c      |  4 +--
 hw/dma/omap_dma.c       | 70 ++++++++++++++++++++++++++---------------
 hw/i2c/omap_i2c.c       | 20 +++++++-----
 hw/input/pckbd.c        |  4 ++-
 hw/input/tsc2005.c      | 13 +++++---
 hw/net/smc91c111.c      | 21 +++++++++----
 hw/net/stellaris_enet.c |  9 ++++--
 hw/sd/omap_mmc.c        | 13 +++++---
 hw/ssi/omap_spi.c       | 15 ++++++---
 11 files changed, 125 insertions(+), 85 deletions(-)

-- 
2.18.0.rc2


