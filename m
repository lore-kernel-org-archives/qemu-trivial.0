Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fbT1Y-0002f5-A7
	for mharc-qemu-trivial@gnu.org; Fri, 06 Jul 2018 11:51:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33663)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fbT1U-0002c3-Hr
	for qemu-trivial@nongnu.org; Fri, 06 Jul 2018 11:51:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fbT1T-0000c2-KP
	for qemu-trivial@nongnu.org; Fri, 06 Jul 2018 11:51:52 -0400
Received: from mail-qk0-x234.google.com ([2607:f8b0:400d:c09::234]:43966)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fbT1R-0000aH-8k; Fri, 06 Jul 2018 11:51:49 -0400
Received: by mail-qk0-x234.google.com with SMTP id z74-v6so6537928qkb.10;
	Fri, 06 Jul 2018 08:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=dozsARSGVZ1UHi/0qPQHi5wytcp0Vh7XMpXWlKcPZW4=;
	b=oNK3bsqH8l9AQQ0GRv3Q+q49L34KW/c7+aQzff9u30sPAbMGKXJQEf7BEbdxwE/k6H
	v5tZJsKhBgdW1rADMO3Vtyb7TyrnCmYofukzBe20Tdcj1W9hFXXciCGlchd01nOOvNE3
	p7QZmXSuGDonVybaGsppkyZJWIXNxNkX23MzKs0bglY5IT/mvyB3V06aO0Fc0LJCvyPM
	LYqsVfbVJpEVab5QKB2OvRS7ZXjWJo/sT+azox6IL8ujWmKoyZ7Aqx3LNG6SNIxGEtdp
	X/xREaDukVwFHxnmn5VlA5YdK+h3QbEV5ugiURX/FzS0Lm2rrOrZdyh40MpOsX4eb5Gr
	rEZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=dozsARSGVZ1UHi/0qPQHi5wytcp0Vh7XMpXWlKcPZW4=;
	b=T6BJaHO52QYXd/qufGVNvozV6ewOW0ivCC7AfRjs3eA/QY6OhkzwyNnbqnMA0bA9Sa
	9y3AMf3It1mOYwsJIvX5N7ZU7cDz3laZ6XZJkrZ0Y3H4s8WiPev/f6hDPTPYGzlnNUEM
	+/fB/aREf9ApKrPcFX3NVIzERiOei1gNZAJCG1pSo6NYf3pvvP0VErEEBq+k5tki66Ai
	eQPuSFpNkbVcIX4B1sN+f1esVDUxow44/3vo8Vklkwh6HqzcMb5OglAUInlDjpDyyEoJ
	EutrjKC6nKz4ayIlD9QucCENFA/NoYmthBEfC/pCtBiPRrEiAl9Ted8/tjwO72czNwFw
	i4wA==
X-Gm-Message-State: APt69E00GlJuLLehWWTuB3NbKE2tW9oDlq876UXazj9iMYryYuMdVsHy
	HdQMbES/7px+w9N5gaTaR0M=
X-Google-Smtp-Source: AAOMgpd6G/g4y0AbAUyGhMaNj9lvyqpTBGlJgWFesyplfVRghqX6oGu+PPUf8LxNTbU4nGcvBblUdg==
X-Received: by 2002:a37:1456:: with SMTP id
	e83-v6mr9659827qkh.69.1530892308686; 
	Fri, 06 Jul 2018 08:51:48 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	140-v6sm5913691qkm.18.2018.07.06.08.51.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Jul 2018 08:51:48 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Laurent Vivier <laurent@vivier.eu>,
	Riku Voipio <riku.voipio@iki.fi>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org
Date: Fri,  6 Jul 2018 12:51:25 -0300
Message-Id: <20180706155127.7483-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180706155127.7483-1-f4bug@amsat.org>
References: <20180706155127.7483-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::234
Subject: [Qemu-trivial] [PATCH for-3.0 1/3] linux-user: Do not report
 "Unsupported syscall" by default
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
X-List-Received-Date: Fri, 06 Jul 2018 15:51:53 -0000

This can still be reported using the "-d unimp" command line option.

Fixes: https://bugs.launchpad.net/qemu/+bug/1777226
Reported-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 linux-user/syscall.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 5822e03e28..e4b1b7d7da 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -12757,7 +12757,7 @@ abi_long do_syscall(void *cpu_env, int num, abi_long arg1,
 
     default:
     unimplemented:
-        gemu_log("qemu: Unsupported syscall: %d\n", num);
+        qemu_log_mask(LOG_UNIMP, "Unsupported syscall: %d\n", num);
 #if defined(TARGET_NR_setxattr) || defined(TARGET_NR_get_thread_area) || defined(TARGET_NR_getdomainname) || defined(TARGET_NR_set_robust_list)
     unimplemented_nowarn:
 #endif
-- 
2.18.0


