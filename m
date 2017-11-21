Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eH5HC-0000EM-Gs
	for mharc-qemu-trivial@gnu.org; Tue, 21 Nov 2017 04:55:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47170)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eH5HA-0000Cc-04
	for qemu-trivial@nongnu.org; Tue, 21 Nov 2017 04:55:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eH5H8-0006gZ-RW
	for qemu-trivial@nongnu.org; Tue, 21 Nov 2017 04:55:32 -0500
Received: from mail-qt0-x22b.google.com ([2607:f8b0:400d:c0d::22b]:44947)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eH5H4-0006dm-54; Tue, 21 Nov 2017 04:55:26 -0500
Received: by mail-qt0-x22b.google.com with SMTP id h42so18300652qtk.11;
	Tue, 21 Nov 2017 01:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=yiNx8uASHiMoliPBt/rniux47GxF3eg7dOy1d2eBZ5s=;
	b=Wf6Fi6i/pAkNiIYChEOrGksapULyj0fd+8mKkEN4o/CmnzsH45lC4tObpU7hlCW7lw
	o48proYOOWOpaaMtCZLilW6stKnBVspZiV4h5+81Ea/XbPOyjC78WJJWzTDisnAnI+BK
	kCbfIOe3k6BYYWY1/b4HmwxMIE6bS7d60fMeQZXF9Yf4AujzSl7kGpNUTKCRBni51SQ/
	D7n6CcdAurZ9umZWdnhRd+ZheNm0Jp89o4RSmCCgFkwl+Hb5GVlnmhI2kvUjrZKEDKA0
	oV/4fVK2jedV3s+W7yt8ZIbMVkMsF4wh4ziXu1fcreWFp6wpW3sIn1YfOuxjQ1+U+IFi
	Ws2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=yiNx8uASHiMoliPBt/rniux47GxF3eg7dOy1d2eBZ5s=;
	b=Bbkczbt3kY0r1Gf0xydqxgNiIyl/385MpUJY2/lD21Nqve9/IispNzNjhG9YYjzcVm
	9aCmk2s1BbB5/6tS3WMIpw3YRiuUavetA7HsKSe8rjiqBJzee5jG25XX4ZKLomIaOhoa
	nZy3x6KImi6BJrBr550kaA51P5GDA15MCXOcuBv1hWwMOJGg5q0mC3H122a7/DZEi1rE
	4PrnTbyoE0EuHBNdv3qE/7u53zun6O3v4hsLaAThh0IzhtcsjqPEOk6kIBn+DtTmWfBa
	KZ2W9WyqGvKnKZ9BU57LH+f8XAz3jrJs3of+qhr6nv4w0GtUGC31bsNvw4RdgHuW20cS
	aRyA==
X-Gm-Message-State: AJaThX6t43VecjNdCV+sBoTZ7M25dcw+wgFvII4QF0eJ2DjWaxGiLJis
	Sl1NDIYULqjP115yyIc2KAo=
X-Google-Smtp-Source: AGs4zMaWuZCqMVcN2lChJ6X/9+YE1HEuNfXUYas+N+Z/ez4SXLCTiDsVhossKBf5ZFs88PcMKVUdOQ==
X-Received: by 10.237.62.67 with SMTP id m3mr26678494qtf.289.1511258125219;
	Tue, 21 Nov 2017 01:55:25 -0800 (PST)
Received: from x1.lan (host99.190-139-18.telecom.net.ar. [190.139.18.99])
	by smtp.gmail.com with ESMTPSA id
	u50sm8718192qth.39.2017.11.21.01.55.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Nov 2017 01:55:24 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	"Daniel P . Berrange" <berrange@redhat.com>, Fam Zheng <famz@redhat.com>,
	Eric Blake <eblake@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Date: Tue, 21 Nov 2017 06:55:10 -0300
Message-Id: <20171121095510.29436-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::22b
Subject: [Qemu-trivial] [PATCH v2 for-2.11] Makefile: use $(MAKE) variable
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
X-List-Received-Date: Tue, 21 Nov 2017 09:55:33 -0000

For some systems (i.e. FreeBSD) the default 'make' is not compatible with the
GNU extensions used by QEMU makefiles.

