Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d7sFe-0004uS-JM
	for mharc-qemu-trivial@gnu.org; Mon, 08 May 2017 19:39:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52567)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d7sFb-0004t1-Pw
	for qemu-trivial@nongnu.org; Mon, 08 May 2017 19:39:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d7sFb-0002Aw-14
	for qemu-trivial@nongnu.org; Mon, 08 May 2017 19:39:35 -0400
Received: from mail-qk0-x22c.google.com ([2607:f8b0:400d:c09::22c]:35554)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d7sFW-00028e-Rj; Mon, 08 May 2017 19:39:30 -0400
Received: by mail-qk0-x22c.google.com with SMTP id a72so49747424qkj.2;
	Mon, 08 May 2017 16:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=fsh7WKaIG3d3cx5zxsiLj3wivmXqYuVkUZl+xya64+Q=;
	b=a4u4+5GASZ8oVhsjmdbWTK4xP0LLrsycvFy4y07pBidPpIKRzVX3Ot2SG47wEmhKPO
	Nqcbn903NdbEh+4nXw7glr14zrfr5HVUVP53XrkJ48JQ4zmxYRd6Gxbuh+HhnbRTkpxR
	l8YXkBbTlllguzZyxaRJyZXQvUPNoGxk2OqcxZENooxyr3bl2ELRAM6E/z9BHDrl9X9e
	aLWEeoOUPUyYzkbkOhjsimjdqURLUYTFHwP5Zolh37NL5dxeo0vnBquk8cwghr2J4HGM
	EghIMke/Fy2E2NpYUKOqlpvjZ9qsW2HNS4zmh13t4QE/7enjiZcHiDOYp4XwDz471RkL
	YD4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=fsh7WKaIG3d3cx5zxsiLj3wivmXqYuVkUZl+xya64+Q=;
	b=ah65Dmby1Qa40HZx9fpqhz372bEjUwr97Dxvl3JmUduUBGcpuFSrF0VUGTmiqgQIMI
	MLRgf5fZDl7Nbf9oUCpmb1WOw5DU52BLvyTgux1M+z2xVv/C+8X2A/k327qjJnl6shuT
	NkhxzLDakpJ2ESiOciKsKUuPRT14RccGTw0RHdnuv6+2NjF+o0fDklwPvPJsKxCJTqc0
	7RevoquvD3AAWqlhp3+ahrUe0d+JafrNCW1/UQaDHVDbnXYa6tj6JBJAUegzg0l9rxnJ
	IWdh8rV9Ok0TEDnpxS0D+lU3XsNkRscwt08wCa9mBou04eSTBxl997vDmkXIs4740Qpd
	gVcg==
X-Gm-Message-State: AODbwcAf+zpTf2KbqACQEPSxIJ9Yiq3xyvzi8BIiJV11OHLqJRCOTpMn
	ZV6fEHwA0eY3Xw==
X-Received: by 10.55.97.202 with SMTP id v193mr22345151qkb.186.1494286770247; 
	Mon, 08 May 2017 16:39:30 -0700 (PDT)
Received: from localhost.localdomain ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id
	v64sm13556099qkg.38.2017.05.08.16.39.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 May 2017 16:39:29 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Date: Mon,  8 May 2017 20:39:07 -0300
Message-Id: <20170508233918.9043-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::22c
Subject: [Qemu-trivial] [PATCH 00/11] various easy cleanups
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
X-List-Received-Date: Mon, 08 May 2017 23:39:36 -0000

various easy patchs added while coding around:
- remove old comments
- add/remove includes
- use TYPE_ names when available
- use ARRAY_SIZE() macro

Philippe Mathieu-Daudé (11):
  hw/net: removed obsolete comments
  hw/pci: define msi_nonbroken in pci-stub
  hw/misc: add missing includes
  ide/ahci: add missing includes
  hw/mips: add missing include
  hw/arm: removed unnecessary include
  hw/arm: use defined type name instead of hard-coded string.
  hw/sparc: use ARRAY_SIZE() macro
  target/sparc: fix DEBUG_MMU DPRINTF() arguments
  register: display register prefix (name) since it is available
  MAINTAINERS: self-appoint me as reviewer of the Register API

 MAINTAINERS                |  1 +
 hw/arm/armv7m.c            |  4 ++--
 hw/arm/exynos4210.c        |  4 ++--
 hw/arm/highbank.c          | 11 +++++++----
 hw/arm/realview.c          |  6 ++++--
 hw/arm/vexpress.c          |  6 ++++--
 hw/arm/xilinx_zynq.c       | 14 ++++++++------
 hw/core/register.c         |  8 ++++----
 hw/net/pcnet-pci.c         | 10 ----------
 hw/pci/pci-stub.c          |  3 +++
 hw/sparc64/sun4u.c         |  2 +-
 include/hw/arm/arm.h       |  1 -
 include/hw/ide/ahci.h      |  2 ++
 include/hw/mips/mips.h     |  1 +
 include/hw/misc/unimp.h    |  3 +++
 target/sparc/ldst_helper.c |  4 ++--
 16 files changed, 44 insertions(+), 36 deletions(-)

-- 
2.11.0


