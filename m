Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1daxxl-0004gi-6A
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 01:37:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48369)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxxh-0004eS-NS
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 01:37:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxxg-0003wu-U7
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 01:37:21 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:36484)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxxc-0003ro-K5; Fri, 28 Jul 2017 01:37:16 -0400
Received: by mail-qt0-x244.google.com with SMTP id c15so6555197qta.3;
	Thu, 27 Jul 2017 22:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=nFEaNSMZOOry35lRJJOkLI65+RXkEqahlL9OonCrlbI=;
	b=Y3jNA9woS4yNGT7AIpbmqqAZ3OXgQ6ub24UU/hPwEg+enCBbHlzkRXznXtn2kjwuXm
	fTHuxncjjTZT+P735fdT0P882z2mKjVGIxZqEXkcw1wC4/+AEUauHiw2PDyOF0QF8tZz
	l1zlp3UK9F9g4pwXqb++ila3lpn5y1puhI929lrlOuSsu5ZxFqx1Fe962G3a/EnBYYUj
	ooATrLu1DAAWBgLHRUXRdHZJRyDCrtn6QSXFMQ6vqlOtimZyHfcqpxIkXla12LxH3jiT
	M0hrDH/55bfAQb6U1fAux2nVfLvMrJM9npjiF6yc9QKrmEEcy4pZbicUjHd7nx2b9x2G
	Yb7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=nFEaNSMZOOry35lRJJOkLI65+RXkEqahlL9OonCrlbI=;
	b=t23PXXeegGEZSigd7MR592FzNZVoT2WsFKUTVyu5hrVpbeV2tfqeGdWnBN7I9jf36Y
	f3CdTJozaYDxMNV16CRw3AbD+e60VDRJX+3pq3FmDCBboaO5iubVEA4xJRaALDVIkn2t
	1we+Ca3zI3aIqh3VM+fyhIRZNLcETkrIM8g3qcDutiO68vDYxUUZwqPAnmO5EvDqimcW
	JT6tlHr7e1WruKtdlMx/qCR+5dWUn33mng9j/UrGx88ryFLZiEr5J1qqwIM781fBMQGQ
	mPN7u9xCfAcHK9I1grG3mXEXlqRMeuASrDUMAKGi27iYU2+gCAItxNcR6NYuvvngvkPh
	fwjA==
X-Gm-Message-State: AIVw111k1ZVaKmDEnJpje/zkP9ah2l1mmGUJYFMCYqlYyILiAvhASavE
	STmqigI8gM9gZA==
X-Received: by 10.200.38.243 with SMTP id 48mr8666868qtp.130.1501220236228;
	Thu, 27 Jul 2017 22:37:16 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	h41sm12129560qta.45.2017.07.27.22.37.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Jul 2017 22:37:15 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Michael Walle <michael@walle.cc>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Fri, 28 Jul 2017 02:35:46 -0300
Message-Id: <20170728053610.15770-24-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170728053610.15770-1-f4bug@amsat.org>
References: <20170728053610.15770-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-trivial] [PATCH 23/47] MAINTAINERS: add missing LM32 entry
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
X-List-Received-Date: Fri, 28 Jul 2017 05:37:22 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 06b092bf85..1424788a9d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -150,6 +150,7 @@ F: hw/*/milkymist-*
 F: include/hw/char/lm32_juart.h
 F: include/hw/lm32/
 F: tests/tcg/lm32/
+F: default-configs/lm32-softmmu.mak
 
 M68K
 M: Laurent Vivier <laurent@vivier.eu>
-- 
2.13.3


