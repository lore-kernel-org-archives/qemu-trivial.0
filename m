Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1daYl9-0005EB-1T
	for mharc-qemu-trivial@gnu.org; Wed, 26 Jul 2017 22:42:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54327)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daYl5-0005Bp-O6
	for qemu-trivial@nongnu.org; Wed, 26 Jul 2017 22:42:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daYl4-0007cf-Ir
	for qemu-trivial@nongnu.org; Wed, 26 Jul 2017 22:42:39 -0400
Received: from mail-qt0-x22f.google.com ([2607:f8b0:400d:c0d::22f]:38618)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daYky-0007XG-RQ; Wed, 26 Jul 2017 22:42:32 -0400
Received: by mail-qt0-x22f.google.com with SMTP id t37so60736413qtg.5;
	Wed, 26 Jul 2017 19:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=w71izf8r3/NMxzgROWfGgCIbkAUlOvbpS6OKvq58e7E=;
	b=IszGrwXNbb0cWm2wjPJzxFftywCMegwBxMrkYMywgmPplnAy3cvOWb2/MXQ2h/aHHE
	1X83xkr3+Xg5t4+6Vl44zH4ugDu8ftM4CGZQrta2TpS41mrf5zOQc/Rw0dL+W1gLDzgx
	RD6FhfBu5PNKeQke4Din1XjUoJTn7kG0eVJrkg1Auvj88ZrqGbpR5qqIHyc+CftcMkk7
	EHCeQqmw5KNuOTpvY9fYw9qZGXtl1zkL0ZZz6hHAn+G+v+6i3f4zvoraS17YTHH6ntKe
	mB3QkuznmTgBqnE0LgtJPe2/tPqZgsbn7ZFsWr9ynDU6n5Qq7ORxAjJpnfsioPkTwUbP
	YZOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=w71izf8r3/NMxzgROWfGgCIbkAUlOvbpS6OKvq58e7E=;
	b=DTeJMrgakt2ESrxZiKKjViUQdFN/uAYRxqL6iZbW8DY5dVmsfEC8JkSmGSZv0jL+wN
	0g1bBs2GXCyX0Tb+zfn/WEZj46YlMm5u6oEyDvCc7rkj3y0KvMhxNk3+D3T1xK/qDMOP
	n8ZX8eEVB7uBHxi3IkAv0Lm4cxusIAguWatbQ7ogbVC/0V4latOYsb43g5CaJ+fGj1Sm
	MWbqh4rNB4CkoNdfLqiY8XcBSfMXK2bxfxd/NHhe40neA8t2qy1gBzVMji5zU1f8IW2A
	vSxPfhteLZ25g8e5ed6jOxxsDpzVzgJNraOLI13tmxNsV8j5VDal1+QYFTdEJHW9dd2w
	QjHg==
X-Gm-Message-State: AIVw1109kp61JYOWs7EXwlRMftqefH8qtzhKgB5F/1Dgi5nhLwpnXSD0
	ZkMu8xIl5VJjBA==
X-Received: by 10.200.50.133 with SMTP id z5mr3965953qta.78.1501123352118;
	Wed, 26 Jul 2017 19:42:32 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	g27sm13221147qtg.84.2017.07.26.19.42.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Jul 2017 19:42:31 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Wed, 26 Jul 2017 23:42:05 -0300
Message-Id: <20170727024224.22900-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::22f
Subject: [Qemu-trivial] [PATCH for 2.10 v2 00/20] fix bugs reported by Clang
 Static Analyzer
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
X-List-Received-Date: Thu, 27 Jul 2017 02:42:41 -0000

Hi,

This series is the result of [now NOT] having fun with Clang's Static Analyzer
(see https://clang-analyzer.llvm.org/).

v2:
- addressed review feedbacks,
- added various R-b,
- dropped noise (Peter sharp eye),
- dropped dup patches

Patches 1-13 are already reviewed,
Patches 14,15 address feedbacks from v1,
Patch 16 test if patch collecting tools can handle missing patches,
Patches 17-19 are new,
Patch 20 is new but not very important ;) bonus that can wait 2.11.

