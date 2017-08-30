Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dnAy5-0005iX-C7
	for mharc-qemu-trivial@gnu.org; Wed, 30 Aug 2017 17:56:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49039)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dnAy3-0005fW-3F
	for qemu-trivial@nongnu.org; Wed, 30 Aug 2017 17:56:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dnAy2-0007qz-DF
	for qemu-trivial@nongnu.org; Wed, 30 Aug 2017 17:56:11 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:37985)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dnAxy-0007p1-6S; Wed, 30 Aug 2017 17:56:06 -0400
Received: by mail-qk0-x242.google.com with SMTP id o63so6387843qkb.5;
	Wed, 30 Aug 2017 14:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=MMPFmNw/5caLXA4+t/btoe0b8cSXg38CZ2mwhRkUQcU=;
	b=Y5ErpFRuP6qOQDGLzBcxM8GbOD/W3V8NVIiZ49xvLDUpbkOtfeZ71vGzoRcHfy/Mbr
	kFwYlR9+nzMtAlDqwFITQCpqerCd2dO4b6tXUlgh97uWnqZEIPMXMDl+0V3VW13VWP3L
	kAbFH4l58G4MJMSC24B+7GIOcHMU3g+jbWh3DidI7JaIirJyBSntpOm9zqjbiNLwmMzG
	d/DJB5IVQTXf9i23dHQmtOy1Ud+DVzTyZJ+KsKWG/rX/YH/1lxfFqimRqIqA4FLB7heD
	IGKxBI3FRklp84FgumiGBnMqio3JrmRkRbpIRJ+qBxr0SlXaEC2DuBxVBdZuZJH9eb5J
	OkWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=MMPFmNw/5caLXA4+t/btoe0b8cSXg38CZ2mwhRkUQcU=;
	b=bcZDlVOt85sqkTOAmmXbbJ0B+Gy/vgnZqwp9dWOjWm14B8VGuhLBHBmK9B+4giAzoT
	nA9067Q6Ruh/aM4usFPRWsaPNKYPfDUZLl/TQdQceCqlPUFaZepiUQTiCGmd0OgEyZpc
	tWzkI3jvMDuCmGhlMvb0jIvR6dF0MpD7I6VyGyyYZB8annyFdb1Z0CiwjFwFvq4fqCEn
	FCwTxkfjqljPwl8v+WV8QG7i2KdeYSo/WHdfDWzdVxwWze7mTz4ov0nDvz+vd0zjLOcS
	z4gek69cHiOGLFO9V4WyLLbiq5GHUvYNOMQbb5Q/Um59K/lUSJzFhH7Q9K9EaOnCqRZT
	pySw==
X-Gm-Message-State: AHYfb5ixovioMl6sJwXNNWpY9/J+JC8I96PoS8D2wvlXrx8fmreoB0bJ
	KGENKCrd9rbIZw==
X-Received: by 10.55.4.1 with SMTP id 1mr970322qke.301.1504130165661;
	Wed, 30 Aug 2017 14:56:05 -0700 (PDT)
Received: from yoga.offpageads.com ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	w131sm4298690qkb.85.2017.08.30.14.56.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Aug 2017 14:56:04 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Alistair Francis <alistair.francis@xilinx.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Wed, 30 Aug 2017 18:55:16 -0300
Message-Id: <20170830215523.25278-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170830215523.25278-1-f4bug@amsat.org>
References: <20170830215523.25278-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: [Qemu-trivial] [PATCH v2 10/17] MAINTAINERS: add missing SSI entries
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
X-List-Received-Date: Wed, 30 Aug 2017 21:56:12 -0000

Alistair Francis volunteered :)

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index bbe1191883..0a3a50aa25 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -986,10 +986,13 @@ F: hw/scsi/lsi53c895a.c
 
 SSI
 M: Peter Crosthwaite <crosthwaite.peter@gmail.com>
+M: Alistair Francis <alistair.francis@xilinx.com>
 S: Maintained
 F: hw/ssi/*
 F: hw/block/m25p80.c
+F: include/hw/ssi/ssi.h
 X: hw/ssi/xilinx_*
+F: tests/m25p80-test.c
 
 Xilinx SPI
 M: Alistair Francis <alistair.francis@xilinx.com>
-- 
2.14.1


