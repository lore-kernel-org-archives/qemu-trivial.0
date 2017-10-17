Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4FV1-0005mI-26
	for mharc-qemu-trivial@gnu.org; Mon, 16 Oct 2017 20:12:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32962)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FUy-0005kI-NV
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 20:12:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FUx-0003hd-Uy
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 20:12:44 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:51539)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FUw-0003eF-0l; Mon, 16 Oct 2017 20:12:42 -0400
Received: by mail-qt0-x243.google.com with SMTP id h4so44959qtk.8;
	Mon, 16 Oct 2017 17:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=z2dAW2A8SOT1aydBzKCIRcDMXVvnjWoc/5odhds94hE=;
	b=OVUUk2CkI6+qA+hkvEucA82S8oy/ZcMmF02dtrIMetFnQBAxOWtRNtkpTJbIilgrUO
	E03iUtl0In6zj2nxBntXLehsV8HZC2frZ0OKOjqQowIUTR2iL8cUgVoX8wf3TAGj3P5P
	TiyWyu99TZzylZ1Ac/TXoNPIZzHlq1g79o9vSAze7+8KB9uWIkSXSPOppxf+H6gjzsE8
	m2AuCgeoSyuNkseDgDK7eBoHtmeTYurP6crzbsh+ZNcpaRinteYnD8MEVLkwrMgugyJI
	sey4pV+c+37tvnzfQ0b3s6gOm1JuprqCLrSdGfp8FCl8Pc4SVAeV535hqipNEzQBUyAn
	sY4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=z2dAW2A8SOT1aydBzKCIRcDMXVvnjWoc/5odhds94hE=;
	b=otNr3CTf2tJJA/URMJhzGzHS58j+juKnQ4g/RhyuVI9wEC1iDe+BNmhMno458MHTvn
	Wj3R2OMSyoISQgKvKVh7VBoOcjIBwsO/AgOSbM7PPHV/BNOjnO0Vz5RixX6TneZqSFsA
	pdSdjS0VvaQx5Wm/GF56SRCAQdDPeEcMlf4FExL1+orMKds74Oc4se04OCx8KKysItsb
	ffAiApo/LNLjiGB7YgVjKQwKBjo5vpJkz00vL4O8Sq4h8JiH3U9V8UM5fvwaGZmdCCU2
	Sx2g9XEPVEc6VPDyfBmOhbvMDXuAEvtjmw3c6Dr9iOreHNq1/mE5YMwKySmw6IRKoVfA
	zv1A==
X-Gm-Message-State: AMCzsaWTxI7uU0p/qSEzDsRm3s1B3t02P4YHkCSR0eFsc0V9fUTStah0
	0/cBVYYUkTP3TyQSgtKzkY4=
X-Google-Smtp-Source: ABhQp+R/M8fe7VV7BdqvI5yrzXr0ldoN8VOAC4yz0apV88Y2z23XIFrgscuSNN8AmNC5hIcQVJfRVQ==
X-Received: by 10.200.37.230 with SMTP id f35mr18040895qtf.335.1508199161574; 
	Mon, 16 Oct 2017 17:12:41 -0700 (PDT)
Received: from x1.local ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id r6sm5409043qkh.22.2017.10.16.17.12.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Oct 2017 17:12:41 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Mon, 16 Oct 2017 21:11:32 -0300
Message-Id: <20171017001209.32276-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.0.rc0
In-Reply-To: <20171017001209.32276-1-f4bug@amsat.org>
References: <20171017001209.32276-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-trivial] [PATCH v2 02/39] MAINTAINERS: add entries for
 dma/i82374
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
X-List-Received-Date: Tue, 17 Oct 2017 00:12:45 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6f56c1349b..cfd9010e27 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -713,6 +713,7 @@ F: hw/ppc/prep_systemio.c
 F: hw/ppc/rs6000_mc.c
 F: hw/pci-host/prep.[hc]
 F: hw/isa/pc87312.[hc]
+F: hw/dma/i82374.c
 F: pc-bios/ppc_rom.bin
 
 sPAPR
@@ -854,6 +855,7 @@ F: hw/misc/pc-testdev.c
 F: hw/timer/hpet*
 F: hw/timer/i8254*
 F: hw/timer/mc146818rtc*
+F: include/hw/dma/i8257_dma.h
 F: include/hw/i2c/pm_smbus.h
 F: include/hw/timer/hpet.h
 F: include/hw/timer/i8254*
-- 
2.15.0.rc0


