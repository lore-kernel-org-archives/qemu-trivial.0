Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h1UPc-0005HE-9b
	for mharc-qemu-trivial@gnu.org; Wed, 06 Mar 2019 06:08:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35621)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1h1UPX-0005BE-Hz
	for qemu-trivial@nongnu.org; Wed, 06 Mar 2019 06:08:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1h1UPW-0002OC-R5
	for qemu-trivial@nongnu.org; Wed, 06 Mar 2019 06:08:31 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:58869)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1h1UPS-0002GH-EL; Wed, 06 Mar 2019 06:08:26 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA
	(Nemesis)
	id 1M6URj-1gucdO0iYj-006ug8; Wed, 06 Mar 2019 12:07:39 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
	Zhang Chen <zhangckid@gmail.com>,
	zhanghailiang <zhang.zhanghailiang@huawei.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Cornelia Huck <cohuck@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
	Richard Henderson <rth@twiddle.net>, Thomas Huth <thuth@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>, Li Zhijian <lizhijian@cn.fujitsu.com>,
	John Snow <jsnow@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Laurent Vivier <laurent@vivier.eu>, Eduardo Habkost <ehabkost@redhat.com>,
	qemu-block@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Tony Krowiak <akrowiak@linux.ibm.com>, Max Reitz <mreitz@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	Laurent Vivier <lvivier@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-s390x@nongnu.org, Corey Minyard <minyard@acm.org>,
	Pierre Morel <pmorel@linux.ibm.com>, Markus Armbruster <armbru@redhat.com>,
	Fam Zheng <fam@euphon.net>
Date: Wed,  6 Mar 2019 12:07:09 +0100
Message-Id: <20190306110711.309-9-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190306110711.309-1-laurent@vivier.eu>
References: <20190306110711.309-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:hjaQkpKldsVQqqSyoP/A6VJEXiFYEub3RFFZIk/3U9ajXyMmlXa
	itzP1bfoNPqxEnI9bgLOepcUpapseOtcETA9IhtDmJMAXxIDw387AQyS+ZIneKMr5Zk1Ld8
	xaUJFUwvHjyupxWHPUh8P8X0xYWwbPxr9Uduz1rov1Did4d4Z+LZUxL518aPIrsgd/0ZdfS
	5JzoeaYzoDq6xoh9MR4OA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:LiOeqshHkeU=:Enu8CMiWNETvPLIwdI6mOz
	hTTHPIy8JMf0kXKKz4wEjtK+THIBERFVHMiBDU3Cxy5puHoJnLDcNfwtxklPZJD3G1KKNbwUN
	ytVjDjmqhGxPrCx9XyiLbAeLga/Eu+RPDK864DxgvftmMI4/a1bdGHGc1HFY1aMIKV2Ynmbmj
	2vAq5pWvQX+p0cH50nqYzB+uvHw0UR4x4a/K57U0hFGjTBJ7xvGC/NyMwRNy1RD2wjUQDMVKC
	eW8/lIMJsLvad7RfauaribvISsNxHPaz+YbvHklcUsNnf42fq8RCd0NIDUFscU+6MW3zVsz3M
	MNoMDpkUHpmlnwPo/e2KmTiD2+r6L70AYaTOOfGuQVUO119/KRwNovvvNRTpSl0KhE6IamTiO
	yP9L8ZBmQeF97PheiTTqKLopXS1JgxijPslHkaCQE7xdqyifdHp+k7X0LaV/Aa3qmSPANITG2
	DjHkl4PpZZ9o1b4Y4MRSfMXqZNaU9Ncu7qM2km+FyoGrmCq1VmXNhQKtMqMN3Ct8UScZIOtZs
	Idsp3GlAS4LJZpkvjaiE5z6sFmFtyvThv80a0Coz7G30GpomG2fevASJIVW06vNrVNid42Iuw
	n2imytAe8bTy9yPO/kDwo3oeTBhQM1dGYwQp0/G67dy+ldGcB+UX7ayxSovNy8P4TUtaXTWXH
	dXvGKiJk+5L+8R1WdgzxSo2lSB7YJG61NwSO8gP3jgerZg/lLdxIxERE4aGJVX7TW2MAy5bkb
	RjqUaTUmRlSwcHvtzScb5cDimRJaXFQ0mdpTPg==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.13
Subject: [Qemu-trivial] [PULL 08/10] build: Correct explanation of
 unnest-vars example
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
X-List-Received-Date: Wed, 06 Mar 2019 11:08:32 -0000

From: Markus Armbruster <armbru@redhat.com>

Cc: Fam Zheng <fam@euphon.net>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20190213130240.15492-1-armbru@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 rules.mak | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rules.mak b/rules.mak
index 86e033d81565..19f3d2c1261d 100644
--- a/rules.mak
+++ b/rules.mak
@@ -327,7 +327,7 @@ endef
 #     ../water/ice.mo-libs = -licemaker
 #     ../water/ice.mo-objs = ../water/ice1.o ../water/ice2.o
 #
-# Note that 'hot' didn't include 'season/' in the input, so 'summer.o' is not
+# Note that 'hot' didn't include 'water/' in the input, so 'steam.o' is not
 # included.
 #
 define unnest-vars
-- 
2.20.1


