Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dZi5e-0008CS-2d
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jul 2017 14:28:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50025)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZi5a-00089S-V7
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 14:28:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZi5Z-0004iI-FU
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 14:28:18 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:38872)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZi5U-0004hF-Mi; Mon, 24 Jul 2017 14:28:12 -0400
Received: by mail-qt0-x241.google.com with SMTP id p3so2376113qtg.5;
	Mon, 24 Jul 2017 11:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=AM24rNd8awmWdlMJDJkir/bYX2CSP2vTdnDjOKPyxOQ=;
	b=JhayWNjNX1Uxt2ALP5E24Ewog/c74fgBy63gX9aLZE/I7Vhz0a3Y+rWNQN9rn6ilw7
	ygw6a4/ymTbJf4Cc4oC/2BEfrkjFYYrKKYRtCLiyo2SHq/xTRRI6zHADQ+uOflmjHmja
	LzO0R+eKiDXkhq8yZXrgAKjqdtgV41olKgtL2ZFcLRQvNq7owUrgGWfNyC1c0jHZrSlR
	k3jDDBn9FYxbbAvMjzezb6EF0ecFIBzgfMjN3O0HiMnkKlWqiK71czIUgQ+png6poomW
	a7+RKoMzqjocYAy2GvUnh73gu0jpQIDAQp2XdduCz8ZS3wQInNYKf1kIlGqLUvYmUdMu
	6HJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=AM24rNd8awmWdlMJDJkir/bYX2CSP2vTdnDjOKPyxOQ=;
	b=DyHTLn2Dwub+lxLVCmVZqNPREob/v7sHSe1Uya2PAIsDDmxGLCDBLklMHNl1DOx1Oz
	r3J8Te9RjAy0N8pp2MXwoWyV+oxDFP/7EUDzTEidWfO1Ym2yecubZ10Bi+1Z/PcIy44W
	ZbqGfhsyToNDgnwE3LgWSI4qtu64iZz4Z0NOLrXNAci+wlVwBhgHwe8SOK0X2vKzy4P4
	n6E8M3eSrL7I4+cJN0cUFXXujTx7zjTtcZcYy3ucJAjTOzyJXLWfyDo7DLUvL54Kih+m
	k4y3sPDN7Z5wnCfQVCTQiLjbhsVA0U+AnqT7WgcGgBLFbbulkAYu+5txSNLoc0C2VYUO
	+bsw==
X-Gm-Message-State: AIVw110xyciM8rUzhB/yfBtOliRgLLjEKYJk8lV1l1BN1VTq3fPKab/i
	H4xR40Y47UUkKA==
X-Received: by 10.200.35.188 with SMTP id q57mr2696353qtq.238.1500920892023;
	Mon, 24 Jul 2017 11:28:12 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	t57sm9033799qtt.18.2017.07.24.11.28.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Jul 2017 11:28:11 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Fam Zheng <famz@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Mon, 24 Jul 2017 15:27:16 -0300
Message-Id: <20170724182751.18261-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-trivial] [PATCH for 2.10 00/35] fix bugs reported by Clang
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
X-List-Received-Date: Mon, 24 Jul 2017 18:28:20 -0000

Hi,

This series is the result of having fun with Clang's Static Analyzer during
the week-end (see https://clang-analyzer.llvm.org/).

No need to delay the first batch for -rc0.

Patch 1 was in another series (delayed for 2.11), it would be nice to have it
in 2.10.

I built a docker image based on debian/unstable to use bleeding code, the
Dockerfile is provided at the end of this series as RFC for people wanted
to give a try (also include 'dockershell' script and a fix in ./configure).
These RFC patches (33-35) are not expected to enter 2.10.

I used the following commands:

$ make docker-image-debian-bleeding-dev
$ ./scripts/dockershell debian-bleeding-dev
$ mkdir -p build
$ cd build
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

Regards,

Phil.

Philippe Mathieu-Daudé (35):
  tests: add missing dependency to build QTEST_QEMU_BINARY
  loader: check get_image_size() return value
  thunk: check nb_fields is valid before continuing
  ivshmem: fix incorrect error handling in ivshmem_recv_msg()
  nbd: fix memory leak in nbd_opt_go()
  qcow2: remove inconsistent check
  qcow2: fix null pointer dereference
  qcow2: fix null pointer dereference
  ui/vnc: fix leak of SocketAddress **
  net/eth: fix incorrect check of iov_to_buf() return value
  i2c/exynos4210: correctly check i2c_recv() return value
  vfio/platform: fix use of freed memory
  vfio/pci: fix use of freed memory
  vfio/ccw: fix incorrect malloc() size
  usb: correctly handle Zero Length Packets
  usb/dev-mtp: fix use of uninitialized values
  usb/dev-mtp: fix use of uninitialized values
  usb/dev-mtp: fix use of uninitialized values
  usb/dev-mtp: fix use of uninitialized variable
  arm/boot: fix undefined instruction on secondary smp cpu bootloader
  arm/sysbus-fdt: fix null pointer dereference
  arm/vexpress: fix potential memory leak
  m68k/translate: fix incorrect copy/paste
  linux-user/sh4: fix incorrect memory write
  linux-user: extract is_error() out of syscall.c
  linux-user: use is_error() to avoid warnings and make the code clearer
  syscall: fix dereference of undefined pointer
  syscall: check dup/dup2/dup3() errors, return EBADFD/EINVAL if
    required
  syscall: fix out-of-bound memory access
  syscall: fix use of uninitialized values
  syscall: replace strcpy() by g_strlcpy()
  timer/pxa2xx: silent warning about out-of-bound memory access
  configure: clang does not support -Wexpansion-to-defined
  docker: add debian 'bleeding' image with gcc7 and clang5
  script to run docker image

 block/qcow2-bitmap.c                               |  4 +-
 block/qcow2-refcount.c                             |  4 +-
 configure                                          |  6 +-
 hw/arm/boot.c                                      |  2 +-
 hw/arm/sysbus-fdt.c                                | 11 ++-
 hw/arm/vexpress.c                                  |  5 +-
 hw/core/loader.c                                   |  4 +-
 hw/i2c/exynos4210_i2c.c                            |  8 +-
 hw/misc/ivshmem.c                                  |  5 +-
 hw/timer/pxa2xx_timer.c                            |  2 +-
 hw/usb/dev-mtp.c                                   | 60 +++++++++-----
 hw/usb/redirect.c                                  |  2 +-
 hw/vfio/ccw.c                                      |  2 +-
 hw/vfio/pci.c                                      | 11 ++-
 hw/vfio/platform.c                                 |  2 +-
 linux-user/elfload.c                               |  2 +-
 linux-user/flatload.c                              | 15 ++--
 linux-user/qemu.h                                  |  5 ++
 linux-user/syscall.c                               | 45 +++++++----
 nbd/client.c                                       |  8 +-
 net/eth.c                                          |  4 +-
 scripts/dockershell                                | 30 +++++++
 target/m68k/translate.c                            |  3 +-
 tests/Makefile.include                             |  2 +-
 .../docker/dockerfiles/debian-bleeding-dev.docker  | 94 ++++++++++++++++++++++
 thunk.c                                            |  5 +-
 ui/vnc.c                                           | 36 ++++-----
 27 files changed, 279 insertions(+), 98 deletions(-)
 create mode 100755 scripts/dockershell
 create mode 100644 tests/docker/dockerfiles/debian-bleeding-dev.docker

-- 
2.13.3


