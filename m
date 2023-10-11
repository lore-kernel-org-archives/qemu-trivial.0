Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qqgx7-0007xs-FT
	for mharc-qemu-trivial@gnu.org; Wed, 11 Oct 2023 17:41:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1qqgx5-0007xQ-S8; Wed, 11 Oct 2023 17:41:11 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1qqgx3-0001cE-Kn; Wed, 11 Oct 2023 17:41:11 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 2C9ED29952;
 Thu, 12 Oct 2023 00:41:10 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id BFE862E8A3;
 Thu, 12 Oct 2023 00:41:03 +0300 (MSK)
Received: (nullmailer pid 20158 invoked by uid 1000);
 Wed, 11 Oct 2023 21:41:03 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org
Subject: [PULL v2 00/12] Trivial patches for 2023-10-11
Date: Thu, 12 Oct 2023 00:40:59 +0300
Message-Id: <20231011214059.20142-1-mjt@tls.msk.ru>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Oct 2023 21:41:12 -0000

The following changes since commit 0ad0d9dcd16f2ea816a413008ac5191ebef45c95:

  Merge tag 'firmware/seabios-20231010-pull-request' of https://gitlab.com/kraxel/qemu into staging (2023-10-10 10:22:16 -0400)

are available in the Git repository at:

  https://gitlab.com/mjt0k/qemu.git tags/pull-trivial-patches

for you to fetch changes up to b216b5daa57ce068183ce865c163f4df01b74614:

  cpus: Remove unused smp_cores/smp_threads declarations (2023-10-12 00:37:39 +0300)

----------------------------------------------------------------
trivial patches for 2023-10-11

Just some trivial stuff, including some MAINTAINERS updates.

v2:
Dropped the pvrdma change which broke CI with clang.
I did just the basic test, no clang.

Not re-sending any patches, since it all is exactly the same
as before, just without "hw/rdma/vmw/pvrdma_cmd: Use correct
struct in query_port()" one.

----------------------------------------------------------------
Cornelia Huck (1):
      MAINTAINERS: add standard-headers to Hosts/LINUX

Jianlin Li (1):
      Update AMD memory encryption document links.

Olaf Hering (1):
      roms: use PYTHON to invoke python

Philippe Mathieu-Daudé (2):
      MAINTAINERS: Add section for overall sensors
      cpus: Remove unused smp_cores/smp_threads declarations

Pierre Labatut (1):
      Fix compilation when UFFDIO_REGISTER is not set.

Thomas Huth (6):
      MAINTAINERS: Add g364fb and ds1225y to the Jazz section
      MAINTAINERS: Add unowned RISC-V related files to the right sections
      MAINTAINERS: Add include folder to the hw/char/ section
      MAINTAINERS: Add the CI-related doc files to the CI section
      MAINTAINERS: Add some unowned files to the SBSA-REF section
      scripts/xml-preprocess: Make sure this script is invoked via the right Python

 MAINTAINERS                                | 24 +++++++++++++++++++++++-
 docs/system/i386/amd-memory-encryption.rst |  6 +++---
 include/sysemu/cpus.h                      |  7 -------
 roms/Makefile                              |  2 +-
 scripts/xml-preprocess.py                  |  0
 subprojects/libvhost-user/libvhost-user.c  |  2 +-
 6 files changed, 28 insertions(+), 13 deletions(-)
 mode change 100755 => 100644 scripts/xml-preprocess.py

