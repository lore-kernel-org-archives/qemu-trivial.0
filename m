Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dFihK-0004Xu-RE
	for mharc-qemu-trivial@gnu.org; Tue, 30 May 2017 11:04:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35483)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <groug@kaod.org>) id 1dFihI-0004WM-N5
	for qemu-trivial@nongnu.org; Tue, 30 May 2017 11:04:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <groug@kaod.org>) id 1dFihF-00042K-I7
	for qemu-trivial@nongnu.org; Tue, 30 May 2017 11:04:36 -0400
Received: from 12.mo5.mail-out.ovh.net ([46.105.39.65]:34967)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <groug@kaod.org>) id 1dFihF-000426-By
	for qemu-trivial@nongnu.org; Tue, 30 May 2017 11:04:33 -0400
Received: from player799.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo5.mail-out.ovh.net (Postfix) with ESMTP id C33F210018B
	for <qemu-trivial@nongnu.org>; Tue, 30 May 2017 17:04:27 +0200 (CEST)
Received: from bahia.lan (gar31-1-82-66-74-139.fbx.proxad.net [82.66.74.139])
	(Authenticated sender: groug@kaod.org)
	by player799.ha.ovh.net (Postfix) with ESMTPA id CB5A252007B;
	Tue, 30 May 2017 17:04:21 +0200 (CEST)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Cc: Cornelia Huck <cornelia.huck@de.ibm.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>, qemu-trivial@nongnu.org,
	Fam Zheng <famz@redhat.com>, Alexander Graf <agraf@suse.de>
Date: Tue, 30 May 2017 17:04:14 +0200
Message-ID: <149615665491.28067.17765793725374594694.stgit@bahia.lan>
User-Agent: StGit/0.17.1-20-gc0b1b-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 9942540603221514611
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeljedrgeeggdekiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.39.65
Subject: [Qemu-trivial] [PATCH] pc-bios/s390-ccw: use STRIP variable in
 Makefile
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
X-List-Received-Date: Tue, 30 May 2017 15:04:37 -0000

The docker-run-test-build@debian-s390x-cross target fails with:

strip --strip-unneeded s390-ccw.elf -o s390-ccw.img
strip: Unable to recognise the format of the input file `s390-ccw.elf'

The configure script defines a STRIP makefile variable whose default
value is ${cross_prefix}strip. Let's use it.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 pc-bios/s390-ccw/Makefile |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/pc-bios/s390-ccw/Makefile b/pc-bios/s390-ccw/Makefile
index 79a46b67356f..7af57dad109c 100644
--- a/pc-bios/s390-ccw/Makefile
+++ b/pc-bios/s390-ccw/Makefile
@@ -22,7 +22,7 @@ s390-ccw.elf: $(OBJECTS)
 	$(call quiet-command,$(CC) $(LDFLAGS) -o $@ $(OBJECTS),"BUILD","$(TARGET_DIR)$@")
 
 s390-ccw.img: s390-ccw.elf
-	$(call quiet-command,strip --strip-unneeded $< -o $@,"STRIP","$(TARGET_DIR)$@")
+	$(call quiet-command,$(STRIP) --strip-unneeded $< -o $@,"STRIP","$(TARGET_DIR)$@")
 
 $(OBJECTS): Makefile
 


