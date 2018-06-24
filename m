Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fWwIP-0003pL-Qy
	for mharc-qemu-trivial@gnu.org; Sun, 24 Jun 2018 00:06:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42192)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWwIL-0003kM-A8
	for qemu-trivial@nongnu.org; Sun, 24 Jun 2018 00:06:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWwIK-0003k2-0f
	for qemu-trivial@nongnu.org; Sun, 24 Jun 2018 00:06:33 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:37261)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWwID-0003gO-IP; Sun, 24 Jun 2018 00:06:25 -0400
Received: by mail-qk0-x244.google.com with SMTP id j12-v6so5833185qkk.4;
	Sat, 23 Jun 2018 21:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=NqaW2wt9TX8EMxFAXZHdz534SZR0gIgCCme1681fFc4=;
	b=fFOvXfiyX88B7lBoojpLN1trIyGNN6wE/XazyFzjlHG/yYV7sK/LEqQ2pAj+lYX0hI
	NzQTWcugJVUH8IKlkXjJH0E72QeZCpGexFSklLgyEvnTnxcTuY11f8/3TOxQNwgSd0BS
	Y0CRcE04fipCJcqWtu9d8esKjtF7to5duR3lOiP1K3ozNBrD4wfA+AoJBnrSiE+WlX4i
	v9x7QxIqJQZ9SDn2D1mJYRs+FBho9efnMiKJuJ52AG2SfXmFNEvl1/cg6zf5ocd+hTbv
	dxZ0nLXrMW4QqjDJ9MBMkAPIcDaoMQUPZFjFPwKURJv682DLT2An/rb/9lkrs+O85fPJ
	x1/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=NqaW2wt9TX8EMxFAXZHdz534SZR0gIgCCme1681fFc4=;
	b=KA9o9fHRKfuynj6eKSrZYFOQ3BGfq2cLoOn+3ezpQsXvqW3IL0dZ6RviREvW+GfkN+
	YUg4AOsQkH1BfQ1GQ64DciBgI6qpyMJXg7XBSjYP8b0GcB3UQD3QDOMFQAmIS0uNSheV
	DC15MrTnBFSQW+ejHhDMUoigDYBYnxy0gq9wmOL/PbNlP8D8w5QHbiC/wk/i9O+8ur9G
	t88SPhsbDi7a0O2MC1iMnqaUCRXYdMaoHL3OPwhspISs0s3zykg+uVPqkIESY3UyxAeL
	vAS9i1z0Z9G4psPeZtKOEz2fT6JwAhyy17jlT8rvVbxU89fAYjYakO4y7Vgc63yZAQo5
	EROg==
X-Gm-Message-State: APt69E0FwfKaBojHkGPKvPX5ZYFs+G4v7aUTPj1+pXcEs8KCfqD1LWnO
	nkT9rSpEOIQXulWzBFnUoao=
X-Google-Smtp-Source: ADUXVKJ67zrI0f1WRm816wYjk+cwDJ2k1+EtwZfv9hZ7+vVam7WZGsRrKeoyT7g2Kr5sJ7G3BBuXQg==
X-Received: by 2002:a37:78c5:: with SMTP id
	t188-v6mr6227127qkc.283.1529813185012; 
	Sat, 23 Jun 2018 21:06:25 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	d14-v6sm7145313qtn.90.2018.06.23.21.06.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 23 Jun 2018 21:06:24 -0700 (PDT)
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
Date: Sun, 24 Jun 2018 01:05:53 -0300
Message-Id: <20180624040609.17572-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-trivial] [PATCH v3 00/16] hw/arm: use qemu_log_mask instead
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
X-List-Received-Date: Sun, 24 Jun 2018 04:06:34 -0000

Hi,

This series is another collection of trivial patches from
different stagnating branches, OMAP and Stellaris. Time to
share before loosing them.

Regards,

Phil.

Patches missing review: 1, 9, 11, 12, 15, 16

