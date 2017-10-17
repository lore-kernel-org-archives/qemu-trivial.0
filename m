Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4FV8-0005tr-Tj
	for mharc-qemu-trivial@gnu.org; Mon, 16 Oct 2017 20:12:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33072)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FV6-0005pT-3L
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 20:12:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FV5-0003rn-8K
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 20:12:52 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:46920)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FV3-0003ph-9A; Mon, 16 Oct 2017 20:12:49 -0400
Received: by mail-qk0-x241.google.com with SMTP id k123so28161qke.3;
	Mon, 16 Oct 2017 17:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=28F1GwnDti6WJH9NptxC/jzFepNq1oGcB3WP4jbk0As=;
	b=K3ZP/U6FR2n+0sO0gdQ/mM1Vzh5waSO1o82tbpvFD1B04dFOCh7A8AVZXPnvQqInLF
	Lozk+ga0ZGQXFwjZXbIdDznmC3Qyz72naKvED3EQhIT3JqzSCVtUI84R6QVhMHgcDUJk
	zrnELEK1feWMK1XLyegQOVuDVQc1uAVIAboHpfai8881/8c7XIUXf/X75XAbvyXcZbPm
	YaKYpcve8dCJf46mytHMnnxGMigBMeEGYeW1xgKlsfH9sv8946J671jxfdSvDWd8A9IC
	AX2tp2x+sCXi/RGcYhUgyHmNvf1R/J93j7XKhFI85vDHJ6TLhREo10+yNHRrDoAfemkq
	iteQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=28F1GwnDti6WJH9NptxC/jzFepNq1oGcB3WP4jbk0As=;
	b=O4t2hos9HGSrpRPAep725n7PuWsb+KkpUNt8biRJHG8cdxFGAq/JeQbwzqt/qvYNlq
	V1JD5Rjz25hB+tRQwqrdzYldtUZEcE5PPUAr+235jrtZBzKl24us/5ySckaNMr0ojTW9
	Qtzsuo6VfFwTHnfTTrDRRnsLR7fiCHWnaB3F/C+pfAZybyupAO+KyeuZPKVeRzVfUfTa
	H+sHaWbmjCxO5jfX6gMriAJ+eiwDZBUQ1eh3p7KlTRDLM0D8vi7GiJ63CK2alBPVFich
	U3BpkCFmMh2KWkS46uo9i140mXyPetYduVJ3+Hi6hTTVzS2I7mpu0RlXpSbgdfTVdGik
	ytSw==
X-Gm-Message-State: AMCzsaXFmxA62+OUxHVCIOM4ufmKk3ckx8xRbTDE2i6Ib5IFSoSdzv37
	37AbmaE9IYWYZ0KGLSD13nn4IIai
X-Google-Smtp-Source: ABhQp+T6NB9Ki9jA4SzcNJE0+a2aE5UNzrRCv5TGBvmwZ8wA6+j3ls2AGGFc1OiiRmSBbSaovg1ePg==
X-Received: by 10.55.97.202 with SMTP id v193mr15407511qkb.165.1508199168811; 
	Mon, 16 Oct 2017 17:12:48 -0700 (PDT)
Received: from x1.local ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id r6sm5409043qkh.22.2017.10.16.17.12.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Oct 2017 17:12:48 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Mon, 16 Oct 2017 21:11:35 -0300
Message-Id: <20171017001209.32276-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.0.rc0
In-Reply-To: <20171017001209.32276-1-f4bug@amsat.org>
References: <20171017001209.32276-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: [Qemu-trivial] [PATCH v2 05/39] MAINTAINERS: add an entry for
 input/pckbd.c
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
X-List-Received-Date: Tue, 17 Oct 2017 00:12:53 -0000

and fix a typo in the "PC Chipset" section

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Hervé Poussineau <hpoussin@reactos.org>
---
 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 99033b049c..b90a42d823 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -842,12 +842,13 @@ F: hw/misc/sga.c
 PC Chipset
 M: Michael S. Tsirkin <mst@redhat.com>
 M: Paolo Bonzini <pbonzini@redhat.com>
-S: Support
+S: Supported
 F: hw/char/debugcon.c
 F: hw/char/parallel.c
 F: hw/char/serial*
 F: hw/dma/i8257*
 F: hw/i2c/pm_smbus.c
+F: hw/input/pckbd.c
 F: hw/intc/apic*
 F: hw/intc/ioapic*
 F: hw/intc/i8259*
-- 
2.15.0.rc0


