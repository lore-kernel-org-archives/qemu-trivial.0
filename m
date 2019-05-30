Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hWP0i-0000R9-Gk
	for mharc-qemu-trivial@gnu.org; Thu, 30 May 2019 13:38:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44078)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hWP0h-0000Qy-8l
	for qemu-trivial@nongnu.org; Thu, 30 May 2019 13:38:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hWP0Z-0000gd-N9
	for qemu-trivial@nongnu.org; Thu, 30 May 2019 13:38:35 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:34422)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hWP0X-0000dE-IX
	for qemu-trivial@nongnu.org; Thu, 30 May 2019 13:38:29 -0400
Received: by mail-ot1-x341.google.com with SMTP id l17so6463476otq.1
	for <qemu-trivial@nongnu.org>; Thu, 30 May 2019 10:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=NlfGiAAlPDQtelzDRN9s5s54Y74DMuOJ6VJbYlSv7zo=;
	b=SgD79CyqD8o2D+fOKp0hfXAazxGXFauY/FcGUCiFJ4Xr3IA6yKF5cuPKncSk19Yz8A
	DOKjJ8ijd2/cVBtMMRR+HjMKjJbVdpsanlh5GQ0TXuedE1gitY9r9ERlCGrOjv+mh3bl
	YW8rkHJQs0wZl1ynTUb5uSqpLVyMQF9q6uDweM/ktNCtiY0H9BjWKb3ViKrzQ4Nna3Gw
	wsMvVxAmriZFGLweM65amhcOWDLh9OQrqKeRyO96Va2D1v7rd3RV5TJAifwg1sFjhGyS
	5efmvy3XTIG/LWDvpE8AY2DQrVm8Ng9mK5Fj4r43bbPBv7nXgWQiUKJYgSFTwlG3xJQd
	Nong==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=NlfGiAAlPDQtelzDRN9s5s54Y74DMuOJ6VJbYlSv7zo=;
	b=BQ9ZNH5XSwoGN3k+Uj8yqU0BUJNYLRSXSP38Xjr/CcKTRyE59Tifu6fzKncXT2PjCQ
	nhLgEmtVd1wjZFp5Pb/Nea7j499h2U982ezNPFOnceEtlTv3Xu77WPVc/TpHsOjokuqH
	6ob4flbNnwP5e3mbYhcttuMnKaf6xkchcZga8a7W1L4Ti3aAkLSfOrZP3p2qeUs0p2TY
	YH1asAxuw7bkOKHkZaN/2APdTa4UlVXmVyk7u2MQZlCAi7HgYBFpxne18sT5AcfMVBRO
	ZrP6ihHVSLRa1ihA4RVvBfXJ9J0Qez6bieM3rF465dvSKQNsEJxk0fWxMFb74IlRc5zP
	F2/Q==
X-Gm-Message-State: APjAAAWQaSXDAHDOUzfls6L9h7azvTnsbFc4ekj8A2rmj2boqMVs0+Dx
	oJ7OsCr8ZWx51u0hmHFtlauDYQ==
X-Google-Smtp-Source: APXvYqzgjBZv+L3ZfNk9vTxuurkKGvmM/EYYknR2zNcbu19ghGWkZVIyewk/Jawj8P9DdaP6BU2lag==
X-Received: by 2002:a9d:694a:: with SMTP id p10mr3649933oto.61.1559237908397; 
	Thu, 30 May 2019 10:38:28 -0700 (PDT)
Received: from localhost.localdomain (168.189-204-159.bestelclientes.com.mx.
	[189.204.159.168])
	by smtp.gmail.com with ESMTPSA id i12sm1124466otk.2.2019.05.30.10.38.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 30 May 2019 10:38:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	peter.maydell@linaro.org
Date: Thu, 30 May 2019 12:38:24 -0500
Message-Id: <20190530173824.30699-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: [Qemu-trivial] [PATCH] util: Adjust qemu_guest_getrandom_nofail for
 Coverity
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
X-List-Received-Date: Thu, 30 May 2019 17:38:40 -0000

Explicitly ignore the return value of qemu_guest_getrandom.
Because we use error_fatal, all errors are already caught.

Fixes: CID 1401701
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 util/guest-random.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/util/guest-random.c b/util/guest-random.c
index e8124a3cad..00a08fd981 100644
--- a/util/guest-random.c
+++ b/util/guest-random.c
@@ -56,7 +56,7 @@ int qemu_guest_getrandom(void *buf, size_t len, Error **errp)
 
 void qemu_guest_getrandom_nofail(void *buf, size_t len)
 {
-    qemu_guest_getrandom(buf, len, &error_fatal);
+    (void)qemu_guest_getrandom(buf, len, &error_fatal);
 }
 
 uint64_t qemu_guest_random_seed_thread_part1(void)
-- 
2.17.1


