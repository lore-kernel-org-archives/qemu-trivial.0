Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i0Ofl-0005hB-FH
	for mharc-qemu-trivial@gnu.org; Wed, 21 Aug 2019 07:21:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53650)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1i0OfU-000593-RH
 for qemu-trivial@nongnu.org; Wed, 21 Aug 2019 07:20:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1i0OfO-0006c6-T3
 for qemu-trivial@nongnu.org; Wed, 21 Aug 2019 07:20:44 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:56447)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1i0Oex-0006Ib-Eu; Wed, 21 Aug 2019 07:20:11 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1N1xZX-1iOU3W0Wgz-012Fkp; Wed, 21 Aug 2019 13:19:55 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Michael Tokarev <mjt@tls.msk.ru>,
 "Michael S. Tsirkin" <mst@redhat.com>, Corey Minyard <minyard@acm.org>,
 Juan Quintela <quintela@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <rth@twiddle.net>, Jason Wang <jasowang@redhat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-trivial@nongnu.org
Date: Wed, 21 Aug 2019 13:19:33 +0200
Message-Id: <20190821111947.26580-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:CwXLgJTeGqkHU4donMSo/o4WF+pmod01SbtIm67Fh6aEFuqYFK9
 sh3byMLoslHL9Jg742dcaGLAr9ueO71pP6cLEIhTN87ztx4EktsJrP+IQDeVK9arek9uRtV
 vyy1GaLtEqQDWznXol1dKMcC9ThtpwscF1RDsZ0/N4dwzUBXcynxY9LAxgrCAwuWn4Lwn7z
 o5h+2wAdrYEgENBiw3KQQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:GU2dcO62q0Q=:p0YWQtu9RaMtDVEyWv9daD
 ZbK20Iiurvn3jibUVPiERStMBGTuw0ruNuGBKJaP3YmAf/se+UyU9T31wIldFWqEZnk7pF0L2
 l5ncc8HLRglxQKMhVfsmialtKsP0NCl/2Z97YGJsjyDHLivGLHHTrNlrW2UvrTrQs1FnyUjEk
 F018Ju1E5eV4gWH68YWBxHCdTJmOQF+ynylf842vuBKSmiGBzZr5SfUi8NSb0bm8WPTOPt4yq
 oCta0e05MU8Zkqq74cldSpeljvLc7eHNDzZKm5QBtThm3CSlb3aUfdlzauTjzNcpiLmmaV5wQ
 j1HUXPlDCSSDvYVeTQw6FXPGXsaxDhwF91zqJ8Qtd02CId38uP1FXsYo+gAZrxlGLss7ejqsM
 194+onIf4R3/f4uMQbiUd0CltqtKLTQ9QpbP3n/lpFL9HYyqsUVZNajqTh11y46aBi1HQmLsB
 dnVLdEmooHsFOAMjREBBeFSHmBkfI4YlldgEABWX9k86LV7WLMFMJ9ANui4AN0dftYUxwgUA8
 yUN6E4kUR6/gTQvQ4Rcyfd6lSOBYuIbU6Ir3lca5gQzqx6oD/YHTY9hvZLRiOxqI4obJg5s24
 uIphD7hySL/DsyBRuh6TozOhv4HY1g4h9K5yPPsKTBhhi5WM4PbTR84D/v0dl2elvfG+hKGp6
 T+K6lrstAaqIpsAGRLCov69VaLNhAhSTFOMFoLHr3cBSwSIed/60z5avQEFee8cuNarpm7NwH
 ll/M5YsEzyNlKLy0t57kB2+Rox0E4epIDXTca7iqKfrsqENEyZTrHSruCFw=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.13
Subject: [Qemu-trivial] [PULL 00/14] Trivial branch patches
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Aug 2019 11:20:48 -0000

The following changes since commit 17dc57990320edaad52ac9ea808be9719c91cea6:

  Merge remote-tracking branch 'remotes/huth-gitlab/tags/pull-request-2019-08-20' into staging (2019-08-20 14:14:20 +0100)

are available in the Git repository at:

  git://github.com/vivier/qemu.git tags/trivial-branch-pull-request

for you to fetch changes up to 8a9224a250094222e9ff302b95e379c3e71d3c8a:

  hw/display: Compile various display devices as common object (2019-08-21 13:17:22 +0200)

----------------------------------------------------------------
Various trivial fixes

----------------------------------------------------------------

Carlo Marcelo Arenas Belón (2):
  configure: remove obsoleted $sparc_cpu variable
  configure: fix sdl detection using sdl2-config

Marc-André Lureau (1):
  misc: fix naming scheme of compatiblity arrays

Michal Privoznik (1):
  .gitignore: ignore some vhost-user* related files

Philippe Mathieu-Daudé (9):
  hw/net/e1000: Fix erroneous comment
  json: Move switch 'fall through' comment to correct place
  hw/dma/omap_dma: Move switch 'fall through' comment to correct place
  hw/ipmi: Rewrite a fall through comment
  target/ppc: Rewrite a fall through comment
  vl: Rewrite a fall through comment
  spapr_events: Rewrite a fall through comment
  hw/display/sm501: Remove unused include
  hw/display: Compile various display devices as common object

tony.nguyen@bt.com (1):
  test: Use g_strndup instead of plain strndup

 .gitignore                |  3 +++
 configure                 | 12 ++++--------
 docs/devel/migration.rst  |  2 +-
 hw/display/Makefile.objs  | 18 +++++++++---------
 hw/display/sm501.c        |  1 -
 hw/dma/omap_dma.c         |  2 +-
 hw/i386/pc_piix.c         |  2 +-
 hw/ipmi/ipmi_bmc_extern.c |  3 +--
 hw/net/e1000.c            |  2 +-
 hw/ppc/spapr_events.c     |  2 +-
 qobject/json-parser.c     |  2 +-
 target/ppc/mmu_helper.c   |  6 +++---
 tests/check-qjson.c       |  2 +-
 tests/migration/stress.c  |  8 ++++----
 vl.c                      |  2 +-
 15 files changed, 32 insertions(+), 35 deletions(-)

-- 
2.21.0


