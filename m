Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eGz8h-0007kC-CE
	for mharc-qemu-trivial@gnu.org; Mon, 20 Nov 2017 22:22:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42352)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eGz8f-0007ih-J9
	for qemu-trivial@nongnu.org; Mon, 20 Nov 2017 22:22:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eGz8e-0008JM-Ah
	for qemu-trivial@nongnu.org; Mon, 20 Nov 2017 22:22:21 -0500
Received: from mail-qt0-x22d.google.com ([2607:f8b0:400d:c0d::22d]:45781)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eGz8Z-0008IU-Ku; Mon, 20 Nov 2017 22:22:15 -0500
Received: by mail-qt0-x22d.google.com with SMTP id r37so9379525qtj.12;
	Mon, 20 Nov 2017 19:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=YSwv5MhyvjwiGqEvr902fddhFSm6D5VRUVt+AEG6R58=;
	b=OTMSUrpvKw0xX0oWbmeaZmQ/T3sE8tqfmIFEAKdZH09LuSPg30pWmrb7uNkO5cVH7E
	cl4m+CWLariKBtdIIznN/EGXrGGAr2XlX9/FC85u3ZidNYY7AWj3NfGmznvQc8SMdLjD
	BoIeR/36QGPFRKIedOetXNhKDfw/vtQi2YspwZBN+aPfH0WTOOD34yN6OKxBhf/3WaaH
	U2fB4C9bXPHaSV1JdBsVIcdvDdzWwSwGUzCngs+8Xv4G1Ar6ogUo+Miew5GME2bcEsdX
	65WqFOXzz4OiUw/NAnpWybdoMmt07uSReLa7eWQXV+rBtNFll4Qn4ZQGvir/7aFZOgFN
	HwUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=YSwv5MhyvjwiGqEvr902fddhFSm6D5VRUVt+AEG6R58=;
	b=OCeyggCZ+cxYenTkNaYYO7Lgx41zkFP52gD04fTo6fiQ8GFjtsxOZjWc1FS519sekC
	AHgtWrMhU7ukT8njR3EOozvccI6flknUwA5ks3UKwca07tYclLahXcgWMGt2KKz4TIjE
	9LeL6DDM27E3268h+Hz0UHw+afsKG/+R2C/Bh3GGBh1Yke9QN2BARq55zlNYYK6YMFCx
	2Oxbp5hWt+RUB1b2jtvcyNUpUjTiv8XfMrMimeSYGt924Ct40I5f6xzWjHWF+i9prIj1
	Ng5bTGRtEMbDXeLp3/gnnHt8gm4tC9unDxejvS4Z+bB8qlR1N1jyB0E1vGmnYnxI8imQ
	l9CA==
X-Gm-Message-State: AJaThX6qArSRLPnSSzq4OlRsFDIwIPesgjf9YAr8xpy6kXvxN4kuHVfu
	0Lssa+wpc9HgHh6XTqBkGjE=
X-Google-Smtp-Source: AGs4zMaYk4oL7DvoHixxWH3/+y62h5RX4uw3w/Z0DgzR93flcPriOREb2I1i3aUsfKgYKCMStVHQ8Q==
X-Received: by 10.200.54.198 with SMTP id b6mr24528413qtc.48.1511234534370;
	Mon, 20 Nov 2017 19:22:14 -0800 (PST)
Received: from x1.lan (host99.190-139-18.telecom.net.ar. [190.139.18.99])
	by smtp.gmail.com with ESMTPSA id
	q49sm8173523qtq.80.2017.11.20.19.21.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Nov 2017 19:22:13 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	"Daniel P . Berrange" <berrange@redhat.com>, Fam Zheng <famz@redhat.com>,
	Eric Blake <eblake@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Date: Tue, 21 Nov 2017 00:21:19 -0300
Message-Id: <20171121032119.14442-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::22d
Subject: [Qemu-trivial] [PATCH for-2.11] Makefile: use $(MAKE) variable
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
X-List-Received-Date: Tue, 21 Nov 2017 03:22:22 -0000

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
 Makefile               |  6 +++---
 tests/Makefile.include | 22 +++++++++++-----------
 2 files changed, 14 insertions(+), 14 deletions(-)

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
index c002352134..060dcd6f36 100644
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
@@ -904,7 +904,7 @@ $(patsubst %, check-%, $(check-qapi-schema-y)): check-%.json: $(SRC_PATH)/%.json
 		echo $$? >$*.test.exit, \
 		"TEST","$*.out")
 	@diff -q $(SRC_PATH)/$*.out $*.test.out
-	@# Sanitize error messages (make them independent of build directory)
+	@# Sanitize error messages ($(MAKE) them independent of build directory)
 	@perl -p -e 's|\Q$(SRC_PATH)\E/||g' $*.test.err | diff -q $(SRC_PATH)/$*.err -
 	@diff -q $(SRC_PATH)/$*.exit $*.test.exit
 
-- 
2.15.0


