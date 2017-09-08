Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dqNE9-0007GB-H2
	for mharc-qemu-trivial@gnu.org; Fri, 08 Sep 2017 13:38:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39000)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dqNE7-0007CM-4L
	for qemu-trivial@nongnu.org; Fri, 08 Sep 2017 13:38:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dqNE5-0007SG-Vr
	for qemu-trivial@nongnu.org; Fri, 08 Sep 2017 13:37:59 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:38324)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dqNE5-0007Rt-Qg; Fri, 08 Sep 2017 13:37:57 -0400
Received: by mail-qk0-x242.google.com with SMTP id c69so1908531qke.5;
	Fri, 08 Sep 2017 10:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:mime-version:content-transfer-encoding;
	bh=IcQ5rRLj0L0YoF1T68mNXzIHmx/hM7zC8hys2yyDrFk=;
	b=C9RvGZj/2/jrpdeNvCUy/SVSPm7LbVQbh3OCn6hait7ZwJB9HrF4/92qojqRT6te4L
	uwLc1538Ymi8S1bXaeXLLznm1Ecq1966hPkgdUt+PWe65HOlhBpW4wGKcGEj4s61vWgn
	7agZhON0x6C3WcwwaBkeYlevD2vUeKbIY0Tdvuip3fCn/ZKS4crNdpRa7drMjcJFk9rD
	JJyoQ5aoeIcs8CP/FU4fIdS5gSYX10jm998L10C0iMkvcQ/t1vjHWjnblrJvU9ao+8Ap
	HUSrkcAqARo4VCuEMkqK40SjIPFSMVl2eLSXVCj2qK+GYNDYltQOn8eMhbHQPVdYBNmd
	zbLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:in-reply-to:mime-version
	:content-transfer-encoding;
	bh=IcQ5rRLj0L0YoF1T68mNXzIHmx/hM7zC8hys2yyDrFk=;
	b=nwSIwzfA7C2n/rQM7nDtoKC9jMQpcBv16th8F/VIE3Vg4C4c51bP46hlqZmYHAUcUr
	gsEqBGk0W5IhPz2uOlBYB9rrZXknT98quY//G+z4XI/JEJkVf2p5uixYljC+bG+pJkCi
	yBWKt/Sih4lXGFjVl9xFggSDQhVZnHkh/Vc255X9rxmA4Ds3tRgaMitC75S3ofp9JYhi
	9sRUaVUdeYBPjQRRSdPL6BAerUPXsEkROZrTXMYjpLzzwtwYtvQEKDy5f2jaF9ZbULAc
	UNxoUv5e+QqFEKl7DDx8iDbjRSqFBxfuAWPAqhnXjDpMcMqDWoG1FMWgyDlFYCngC9Nn
	MldA==
X-Gm-Message-State: AHPjjUgmE6M5P12wsv5EAFlieWXzTu5LWXZhk5vdKXeRmRdGDlMjFRWb
	Irpaseg0+N1kYUdOkoGIFQ==
X-Google-Smtp-Source: AOwi7QAutVeKAAy/VPK2JaOUcgF5qd18C7jplf7jx8mtxVU1hldQJo5oHDpqCxKroTHjkGUT01eH9Q==
X-Received: by 10.55.159.81 with SMTP id i78mr5075607qke.81.1504892277061;
	Fri, 08 Sep 2017 10:37:57 -0700 (PDT)
Received: from yoga.offpageads.com ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id f4sm1605859qtg.35.2017.09.08.10.37.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Sep 2017 10:37:56 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Alistair Francis <alistair.francis@xilinx.com>
Date: Fri,  8 Sep 2017 14:36:26 -0300
Message-Id: <20170908173632.6711-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170908173632.6711-1-f4bug@amsat.org>
References: <20170908173632.6711-1-f4bug@amsat.org>
In-Reply-To: <20170908173146.6446-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: [Qemu-trivial] [PATCH v3 09/15] MAINTAINERS: add missing SSI entries
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
X-List-Received-Date: Fri, 08 Sep 2017 17:38:00 -0000

Alistair Francis volunteered :)

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
---
 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 69ad3aac29..517c8f95d7 100644
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


