Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dZt4p-0006iO-PO
	for mharc-qemu-trivial@gnu.org; Tue, 25 Jul 2017 02:12:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55647)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZt4o-0006ha-8Z
	for qemu-trivial@nongnu.org; Tue, 25 Jul 2017 02:12:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZt4n-0000pH-Co
	for qemu-trivial@nongnu.org; Tue, 25 Jul 2017 02:12:14 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:36734)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZt4j-0000nf-4w; Tue, 25 Jul 2017 02:12:09 -0400
Received: by mail-qk0-x242.google.com with SMTP id d136so11872381qkg.3;
	Mon, 24 Jul 2017 23:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=zEDnYypG4KYc2ekodDXz3VkuxMhGpTeQ7u3RoWICgMU=;
	b=GeTmwMPoVRVeekhu+uZ9qsc3Cyvo0s68xdFPvvR+ejZL9fC10VgAzZ9tDXmrWTZJPQ
	fyjtJA8qBOdnNLUesXcOAQ9H2oAXBto0lm/S9XwQxDgLAOJY/ch8DSc0/bqtnhmWKcJ3
	ruHDBVcSPsrH+ZRH+L4DlVmSCtMsZUBd7RRaxQqtdmGxg/SLAgRXgJmc/bqkm/ZNAiEs
	cV0seLD7e8tUrWLSjfa2LsU/1PkbWAHcmUzsZrIUyKYmPIpR0YFnyqLTmjns2yU9bBvz
	mKSfGhghR6sKNrUJw+wJVtYI2pHKQZ9tg6KKDFhG9hb7EwJZqNjgUOQmll9vql0guTz/
	i8yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=zEDnYypG4KYc2ekodDXz3VkuxMhGpTeQ7u3RoWICgMU=;
	b=EaEXzi3ME7hPnj5L/2bdm1d4emtubCGyoea0Z7IjTrTIqwEp89H0rtaFu+vWdkIVHf
	W8CXcrbic26AQ6tKG5bhCgJjBtQg5s/6o6U/XPLF/Chon08i5zSRjzhoE/wYh0hzYTTo
	b2J3ZOiU6rpi76V8bVVHxfROHDHB1rvdFIL/RrTO17DZql+u8TjB3wpL2yLCAgVacs7+
	OQy4Z+YRGDoKPv05Z8M3zx3t24FlSD/f6vXv/VSyXSHZpqf+8ZDufFaM07wqhZvNbarn
	BxlRSPOiOTVRDmT2qg611mEMcH2MzbwluZcfY9F6yEfwR6zRk+UToBb2oKfnGLv9Lvgz
	bLXQ==
X-Gm-Message-State: AIVw110KWstf1CHgpxzCl5cI6ITOiBR7GiBH3QojV9Ep+16LjbiL1lqC
	Rahl17yf4qScrA==
X-Received: by 10.55.175.3 with SMTP id y3mr22793406qke.185.1500963128679;
	Mon, 24 Jul 2017 23:12:08 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id y9sm1254120qkg.36.2017.07.24.23.12.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Jul 2017 23:12:08 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Fam Zheng <famz@redhat.com>
Date: Tue, 25 Jul 2017 03:11:58 -0300
Message-Id: <20170725061158.10745-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: [Qemu-trivial] [PATCH] Makefile: add
 all-user/all-linux-user/all-softmmu meta-targets
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
X-List-Received-Date: Tue, 25 Jul 2017 06:12:15 -0000

Useful to build a whole set at once.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 Makefile | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 5f18243d05..da899522e4 100644
--- a/Makefile
+++ b/Makefile
@@ -814,6 +814,11 @@ endif
 # Dependencies in Makefile.objs files come from our recursive subdir rules
 -include $(wildcard *.d tests/*.d)
 
+.PHONY: subdir-all-user subdir-all-linux-user subdir-all-softmmu
+subdir-all-user: $(patsubst %,subdir-%,$(filter %-user,$(TARGET_DIRS)))
+subdir-all-linux-user: $(patsubst %,subdir-%,$(filter %-linux-user,$(TARGET_DIRS)))
+subdir-all-softmmu: $(patsubst %,subdir-%,$(filter %-softmmu,$(TARGET_DIRS)))
+
 include $(SRC_PATH)/tests/docker/Makefile.include
 
 .PHONY: help
@@ -827,7 +832,7 @@ help:
 	@echo  ''
 	@$(if $(TARGET_DIRS), \
 		echo 'Architecture specific targets:'; \
-		$(foreach t, $(TARGET_DIRS), \
+		$(foreach t, $(TARGET_DIRS) all-user all-linux-user all-softmmu, \
 		printf "  %-30s - Build for %s\\n" $(patsubst %,subdir-%,$(t)) $(t);) \
 		echo '')
 	@echo  'Cleaning targets:'
-- 
2.13.3


