Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dZi5d-0008BR-5t
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jul 2017 14:28:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50014)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZi5a-00088Y-Ci
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 14:28:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZi5Z-0004iN-Gg
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 14:28:18 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:34273)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZi5X-0004hc-9A; Mon, 24 Jul 2017 14:28:15 -0400
Received: by mail-qk0-x242.google.com with SMTP id q66so10660843qki.1;
	Mon, 24 Jul 2017 11:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=uGyrHEzvy8FqoRMrRUgLWHf217VZM8hapwRVmbqBJY0=;
	b=Q/U1a0g5vWsV6eMkX3ko9rOzhrSpu6LvbNGbVDi3U8UjBVGQO8lCUy98W1W6nPWRG3
	l6L6Yrr+em6oueTyA7rCviKf6qXInkWs7nQVtYR58Hf0k6qQFhS+JFGzmcRth/SYgWFW
	Wym6aeW1BaQtgKN8sc4Hq9uhNj+HnygfLCf0erG8UMKEMGO5CnkEXq7/Z5xROOBK2+pz
	+TVvc5kHEe2UzgMDX3Pc9YGp9D8GqRZ65K2zXv3JepTkIbAmMrkPl9xtkrW7cRnjiDLh
	26sw89dG7oFBiA73i5LK51Bdooeat2VaT4WgdxU8HyRs21l4mWjVP79tjL11msx/odGH
	AYKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=uGyrHEzvy8FqoRMrRUgLWHf217VZM8hapwRVmbqBJY0=;
	b=hO3kmoQg/JBCl8jUqhQEN/4xM81ViYxWoxfp7ui+ydVjxbeigUu9LDsdpBzTVkXmLm
	Lyj3zxBkoCjSI/xI4kfkuHyemECc9cAMxFHw1Qrnj0PuVxNW40bhpNxdoFL2s6QtAmnF
	dvnTUGAbrIMlEvPv84mpEBu3SWsa+2nyAFQBW+A7Yp0GTX8epmQmdSINL8H++pzDyjsm
	H2CSzOT9GuwtrYVuq6z9E/Nwh36UhDEA9INDoQc1g5ksGBWcQrhO7ETWDiLsAvburc3y
	r2vOFkND+aQO7VW6CYZG9YGSJ1SfrG8wYB8JHmq5BzUKfLcfQnBKGflj+SctBrLgq78/
	6e1g==
X-Gm-Message-State: AIVw113d7tqY2taKmDj5jhkENHYuAfqdM/AG4T83i9AkhWIs+1kwLa5k
	2cpv/lCefttqYw==
X-Received: by 10.55.31.34 with SMTP id f34mr20166510qkf.357.1500920894664;
	Mon, 24 Jul 2017 11:28:14 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	t57sm9033799qtt.18.2017.07.24.11.28.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Jul 2017 11:28:13 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Mon, 24 Jul 2017 15:27:17 -0300
Message-Id: <20170724182751.18261-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170724182751.18261-1-f4bug@amsat.org>
References: <20170724182751.18261-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: [Qemu-trivial] [PATCH for 2.10 01/35] tests: add missing dependency
 to build QTEST_QEMU_BINARY
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
X-List-Received-Date: Mon, 24 Jul 2017 18:28:19 -0000

This allow a one liner from fresh repository clone, i.e.:

  ./configure && make -j check-qtest-aarch64

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
---
 tests/Makefile.include | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index 7af278db55..b55fe39d94 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -830,7 +830,7 @@ GCOV_OPTIONS = -n $(if $(V),-f,)
 # gtester tests, possibly with verbose output
 
 .PHONY: $(patsubst %, check-qtest-%, $(QTEST_TARGETS))
-$(patsubst %, check-qtest-%, $(QTEST_TARGETS)): check-qtest-%: $(check-qtest-y)
+$(patsubst %, check-qtest-%, $(QTEST_TARGETS)): check-qtest-%: subdir-%-softmmu $(check-qtest-y)
 	$(if $(CONFIG_GCOV),@rm -f *.gcda */*.gcda */*/*.gcda */*/*/*.gcda,)
 	$(call quiet-command,QTEST_QEMU_BINARY=$*-softmmu/qemu-system-$* \
 		QTEST_QEMU_IMG=qemu-img$(EXESUF) \
-- 
2.13.3


