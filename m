Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dQayv-0001b5-Jv
	for mharc-qemu-trivial@gnu.org; Thu, 29 Jun 2017 11:03:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58002)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dQayt-0001Z4-Kf
	for qemu-trivial@nongnu.org; Thu, 29 Jun 2017 11:03:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dQayq-0006lS-DS
	for qemu-trivial@nongnu.org; Thu, 29 Jun 2017 11:03:43 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:34736)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dQayj-0006h4-K7; Thu, 29 Jun 2017 11:03:33 -0400
Received: by mail-qt0-x241.google.com with SMTP id m54so9082780qtb.1;
	Thu, 29 Jun 2017 08:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=h12XJC2xvvc0LZfp8cdbXGPkUJEkrvJ/fMV1K4W3vps=;
	b=lTw6mqRfhgqAFU8Hi6KdgYdAbUQ1uT83E+lW2qmzJjUw/vG9TGI4nq/foIK5SM6tin
	uR0itp9JNH8cGrdFY+Eou2sDpo8Dld2IL6usElyzTskS+q3gRKozAVF2xwRFhi+I1/KX
	WW6zKlp8WapDsxodYTwrMhNRlS23PBTkpF/6SvUGtmHmzdpIe5vCHX23AP4PNuX4EGI0
	wP1DZdfxh7ASis9O2FF3nhd/0tnZLcC8B8AFoKRbFq0xXNxj0PJXyXSe07GWxaA9KXlf
	TXPuzJjqjcR4+CKPE/Is3cA+Jr+G0eXJiS6g4teTAnvdJwbleuO1TGz07gT6VmXy14VO
	7zfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=h12XJC2xvvc0LZfp8cdbXGPkUJEkrvJ/fMV1K4W3vps=;
	b=IEkmi5LQ2pTdxMK+asoTl6I0/SCUTpg5p2EzjN4KNTT4W1xlNh594TDrnIpEXOC2BK
	BH8fJzAPdNM6+2E7Uk/24VqzFijsv8dLZ2ZK/DMifJYTJGU3mRmLEHv0osnmygVOTxJ1
	MudHLEn99mxe0CaeSmKYyshf5EJ1P1aAnJJyH+Z5IYZeHLUt/mvkxfkCVaiMRuAagtKx
	QfB5Z9yb2xlJt8xqisKB8FpIJy4NRl95uHsOTRAYc2AMW5sJ6F7i6HY8+7C7rGd2PZ08
	FMw3IZUOw9hTqpqUbNgHhTNjGyrMFcn9+8QbPBYsAkKyPZXYUdHBOroBW3BD+BDTZhm+
	gGAg==
X-Gm-Message-State: AKS2vOz0Tbrz3mdWStyYeXBIyv6dyJcVodiBHs2lomPYYZYDPn+xG/gM
	yy7RUroKcv6uYs8TLT/21Q==
X-Received: by 10.200.52.242 with SMTP id x47mr21018294qtb.70.1498748612552;
	Thu, 29 Jun 2017 08:03:32 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id z1sm3873349qkb.37.2017.06.29.08.03.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 29 Jun 2017 08:03:31 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	"Emilio G . Cota" <cota@braap.org>, Stefan Weil <sw@weilnetz.de>,
	Yang Zhong <yang.zhong@intel.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-trivial@nongnu.org
Date: Thu, 29 Jun 2017 12:03:07 -0300
Message-Id: <20170629150308.22766-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.1
In-Reply-To: <20170629150308.22766-1-f4bug@amsat.org>
References: <20170629150308.22766-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-trivial] [PATCH v2 4/5] MAINTAINERS: update TCI entry
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
X-List-Received-Date: Thu, 29 Jun 2017 15:03:44 -0000

moved in 244f1441 to tcg/

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 530293044b..9bad523060 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1654,7 +1654,7 @@ TCI target
 M: Stefan Weil <sw@weilnetz.de>
 S: Maintained
 F: tcg/tci/
-F: tci.c
+F: tcg/tci.c
 F: disas/tci.c
 
 Block drivers
-- 
2.13.1


