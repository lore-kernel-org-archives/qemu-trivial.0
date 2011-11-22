Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RSu7M-0002ss-OS
	for mharc-qemu-trivial@gnu.org; Tue, 22 Nov 2011 12:26:48 -0500
Received: from eggs.gnu.org ([140.186.70.92]:55385)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Stefano.Stabellini@eu.citrix.com>)
	id 1RSu7K-0002s1-8y
	for qemu-trivial@nongnu.org; Tue, 22 Nov 2011 12:26:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Stefano.Stabellini@eu.citrix.com>)
	id 1RSu7E-0006mW-Fs
	for qemu-trivial@nongnu.org; Tue, 22 Nov 2011 12:26:46 -0500
Received: from smtp.ctxuk.citrix.com ([62.200.22.115]:46385
	helo=SMTP.EU.CITRIX.COM) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Stefano.Stabellini@eu.citrix.com>)
	id 1RSu7E-0006mF-8b; Tue, 22 Nov 2011 12:26:40 -0500
X-IronPort-AV: E=Sophos;i="4.69,554,1315180800"; 
   d="scan'208";a="9071397"
Received: from lonpmailmx01.citrite.net ([10.30.203.162])
	by LONPIPO01.EU.CITRIX.COM with ESMTP/TLS/RC4-MD5;
	22 Nov 2011 17:26:29 +0000
Received: from kaball.uk.xensource.com (10.80.2.59) by
	LONPMAILMX01.citrite.net (10.30.203.162) with Microsoft SMTP Server id
	8.3.213.0; Tue, 22 Nov 2011 17:26:29 +0000
Date: Tue, 22 Nov 2011 17:27:15 +0000
From: Stefano Stabellini <stefano.stabellini@eu.citrix.com>
X-X-Sender: sstabellini@kaball-desktop
To: <qemu-devel@nongnu.org>
Message-ID: <alpine.DEB.2.00.1111221726190.31179@kaball-desktop>
User-Agent: Alpine 2.00 (DEB 1167 2008-08-23)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 62.200.22.115
Cc: qemu-trivial@nongnu.org, Anthony Liguori <anthony@codemonkey.ws>
Subject: [Qemu-trivial] [PATCH] fix out of tree build
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
X-List-Received-Date: Tue, 22 Nov 2011 17:26:47 -0000


Signed-off-by: Stefano Stabellini <stefano.stabellini@eu.citrix.com>

diff --git a/Makefile b/Makefile
index 168093c..885065f 100644
--- a/Makefile
+++ b/Makefile
@@ -167,7 +167,7 @@ check-qjson: check-qjson.o $(qobject-obj-y) $(tools-obj-y)
 test-coroutine: test-coroutine.o qemu-timer-common.o async.o $(coroutine-obj-y) $(tools-obj-y)
 
 $(qapi-obj-y): $(GENERATED_HEADERS)
-qapi-dir := qapi-generated
+qapi-dir := $(SRC_PATH)/qapi-generated
 test-visitor.o test-qmp-commands.o qemu-ga$(EXESUF): QEMU_CFLAGS += -I $(qapi-dir)
 qemu-ga$(EXESUF): LIBS = $(LIBS_QGA)
 

