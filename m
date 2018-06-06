Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fQaGJ-00051a-J5
	for mharc-qemu-trivial@gnu.org; Wed, 06 Jun 2018 11:22:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39386)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQaGC-0004x3-Vw
	for qemu-trivial@nongnu.org; Wed, 06 Jun 2018 11:22:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQaG8-0003jB-UU
	for qemu-trivial@nongnu.org; Wed, 06 Jun 2018 11:22:05 -0400
Received: from mail-qk0-x236.google.com ([2607:f8b0:400d:c09::236]:43368)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQaG3-0003fL-OJ; Wed, 06 Jun 2018 11:21:55 -0400
Received: by mail-qk0-x236.google.com with SMTP id g126-v6so4173107qke.10;
	Wed, 06 Jun 2018 08:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=QYvFWPBSMWwJbUGc5akXTGpS4UgpgWcqIlqi8pDaTIo=;
	b=jslnmLibGacWKR7+Rvxg7igBLUn5/afOyn+NY7KCoiaWpnfuano/BgiHxNXFH69ikk
	eyj5JJC5apQWUUW2iVL+TtMUJUaLbf4dKhdBYrUkfAPHVaH/n83lDqb4x5CP5vZiWYFH
	CMcWYtwFdYcjIiBsNTfcRm5Nb5g3RgtPguxUFD0BEgLLR4Tc6RfNSK3wL4Df8ZdM9tC0
	76gxp1ghjyuxiGF3Sa6SNGbD7sxzpQOUqpObAwbC//qiAkJIyl+u72IJQjkrv7MsNOWE
	VMjlXv6eNAY/fpmIxQV7dk/9rzLUSReYd/ifUxvS3IpEqXa5M8Y9Xht+1OKdYx7jh87h
	/4Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=QYvFWPBSMWwJbUGc5akXTGpS4UgpgWcqIlqi8pDaTIo=;
	b=Cdtr67Lk6mi+Cjuq14a5/iA+YFaOnslT0X4F+QXr14bAb71bQnKzC0b9HXqF7g8NTq
	3hwGN8LJuBMuH4g2RoEnYqOhNjC8AyK9+BLRb/DiKEKxqB2BuOIX4KIaesx5QvWOfcei
	+6Q1P7HaU1n8C7cRAHzjG81mMoe7bW7rT6gM1r5gLVwe46/zAmsDn0UJas78lG8n2jWG
	OfbFvJ2bIQJhywxMhAw+cadbZMYQzkQHFPrRYZyX2IbhbLSzYjNqPopmM7pK5H35KayR
	mAsXEBlMDG1qNc5UT+d6nnyE7kYDFKevUSOjPBSEJTha/kYoC3ND9pF9gr1sbIabaPVT
	0UnA==
X-Gm-Message-State: APt69E1rvRA6+iB2y5sOs3tKKph6HghTQ04Q6KVEu345quW6ePlSnr+o
	fc3JXNMpafJlkSzUEz1YuCI=
X-Google-Smtp-Source: ADUXVKKgovvmEtrnLIZcSxe26y80QgR8usSqR1oHjGAFLE52PprA5iHS7mOcF4rkuAP7iBlsbxuG4Q==
X-Received: by 2002:a37:c24d:: with SMTP id
	j13-v6mr2916136qkm.210.1528298515239; 
	Wed, 06 Jun 2018 08:21:55 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	i8-v6sm38756255qtb.11.2018.06.06.08.21.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Jun 2018 08:21:54 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Aurelien Jarno <aurelien@aurel32.net>, Paul Burton <paul.burton@mips.com>,
	Yongbok Kim <yongbok.kim@mips.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Wed,  6 Jun 2018 12:21:23 -0300
Message-Id: <20180606152128.449-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180606152128.449-1-f4bug@amsat.org>
References: <20180606152128.449-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::236
Subject: [Qemu-trivial] [PATCH 06/11] hw/mips/boston: Add trailing '\n' to
 qemu_log() calls
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
X-List-Received-Date: Wed, 06 Jun 2018 15:22:06 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/mips/boston.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/mips/boston.c b/hw/mips/boston.c
index 5302e5c885..52cce19766 100644
--- a/hw/mips/boston.c
+++ b/hw/mips/boston.c
@@ -176,7 +176,7 @@ static uint64_t boston_platreg_read(void *opaque, hwaddr addr,
     uint32_t gic_freq, val;
 
     if (size != 4) {
-        qemu_log_mask(LOG_UNIMP, "%uB platform register read", size);
+        qemu_log_mask(LOG_UNIMP, "%uB platform register read\n", size);
         return 0;
     }
 
@@ -205,7 +205,7 @@ static uint64_t boston_platreg_read(void *opaque, hwaddr addr,
         val |= PLAT_DDR_CFG_MHZ;
         return val;
     default:
-        qemu_log_mask(LOG_UNIMP, "Read platform register 0x%" HWADDR_PRIx,
+        qemu_log_mask(LOG_UNIMP, "Read platform register 0x%" HWADDR_PRIx "\n",
                       addr & 0xffff);
         return 0;
     }
@@ -215,7 +215,7 @@ static void boston_platreg_write(void *opaque, hwaddr addr,
                                  uint64_t val, unsigned size)
 {
     if (size != 4) {
-        qemu_log_mask(LOG_UNIMP, "%uB platform register write", size);
+        qemu_log_mask(LOG_UNIMP, "%uB platform register write\n", size);
         return;
     }
 
@@ -237,7 +237,7 @@ static void boston_platreg_write(void *opaque, hwaddr addr,
         break;
     default:
         qemu_log_mask(LOG_UNIMP, "Write platform register 0x%" HWADDR_PRIx
-                      " = 0x%" PRIx64, addr & 0xffff, val);
+                      " = 0x%" PRIx64 "\n", addr & 0xffff, val);
         break;
     }
 }
-- 
2.17.1


