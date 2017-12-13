Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eOzRd-0000EG-NM
	for mharc-qemu-trivial@gnu.org; Wed, 13 Dec 2017 00:19:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54954)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eOzRb-0000BX-0H
	for qemu-trivial@nongnu.org; Wed, 13 Dec 2017 00:18:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eOzRW-0004bt-2I
	for qemu-trivial@nongnu.org; Wed, 13 Dec 2017 00:18:58 -0500
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:41368)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eOzRT-0004aN-Ln; Wed, 13 Dec 2017 00:18:51 -0500
Received: by mail-qt0-x243.google.com with SMTP id i40so2309139qti.8;
	Tue, 12 Dec 2017 21:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=U6gof/XJsJReyCTae3lSRrNSYR33AmUAylXstgPqJ6I=;
	b=IqgoZVW1gwHJuBuFq5s2iU7T1MMRasLGpAaIvMHgxMV0zpRAydXHMbPnBW7GNjxJux
	EHDqNAtYsHX/8BXve6HjkaBDZw4HfFpSOLA5fNDT/Jkfn/CRVnMrTiRHrDUH7UnUwnS/
	fo1tWjzOVQ5aNuUrtpfgeb+1hS3IV80Abkdp//c54EaAe+H6UVvzGSilXm8mM/3HCy4m
	SpiXex635WaPnuIAGMo4GiJGKZzolVIM7fI3EgZWwi4UBlAyU0QPEg4w1gHdiewaZD7M
	qKrSa1m1RAlVmhtaSPsYmNCfH6QsqeOM18q75v2hDjXs5Nk3C6i9+/7zeTEl2pSJ2UhQ
	oCgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=U6gof/XJsJReyCTae3lSRrNSYR33AmUAylXstgPqJ6I=;
	b=Z3ZvbJmbW+yBfO0AgPmD55VKW6hEFjFzkGU7+BAJ7K8kxajQ2iQRyLMAWo20EbLLX/
	HvOwqkZLyBSw9yrLZqsT4AUds8mU3oC7dc1TWt+0ECTJaA6rcwSRsZw8PvYCxdIuCyAM
	2L1ut/EPnVXkQVM3fY0oA/mHiQkYZBF6EtfJ9S6NL1AybsFapIoJYBAwyHv/7oRZM3/r
	pRm2rZGUY5wrsBm3+iXdzWwYlQBjnioRa/6H1DUEN/aXqRLXbfyT5aZvveekcff7QX9m
	cJlbj83YQllQowNcNO7h7rYrSxWzbF/oNOrmh0ukJ31JzotdIvH6ZhQz/g0fq4Ki82Mv
	56Vw==
X-Gm-Message-State: AKGB3mLWlKGu8eBAnfA+iBy62J+Hg9TmSPkUvPuTWd7IwnjnwApgCgJ1
	VJHWbr+j3+jYPanW5RIJzJtHNGRw
X-Google-Smtp-Source: ACJfBosXEbRfViG4MVyZVPnN55nHSUez0AKZPllELu68OYKQrtGKiKG9nHYDuKkAUuHwEbBl/tXUFw==
X-Received: by 10.200.38.33 with SMTP id u30mr9690926qtu.197.1513142331230;
	Tue, 12 Dec 2017 21:18:51 -0800 (PST)
Received: from x1.local ([138.117.48.211])
	by smtp.gmail.com with ESMTPSA id d15sm522318qkc.26.2017.12.12.21.18.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Dec 2017 21:18:50 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	"Edgar E . Iglesias" <edgar.iglesias@xilinx.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Wed, 13 Dec 2017 02:17:35 -0300
Message-Id: <20171213051736.17755-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171213051736.17755-1-f4bug@amsat.org>
References: <20171213051736.17755-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-trivial] [PATCH 3/4] hw/registerfields: add 64-bit
 extract/deposit macros
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
X-List-Received-Date: Wed, 13 Dec 2017 05:19:00 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/registerfields.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/hw/registerfields.h b/include/hw/registerfields.h
index ad9d7a82a3..f59e7f47bd 100644
--- a/include/hw/registerfields.h
+++ b/include/hw/registerfields.h
@@ -35,6 +35,9 @@
 #define FIELD_EX32(storage, reg, field)                                   \
     extract32((storage), R_ ## reg ## _ ## field ## _SHIFT,               \
               R_ ## reg ## _ ## field ## _LENGTH)
+#define FIELD_EX64(storage, reg, field)                                   \
+    extract64((storage), R_ ## reg ## _ ## field ## _SHIFT,               \
+              R_ ## reg ## _ ## field ## _LENGTH)
 
 /* Extract a field from an array of registers */
 #define ARRAY_FIELD_EX32(regs, reg, field)                                \
@@ -52,6 +55,14 @@
     d = deposit32((storage), R_ ## reg ## _ ## field ## _SHIFT,           \
                   R_ ## reg ## _ ## field ## _LENGTH, v.v);               \
     d; })
+#define FIELD_DP64(storage, reg, field, val) ({                           \
+    struct {                                                              \
+        unsigned int v:R_ ## reg ## _ ## field ## _LENGTH;                \
+    } v = { .v = val };                                                   \
+    uint64_t d;                                                           \
+    d = deposit64((storage), R_ ## reg ## _ ## field ## _SHIFT,           \
+                  R_ ## reg ## _ ## field ## _LENGTH, v.v);               \
+    d; })
 
 /* Deposit a field to array of registers.  */
 #define ARRAY_FIELD_DP32(regs, reg, field, val)                           \
-- 
2.15.1


