Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dXLsX-0001jz-UG
	for mharc-qemu-trivial@gnu.org; Tue, 18 Jul 2017 02:21:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60262)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXLsV-0001hR-DH
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 02:21:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXLsU-0000ow-K5
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 02:21:03 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:33287)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXLsU-0000no-Ff; Tue, 18 Jul 2017 02:21:02 -0400
Received: by mail-qt0-x241.google.com with SMTP id 50so292611qtz.0;
	Mon, 17 Jul 2017 23:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=22aXvepVcsDD/6Hq330QeijR3UM3Tq30AAxXR6wZ3iU=;
	b=kjGLMjD/ajlsGNEXqbN79ZrcDh9Kw8zJQBSGt38XRWrBA5zvF3Z4/16RcGmtTjUr4s
	hxDSatfQgtbFftHrzsw4ceSgLz7y8wDvLHMpqFmqpyXLcM2POOCdh5w9Euaomh/q2H2b
	8yUmhXoJzvf+6LHbc9R62smYe/D4iJh5Mpz22wbh6o5KwgifegBd7k8uV2w84rNpHRpq
	u75zADNol8LUmt/Ij2keaC2wOkc22HF1GybL4xqB6/hHNEnQVjVhU/UuG6hUnhUBOSL1
	VNmZdNtzh66tcz8to0Tw9zec72epEamo+tp8dARozA81+fC7Bd4gGoa3UBHpSWMqe5Dc
	AcJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=22aXvepVcsDD/6Hq330QeijR3UM3Tq30AAxXR6wZ3iU=;
	b=TjZXi9keO7C9z1vZ3WYNjD+w5nq3B+X/Jr92h/VukVEx0pEeeauF24QpOeX/g6wvQf
	R2ayl1QWuyiOIx+eOQMggjK1KQ+isvQal01q5pt5xhyLz0nH6Gvar9TQ6oY+vB03Genf
	5ovHA85BXp/yWayI2aHVJZZ4VUsE67qljlzO+RUwYoB9RxILYxVTJfzUz8LGFYRUlTT7
	ilOMyA9N1tfjxFOL2tXOgkO+KjsOK12m5qc/d2ECDq1mJq2ms3UfbhDS+gCoIla9z2KL
	nDdJK4cXzJZ9wdXkRtA7wixW2H6gPw18cZVQ8pAW/BU1D3t5RkawSNrxgjO9rXVERc5U
	piXQ==
X-Gm-Message-State: AIVw11138POzLnXu05kXNY6sw2JtU+jmvAE0t4BKJOzM1QX/uiOXE3Ne
	s606MmsReaTH6qo0pffnag==
X-Received: by 10.237.39.97 with SMTP id n88mr131091qtd.78.1500358861782;
	Mon, 17 Jul 2017 23:21:01 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	l31sm1099862qtc.64.2017.07.17.23.20.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Jul 2017 23:21:01 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	BALATON Zoltan <balaton@eik.bme.hu>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>
Date: Tue, 18 Jul 2017 03:09:48 -0300
Message-Id: <20170718061005.29518-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170718061005.29518-1-f4bug@amsat.org>
References: <20170718061005.29518-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-trivial] [PATCH 12/29] sm501: use QEMU_IS_ALIGNED macro
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
X-List-Received-Date: Tue, 18 Jul 2017 06:21:04 -0000

Applied using the Coccinelle semantic patch scripts/coccinelle/use_osdep.cocci

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/display/sm501_template.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/display/sm501_template.h b/hw/display/sm501_template.h
index a60abad019..6b6386bc72 100644
--- a/hw/display/sm501_template.h
+++ b/hw/display/sm501_template.h
@@ -105,7 +105,7 @@ static void glue(draw_hwc_line_, PIXEL_NAME)(uint8_t *d, const uint8_t *s,
 
     for (i = 0; i < SM501_HWC_WIDTH && c_x + i < width; i++) {
         /* get pixel value */
-        if (i % 4 == 0) {
+        if (QEMU_IS_ALIGNED(i, 4)) {
             bitset = ldub_p(s);
             s++;
         }
-- 
2.13.2


