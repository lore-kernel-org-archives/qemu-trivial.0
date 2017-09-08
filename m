Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dqNEG-0007O4-Mm
	for mharc-qemu-trivial@gnu.org; Fri, 08 Sep 2017 13:38:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39109)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dqNEE-0007Lw-GE
	for qemu-trivial@nongnu.org; Fri, 08 Sep 2017 13:38:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dqNED-0007YA-Ni
	for qemu-trivial@nongnu.org; Fri, 08 Sep 2017 13:38:06 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:33990)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dqNED-0007Y2-K6; Fri, 08 Sep 2017 13:38:05 -0400
Received: by mail-qk0-x244.google.com with SMTP id d70so1918520qkc.1;
	Fri, 08 Sep 2017 10:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:mime-version:content-transfer-encoding;
	bh=XAfHl5NWLWNERc39auxN5sCHFZOAarenhTrOmFSFfrQ=;
	b=Drm/ypZPz6TgzLrP8AL8aGIS21/k2/ddJsEpmhQKWkfG+zwJBwS/YN5dOK334+qJ7t
	AsHUIY3lf0rFaKy8FwpR5AQ53FeLOr0ceYSPLz04AC2k/CL/3pfB2ZKAIHid46HBwnnf
	Lyv5cP+wGVcGhYVf22ZDS5s7wSWX+6O8t3vXStDcUyj7UF1xZIso2UXjm4S3T+o3edTl
	3SVyhSctWkjTZ0LG2yw47lKps7rlK9AHOLhRmcjE6Tyrwvfw2EOeRIxAIwD6EcFFq0C9
	ToyoPG7khgVfVqj2EKCAqbwMVJpvX3GdDiRY7+puzfXYIzIA1/6Zk1UQOIABWoLaMQV4
	PYkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:in-reply-to:mime-version
	:content-transfer-encoding;
	bh=XAfHl5NWLWNERc39auxN5sCHFZOAarenhTrOmFSFfrQ=;
	b=Z19lCpihPHDonP5VlDajMQZTuZqnJpoaqtb/vR7F/4yWmuOsd4QPVYuLYdkNvWUNxW
	ekDXoLONcvH7tzcUc0GZFzGcX1z5xHoaV8SVtGCdpDSdTixYVJ3CJs0mzATszYS0pCZg
	kysgp9rmjZqzsDHctFwfnwqb+OKPjX4hfm/zgZZTIjND8BKoslado4pdNIovjrgjd/Kq
	jj4LeyyzyPDQk8PQWkmzCtLOvqwDkFV1EGJ7ZJHyX4W9+uorHG5bsqTidyrU20UjQzlL
	Ixl3+4LMCxN9TQJx8EA8wIvPxvZORvE0iT2iHdlMNXtjUbBjcDHg6Fnkqu3TSaAXdWO2
	oBHQ==
X-Gm-Message-State: AHPjjUjxxBIe8bEElfVihxc/xNlKatVca0MqeX2+u7tmogBWQvl1RgYw
	PWD67Z/YhZV7lJbgqlfkUw==
X-Google-Smtp-Source: AOwi7QD9HKYOem7RipDO+Oe3GDf9wWjss5GtY/LOV3GM0qKkRzJoC8SSMsUT/2RUDysg7MUHiHM4Ug==
X-Received: by 10.55.25.29 with SMTP id k29mr4996133qkh.229.1504892284861;
	Fri, 08 Sep 2017 10:38:04 -0700 (PDT)
Received: from yoga.offpageads.com ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id f4sm1605859qtg.35.2017.09.08.10.38.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Sep 2017 10:38:04 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	Alistair Francis <alistair.francis@xilinx.com>
Date: Fri,  8 Sep 2017 14:36:29 -0300
Message-Id: <20170908173632.6711-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170908173632.6711-1-f4bug@amsat.org>
References: <20170908173632.6711-1-f4bug@amsat.org>
In-Reply-To: <20170908173146.6446-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-trivial] [PATCH v3 12/15] MAINTAINERS: add missing entry for
 Generic Loader
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
X-List-Received-Date: Fri, 08 Sep 2017 17:38:07 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 98b7edc8b3..8024a3880b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1163,6 +1163,7 @@ M: Alistair Francis <alistair.francis@xilinx.com>
 S: Maintained
 F: hw/core/generic-loader.c
 F: include/hw/core/generic-loader.h
+F: docs/generic-loader.txt
 
 CHRP NVRAM
 M: Thomas Huth <thuth@redhat.com>
-- 
2.14.1


