Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h75C5-0002XI-Cy
	for mharc-qemu-trivial@gnu.org; Thu, 21 Mar 2019 17:25:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33458)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wainersm@redhat.com>) id 1h75C0-0002VZ-At
	for qemu-trivial@nongnu.org; Thu, 21 Mar 2019 17:25:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wainersm@redhat.com>) id 1h75By-0001mh-7t
	for qemu-trivial@nongnu.org; Thu, 21 Mar 2019 17:25:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60298)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <wainersm@redhat.com>)
	id 1h75Bv-0001hr-3B; Thu, 21 Mar 2019 17:25:35 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D4AADAC2E1;
	Thu, 21 Mar 2019 21:25:33 +0000 (UTC)
Received: from virtlab501.virt.lab.eng.bos.redhat.com
	(virtlab501.virt.lab.eng.bos.redhat.com [10.19.152.162])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8D5115C57E;
	Thu, 21 Mar 2019 21:25:29 +0000 (UTC)
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, alex.bennee@linaro.org, fam@euphon.net,
	philmd@redhat.com, mjt@tls.msk.ru, laurent@vivier.eu
Date: Thu, 21 Mar 2019 17:25:28 -0400
Message-Id: <20190321212528.6100-1-wainersm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Thu, 21 Mar 2019 21:25:33 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] docker: trivial changes to `make docker` help
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
X-List-Received-Date: Thu, 21 Mar 2019 21:25:44 -0000

Apply double quotes and period punctuation uniformly.

Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
---
 tests/docker/Makefile.include | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.includ=
e
index 60314d293a..c0e1bf57a3 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -151,15 +151,15 @@ docker:
 	@echo
 	@echo '    docker:              Print this help.'
 	@echo '    docker-all-tests:    Run all image/test combinations.'
-	@echo '    docker-TEST:         Run TEST on all image combinations.'
+	@echo '    docker-TEST:         Run "TEST" on all image combinations.'
 	@echo '    docker-clean:        Kill and remove residual docker testing=
 containers.'
 	@echo '    docker-TEST@IMAGE:   Run "TEST" in container "IMAGE".'
 	@echo '                         Note: "TEST" is one of the listed test =
name,'
 	@echo '                         or a script name under $$QEMU_SRC/tests=
/docker/;'
-	@echo '                         "IMAGE" is one of the listed container =
name."'
+	@echo '                         "IMAGE" is one of the listed container =
name.'
 	@echo '    docker-image:        Build all images.'
 	@echo '    docker-image-IMAGE:  Build image "IMAGE".'
-	@echo '    docker-run:          For manually running a "TEST" with "IMA=
GE"'
+	@echo '    docker-run:          For manually running a "TEST" with "IMA=
GE".'
 	@echo
 	@echo 'Available container images:'
 	@echo '    $(DOCKER_IMAGES)'
--=20
2.20.1


