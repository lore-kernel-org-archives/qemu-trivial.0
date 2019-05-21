Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hT6VU-0007YF-Ap
	for mharc-qemu-trivial@gnu.org; Tue, 21 May 2019 11:16:48 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54129)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <liq3ea@163.com>) id 1hT6VS-0007Wk-Fg
	for qemu-trivial@nongnu.org; Tue, 21 May 2019 11:16:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <liq3ea@163.com>) id 1hT6VR-0001an-N4
	for qemu-trivial@nongnu.org; Tue, 21 May 2019 11:16:46 -0400
Received: from m12-16.163.com ([220.181.12.16]:57266)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <liq3ea@163.com>)
	id 1hT6VP-0001VV-Di; Tue, 21 May 2019 11:16:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=3MoRSJyCsIFKNNUCfB
	vEtOAISeqVYFTvmBIb424LSkw=; b=cMHjRLnT2kh/sil4TjDYpZl/kFJhguuj/b
	rvDUaMpzX6OJhrXgzlyCdnu2XOeljWEp39nxQfEjmZS2IkwA8VtopcQk7WrnUHt+
	+8NDAoMHWZE+4B5CGy98d11nV839ITTh3mhS7o/TqaDB6cvyxAefjAfL/ACS47wG
	KJhzggEZA=
Received: from localhost.localdomain (unknown [115.192.71.0])
	by smtp12 (Coremail) with SMTP id EMCowAC31lxJFuRcie7uGw--.4521S2;
	Tue, 21 May 2019 23:16:26 +0800 (CST)
From: Li Qiang <liq3ea@163.com>
To: alex.williamson@redhat.com,
	lvivier@redhat.com
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, liq3ea@gmail.com,
	philmd@redhat.com, Li Qiang <liq3ea@163.com>
Date: Tue, 21 May 2019 08:15:39 -0700
Message-Id: <20190521151543.92274-1-liq3ea@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: EMCowAC31lxJFuRcie7uGw--.4521S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7XFyUJF1rury8JFykAr1kXwb_yoW3GrcEk3
	4Fvws8GrZIgasIkFW2kr17Ww18Cw4rurn0y34rAryqvws8Jas8GF97CrWSgF17ur4SyF9x
	GrW7uryayr9xWjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUjdHUPUUUUU==
X-Originating-IP: [115.192.71.0]
X-CM-SenderInfo: 5oltjvrd6rljoofrz/1tbiFAi7bVaD011gfAAAsN
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 220.181.12.16
Subject: [Qemu-trivial] [PATCH v2 0/4] hw: vfio: some trivial fix
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
X-List-Received-Date: Tue, 21 May 2019 15:16:47 -0000

These patchset fix some trivial issues,
The first patch makes the code more QOMConventions.
The second decouples VMStateDescription's name with
QOM TypeInfo's name.
The third fixes a typo.
The fourth reduce duplicated code.

Change since v1:
Add more commit message.

Li Qiang (4):
  vfio: pci: make "vfio-pci-nohotplug" as MACRO
  hw: vfio: drop TYPE_FOO MACRO in VMStateDescription
  vfio: platform: fix a typo
  pci: msix: move 'MSIX_CAP_LENGTH' to header file

 hw/pci/msix.c           | 2 --
 hw/vfio/amd-xgbe.c      | 2 +-
 hw/vfio/ap.c            | 2 +-
 hw/vfio/calxeda-xgmac.c | 2 +-
 hw/vfio/ccw.c           | 2 +-
 hw/vfio/pci.c           | 8 ++++----
 hw/vfio/platform.c      | 6 +++---
 include/hw/pci/msix.h   | 2 ++
 8 files changed, 13 insertions(+), 13 deletions(-)

-- 
2.17.1



