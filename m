Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dXLi7-0002DR-PU
	for mharc-qemu-trivial@gnu.org; Tue, 18 Jul 2017 02:10:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56680)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXLi6-0002DI-1e
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 02:10:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXLi2-000361-TC
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 02:10:18 -0400
Received: from mail-qk0-x231.google.com ([2607:f8b0:400d:c09::231]:35457)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXLi2-00035n-Oh; Tue, 18 Jul 2017 02:10:14 -0400
Received: by mail-qk0-x231.google.com with SMTP id p73so8450341qka.2;
	Mon, 17 Jul 2017 23:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=IkNIlrG+ixXAJ1YmB95u/UugcDd6UV+PscsG1+UFAho=;
	b=OknledkwUZ1jcxR491oX5Rw5Fo1n6fvB/xVExFV3XXX66y9yuUaf9FeNvNtAAvR/08
	MMSUgoIIm8WjK8ip8Lzo8At5jdTVXUbinZ7QOzMCy3hO+RTzHU8pu+D9NTRYoIEMfm6+
	gd8ch9/pcpOK02onvCbUtY6Q4ZSgtcdT+HBkftCFwrmmbcByLTGkU3tYvGCDvm1IXU5c
	FGmxJPhnxUL0JCPgUNLsCG2JYAcR8cp+quWVvIkZFvXNmMdTTxqbpR73mzY/hdZSmLva
	orl0WsO3PO5jNdsDMXiRDfsYAU+OVAoBZ9wQcs7s/bs727+IZCfW+E4QHC5OL7sueQC9
	4q1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=IkNIlrG+ixXAJ1YmB95u/UugcDd6UV+PscsG1+UFAho=;
	b=hKqPxQ6OXODABHhN3Vjdj0K7Eq09IS6TIfUzXeihE/8MwuWTsngHJWfvFW68kwMIZ4
	md9Z1yjHLyGm+gartQpB3SoTD7ZmLoxh2R+ixwysttra7RBtuIfK5FiT5HMGMbGq1gG1
	EA2UfSKGwm4b3zYTC1cMsqHmJ9P6sVayLbOQtnemNqIlCTySyeYNVI4IKClT7Ey5uqij
	ky31oVVWSlzROiTxdQo6HXJvfUT8cSgAC/NPvFn41od5vjH2jRZf4Fns/550QddoqDcr
	/+heIUb6JzgbMRuhJIuGwQYDWVRc9p50wvgC/i7mt8OMekkCjXzKDUUpLOu7XDH90Ptb
	2+fQ==
X-Gm-Message-State: AIVw113HyJJayrJgNCDZuLTj7RN4PeZF4UXdTCPrLTmBKFR9vtvKXAtj
	HerKB0XkA9VQLUSV7HHXVw==
X-Received: by 10.55.134.69 with SMTP id i66mr18121qkd.33.1500358213952;
	Mon, 17 Jul 2017 23:10:13 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	l31sm1099862qtc.64.2017.07.17.23.10.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Jul 2017 23:10:13 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Eric Blake <eblake@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Date: Tue, 18 Jul 2017 03:09:36 -0300
Message-Id: <20170718061005.29518-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::231
Subject: [Qemu-trivial] [PATCH 00/29] coccinelle script to enforce
 qemu/osdep.h macros usage
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
X-List-Received-Date: Tue, 18 Jul 2017 06:10:19 -0000

Hi,

Another cocci script... Here the idea is to have the same script with all the
osdep.h macros related rules altogether.

First run with QEMU_IS_ALIGNED() and ARRAY_SIZE().

Regards,

Phil.

PD: I used the "enforce" word because I plan to have some continuous integration
job running such scripts (also the clang-tidy good stuff).

Philippe Mathieu-Daudé (29):
  coccinelle: add a script to enforce qemu/osdep.h macros usage
  pci: remove superfluous parenthesis
  qemu-img: use QEMU_IS_ALIGNED macro
  scsi-disk: use QEMU_IS_ALIGNED macro
  block: use QEMU_IS_ALIGNED macro
  migration/block: use QEMU_IS_ALIGNED macro
  ds1338: use QEMU_IS_ALIGNED macro
  ui: use QEMU_IS_ALIGNED macro
  net: use QEMU_IS_ALIGNED macro
  net/rocker: use QEMU_IS_ALIGNED macro
  s390x/sclp: use QEMU_IS_ALIGNED macro
  sm501: use QEMU_IS_ALIGNED macro
  tcg: use QEMU_IS_ALIGNED macro
  cris: use QEMU_IS_ALIGNED macro
  microblaze: use QEMU_IS_ALIGNED macro
  lm32: use QEMU_IS_ALIGNED macro
  sparc: use QEMU_IS_ALIGNED macro
  nios2: use QEMU_IS_ALIGNED macro
  disas: use QEMU_IS_ALIGNED macro
  disas: use ARRAY_SIZE macro
  qga: use ARRAY_SIZE macro
  vmsvga: use ARRAY_SIZE macro
  async: use ARRAY_SIZE macro
  tests/acpi: use ARRAY_SIZE macro
  tests/qos: use ARRAY_SIZE macro
  tests/tcg: use ARRAY_SIZE macro
  tests/hbitmap: use ARRAY_SIZE macro
  tests/qapi: use QEMU_IS_ALIGNED macro
  tests/qapi: use ARRAY_SIZE macro

 accel/tcg/translate-all.c           |  2 +-
 block/io.c                          |  4 +--
 block/qcow2-cache.c                 |  2 +-
 block/vhdx-log.c                    |  2 +-
 block/vvfat.c                       |  2 +-
 disas.c                             |  2 +-
 disas/ia64.c                        |  4 +--
 disas/m68k.c                        |  5 ++--
 disas/ppc.c                         | 12 +++-----
 disas/s390.c                        |  3 +-
 hw/display/sm501_template.h         |  2 +-
 hw/display/vmware_vga.c             |  5 ++--
 hw/misc/pci-testdev.c               |  4 +--
 hw/net/rocker/rocker.c              |  2 +-
 hw/s390x/sclp.c                     |  4 +--
 hw/scsi/scsi-disk.c                 |  4 +--
 hw/timer/ds1338.c                   |  4 +--
 migration/block.c                   |  2 +-
 net/eth.c                           |  2 +-
 qemu-img.c                          |  2 +-
 qga/commands-posix.c                |  2 +-
 scripts/coccinelle/use_osdep.cocci  | 60 +++++++++++++++++++++++++++++++++++++
 target/cris/translate.c             |  6 ++--
 target/lm32/translate.c             |  2 +-
 target/microblaze/op_helper.c       |  3 +-
 target/microblaze/translate.c       |  3 +-
 target/nios2/translate.c            |  2 +-
 target/sparc/cpu.c                  |  4 +--
 tests/acpi-utils.h                  |  2 +-
 tests/libqos/libqos.c               |  2 +-
 tests/tcg/alpha/test-cond.c         |  2 +-
 tests/tcg/alpha/test-ovf.c          |  2 +-
 tests/test-hbitmap.c                |  6 ++--
 tests/test-qobject-output-visitor.c |  2 +-
 tests/test-string-output-visitor.c  |  2 +-
 ui/console-gl.c                     |  2 +-
 util/aio-posix.c                    |  2 +-
 37 files changed, 114 insertions(+), 59 deletions(-)
 create mode 100644 scripts/coccinelle/use_osdep.cocci

-- 
2.13.2