Regards,

Phil.

v1:

Patch 1 was in another series (delayed for 2.11), it would be nice to have it
in 2.10.

I ran Clang static analyzer "scan-build" via a docker image based on
debian/unstable to use bleeding code, if one is interested in reproduce or use
it the Dockerfile is available here:
http://lists.nongnu.org/archive/html/qemu-devel/2017-07/msg07487.html

I used the following commands:

$ ../configure --host-cc=clang-5.0 --cc=clang-5.0 --cxx=clang++-5.0 \
  --disable-docs --enable-debug
$ scan-build-5.0 -o testresults --keep-going -maxloop 2 -no-failure-reports \
  -analyzer-config stable-report-filename=true \
  -disable-checker alpha.clone.CloneChecker \
  -enable-checker alpha.core.CastSize \
  -enable-checker alpha.core.Conversion \
  -enable-checker alpha.core.IdenticalExpr \
  -enable-checker alpha.core.SizeofPtr \
  -disable-checker alpha.deadcode.UnreachableCode \
  -enable-checker alpha.security.ArrayBoundV2 \
  -enable-checker alpha.security.MallocOverflow \
  -enable-checker alpha.unix.cstring.BufferOverlap \
  -enable-checker alpha.unix.cstring.OutOfBounds \
  -disable-checker deadcode.DeadStores \
  -disable-checker optin.performance.Padding \
  -enable-checker optin.portability.UnixAPI \
  -disable-checker security.insecureAPI.getpw \
  -disable-checker security.insecureAPI.gets \
  -enable-checker security.insecureAPI.strcpy \
  -disable-checker unix.Vfork \
    make -k -j4

Philippe Mathieu-Daudé (20):
  tests: add missing dependency to build QTEST_QEMU_BINARY
  loader: check get_image_size() return value
  ivshmem: fix incorrect error handling in ivshmem_recv_msg()
  nbd: fix memory leak in nbd_opt_go()
  qcow2: fix null pointer dereference
  ui/vnc: fix leak of SocketAddress **
  net/eth: fix incorrect check of iov_to_buf() return value
  vfio/platform: fix use of freed memory
  vfio/pci: fix use of freed memory
  m68k/translate: fix incorrect copy/paste
  linux-user/sh4: fix incorrect memory write
  syscall: fix dereference of undefined pointer
  syscall: fix use of uninitialized values
  syscall: check inotify() and eventfd() return value
  thunk: assert nb_fields is valid
  bt-sdp: fix memory leak in sdp_service_record_build()
  9pfs: avoid sign conversion error simplifying the code
  spapr_vio: fix overflow of qdevs in spapr_dt_vdevice()
  i2c/exynos4210: fix write to I2CADD register, bit 0 is not mapped

 block/qcow2-refcount.c  |  4 +--
 hw/9pfs/9p.c            |  6 ++---
 hw/bt/sdp.c             |  6 +++--
 hw/core/loader.c        |  4 +--
 hw/i2c/exynos4210_i2c.c |  2 +-
 hw/misc/ivshmem.c       |  5 +++-
 hw/ppc/spapr_vio.c      |  4 +--
 hw/vfio/pci.c           | 11 ++++++---
 hw/vfio/platform.c      |  2 +-
 linux-user/elfload.c    |  2 +-
 linux-user/syscall.c    | 18 +++++++++++---
 nbd/client.c            |  8 +++---
 net/eth.c               |  4 +--
 target/m68k/translate.c |  2 +-
 tests/Makefile.include  |  2 +-
 thunk.c                 |  3 ++-
 ui/vnc.c                | 66 ++++++++++++++++++++++++-------------------------
 17 files changed, 83 insertions(+), 66 deletions(-)

-- 
2.13.3


