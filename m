Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fQaGJ-00051r-RB
	for mharc-qemu-trivial@gnu.org; Wed, 06 Jun 2018 11:22:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39408)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQaGE-0004yS-BH
	for qemu-trivial@nongnu.org; Wed, 06 Jun 2018 11:22:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQaGD-0003kz-50
	for qemu-trivial@nongnu.org; Wed, 06 Jun 2018 11:22:06 -0400
Received: from mail-qk0-x22f.google.com ([2607:f8b0:400d:c09::22f]:46764)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQaG8-0003in-Lt; Wed, 06 Jun 2018 11:22:00 -0400
Received: by mail-qk0-x22f.google.com with SMTP id k86-v6so4168629qkh.13;
	Wed, 06 Jun 2018 08:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=O5ti0iCG1c3ADHg6knLG43SRvnYZkESSsHS69ePHdeI=;
	b=QfWDsZ99ehZIFJ4fFCjIt12hNZbw6qdVtCEVm70z3MtdFUV70ei1bPFK1+mvedrprE
	FLG7Icnyt0yrzEQg5KqC4Ie/29DUhnWhH2UZCBqhH5qWMSLKgxlY6fCrtLeI7N7bYGl5
	M7ymTedJWvS+SadBBtmRgMtkBBBt0vwAjprjLxsnI+DVXaQALzpIia84QZ411q0/ZxcP
	prpdFyx/VyfEjYTYWgl9Jr2mDOFmlfZJkw1otjNIJon9Zh2DzghOwrafbMKDlFk83273
	AmkKvsW1ITzmKodCjhW/rgEUdQsFBFUlNZVWTvgFlWkdUkJEOip+sTu4ziwC5QlvVtiW
	Iltw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=O5ti0iCG1c3ADHg6knLG43SRvnYZkESSsHS69ePHdeI=;
	b=fJQPS0SbxtAbXIBhJ8RIG8mRRo7x49bgFBE3oyYMnN7gQqiu8ZSqTvGkN0uymWv/jA
	pY44pLluimRgFxE0SNmsgE/Hz0uTzArhkIorlsdSpVpvTNYO+rLsCFb90/lJxkCz5V9+
	bAbi+pPbZmmJEo7yh6YaASxiN6mkYzlUukZmjKP8m2epezTxvGZM9kGfgsiogDEXA2Br
	bu7KrZjpHDr2cj1In8kSb+qEmRsKkPjeFjtM/hX0wBvdl+BrT29zOMQ41HssR0tUekIt
	T4H6DTgr08T1+YOlhbpQkqbXf7MJYLkeFL45vpLJNPRWRiICSRN5+aqBLAITnIlJnIcU
	HXpg==
X-Gm-Message-State: APt69E20DN/GWpPlp/yB/SZ+59PWeqsY67t+QsnSqS5hFtXUzywasGxt
	POOpEnWhBdbuZ9jawAoLVbtM4BTk
X-Google-Smtp-Source: ADUXVKIcugOd8Z2QqemGRI9XisuiFPI6YxEzBQzay7PwRm32Wgs+2fruj2i/4vA0O+lT6+WY3r4ASw==
X-Received: by 2002:a37:88c2:: with SMTP id
	k185-v6mr2947809qkd.102.1528298520193; 
	Wed, 06 Jun 2018 08:22:00 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	i8-v6sm38756255qtb.11.2018.06.06.08.21.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Jun 2018 08:21:59 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-arm@nongnu.org
Date: Wed,  6 Jun 2018 12:21:25 -0300
Message-Id: <20180606152128.449-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180606152128.449-1-f4bug@amsat.org>
References: <20180606152128.449-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::22f
Subject: [Qemu-trivial] [PATCH 08/11] target/arm: Add trailing '\n' to
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
X-List-Received-Date: Wed, 06 Jun 2018 15:22:07 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/arm/helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index f75aa6e9ca..1248d84e6f 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4570,7 +4570,7 @@ void hw_breakpoint_update(ARMCPU *cpu, int n)
     case 4: /* unlinked address mismatch (reserved if AArch64) */
     case 5: /* linked address mismatch (reserved if AArch64) */
         qemu_log_mask(LOG_UNIMP,
-                      "arm: address mismatch breakpoint types not implemented");
+                      "arm: address mismatch breakpoint types not implemented\n");
         return;
     case 0: /* unlinked address match */
     case 1: /* linked address match */
@@ -4604,7 +4604,7 @@ void hw_breakpoint_update(ARMCPU *cpu, int n)
     case 8: /* unlinked VMID match (reserved if no EL2) */
     case 10: /* unlinked context ID and VMID match (reserved if no EL2) */
         qemu_log_mask(LOG_UNIMP,
-                      "arm: unlinked context breakpoint types not implemented");
+                      "arm: unlinked context breakpoint types not implemented\n");
         return;
     case 9: /* linked VMID match (reserved if no EL2) */
     case 11: /* linked context ID and VMID match (reserved if no EL2) */
-- 
2.17.1


