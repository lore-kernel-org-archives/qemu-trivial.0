Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZfsFL-00009f-GT
	for mharc-qemu-trivial@gnu.org; Sat, 26 Sep 2015 12:22:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49939)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1ZfsF4-00089L-N0
	for qemu-trivial@nongnu.org; Sat, 26 Sep 2015 12:22:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1ZfsF1-0006Vz-T2
	for qemu-trivial@nongnu.org; Sat, 26 Sep 2015 12:22:30 -0400
Received: from smtp4-g21.free.fr ([212.27.42.4]:28585)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>)
	id 1ZfsEr-0006KP-Qw; Sat, 26 Sep 2015 12:22:18 -0400
Received: from Quad.localdomain (unknown [78.238.229.36])
	by smtp4-g21.free.fr (Postfix) with ESMTPS id 1C0934C8062;
	Sat, 26 Sep 2015 18:22:15 +0200 (CEST)
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-trivial@nongnu.org
Date: Sat, 26 Sep 2015 18:22:02 +0200
Message-Id: <1443284532-8634-1-git-send-email-laurent@vivier.eu>
X-Mailer: git-send-email 2.4.3
X-detected-operating-system: by eggs.gnu.org: Windows NT kernel [generic]
	[fuzzy]
X-Received-From: 212.27.42.4
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
	Alexander Graf <agraf@suse.de>, qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	John Snow <jsnow@redhat.com>, Laurent Vivier <laurent@vivier.eu>
Subject: [Qemu-trivial] [PATCH 00/10][TRIVIAL] Define categories for some
	PPC devices
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
X-List-Received-Date: Sat, 26 Sep 2015 16:22:32 -0000

Some PPC devices appear uncategorized in the output of
"-device ?". This series tries to categorize some of
them.

Laurent Vivier (10):
  adb: add to input category
  cmd646: add to storage category
  escc: add to input category
  grackle: add to bridge category
  cuda: add to bridge category
  macio-ide: add to storage category
  uninorth: add to bridge category
  macio: add to bridge category
  macio-nvram: add to misc category
  openpic: add to misc category

 hw/char/escc.c         | 1 +
 hw/ide/cmd646.c        | 1 +
 hw/ide/macio.c         | 1 +
 hw/input/adb.c         | 2 ++
 hw/intc/openpic.c      | 1 +
 hw/intc/openpic_kvm.c  | 1 +
 hw/misc/macio/cuda.c   | 1 +
 hw/misc/macio/macio.c  | 1 +
 hw/nvram/mac_nvram.c   | 1 +
 hw/pci-host/grackle.c  | 2 ++
 hw/pci-host/uninorth.c | 8 ++++++++
 11 files changed, 20 insertions(+)

-- 
2.4.3


