Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fQZuW-0007Gz-Rm
	for mharc-qemu-trivial@gnu.org; Wed, 06 Jun 2018 10:59:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60689)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQZuU-000799-HM
	for qemu-trivial@nongnu.org; Wed, 06 Jun 2018 10:59:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQZuT-0007FH-Q7
	for qemu-trivial@nongnu.org; Wed, 06 Jun 2018 10:59:38 -0400
Received: from mail-qk0-x236.google.com ([2607:f8b0:400d:c09::236]:41191)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQZuR-0007C4-Rx; Wed, 06 Jun 2018 10:59:35 -0400
Received: by mail-qk0-x236.google.com with SMTP id w23-v6so4115451qkb.8;
	Wed, 06 Jun 2018 07:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=2UdlsGmLRfF9Nz5vSYEwQfta7NY7rE+wFRsfFU7Qew0=;
	b=G9lHHc9RrE0esbHIV42DDHbaG0ELYJdBgNdLCKE2rzV+Fh6PVT7XK5AEUNl53UnORc
	b/1n3E73YH4p8D2PM1tVZgEBPLYERgA3V5a1Fz/xYxI8X9i8A0WKvU8MqDRZKtllvBvS
	DYDBWi7Cu+GGgIJuF5fLituhbYYig5BIFhZJ443pTJWm63Vzu/v1HCUarYPIh0fEHClP
	NXGhYAYjeAJv9JWG0OzaOMEFUMaOKnyfN/jHbSpqSval5ZBwE4wlgxDKS9wv7wHuR557
	zd9xJyGq/WUInNIKKshBuWS2NlNHQPBtVidoNTMAG1VjjFC+XJZczWkjoFB8ZwcPrWOb
	FgVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=2UdlsGmLRfF9Nz5vSYEwQfta7NY7rE+wFRsfFU7Qew0=;
	b=ts+VgylhgyFEiNPN4rHbvxtrqAxEXlnFfK7zcwOLIqg04pKNx3r2X8hbX4zw/M8rts
	Y585Xobbf+lgw9N+CB4oizctNC7x+A122+EBrnyqEEmpZ+YCOjFEscnz/AukI8wOKCNK
	vOMIhnsAO0Eyi+6l/PeUeu77QhLg08JmV0c+tz3qHAKVL8su0omlvzml5doYx5DdFDuh
	0sL0roevLvN/mOCK7fBpJVB7xwen2Y8+5kOeLoL/mtusjoXUTY8X3I8B1b/Vf3Vbcg8l
	dKmQwiTjlE5ZsAPbsHLeC92waIQQ8WGu+KR3ALMjYdF9OO3IfyD6nJB4tl8BCD1GPSr0
	YAwQ==
X-Gm-Message-State: APt69E1mcaYQyazn495gZMbVkyfzkk+hZJq0x9xZzcMUrr/QtA+7jOC2
	BuUL9z5GEEa0kP6Mq6p1lGo=
X-Google-Smtp-Source: ADUXVKLYDcovUY1TgXZeOhFIrptubEy+o1EUb4J4Bao5n6DDT4HYvCqmlNrraSXryFc922jSTD49dg==
X-Received: by 2002:a37:7101:: with SMTP id m1-v6mr2788513qkc.19.1528297175216;
	Wed, 06 Jun 2018 07:59:35 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	v29-v6sm8519439qkv.28.2018.06.06.07.59.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Jun 2018 07:59:34 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Alexander Graf <agraf@suse.de>, David Gibson <david@gibson.dropbear.id.au>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-ppc@nongnu.org
Date: Wed,  6 Jun 2018 11:59:20 -0300
Message-Id: <20180606145921.30606-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180606145921.30606-1-f4bug@amsat.org>
References: <20180606145921.30606-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::236
Subject: [Qemu-trivial] [PATCH 2/3] MAINTAINERS: Add entries for the MOS6522
 VIA device
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
X-List-Received-Date: Wed, 06 Jun 2018 14:59:39 -0000

Introduced in 51f233ec92c.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2423b248fb..c0922765f6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -766,8 +766,10 @@ F: hw/ppc/mac_newworld.c
 F: hw/pci-host/uninorth.c
 F: hw/pci-bridge/dec.[hc]
 F: hw/misc/macio/
+F: hw/misc/mos6522.c
 F: hw/nvram/mac_nvram.c
 F: include/hw/misc/macio/
+F: include/hw/misc/mos6522.h
 F: include/hw/ppc/mac_dbdma.h
 
 Old World
-- 
2.17.1