Since v2: addressed Thomas Huth comments
- fixed incorrect "<< 2" using "* 8"
- fixed fmt string on 32-bit arch (Thomas)
- keep <tab> comments aligned but use spaces (4) to satisfy checkpatch
- replaced OMAP_BAD_REG() macro
- fixed a typo
- remove a cast using HWADDR_PRIx
- added Thomas R-b

Since v1:
- added Alistair R-b
- addressed Thomas Huth comments
- added one more change in smc91c111
- fixed gptm_write()

v1: http://lists.nongnu.org/archive/html/qemu-devel/2018-06/msg06324.html
v2: http://lists.nongnu.org/archive/html/qemu-devel/2018-06/msg06645.html

[----] : patches are identical
[####] : number of functional differences between upstream/downstream patch
[down] : patch is downstream-only
The flags [FC] indicate (F)unctional and (C)ontextual differences, respectively

001/16:[0002] [FC] 'hw/input/pckbd: Use qemu_log_mask(GUEST_ERROR) instead of fprintf'
002/16:[----] [--] 'hw/input/tsc2005: Use qemu_log_mask(GUEST_ERROR) instead of fprintf'
003/16:[----] [--] 'hw/dma/omap_dma: Use qemu_log_mask(UNIMP) instead of printf'
004/16:[----] [--] 'hw/dma/omap_dma: Use qemu_log_mask(GUEST_ERROR) instead of fprintf'
005/16:[----] [--] 'hw/ssi/omap_spi: Use qemu_log_mask(GUEST_ERROR) instead of fprintf'
006/16:[----] [--] 'hw/sd/omap_mmc: Use qemu_log_mask(UNIMP) instead of printf'
007/16:[0004] [FC] 'hw/i2c/omap_i2c: Use qemu_log_mask(UNIMP) instead of fprintf'
008/16:[----] [--] 'hw/arm/omap1: Use qemu_log_mask(GUEST_ERROR) instead of fprintf'
009/16:[0011] [FC] 'hw/arm/omap: Use qemu_log_mask(GUEST_ERROR) instead of fprintf'
010/16:[----] [--] 'hw/arm/stellaris: Use qemu_log_mask(UNIMP) instead of fprintf'
011/16:[down] 'hw/net/stellaris_enet: Fix a typo'
012/16:[0008] [FC] 'hw/net/stellaris_enet: Use qemu_log_mask(GUEST_ERROR) instead of hw_error'
013/16:[----] [--] 'hw/net/smc91c111: Use qemu_log_mask(GUEST_ERROR) instead of hw_error'
014/16:[----] [--] 'hw/net/smc91c111: Use qemu_log_mask(UNIMP) instead of fprintf'
015/16:[----] [--] 'hw/arm/stellaris: Fix gptm_write() error message'
016/16:[down] 'hw/arm/stellaris: Use HWADDR_PRIx to display register address'

Philippe Mathieu-Daudé (16):
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
  hw/net/stellaris_enet: Fix a typo
  hw/net/stellaris_enet: Use qemu_log_mask(GUEST_ERROR) instead of hw_error
  hw/net/smc91c111: Use qemu_log_mask(GUEST_ERROR) instead of hw_error
  hw/net/smc91c111: Use qemu_log_mask(UNIMP) instead of fprintf
  hw/arm/stellaris: Fix gptm_write() error message
  hw/arm/stellaris: Use HWADDR_PRIx to display register address

 include/hw/arm/omap.h   | 30 ++++--------------
 hw/arm/omap1.c          | 18 +++++++----
 hw/arm/stellaris.c      |  8 +++--
 hw/dma/omap_dma.c       | 70 ++++++++++++++++++++++++++---------------
 hw/i2c/omap_i2c.c       | 20 +++++++-----
 hw/input/pckbd.c        |  4 ++-
 hw/input/tsc2005.c      | 13 +++++---
 hw/net/smc91c111.c      | 21 +++++++++----
 hw/net/stellaris_enet.c | 11 +++++--
 hw/sd/omap_mmc.c        | 13 +++++---
 hw/ssi/omap_spi.c       | 15 ++++++---
 11 files changed, 132 insertions(+), 91 deletions(-)

-- 
2.18.0


