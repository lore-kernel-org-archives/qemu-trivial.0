Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ghDek-0003Dx-Kn
	for mharc-qemu-trivial@gnu.org; Wed, 09 Jan 2019 08:12:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46864)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1ghDei-0002z4-TW
	for qemu-trivial@nongnu.org; Wed, 09 Jan 2019 08:12:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1ghDbn-0000A4-Ob
	for qemu-trivial@nongnu.org; Wed, 09 Jan 2019 08:09:25 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:44581)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1ghDbh-00006c-Sw; Wed, 09 Jan 2019 08:09:18 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MqINP-1h3Ins1xml-00nSCS; Wed, 09 Jan 2019 14:08:55 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
	Richard Henderson <rth@twiddle.net>,
	David Gibson <david@gibson.dropbear.id.au>,
	Anthony Green <green@moxielogic.com>, John Snow <jsnow@redhat.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Laszlo Ersek <lersek@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
	qemu-block@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	qemu-ppc@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Gerd Hoffmann <kraxel@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=83=C2=A9?= <philmd@redhat.com>
Date: Wed,  9 Jan 2019 14:08:38 +0100
Message-Id: <20190109130844.5172-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:wkTJm9nNSOlDGBw6ot+eiB92QURMsDEToWFzQrx6vu7MQ8jVNHG
	Ry8Dc1bR5fYHenqbTKFKPKsOCItsA5QH8G4NRtUTUBoCE8QiubxciqYrjiADAFoEdT2XsLG
	fYlHne0vp0q5NQqbt/9AzanY6fkKw+uGgog99bVT3cHi0AecznRNImyZmyGy1WOxCyPC7vr
	Iu3D9xuB0WwAUZFas0Imw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:DIhg8cQYzxc=:PSZbgaE9QV7up6bSNllWsE
	fFmPgaTtVLxWT9LyCGL7/1OTRB94pJmwEK9/IgGtDmUskpir3G9AldHAK1WqlVD1iMrpThovT
	iKG3/+rg3E9E9HBceMwyM3Bu3HUjJVgbtkc9mrPy2JdaWhF85r4ncGtXq9smDAelP2itqQ8vB
	Wse6krYAztrkPii7GhW9APoGAajIeRauQ1feP83HY/cyTAr0GRciLcbqHqUyNc4pkehBlywup
	vtVkcsxgggZna9RonMPpZ1JQPOIYd8VEDUw2f7Kl/P7TbkhOk7DRcKHOqRcKNarNpT650AvY2
	szCJC1KiAxyzPU67nyR9cjisYBzHNBP5HQ6Daw4ycvyH0DSI4gR6ZMGzDzZOoWI1tkJVBs5S5
	qSPWe4+5LA2ENL5Lx/gxpZjDOuOnOz7z4XhYUoe1oDkQ4oVzRX53M9CpCceS5zRbPGLI1PeHg
	fB8+TOVC5S+IbwHPMdC4nU/PyQWjpfDV+Q+tTtN4IKRFvd3AnyXAC0rQo04j2KhK3/vfgUCLr
	j6pQwI3/mvcvMO17HHqAmUPNh7DgQgAVa55OYI5wf0LAwAtXxSGwWHjyBRqvsJXCApez8b75v
	ylZgXYz4Fhw0EqMuHtu00Jnv4fUxdo9lUASSCXibXMH4ZYe7u8e5R7MIUprIODcvzVA9OG6Lt
	V+SycrjRRfq/YXA1aeKKe22C1pTERjHIVAlwOzQmmQhBzv3P06pzFN507ZAduM91Poe8G+v3F
	y+EhEYunVV/HCgjOnb1MMRQ31sxqe8tklt9Brui90CoYgxolSBUAGgOJfeXYh+xzuaYS1Ki5c
	T14SnTaB6WXQw6+kz5LzHvouOMlcPdZuo4sIreQVWiTjbahXpngQ/NW4jx7HwuNIGGJ3nqA5o
	S21p2rSmdJpo07TJ7ENw==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.134
Subject: [Qemu-trivial] [PULL 0/6] Trivial patches patches
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
X-List-Received-Date: Wed, 09 Jan 2019 13:12:25 -0000

The following changes since commit 147923b1a901a0370f83a0f4c58ec1baffef22f0:

  Merge remote-tracking branch 'remotes/kraxel/tags/usb-20190108-pull-request' into staging (2019-01-08 16:07:32 +0000)

are available in the Git repository at:

  git://github.com/vivier/qemu.git tags/trivial-patches-pull-request

for you to fetch changes up to 34bec7a8d04f23d6258dcf338894956b945673a5:

  ioapic: use TYPE_FOO MACRO than constant string (2019-01-09 11:33:47 +0100)

----------------------------------------------------------------
Trivial patches for 4.0 (2019-01-09)

----------------------------------------------------------------

Eric Blake (1):
  typedefs: (Re-)sort entries alphabetically

Li Qiang (1):
  ioapic: use TYPE_FOO MACRO than constant string

Priit Laes (1):
  qom: Include qemu/fprintf-fn.h in cpu.h

Thomas Huth (2):
  hw/audio/marvell: Don't include unnecessary i2c.h header file
  trivial: Don't include isa.h if it is not really necessary

Wainer dos Santos Moschetta (1):
  hw/core: fix whitespace in a sentence

 hw/audio/marvell_88w8618.c    |  1 -
 hw/core/machine.c             |  2 +-
 hw/display/ramfb-standalone.c |  1 -
 hw/i386/kvm/ioapic.c          |  2 +-
 hw/i386/pc.c                  |  4 ++--
 hw/ide/pci.c                  |  1 -
 hw/ide/piix.c                 |  1 -
 hw/ide/via.c                  |  1 -
 hw/intc/ioapic.c              |  2 +-
 hw/misc/macio/mac_dbdma.c     |  1 -
 hw/moxie/moxiesim.c           |  1 -
 hw/nvram/fw_cfg.c             |  1 -
 hw/sparc/sun4m.c              |  1 -
 hw/timer/i8254.c              |  1 -
 include/hw/i386/ioapic.h      |  3 +++
 include/qemu/typedefs.h       | 10 +++++-----
 include/qom/cpu.h             |  1 +
 17 files changed, 14 insertions(+), 20 deletions(-)

-- 
2.20.1


