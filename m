Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dnAxo-0005Nz-Mw
	for mharc-qemu-trivial@gnu.org; Wed, 30 Aug 2017 17:55:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48793)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dnAxl-0005JO-QS
	for qemu-trivial@nongnu.org; Wed, 30 Aug 2017 17:55:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dnAxl-0007b9-1z
	for qemu-trivial@nongnu.org; Wed, 30 Aug 2017 17:55:53 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:33173)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dnAxg-0007Zq-7J; Wed, 30 Aug 2017 17:55:48 -0400
Received: by mail-qt0-x242.google.com with SMTP id q53so6295724qtq.0;
	Wed, 30 Aug 2017 14:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=kw+6KAYt8jxvEF/hv9r6rVR2ItQT9tMQN0eti2z90vQ=;
	b=ShLMWV+zWnmSJx2bK7rqJim3qJ6eYlbIcvOexSZeHSRHMIB1pp2f/kDxWPopMa8Q45
	4YSvW660R3TaI52y4AYyFlD9rkCSBCKqPUW+IJ1O9KtegL6CLZQZUAu4Kaif7wOY/WcE
	tpoupPsRDmNgrkKsjB9QLBNWZSsjvsq15cfCM38qkscbwlpTw0dnGhl2B65QKYhu1+nF
	J/nlCuUJcgQ+Zh/6G/+OiHYAXWo+GWNvPKTzr9zOPyKlzQLOkjJQJibwOEJBkDQ+7bzd
	1KY2fjO+ZKrKztei/o1xZLR7dcLaG6JbOINCLZraxMVpuf4qEYMqEuwRHBZqxhCAjCL+
	Z7yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=kw+6KAYt8jxvEF/hv9r6rVR2ItQT9tMQN0eti2z90vQ=;
	b=k6+ak4iOHNw/6OaezvlD+CeGEb4UPsRWZ9PHeT2oSwQP4Zp6ZvVLTs+frQVGZitxi4
	EXrU11aKoYmYk1vew+ApmH+ttteYR5EKoDS+ajLxeZsSF5aEinw4rE72bX4+cevyY20G
	BreJtmw4f8EiA2mUyBcPDuHTMmYOX4vLjlsm5+E+Og1nDWWKHAurGyxLi5xeBw4+eecQ
	CDZmO8JaKGWILUvnaJhTgFFYJ3mGwWWPab+3eE2Kv3T9OTcpep4k5rnK6oqAJxQfxnwD
	JHp1VFY2jTcMTBYMFzYbvRrYuCbQ8EXqZzyTjOrp5TNfDAj5WhOjEQtgVFfuschv9fgD
	N9XQ==
X-Gm-Message-State: AHYfb5jvJeDrGnEyS0WaINZoMyS/feLc7fLvqDc/ZLubWSQ28AlcHP/Q
	Ax5Tq/LV65LGjiU4qbzYNw==
X-Received: by 10.200.26.150 with SMTP id x22mr4323336qtj.121.1504130147695;
	Wed, 30 Aug 2017 14:55:47 -0700 (PDT)
Received: from yoga.offpageads.com ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	w131sm4298690qkb.85.2017.08.30.14.55.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Aug 2017 14:55:47 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair@alistair23.me>, Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Wed, 30 Aug 2017 18:55:09 -0300
Message-Id: <20170830215523.25278-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170830215523.25278-1-f4bug@amsat.org>
References: <20170830215523.25278-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-trivial] [PATCH v2 03/17] MAINTAINERS: add missing STM32 entry
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
X-List-Received-Date: Wed, 30 Aug 2017 21:55:55 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Alistair Francis <alistair@alistair23.me>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5b7891addc..8c75ce477a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -552,6 +552,7 @@ F: hw/char/stm32f2xx_usart.c
 F: hw/timer/stm32f2xx_timer.c
 F: hw/adc/*
 F: hw/ssi/stm32f2xx_spi.c
+F: include/hw/*/stm32*.h
 
 Netduino 2
 M: Alistair Francis <alistair@alistair23.me>
-- 
2.14.1


