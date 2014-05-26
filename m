Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WopD6-0005Wv-Sw
	for mharc-qemu-trivial@gnu.org; Mon, 26 May 2014 03:20:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44246)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WopCz-0005Hu-43
	for qemu-trivial@nongnu.org; Mon, 26 May 2014 03:20:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WopCu-0007Oi-5I
	for qemu-trivial@nongnu.org; Mon, 26 May 2014 03:20:33 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:43004)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WopCh-0007Kw-Ol; Mon, 26 May 2014 03:20:16 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 7220342F3F;
	Mon, 26 May 2014 11:20:13 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 3096D644;
	Mon, 26 May 2014 11:20:13 +0400 (MSK)
Received: (nullmailer pid 22984 invoked by uid 1000);
	Mon, 26 May 2014 07:20:13 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 26 May 2014 11:19:48 +0400
Message-Id: <1401088811-22923-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 00/23] Trivial patches for 2014-05-26
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
X-List-Received-Date: Mon, 26 May 2014 07:20:38 -0000

Here's another trivial patches pull request.

This time it accumulated 23 patches, in many areas, with a focus,
for some reason, on libcacard, which received quite some cleanups
and a fix for a fun bug.

More interesting changes this time are by Peter Maydell, -- these
are the bswap.h macros renaming and using a subdir in curdir for
temporaries.

Please consider applying.

/mjt

The following changes since commit 6054d883d6138bfc92c73a7c090c824b64086f=
d2:

  Merge remote-tracking branch 'remotes/kraxel/tags/pull-chardev-2' into =
staging (2014-05-22 18:14:01 +0100)

are available in the git repository at:


  git://git.corpit.ru/qemu.git tags/trivial-patches-2014-05-26

for you to fetch changes up to 1687a089f103f9b7a1b4a1555068054cb46ee9e9:

  libcacard: remove useless initializers (2014-05-26 10:41:22 +0400)

----------------------------------------------------------------
trivial patches for 2014-05-26

----------------------------------------------------------------
Dr. David Alan Gilbert (1):
      vl: fix 'name' option to work with -readconfig

Hani Benhabiles (2):
      nbd: Close socket on negotiation failure.
      nbd: Miscellaneous typo fixes.

Jules Wang (1):
      dma-helpers: avoid calling dma_bdrv_unmap() twice

Le Tan (3):
      arch_init: replace fprintf(stderr, ...) with error_report()
      audio: replace fprintf(stderr, ...) with error_report() in audio
      bsd-user: replace fprintf(stderr, ...) with error_report()

Markus Armbruster (6):
      libcacard/vscclient: Bury some dead code
      libcacard: Plug memory leaks around vreader_get_reader_list()
      libcacard/vreader: Drop broken recovery from failed assertion
      libcacard/vreader: Tighten assertion to clarify intent
      libcacard: Convert two leftover realloc() to GLib
      libcacard/vcard_emul_nss: Drop a redundant conditional

Michael Tokarev (3):
      libcacard: g_malloc cleanups
      libcacard: fix wrong array expansion logic
      libcacard: remove useless initializers

Peter Crosthwaite (1):
      net: cadence_gem: Fix top comment

Peter Maydell (3):
      iohandler.c: Properly initialize sigaction struct
      bswap.h: Rename ldl_p, stl_p, etc to ldl_he_p, stl_he_p, etc
      configure: Put tempfiles in a subdir of the build directory

Saravanakumar (2):
      jazz_led: Add missing break in switch case
      pci: move dereferencing of root only after verifying valid root poi=
nter

Stefan Weil (1):
      configure: Automatically select GTK+ 3.0 if GTK+ 2.0 is unavailable

 .gitignore                 |    1 +
 arch_init.c                |   32 +++++++++++++--------------
 audio/spiceaudio.c         |    2 +-
 audio/wavcapture.c         |    3 +--
 blockdev-nbd.c             |    4 ++--
 bsd-user/bsdload.c         |    2 +-
 bsd-user/elfload.c         |    2 +-
 bsd-user/main.c            |   14 ++++++------
 configure                  |   51 ++++++++++++++++++++++++++++++--------=
------
 dma-helpers.c              |    2 +-
 hw/display/jazz_led.c      |    1 +
 hw/net/cadence_gem.c       |    2 +-
 hw/pci/pci.c               |    4 ++--
 include/qemu/bswap.h       |   45 +++++++++++++++++++-------------------
 iohandler.c                |    1 +
 libcacard/cac.c            |   38 +++++++++++----------------------
 libcacard/card_7816.c      |   16 ++++++--------
 libcacard/event.c          |    2 +-
 libcacard/vcard.c          |   26 ++++++----------------
 libcacard/vcard_emul_nss.c |   39 +++++++++++++++------------------
 libcacard/vreader.c        |   31 +++++++++++----------------
 libcacard/vscclient.c      |   11 +++++-----
 nbd.c                      |    2 +-
 qemu-nbd.c                 |    6 ++++--
 qemu-nbd.texi              |    2 +-
 vl.c                       |    9 ++++++--
 26 files changed, 167 insertions(+), 181 deletions(-)