Calling the GNU make (gmake) works, however the help displayed refers to the
host 'make' and copy/paste leads to lot of unobvious errors:

  $ gmake check-help
  [...]
   make check                Run all tests

  $ make check
  make: "Makefile" line 28: Missing dependency operator
  make: "Makefile" line 37: Need an operator
  make: "Makefile" line 41: warning: duplicate script for target "git-submodule-update" ignored
  make: "rules.mak" line 70: warning: duplicate script for target "%.o" ignored
  make: Unknown modifier ' '
  make: Unclosed substitution for eval modules (= missing)
  make: "tests/Makefile.include" line 24: Variable/Value missing from "export"
  make: "tests/" line 1: warning: Zero byte read from file, skipping rest of line.
  make: "tests/" line 1: Need an operator
  make: "Makefile" line 660: warning: duplicate script for target "ifneq" ignored
  make: "Makefile" line 78: warning: using previous script for "ifneq" defined here
  make: Fatal errors encountered -- cannot continue

Using the $(MAKE) variable, the help displayed is consistent with the 'make'
program used.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v2: dropped inconsistent replace in comment (Fam's review)

 Makefile               |  6 +++---
 tests/Makefile.include | 20 ++++++++++----------
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/Makefile b/Makefile
index 5392cfac4d..5e8d79618c 100644
--- a/Makefile
+++ b/Makefile
@@ -53,7 +53,7 @@ ifneq ($(realpath $(SRC_PATH)),$(realpath .))
 ifneq ($(wildcard $(SRC_PATH)/config-host.mak),)
 $(error This is an out of tree build but your source tree ($(SRC_PATH)) \
 seems to have been used for an in-tree build. You can fix this by running \
-"make distclean && rm -rf *-linux-user *-softmmu" in your source tree)
+"$(MAKE) distclean && rm -rf *-linux-user *-softmmu" in your source tree)
 endif
 endif
 
@@ -306,7 +306,7 @@ endif
 	    else \
 	      echo "WARNING: $@ out of date.";\
 	    fi; \
-	    echo "Run \"make defconfig\" to regenerate."; \
+	    echo "Run \"$(MAKE) defconfig\" to regenerate."; \
 	    rm $@.tmp; \
 	  fi; \
 	 else \
@@ -940,4 +940,4 @@ ifdef QEMU_GA_MSI_ENABLED
 endif
 	@echo  ''
 endif
-	@echo  '  make V=0|1 [targets] 0 => quiet build (default), 1 => verbose build'
+	@echo  '  $(MAKE) V=0|1 [targets] 0 => quiet build (default), 1 => verbose build'
diff --git a/tests/Makefile.include b/tests/Makefile.include
index c002352134..b4bcc872f2 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -3,21 +3,21 @@
 check-help:
 	@echo "Regression testing targets:"
 	@echo
-	@echo " make check                Run all tests"
-	@echo " make check-qtest-TARGET   Run qtest tests for given target"
-	@echo " make check-qtest          Run qtest tests"
-	@echo " make check-unit           Run qobject tests"
-	@echo " make check-speed          Run qobject speed tests"
-	@echo " make check-qapi-schema    Run QAPI schema tests"
-	@echo " make check-block          Run block tests"
-	@echo " make check-report.html    Generates an HTML test report"
-	@echo " make check-clean          Clean the tests"
+	@echo " $(MAKE) check                Run all tests"
+	@echo " $(MAKE) check-qtest-TARGET   Run qtest tests for given target"
+	@echo " $(MAKE) check-qtest          Run qtest tests"
+	@echo " $(MAKE) check-unit           Run qobject tests"
+	@echo " $(MAKE) check-speed          Run qobject speed tests"
+	@echo " $(MAKE) check-qapi-schema    Run QAPI schema tests"
+	@echo " $(MAKE) check-block          Run block tests"
+	@echo " $(MAKE) check-report.html    Generates an HTML test report"
+	@echo " $(MAKE) check-clean          Clean the tests"
 	@echo
 	@echo "Please note that HTML reports do not regenerate if the unit tests"
 	@echo "has not changed."
 	@echo
 	@echo "The variable SPEED can be set to control the gtester speed setting."
-	@echo "Default options are -k and (for make V=1) --verbose; they can be"
+	@echo "Default options are -k and (for $(MAKE) V=1) --verbose; they can be"
 	@echo "changed with variable GTESTER_OPTIONS."
 
 ifneq ($(wildcard config-host.mak),)
-- 
2.15.0


