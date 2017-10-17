Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4FVK-00066I-3r
	for mharc-qemu-trivial@gnu.org; Mon, 16 Oct 2017 20:13:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33272)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FVH-00063b-KN
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 20:13:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FVG-0003yY-QY
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 20:13:03 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:46395)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FVF-0003xZ-0A; Mon, 16 Oct 2017 20:13:01 -0400
Received: by mail-qt0-x243.google.com with SMTP id 1so66946qtn.3;
	Mon, 16 Oct 2017 17:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=gHdLRvpDVFNy+qKKL3ixK7mNa6loNMIqjMR1Oh9hAEY=;
	b=qMq9QTQEFisHpX7DRqw/VMjICte9SQU0NZjKs8Tlwh24v7Hf+wC9Osg5Ag0oTftGt+
	mJIrslOu9y9W3Z4JMD8xTmuEwFXlsn7DR/aHWIhUIp+0p5veG2kLCungiAC2IsVqDje+
	jaLGAqnRdu5+ceqnMyv+lrsxHghXUgWtzwKxVN95jJ9i5LBpoyl2IheCdIpXFqiiS7ib
	R8g1jfiXK7DvVZj8P12dEBSRPg6FtDKXC7e3rFVffglkNe6RMHZeSrpevqYBSjQ0KgKf
	P8uXuLaF7yboalEcrFxtxh0UieGQ/BGE8prnAI94g4Z5EDgP4nDakO6JS6tHu4AZY+/c
	JQ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=gHdLRvpDVFNy+qKKL3ixK7mNa6loNMIqjMR1Oh9hAEY=;
	b=Wcd8tZS0AmVkPsRhotu/mq0DSE/K02AmuV9K5Czyv4ZCwQ/0OQlb+u9FMK/bYhdpYa
	eISEA7okI/cFZHHm2oTNj/BOGKw17L7CAapxnoaQCKAVZoAKbbC7bPQYSCsML/O8jb9h
	ZP1qnP7+M6izauMYIRgVwR30Ej6J5apaYVQUhTzal5KlSmSCmFgIFQT1jhtNujb0Jne+
	u2WHEfNv7nOeyW0+31mpMatnDAwBtioP1Pzk9rsJEG4IV8Raq5jX6NR/YlzjQeG6Khld
	qYncdXKgr985MSmG30SvBJNbOiVGyEWpdXWINYMyagCnvgPpzTMhEXxRxI4TX4VCVbOD
	BvxA==
X-Gm-Message-State: AMCzsaUv+OwXb/0WJ9czDy2nAB25f7aesrAIn169j8fOh5rhp2DUdpg3
	SPdSUah5xD4s/+ynf46H+4biYssx
X-Google-Smtp-Source: AOwi7QCxc9Zh6Azh4VYcFHNUE7v9/jVnHOx3wimtcDviFE33Iqk1RAuyrUaRml4TNJ76FueafTzYBw==
X-Received: by 10.200.22.103 with SMTP id x36mr18104802qtk.52.1508199180627;
	Mon, 16 Oct 2017 17:13:00 -0700 (PDT)
Received: from x1.local ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id r6sm5409043qkh.22.2017.10.16.17.12.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Oct 2017 17:13:00 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Mon, 16 Oct 2017 21:11:40 -0300
Message-Id: <20171017001209.32276-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.0.rc0
In-Reply-To: <20171017001209.32276-1-f4bug@amsat.org>
References: <20171017001209.32276-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-trivial] [PATCH v2 10/39] block: remove "qemu/osdep.h" from
 header file
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
X-List-Received-Date: Tue, 17 Oct 2017 00:13:04 -0000

applied using ./scripts/clean-includes

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 block/dmg.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/block/dmg.h b/block/dmg.h
index b592d6fa8b..2ecf239ba5 100644
--- a/block/dmg.h
+++ b/block/dmg.h
@@ -26,7 +26,6 @@
 #ifndef BLOCK_DMG_H
 #define BLOCK_DMG_H
 
-#include "qemu/osdep.h"
 #include "qemu-common.h"
 #include "block/block_int.h"
 #include <zlib.h>
-- 
2.15.0.rc0


