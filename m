Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gmJDK-0004ON-Fk
	for mharc-qemu-trivial@gnu.org; Wed, 23 Jan 2019 09:09:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36627)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gmJDF-0004KY-T7
	for qemu-trivial@nongnu.org; Wed, 23 Jan 2019 09:09:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gmJDE-0003yz-2P
	for qemu-trivial@nongnu.org; Wed, 23 Jan 2019 09:09:05 -0500
Received: from mx1.redhat.com ([209.132.183.28]:39998)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gmJDB-0003yI-W3; Wed, 23 Jan 2019 09:09:02 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0EA5CC05A1D8;
	Wed, 23 Jan 2019 14:09:01 +0000 (UTC)
Received: from thuth.com (ovpn-116-107.ams2.redhat.com [10.36.116.107])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2E64B6C205;
	Wed, 23 Jan 2019 14:08:59 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Date: Wed, 23 Jan 2019 15:08:52 +0100
Message-Id: <1548252536-6242-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Wed, 23 Jan 2019 14:09:01 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 0/4] Clarify the LGPL version in some files
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
X-List-Received-Date: Wed, 23 Jan 2019 14:09:06 -0000

The GNU project published the "GNU Library Public License, version 2"
and the "GNU Lesser Public License, version 2.1" in the past, but
there never was a "GNU Lesser Public License, version 2" (like 2.0).
We've got that wrong in many files, let's start fixing this!

Thomas Huth (4):
  COPYING.LIB: Synchronize the LGPL 2.1 with the version from gnu.org
  target/openrisc: Fix LGPL version number
  target/tricore: Fix LGPL version number
  tcg: Fix LGPL version number

 COPYING.LIB                        | 22 ++++++++++------------
 accel/tcg/atomic_template.h        |  2 +-
 accel/tcg/cpu-exec-common.c        |  2 +-
 accel/tcg/cpu-exec.c               |  2 +-
 accel/tcg/cputlb.c                 |  2 +-
 accel/tcg/softmmu_template.h       |  2 +-
 accel/tcg/tcg-runtime-gvec.c       |  2 +-
 accel/tcg/translate-all.c          |  2 +-
 accel/tcg/translate-all.h          |  2 +-
 accel/tcg/user-exec.c              |  2 +-
 target/openrisc/cpu.c              |  2 +-
 target/openrisc/exception.h        |  2 +-
 target/openrisc/gdbstub.c          |  2 +-
 target/openrisc/helper.h           |  2 +-
 target/openrisc/interrupt_helper.c |  2 +-
 target/openrisc/sys_helper.c       |  2 +-
 target/openrisc/translate.c        |  2 +-
 target/tricore/cpu-qom.h           |  2 +-
 target/tricore/cpu.c               |  2 +-
 target/tricore/cpu.h               |  2 +-
 target/tricore/fpu_helper.c        |  2 +-
 target/tricore/helper.c            |  2 +-
 target/tricore/helper.h            |  2 +-
 target/tricore/op_helper.c         |  2 +-
 target/tricore/translate.c         |  2 +-
 target/tricore/tricore-defs.h      |  2 +-
 target/tricore/tricore-opcodes.h   |  2 +-
 tcg/tcg-gvec-desc.h                |  2 +-
 tcg/tcg-op-gvec.c                  |  2 +-
 tcg/tcg-op-gvec.h                  |  2 +-
 tcg/tcg-op-vec.c                   |  2 +-
 31 files changed, 40 insertions(+), 42 deletions(-)

-- 
1.8.3.1


