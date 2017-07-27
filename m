Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1daYl7-0005DK-Ty
	for mharc-qemu-trivial@gnu.org; Wed, 26 Jul 2017 22:42:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54314)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daYl5-0005BS-2x
	for qemu-trivial@nongnu.org; Wed, 26 Jul 2017 22:42:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daYl4-0007cT-9n
	for qemu-trivial@nongnu.org; Wed, 26 Jul 2017 22:42:39 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:33250)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daYl2-0007aC-FN; Wed, 26 Jul 2017 22:42:36 -0400
Received: by mail-qk0-x244.google.com with SMTP id d145so14633714qkc.0;
	Wed, 26 Jul 2017 19:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=uGyrHEzvy8FqoRMrRUgLWHf217VZM8hapwRVmbqBJY0=;
	b=u5aVq7dToTFgppVGF6rKpWHYmfzSjtWWQKMdzqRPE5gXEleoZRnHp6rsS/nqgBLEip
	iDZQ9BQiqkjvr4utDftnlCL6eX/tk9fDJzhK/Xrdq7h9QXFfxayd7J0Ed5nVgd5xQAlm
	szPWctRr78c5HbQjv4yR3RC+FwEhFanOOGOV+nqG4BRAACDqJr+1hNyE3gAR9AA18zlS
	qFmZ3obkm5KiQNSGQcfid4qQnQDhcNo3IcvjMHC1S3xKNoZQgypn2jNXJac02WbKp8PL
	hXo5t55FMdLr2GAx117Bw2rFZ1EjNWIi5OChH0tFgoH0xZ4DaA47ysd7V7KmniRBgxDW
	SR2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=uGyrHEzvy8FqoRMrRUgLWHf217VZM8hapwRVmbqBJY0=;
	b=NLUdaIXt0WRNwU/e50foKExodKJoE2sIswlazWuaANnJsDQIwLCaTlIYbxvcBohfcx
	udezCsRcRVxkEVb/KVmenEjaE8AedP81WMY5Qr9+Hvx3V86weKbB70l/7G/3PusyUscc
	eUPrko+0Xf8RiCu9r8CRBDvX/cS5BKmAd+bz2pnozYndg7P6Nkk7/rhR600K8UeSl13h
	LfCnmSCW7zIM+Cr9au32VB5hBkbksIM/C3ErAN7+a27X/vMyA9lX92hxGJelDxWG9tuY
	yMx2QK6tSTHR40C6BmxvTJE0AY55KcVjYtuP9WJmC3yVz8milXw3dF5q3bpMaofJrbuz
	1Xeg==
X-Gm-Message-State: AIVw110bAO+1HyCcKoVHdpicu9KXPFuxOYVKlUtVR8KwnDtcYNZKQEKq
	yZ8jKHVdN93pCA==
X-Received: by 10.55.42.216 with SMTP id q85mr3700538qkq.202.1501123355292;
	Wed, 26 Jul 2017 19:42:35 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	g27sm13221147qtg.84.2017.07.26.19.42.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Jul 2017 19:42:34 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Wed, 26 Jul 2017 23:42:06 -0300
Message-Id: <20170727024224.22900-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170727024224.22900-1-f4bug@amsat.org>
References: <20170727024224.22900-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-trivial] [PATCH for 2.10 v2 01/20] tests: add missing
 dependency to build QTEST_QEMU_BINARY
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
X-List-Received-Date: Thu, 27 Jul 2017 02:42:40 -0000

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


