Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fNRZC-0007g2-NK
	for mharc-qemu-trivial@gnu.org; Mon, 28 May 2018 19:28:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33094)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNRZA-0007do-8T
	for qemu-trivial@nongnu.org; Mon, 28 May 2018 19:28:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNRZ9-0001a3-CI
	for qemu-trivial@nongnu.org; Mon, 28 May 2018 19:28:40 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:35512)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNRZ5-0001Wz-5z; Mon, 28 May 2018 19:28:35 -0400
Received: by mail-qk0-x242.google.com with SMTP id d130-v6so4783029qkc.2;
	Mon, 28 May 2018 16:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=wdwMOY1aiOs2ZgueHQbDm07D1K6YVAO8qKhImyEd0cI=;
	b=FXviPkgBWDlN7dJkj8pfSWDlPnuthMWAFtNvsWk+6Tl2IK6th/yOEAU3vGQjtXuJnU
	IIqY23R7MeH+1yvG4RRcj4X7CvvzqV6kZzf/3d2UlX1TSe9uupY97iMYI9vHW/7x+ZW9
	0MdKgQoa97A/wkKCcP7vmBkechRPjtme16HlOent3zCTLFIK9fhAy9q5M9bISzAmDgPd
	e8pKGOAy9WMR01e3IvzWw1lp36cqEIIO1wxvVD3oYpHNP23o85KhABGU55HWxeUEZgzM
	3Q1MSLINU61dEYdjVmvog1qmXt4RC4JFg9Lhbx9KmV/ANCMuI4Gyjwxx/CAHUv23NhBX
	jyfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=wdwMOY1aiOs2ZgueHQbDm07D1K6YVAO8qKhImyEd0cI=;
	b=rvht//8tMUxN/BOM1FCRdS+vvCsntLRDp02DQ4i4cDnzUGcsJ/S9TzO33eX4+/JU7J
	xONFs1cuRrKTSoeJTpksh2Bgs7rbIri+Lz4YMDd+X5t2ugOHxOOR6tM15VKLW6y5c0X1
	kVluMRoa47UVvR+auPDarzAngFObBsv/TADv+t/sdvbLrKFF3y9QyDrXbnT0KpKyc7Fz
	YJRZ0SGOTnyDew9T+OImGBZDVD38iafyCmD2l0/i9Wv7I1gNGkyeTmN3fJs74seMlzGd
	kyEVPQvDYtoEdgsf8xjexWWMLlRD6UAVoop42iDFCNzSFQ/m5VMudibpmS4O6XZPmTyv
	coKQ==
X-Gm-Message-State: ALKqPwfSCQ38AfBABRJPamiWTwh4F//IgXm95hQugpuD5bJooNjdKqgm
	CqUTgZYy4ADb9DPMPHs3G54=
X-Google-Smtp-Source: ADUXVKL3XutMHc18mdg9XDf3HNkvqHwMrp5nQwMPOnCut8q1Ab0tn3L5cu1Uu1MpTvjWNcrVdM5Q/A==
X-Received: by 2002:a37:3c8a:: with SMTP id
	j132-v6mr2467413qka.266.1527550114704; 
	Mon, 28 May 2018 16:28:34 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	s19-v6sm23756182qki.62.2018.05.28.16.28.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 May 2018 16:28:34 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Aurelien Jarno <aurelien@aurel32.net>, Yongbok Kim <yongbok.kim@mips.com>,
	Alexander Graf <agraf@suse.de>, David Gibson <david@gibson.dropbear.id.au>,
	qemu-arm@nongnu.org (open list:ARM), qemu-ppc@nongnu.org (open list:ppc4xx)
Date: Mon, 28 May 2018 20:27:11 -0300
Message-Id: <20180528232719.4721-14-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180528232719.4721-1-f4bug@amsat.org>
References: <20180528232719.4721-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: [Qemu-trivial] [PATCH v4 13/21] hw: Do not include
 "sysemu/blockdev.h" if it is not necessary
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
X-List-Received-Date: Mon, 28 May 2018 23:28:41 -0000

The header "hw/boards.h" already includes "sysemu/blockdev.h".

Code change produced with:

    $ git grep '#include "sysemu/blockdev.h"' hw | \
      cut -d: -f-1 | \
      xargs fgrep -l '#include "hw/boards.h"' | \
      xargs sed -i.bak '/#include "sysemu\/blockdev.h"/d'

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/aspeed.c        | 1 -
 hw/arm/omap1.c         | 1 -
 hw/arm/omap2.c         | 1 -
 hw/mips/mips_malta.c   | 1 -
 hw/ppc/ppc405_boards.c | 1 -
 hw/ppc/sam460ex.c      | 1 -
 6 files changed, 6 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index aecb3c1e75..a7110a712f 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -19,7 +19,6 @@
 #include "hw/boards.h"
 #include "qemu/log.h"
 #include "sysemu/block-backend.h"
-#include "sysemu/blockdev.h"
 #include "hw/loader.h"
 #include "qemu/error-report.h"
 
diff --git a/hw/arm/omap1.c b/hw/arm/omap1.c
index 854996c1ac..9af04728e3 100644
--- a/hw/arm/omap1.c
+++ b/hw/arm/omap1.c
@@ -28,7 +28,6 @@
 #include "hw/arm/omap.h"
 #include "sysemu/sysemu.h"
 #include "hw/arm/soc_dma.h"
-#include "sysemu/blockdev.h"
 #include "sysemu/qtest.h"
 #include "qemu/range.h"
 #include "hw/sysbus.h"
diff --git a/hw/arm/omap2.c b/hw/arm/omap2.c
index cc4250b7da..3c7d1364a9 100644
--- a/hw/arm/omap2.c
+++ b/hw/arm/omap2.c
@@ -23,7 +23,6 @@
 #include "qapi/error.h"
 #include "qemu-common.h"
 #include "cpu.h"
-#include "sysemu/blockdev.h"
 #include "sysemu/qtest.h"
 #include "hw/boards.h"
 #include "hw/hw.h"
diff --git a/hw/mips/mips_malta.c b/hw/mips/mips_malta.c
index af70ecffc0..494f84e290 100644
--- a/hw/mips/mips_malta.c
+++ b/hw/mips/mips_malta.c
@@ -46,7 +46,6 @@
 #include "elf.h"
 #include "hw/timer/mc146818rtc.h"
 #include "hw/timer/i8254.h"
-#include "sysemu/blockdev.h"
 #include "exec/address-spaces.h"
 #include "hw/sysbus.h"             /* SysBusDevice */
 #include "qemu/host-utils.h"
diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
index 0b658931ee..d301067d3b 100644
--- a/hw/ppc/ppc405_boards.c
+++ b/hw/ppc/ppc405_boards.c
@@ -37,7 +37,6 @@
 #include "qemu/log.h"
 #include "qemu/error-report.h"
 #include "hw/loader.h"
-#include "sysemu/blockdev.h"
 #include "exec/address-spaces.h"
 
 #define BIOS_FILENAME "ppc405_rom.bin"
diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
index a48e6e6fce..3dd23de71f 100644
--- a/hw/ppc/sam460ex.c
+++ b/hw/ppc/sam460ex.c
@@ -17,7 +17,6 @@
 #include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "hw/hw.h"
-#include "sysemu/blockdev.h"
 #include "hw/boards.h"
 #include "sysemu/kvm.h"
 #include "kvm_ppc.h"
-- 
2.17.0


