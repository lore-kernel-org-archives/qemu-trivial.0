Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fWwJ3-0004Tq-VB
	for mharc-qemu-trivial@gnu.org; Sun, 24 Jun 2018 00:07:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42804)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWwJ1-0004Qz-DI
	for qemu-trivial@nongnu.org; Sun, 24 Jun 2018 00:07:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWwJ0-0004Qz-LM
	for qemu-trivial@nongnu.org; Sun, 24 Jun 2018 00:07:15 -0400
Received: from mail-qt0-x231.google.com ([2607:f8b0:400d:c0d::231]:34040)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWwIu-0004Oo-VE; Sun, 24 Jun 2018 00:07:09 -0400
Received: by mail-qt0-x231.google.com with SMTP id b20-v6so116313qtp.1;
	Sat, 23 Jun 2018 21:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=0813b3tZy7rwAPhFhDgW2zSrtA+q6aqQyRwlZWaHh0c=;
	b=dLRBr+Y0fdF+CbPtlsr6YFCANMK7JE5KsBQU/rfO2r2gvpPhTkQNF3mR5udCb+5Tz4
	35RH2GhNIntlOL2qghjdI6bEi4lUN0iOrljxAE/WjoQAoHpqfKR+uqcV+scxuJXarTfI
	kxDxD/6VWyUwLp20H1HdYBZydp2D7mUAh2bsMKRzCOLdwvHfnI+T0ApwFsbAgIc29xDU
	k1N0jQz1lTA34Dxw9BDY9jLYMLIo4iWTQc2rKVHR1v+xGGjCmPxlgsDb/4R5BfPhMmXL
	5u3WKNk2mCDZJCIJLiXeOVNwTjRYtWPnW6Bn0/I6Op6FUATCqiR6YH4bL6aT7ag+zVRw
	xq3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=0813b3tZy7rwAPhFhDgW2zSrtA+q6aqQyRwlZWaHh0c=;
	b=FwLofxpC3PMCQXZ8v6zy2vvs4NMysbdfMftv1baxoAjwqSAWnyvr0A8oEYeBIN/8xm
	5D2Ngxtj925BwB6jCO/NVhUKsnuG+mOrD3pfQ4sp8MTX0W5dyAH1F79Y2T69SKT7s5pQ
	290z/RrGxNPGDqmZCT87fKwaImswT3/YgKeBAMTBrtrGBXSoDtf8mbu2AsApCYQ0gt/d
	Swz7cCVA0+A59ennml5OVMYxrTRDonX4HTMjwcbANQ1erODWVhKtfSfqTXvF7InCXEqy
	1aR6K2u02aMPcaUJusRnBNp1y10v9V5n2FSG7LF85DJZYcVtDpSbhrBp+UtlpBhHifyO
	WxlQ==
X-Gm-Message-State: APt69E2r1BOIh0pidlNDCxqKkvCwkiujeZvYlyRiVlHi6jxJ2H557mr7
	UmfLiHe7eXS06En9oTHsN2Y=
X-Google-Smtp-Source: ADUXVKLlmABEmEsPKkTBqITZ72/fI/WhzJuMtpYPCWRyieCo0cvEY4mwAqqJWYbjrxiw5P+WXESFMg==
X-Received: by 2002:ac8:6045:: with SMTP id
	k5-v6mr6752064qtm.204.1529813228490; 
	Sat, 23 Jun 2018 21:07:08 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	d14-v6sm7145313qtn.90.2018.06.23.21.07.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 23 Jun 2018 21:07:08 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-arm@nongnu.org
Date: Sun, 24 Jun 2018 01:06:09 -0300
Message-Id: <20180624040609.17572-17-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180624040609.17572-1-f4bug@amsat.org>
References: <20180624040609.17572-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::231
Subject: [Qemu-trivial] [PATCH v3 16/16] hw/arm/stellaris: Use HWADDR_PRIx
 to display register address
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
X-List-Received-Date: Sun, 24 Jun 2018 04:07:16 -0000

Suggested-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/stellaris.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index 42baa768b2..dc521b4a5a 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -212,7 +212,8 @@ static uint64_t gptm_read(void *opaque, hwaddr offset,
         return 0;
     default:
         qemu_log_mask(LOG_GUEST_ERROR,
-                      "GPTM: read at bad offset 0x%x\n", (int)offset);
+                      "GPTM: read at bad offset 0x02%" HWADDR_PRIx "\n",
+                      offset);
         return 0;
     }
 }
@@ -294,7 +295,8 @@ static void gptm_write(void *opaque, hwaddr offset,
         break;
     default:
         qemu_log_mask(LOG_GUEST_ERROR,
-                      "GPTM: write at bad offset 0x%x\n", (int)offset);
+                      "GPTM: write at bad offset 0x02%" HWADDR_PRIx "\n",
+                      offset);
     }
     gptm_update_irq(s);
 }
-- 
2.18.0


