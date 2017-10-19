Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e59CH-0003eD-5A
	for mharc-qemu-trivial@gnu.org; Thu, 19 Oct 2017 07:41:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41247)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <groug@kaod.org>) id 1e59CE-0003dd-NH
	for qemu-trivial@nongnu.org; Thu, 19 Oct 2017 07:41:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <groug@kaod.org>) id 1e59CA-0001Ni-PZ
	for qemu-trivial@nongnu.org; Thu, 19 Oct 2017 07:41:06 -0400
Received: from 17.mo5.mail-out.ovh.net ([46.105.56.132]:39860)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <groug@kaod.org>) id 1e59CA-0001Ir-Ij
	for qemu-trivial@nongnu.org; Thu, 19 Oct 2017 07:41:02 -0400
Received: from player773.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo5.mail-out.ovh.net (Postfix) with ESMTP id 7BDA81454FA
	for <qemu-trivial@nongnu.org>; Thu, 19 Oct 2017 13:40:53 +0200 (CEST)
Received: from bahia.lan (gar31-1-82-66-74-139.fbx.proxad.net [82.66.74.139])
	(Authenticated sender: groug@kaod.org)
	by player773.ha.ovh.net (Postfix) with ESMTPA id 3B4CD600074;
	Thu, 19 Oct 2017 13:40:48 +0200 (CEST)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	Alex =?utf-8?q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Fam Zheng <famz@redhat.com>,
	Philippe =?utf-8?q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Date: Thu, 19 Oct 2017 13:40:42 +0200
Message-ID: <150841324224.31292.4012464539983692364.stgit@bahia.lan>
User-Agent: StGit/0.17.1-46-g6855-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 10323657722739923435
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedttddrudekgdeghecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.56.132
Subject: [Qemu-trivial] [PATCH] docker: fix out-of-tree 'make
 docker-test-build@debian-powerpc-cross'
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
X-List-Received-Date: Thu, 19 Oct 2017 11:41:07 -0000

Without this patch, it fails with:

IOError: [Errno 2] No such file or directory:
 'tests/docker/dockerfiles/debian-apt-fake.sh'

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 tests/docker/Makefile.include |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 6f9ea196a7b8..5d54eca5d0b3 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -44,7 +44,7 @@ docker-image-%: $(DOCKER_FILES_DIR)/%.docker
 		$(if $(EXECUTABLE),--include-executable=$(EXECUTABLE)),\
 		"BUILD","$*")
 
-docker-image-debian-powerpc-cross: EXTRA_FILES:=tests/docker/dockerfiles/debian-apt-fake.sh
+docker-image-debian-powerpc-cross: EXTRA_FILES:=$(SRC_PATH)/tests/docker/dockerfiles/debian-apt-fake.sh
 
 # Enforce dependancies for composite images
 docker-image-debian: docker-image-debian9


