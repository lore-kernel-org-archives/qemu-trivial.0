Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1daxx0-0003zz-2T
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 01:36:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47386)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxwx-0003xu-Sh
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 01:36:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxwv-0002wa-5O
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 01:36:35 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:35420)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxws-0002tc-8W; Fri, 28 Jul 2017 01:36:30 -0400
Received: by mail-qk0-x244.google.com with SMTP id a77so2884006qkb.2;
	Thu, 27 Jul 2017 22:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=iEAB1gHAJYNe9ubuwtV8OJoEZjvrtHQzg7iFEaXmkYY=;
	b=sHtQiMkEz2xKzCGna81kZPHMkgJHuVJZk2zF1Pn8pe7A2hBuAlYJge0pDBUPQV2iY8
	dqVSaYjxfPakJGj16G0PWVIF64J1mnC/isnkqpOO3c98sEDZQbpG/lF/z0IDssiMZPc6
	fo5w7lZSlpcqRHo/XrIrDeVgP5UXePDpskKBZP7/lhbfiENkugisdZOO5Gq1mo0heTEV
	84YaJFr0qtCqCuOSFWY58bl5P9Hmv3bkgMhkrTT+qduvwLJj6w9m4Mry2gdjwZ2/V6AB
	4qe2YYkWn1a+CIQAg4ZfqPs6P+fvPv6Vz85DMRy8M3dV0lWe4jZAOGJZG5cfnV6QMENa
	KGQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=iEAB1gHAJYNe9ubuwtV8OJoEZjvrtHQzg7iFEaXmkYY=;
	b=FiJCBMf700r5DWuC8VY/jJ60ihWi0CB3g+5P3a459HlUDAJx9h2Bzth2k4lVlFC9fx
	hQLNXxJ6wlFO9C/hfI1zmNL2j/5hNlYeQiMvhSE9QeDknyDtuNywPhKkSiHxF+K7V1Zt
	W7MjuWk9hXz14KxMCgf5OBQGAfj8gEKC/05jkdEIJFrotMn5f4Ym9mR/RYNSqjhp3Axt
	0mUqZUhh45qgUF00RbrmkdBzUXyQ5Kz/mYVq0YOxWGEoSFlu0K4KbWr9/L8Di6xmd8+b
	1XGP1OaTC42mqEyEg4AYEO7W2y3KICjFMGO9B8wHXA255B+oBfkHVIHiMZevtLP3uw95
	Ykaw==
X-Gm-Message-State: AIVw112kk4agV22Cn3et7JiH69QliN3vI41fF633x/mPa62SQQodNwRt
	phkCY5Z7ofa0hQ==
X-Received: by 10.55.139.68 with SMTP id n65mr8299622qkd.172.1501220189654;
	Thu, 27 Jul 2017 22:36:29 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	h41sm12129560qta.45.2017.07.27.22.36.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Jul 2017 22:36:28 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair@alistair23.me>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Fri, 28 Jul 2017 02:35:26 -0300
Message-Id: <20170728053610.15770-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170728053610.15770-1-f4bug@amsat.org>
References: <20170728053610.15770-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-trivial] [PATCH 03/47] MAINTAINERS: add missing STM32 entry
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
X-List-Received-Date: Fri, 28 Jul 2017 05:36:36 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 795f89f709..f10252c292 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -556,6 +556,7 @@ F: hw/char/stm32f2xx_usart.c
 F: hw/timer/stm32f2xx_timer.c
 F: hw/adc/*
 F: hw/ssi/stm32f2xx_spi.c
+F: include/hw/*/stm32*.h
 
 Netduino 2
 M: Alistair Francis <alistair@alistair23.me>
-- 
2.13.3


