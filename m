Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dnMoC-00018h-5M
	for mharc-qemu-trivial@gnu.org; Thu, 31 Aug 2017 06:34:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40611)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1dnMo8-00015U-6E
	for qemu-trivial@nongnu.org; Thu, 31 Aug 2017 06:34:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1dnMo7-0005DZ-4t
	for qemu-trivial@nongnu.org; Thu, 31 Aug 2017 06:34:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57076)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
	id 1dnMo2-0005AG-E7; Thu, 31 Aug 2017 06:34:38 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AA9DEC047B6F;
	Thu, 31 Aug 2017 10:34:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com AA9DEC047B6F
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=marcandre.lureau@redhat.com
Received: from localhost (ovpn-112-36.ams2.redhat.com [10.36.112.36])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BE38092B93;
	Thu, 31 Aug 2017 10:34:33 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Date: Thu, 31 Aug 2017 12:34:03 +0200
Message-Id: <20170831103432.6007-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Thu, 31 Aug 2017 10:34:36 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PULL 00/29] Code cleanup patches
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
X-List-Received-Date: Thu, 31 Aug 2017 10:34:45 -0000

The following changes since commit 1201d308519f1e915866d7583d5136d03cc1d3=
84:

  slirp: fix clearing ifq_so from pending packets (2017-08-30 23:14:34 +0=
100)

are available in the git repository at:

  https://github.com/elmarco/qemu.git tags/tidy-pull-request

for you to fetch changes up to e4d67e4f2e06128bc7f07263afe9acc2e2242fdc:

  eepro100: replace g_malloc()+memcpy() with g_memdup() (2017-08-31 12:29=
:07 +0200)

----------------------------------------------------------------

----------------------------------------------------------------

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
2.14.1.146.gd35faa819


