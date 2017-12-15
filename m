Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ePgi2-0001jG-EA
	for mharc-qemu-trivial@gnu.org; Thu, 14 Dec 2017 22:30:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33494)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgi0-0001hI-4X
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 22:30:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePghz-0003Yn-CO
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 22:30:48 -0500
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:44174)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePghv-0003QC-Rc; Thu, 14 Dec 2017 22:30:43 -0500
Received: by mail-qt0-x244.google.com with SMTP id m59so10546264qte.11;
	Thu, 14 Dec 2017 19:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=duoIR2Sijb/FfBGnierbXOF3SBbNQvxjm/8uzhGNvSA=;
	b=lsfNjLLoHshhF/LgXxCwSUgYJ2cUH89Qmti6rfu+ByZOFQ8QSAh1sqepiXl8V8YgkV
	PjurtCyfhPTbJCf2jFdIRemtOgbpnM256kpoq2AvGLxfoZvGVFtBQI0Kh8XKnL4aDCk6
	R5bVLhetsIFqlsdCcerW+4mjbR1YJSYX8mlYsW70Yw7BFUb8vFUd6BUwLD1f3P71+Wy5
	4PreZtFUk+HOgT4OPxUVlXXCJmtE2J5oi7gOeS0ArxFpUmgWBB2IdOBKf0yxLaGxGBok
	NdqtJiPGx0c8CZpMfKVhEoMYD1xqVVBGJML+SemxgPdVvjIM4Yap8TOrZ9Byuy2wldvP
	2x5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=duoIR2Sijb/FfBGnierbXOF3SBbNQvxjm/8uzhGNvSA=;
	b=UP3Z3+KIDPbWMRcAGdiIF5KOzYadGXIaJyqK6Gyf9EW4AWLlfgdzC+kcx3rKaoTlJQ
	rzbaT0rdxeQS6QkKBOT7/EnGaH5k5DHFaXMBaicZ1QR12XxdGvkfHXVzmTMrsC0N3anp
	iFYNtBGcqMaZHlDcuyjKM7Kj4yK9cESkQaSQu8hOZuXM8Y86XRbOaJphuPk9BtcoCATO
	Bs4ZzFtZ/tfm+oi8S0iibaFYOFWfFROC2fcFKDCokNAEbmCWYPmpY7Ej2nf661fxCuYa
	jq/tVRV7f7jF3+q6hyZ9b+3pc0LKAFUf38CfkbJM557bQoCkOlnUhYvONzniP3Xe+Nyx
	DedQ==
X-Gm-Message-State: AKGB3mLXGXnVxhXU8lMfr+trFr4hvpMPs7ggnB/51sxeiKYBjXcjB4BR
	eUYfiyHtx0A7wC2Vwb3/0gs=
X-Google-Smtp-Source: ACJfBovr2R721J+xXX75LsmCGzntrOVZCfH8UbJbZX60bEbtzhlx+yFmn55C8nQef1qFNb5806F9Mg==
X-Received: by 10.237.59.22 with SMTP id p22mr19827877qte.34.1513308643339;
	Thu, 14 Dec 2017 19:30:43 -0800 (PST)
Received: from x1.local ([181.91.222.165]) by smtp.gmail.com with ESMTPSA id
	q24sm3794605qkq.63.2017.12.14.19.30.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Dec 2017 19:30:42 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: "Michael S. Tsirkin" <mst@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org
Date: Fri, 15 Dec 2017 00:29:38 -0300
Message-Id: <20171215033015.738-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171215033015.738-1-f4bug@amsat.org>
References: <20171215033015.738-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-trivial] [PATCH v4 06/43] MAINTAINERS: add an entry for
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
X-List-Received-Date: Fri, 15 Dec 2017 03:30:49 -0000

and fix a typo in the "PC Chipset" section

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Hervé Poussineau <hpoussin@reactos.org>
---
 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 00ce2931d9..27f190a70a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -863,12 +863,13 @@ F: hw/misc/sga.c
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
2.15.1


