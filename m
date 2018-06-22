Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fWMJe-0006WT-V7
	for mharc-qemu-trivial@gnu.org; Fri, 22 Jun 2018 09:41:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60096)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWMJc-0006TP-6E
	for qemu-trivial@nongnu.org; Fri, 22 Jun 2018 09:41:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWMJa-0003sU-Tw
	for qemu-trivial@nongnu.org; Fri, 22 Jun 2018 09:41:28 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:46614)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWMJW-0003lx-Pp; Fri, 22 Jun 2018 09:41:22 -0400
Received: by mail-qk0-x242.google.com with SMTP id o2-v6so3652933qkc.13;
	Fri, 22 Jun 2018 06:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=PXIZKg3YGLOO4vafTYVLifGu8wGdKxGuAfiQyEwO7dw=;
	b=HPDzjrhLRNUoHN/eGImj3kLw4TI2hk0e4vZdvEH/FpctkmIQi+ECe+3pehmNwqyEU3
	khShTnvhoZljjRu94Rlui1Hb1LnCwJgPO02CPNk2bX6iCqKcWwZBYk7lycO50kDNpE7O
	7J/N3yseJhwsXwbHTSCVhlqGSGG8IHEZ7xqSZkeWKtnxUdH1rNeFDhEvLC/0yYxNTNZY
	2U/xg7GYzzcaAkIQP+ztgKLLzFJTjLwZHhiKhu9vlam93f8CNB0+90YfDzYtCc6cEytA
	qprR22C4oVe8KtAX4TggiI7+MuuImUGpFwkYjcxj6/OIshBxIIDb3Dwh0M8FsckqV2sA
	3jkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=PXIZKg3YGLOO4vafTYVLifGu8wGdKxGuAfiQyEwO7dw=;
	b=kMh8N/cxi6J4r11id4572+lryguQRo6Hy5HoPeFs2ngmkNeCoO/NvGdl/AggaWJj3s
	D8j83p60d9bHlmRoWSESk6XVuUs+rRB1ViV2ZyYhQkGmzhuA/+/OSzlQBqX3eJXh0afq
	/ipJtUo1jjfmfIwdb/s9e9AyF1Vrfz0Wc9dJDBxefh9/JxmsZL60eLu+rc5MHvqtrD2F
	Ax6tyEZQrZmRLqsGK7vFcP8/pernHHoyt4FdWukL1e7YSyj5o3BA+SOIfuVqZ4V+yHa3
	kk6VtRYvdfKSqO5LIhZ5VXOkJYl6MtsieiO7Xw7pG9Yhzl4Rb1fyMs4S8QQV8f7dp+lN
	DAQQ==
X-Gm-Message-State: APt69E0BLQzH33yYQfYB2BBP7oHO5l653qNUS75nAbSrGtLZxFVh9hr/
	jHNX98kmOvjXm1X8ESza0pkZdSDU
X-Google-Smtp-Source: AAOMgpdgeARUWFvUTVKj07VWji5wfvzmEisAs+Z/jhLIDBLR2kg10NJCrvjTKQQVd0F3IplsDjadxQ==
X-Received: by 2002:a37:18c4:: with SMTP id
	65-v6mr1291846qky.415.1529674882196; 
	Fri, 22 Jun 2018 06:41:22 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	s39-v6sm6006629qts.42.2018.06.22.06.41.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Jun 2018 06:41:21 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-arm@nongnu.org
Date: Fri, 22 Jun 2018 10:40:36 -0300
Message-Id: <20180622134036.23182-15-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0.rc2
In-Reply-To: <20180622134036.23182-1-f4bug@amsat.org>
References: <20180622134036.23182-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: [Qemu-trivial] [PATCH v2 14/14] hw/arm/stellaris: Fix gptm_write()
 error message
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
X-List-Received-Date: Fri, 22 Jun 2018 13:41:29 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/stellaris.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index d06e366402..42baa768b2 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -294,7 +294,7 @@ static void gptm_write(void *opaque, hwaddr offset,
         break;
     default:
         qemu_log_mask(LOG_GUEST_ERROR,
-                      "GPTM: read at bad offset 0x%x\n", (int)offset);
+                      "GPTM: write at bad offset 0x%x\n", (int)offset);
     }
     gptm_update_irq(s);
 }
-- 
2.18.0.rc2


