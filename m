Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eOzRf-0000GY-V3
	for mharc-qemu-trivial@gnu.org; Wed, 13 Dec 2017 00:19:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54987)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eOzRc-0000DV-Vi
	for qemu-trivial@nongnu.org; Wed, 13 Dec 2017 00:19:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eOzRc-0004fR-27
	for qemu-trivial@nongnu.org; Wed, 13 Dec 2017 00:19:00 -0500
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:37110)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eOzRZ-0004e9-LF; Wed, 13 Dec 2017 00:18:57 -0500
Received: by mail-qk0-x242.google.com with SMTP id i130so584603qke.4;
	Tue, 12 Dec 2017 21:18:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=mxhooxRP6D79PhQsASDOKeJRzpNGCSz4Xd1Uu5VCMq8=;
	b=pec2CduFDstcA6PMjr6Dw039dZPVVSB33dl8QX9Sbyq9oy58ZtXCcbkl04wu1W5GBp
	8kzG8eHzRuPyCVDfrsD2PbIKmUDYZGIKA8wlfke786PvDA50uJ6XNWJg0P+AeI+CUd6D
	qOPa+3samk0ejlKQt/RsJqqThAPuKkHSJ6tJ7YNriUe8ZpD9DkbAmOQj0ry7cFkufGkz
	NDeAuwcv4bszioy4YQnBlP3+G5Mra4BKm7RsmilYwxXS/4gnpg+ntyQsd4Nh9I4dbhGW
	gG2Vy8ZHVr4dEwRrrR68hQPhdCN+0X6cSx2t2Wc9WJpRibvT5e4UvyClqBFyn5hXZXzB
	rpzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=mxhooxRP6D79PhQsASDOKeJRzpNGCSz4Xd1Uu5VCMq8=;
	b=Im/4Or4yvDla8bzAUBbLgPAd+pXC0Df97dSggEyrd816pLdK+5qaHYTP+ONzoZPU10
	zQIF/2yoATqrnlHC0cCJXmfh6WAL5v2h9z/yAhDM9AF9qgtWpYR16ysUkPei4qj5Ur0r
	qWgu7v2W1RT7TChjuK2Quel9IElVMmQt4huwtlnGd1ghA4YvP4FU3LOWQJRVC9ZFdv04
	U65lSp46L0r66FXjQPAdN9YcjXMExXpD1k7CDOZowVkMkasn7emo+V06io1E8wXJiUMy
	AiLFOkLfhSzlJnl/o1IFs4Epa4YwDGzZRbn7N41RMSwI1h5L/M9s2Tq7vndu73rX6oz9
	vQvg==
X-Gm-Message-State: AKGB3mIF+KOtX7HCF2f4HfujF3Md/oY7FQVi6Sh/bCshgnR1DJQanDgU
	HdKNVW1CluXAi4F3woCM9mc=
X-Google-Smtp-Source: ACJfBou89/3Jg2uA/MFLAKzf7cpyyvI9DTDT0O2fRrM5p251wujHGuqojX0h+sv36fe550oBuS08IA==
X-Received: by 10.55.21.18 with SMTP id f18mr5161208qkh.257.1513142337243;
	Tue, 12 Dec 2017 21:18:57 -0800 (PST)
Received: from x1.local ([138.117.48.211])
	by smtp.gmail.com with ESMTPSA id d15sm522318qkc.26.2017.12.12.21.18.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Dec 2017 21:18:56 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	"Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Eric Blake <eblake@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Wed, 13 Dec 2017 02:17:36 -0300
Message-Id: <20171213051736.17755-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171213051736.17755-1-f4bug@amsat.org>
References: <20171213051736.17755-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: [Qemu-trivial] [PATCH 4/4] hw/registerfields: add missing include
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
X-List-Received-Date: Wed, 13 Dec 2017 05:19:02 -0000

This allows to use this header in qtests.

This fixes:
    CC      tests/test.o
  include/hw/registerfields.h:32:41: error: implicit declaration of function ‘MAKE_64BIT_MASK’ [-Werror=implicit-function-declaration]
              MAKE_64BIT_MASK(shift, length)};
              ^
  include/hw/registerfields.h:39:5: error: implicit declaration of function ‘extract64’; [-Werror=implicit-function-declaration]
       extract64((storage), R_ ## reg ## _ ## field ## _SHIFT,
       ^

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/registerfields.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/hw/registerfields.h b/include/hw/registerfields.h
index f59e7f47bd..44e0b94edf 100644
--- a/include/hw/registerfields.h
+++ b/include/hw/registerfields.h
@@ -11,6 +11,8 @@
 #ifndef REGISTERFIELDS_H
 #define REGISTERFIELDS_H
 
+#include <qemu/bitops.h>
+
 /* Define constants for a 32 bit register */
 
 /* This macro will define A_FOO, for the byte address of a register
-- 
2.15.1


