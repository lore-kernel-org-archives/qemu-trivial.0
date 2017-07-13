Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dVh2c-0002FA-A1
	for mharc-qemu-trivial@gnu.org; Thu, 13 Jul 2017 12:32:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42066)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1dVh2X-0002Cm-R7
	for qemu-trivial@nongnu.org; Thu, 13 Jul 2017 12:32:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1dVh2W-0003ug-FR
	for qemu-trivial@nongnu.org; Thu, 13 Jul 2017 12:32:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40936)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
	id 1dVh2Q-0003rO-Gd; Thu, 13 Jul 2017 12:32:26 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C5430315FD1;
	Thu, 13 Jul 2017 16:32:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com C5430315FD1
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=marcandre.lureau@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com C5430315FD1
Received: from localhost (ovpn-112-18.ams2.redhat.com [10.36.112.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 457227EE71;
	Thu, 13 Jul 2017 16:32:20 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Date: Thu, 13 Jul 2017 18:31:50 +0200
Message-Id: <20170713163219.9024-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Thu, 13 Jul 2017 16:32:25 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH v2 00/29] Refactoring with clang-tidy
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
X-List-Received-Date: Thu, 13 Jul 2017 16:32:35 -0000

Hi,

Various refactring questions on previously sent series prompted me to
look at coccinelle to automate some changes again. Alas, semantic
patches are not so easy to express for me, cocci doesn't catch all
cases, is quite slow, and it doesn't seem possible to evaluate
expressions to check if E =3D=3D E-1 or if E is pow2 for example.

I started looking at clang-tidy
(http://clang.llvm.org/extra/clang-tidy/) as an alternative to do some
refactoring.

Our build-system doesn't generate compile_commands.json, which is
pretty much required to use clang refactoring tools. But it is as easy
as running "bear make" to make one, using https://github.com/rizsotto/Bea=
r.

Then, you can run checks and automate fixes (here only "qemu-round")
over the code base with:
run-clang-tidy.py -header-filter=3D'.*' -checks=3D'-*,qemu-round' -fix

There are some path bugs that can easily be solved, see
https://bugs.llvm.org/show_bug.cgi?id=3D33440 for details.

I ran 'qemu-round' check in this series, and added a few other manual
refactoring I had pending. (I'll submit other series for the rest of
the checks later)

My WIP qemu checks are here:
https://github.com/elmarco/clang-tools-extra/tree/master/clang-tidy/qemu

The "round-check" is:
https://github.com/elmarco/clang-tools-extra/blob/master/clang-tidy/qemu/=
RoundCheck.cpp

I don't know if you can express a semantic patch that would be as
powerful. The code remains easy to write & read imho, and quite fast
to apply. I like the tool, it's probably a good complement to
coccinelle overall.

v2:
- rebased, and resent to CC qemu-trivial
- drop slirp patch, as Samuel said he applied it on his tree
- added r-b/a-b tags

Thanks

Marc-Andr=C3=A9 Lureau (29):
  i386: use ROUND_UP macro
  vnc: use QEMU_ALIGN_DOWN
  vhdx: use QEMU_ALIGN_DOWN
  vhost: use QEMU_ALIGN_DOWN
  i8254: use QEMU_ALIGN_DOWN
  pcspk: use QEMU_ALIGN_DOWN
  dmg: use DIV_ROUND_UP
  qcow2: use DIV_ROUND_UP
  vpc: use DIV_ROUND_UP
  vvfat: use DIV_ROUND_UP
  vnc: use DIV_ROUND_UP
  ui: use DIV_ROUND_UP
  vga: use DIV_ROUND_UP
  virtio-gpu: use DIV_ROUND_UP
  monitor: use DIV_ROUND_UP
  console: use DIV_ROUND_UP
  virtio-serial: use DIV_ROUND_UP
  piix: use DIV_ROUND_UP
  q35: use DIV_ROUND_UP
  usb-hub: use DIV_ROUND_UP
  msix: use DIV_ROUND_UP
  ppc: use DIV_ROUND_UP
  i386/dump: use DIV_ROUND_UP
  kvm: use DIV_ROUND_UP
  decnumber: use DIV_ROUND_UP
  i386: introduce ELF_NOTE_SIZE macro
  i386: replace g_malloc()+memcpy() with g_memdup()
  test-iov: replace g_malloc()+memcpy() with g_memdup()
  eepro100: replace g_malloc()+memcpy() with g_memdup()

 include/ui/console.h        |  2 +-
 linux-headers/asm-x86/kvm.h |  2 +-
 block/dmg.c                 |  2 +-
 block/qcow2-cluster.c       |  2 +-
 block/vhdx-log.c            |  2 +-
 block/vpc.c                 |  4 ++--
 block/vvfat.c               |  4 ++--
 hw/audio/pcspk.c            |  2 +-
 hw/char/virtio-serial-bus.c |  8 ++++----
 hw/display/vga.c            |  2 +-
 hw/display/virtio-gpu.c     |  4 ++--
 hw/i386/multiboot.c         |  3 +--
 hw/net/eepro100.c           |  3 +--
 hw/pci-host/piix.c          |  2 +-
 hw/pci-host/q35.c           |  2 +-
 hw/pci/msix.c               |  4 ++--
 hw/timer/i8254_common.c     |  4 ++--
 hw/usb/dev-hub.c            |  8 ++++----
 hw/virtio/vhost.c           |  2 +-
 libdecnumber/decNumber.c    |  2 +-
 monitor.c                   |  4 ++--
 target/i386/arch_dump.c     | 40 ++++++++++++++++++++-------------------=
-
 target/ppc/mem_helper.c     |  2 +-
 target/ppc/translate.c      |  2 +-
 tests/test-iov.c            |  3 +--
 ui/cursor.c                 |  2 +-
 ui/vnc-enc-tight.c          |  2 +-
 ui/vnc.c                    | 10 +++++-----
 28 files changed, 63 insertions(+), 66 deletions(-)

--=20
2.13.1.395.gf7b71de06


