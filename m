Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RVWTg-0002pu-GY
	for mharc-qemu-trivial@gnu.org; Tue, 29 Nov 2011 17:48:40 -0500
Received: from eggs.gnu.org ([140.186.70.92]:36898)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdroth@linux.vnet.ibm.com>) id 1RVWTd-0002pg-Lw
	for qemu-trivial@nongnu.org; Tue, 29 Nov 2011 17:48:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mdroth@linux.vnet.ibm.com>) id 1RVWTa-0005mk-WD
	for qemu-trivial@nongnu.org; Tue, 29 Nov 2011 17:48:37 -0500
Received: from mout.perfora.net ([74.208.4.194]:51410)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdroth@linux.vnet.ibm.com>)
	id 1RVWTa-0005hI-RI; Tue, 29 Nov 2011 17:48:34 -0500
Received: from illuin.austin.ibm.com ([32.97.110.59])
	by mrelay.perfora.net (node=mrus4) with ESMTP (Nemesis)
	id 0LvlLA-1QkI5s3AOS-017kLF; Tue, 29 Nov 2011 17:48:29 -0500
From: Michael Roth <mdroth@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Date: Tue, 29 Nov 2011 16:47:49 -0600
Message-Id: <1322606869-25865-2-git-send-email-mdroth@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1322606869-25865-1-git-send-email-mdroth@linux.vnet.ibm.com>
References: <4ED3F1C3.4060601@weilnetz.de>
	<1322606869-25865-1-git-send-email-mdroth@linux.vnet.ibm.com>
X-Provags-ID: V02:K0:xmb4dfbrkB5HXiCW5iBc3zwb7KkXYx6cE3BVkMj4OKt
	jDXkIEZTHKLqOVRxbDHPrTfmGN7mVCCfhzbMLraKcB1qsThPBi
	wJfp/VYyULUqT0IWJFAeVEARnqivDygs+1+oQfSvS9OL2isk7p
	zhYYFFQi9wrSuIl5Ink/WPh8kFS6slTuxurpIUR+XuLQLARaI3
	CC4gKqowZ+0D0JEHbWMj0UFIHk09/cjZsS5wEWCH8eFo/JquFx
	b/HW5uirmSnhmM/ymTrBUVITVmO/kvFvIhcL1sDr002joUcNcA
	svV2k/C7eyJA0vi3AGc+/TnwKsX1li1mKN4z16PVnB7AQz6ELR
	8XT8Yf6g7wrgtjx+8ESeVhDlODJtao889XI7ebbw9H7JmDz99Y
	oi/KAG+TPieJ8am++T/YL+Sn1nkYHgd0Zs=
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.208.4.194
Cc: qemu-trivial@nongnu.org, sw@weilnetz.de, stefano.stabellini@eu.citrix.com
Subject: [Qemu-trivial] [PATCH 2/2] Makefile: use full path for
	qapi-generated directory
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Nov 2011 22:48:38 -0000

Generally $(BUILD_DIR) == $(CURDIR), but that isn't necessarilly the
case, so use $(BUILD_DIR)/qapi-generated for generated files to
avoid potentionally sticking generating files in odd places outside
the build's include paths.
---
 Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index 168093c..0b4b2c3 100644
--- a/Makefile
+++ b/Makefile
@@ -167,7 +167,7 @@ check-qjson: check-qjson.o $(qobject-obj-y) $(tools-obj-y)
 test-coroutine: test-coroutine.o qemu-timer-common.o async.o $(coroutine-obj-y) $(tools-obj-y)
 
 $(qapi-obj-y): $(GENERATED_HEADERS)
-qapi-dir := qapi-generated
+qapi-dir := $(BUILD_DIR)/qapi-generated
 test-visitor.o test-qmp-commands.o qemu-ga$(EXESUF): QEMU_CFLAGS += -I $(qapi-dir)
 qemu-ga$(EXESUF): LIBS = $(LIBS_QGA)
 
-- 
1.7.4.1


