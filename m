Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dqND9-0006Lv-NC
	for mharc-qemu-trivial@gnu.org; Fri, 08 Sep 2017 13:36:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38514)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dqND7-0006KY-Mm
	for qemu-trivial@nongnu.org; Fri, 08 Sep 2017 13:36:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dqND3-0006oj-Pw
	for qemu-trivial@nongnu.org; Fri, 08 Sep 2017 13:36:57 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:33268)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dqND3-0006oL-LG; Fri, 08 Sep 2017 13:36:53 -0400
Received: by mail-qt0-x244.google.com with SMTP id h15so1959578qta.0;
	Fri, 08 Sep 2017 10:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:mime-version
	:content-transfer-encoding;
	bh=LRIaSkvaXbzyMAf1ZND0sDj2yZgVGO5P6LXlLNt7Eno=;
	b=fjpk7971Drh7VKUzlL8onXJ+4toQv/qQyxMqGL4zrCEGnTAQNxbR3+UrQnDPOupm0J
	2qnzc1cIoxhSP2xcjcSOMZMtPHz8VnT/tYLxuwWoYUIFYjQo1+8TPyL36RJ1Ko414emJ
	GhARIo9JAXd7DM/803wt4lnp992Hfe1deRztM4641/P4nQDfnVhlg3MJoVmIPEjr2b9n
	eI7FHOezroQhPLYqmNQGTkdq+ukLzKhBFlAgXjvVX9Q1sJ0m/KoGJpwic8aPUtadNUkQ
	EO1uOmY4Kd5VLoJm47KIG20wU63kP3wmAnmgmbW7EbJYw4g2pVcrlSwGUg5idZNHYlmy
	ws/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:mime-version:content-transfer-encoding;
	bh=LRIaSkvaXbzyMAf1ZND0sDj2yZgVGO5P6LXlLNt7Eno=;
	b=UjhQPCqGiT9+M1oMxryMJ/7rVJ+tBsJQmJpm8ZROj+VfozJA7TtgIQelyu2CfJZVaU
	4/+KMeuJ2KGaps6gGapDCvPjsf/89w94exY+ZT2kSWuQf+Akkv++nko6ew9MxYt2vWv8
	F/xq+4j/HI31Xxh/ayaPG8/PrITH3UUqeJEfkeCoSgaPnRiD9jmXLum8s3JheECg+i0/
	0W7iuvZ9zeEhmEXO+gbyVkOonktLnIz7BL50B1j28IdIpfszCqFt3jwxqr+I4cQ6tgVL
	BJI+1RAs60Zq7r7okQArW5FoYY4ndb1xX9fF9/T846WwCtPFg3bZ5BrSu6DXzgGQmNEq
	9mTA==
X-Gm-Message-State: AHPjjUiC3tw2enWMaD0dNQT9C8D34BDKVZl0+JeXSPPLY3K+ga0Ong3B
	cBZLHywZHXt2ty6eEZtKMw==
X-Google-Smtp-Source: AOwi7QAfTv1W2ATon+IJRfJ6J7wSefGPHgSwMX4OeGYX4sYibKguz9MgT1WLfDChZP0bKUTVwPcW0w==
X-Received: by 10.200.18.67 with SMTP id g3mr4901786qtj.2.1504892212853;
	Fri, 08 Sep 2017 10:36:52 -0700 (PDT)
Received: from yoga.offpageads.com ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id f4sm1605859qtg.35.2017.09.08.10.36.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Sep 2017 10:36:51 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	Alistair Francis <alistair@alistair23.me>, Thomas Huth <thuth@redhat.com>,
	qemu-arm@nongnu.org
Date: Fri,  8 Sep 2017 14:36:19 -0300
Message-Id: <20170908173632.6711-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170908173146.6446-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-trivial] [PATCH v3 02/15] MAINTAINERS: add missing STM32 entry
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
X-List-Received-Date: Fri, 08 Sep 2017 17:36:58 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Alistair Francis <alistair@alistair23.me>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 35c8c9c752..fb93e4b554 100644
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


