Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1grP81-00008z-Kq
	for mharc-qemu-trivial@gnu.org; Wed, 06 Feb 2019 10:28:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55816)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1grP80-00007B-4U
	for qemu-trivial@nongnu.org; Wed, 06 Feb 2019 10:28:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1grP7x-0004OM-K2
	for qemu-trivial@nongnu.org; Wed, 06 Feb 2019 10:28:43 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:46841)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1grP7i-0004KE-TE; Wed, 06 Feb 2019 10:28:27 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MLi4W-1gZjkF0OWW-00HdzY; Wed, 06 Feb 2019 16:28:15 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Eduardo Habkost <ehabkost@redhat.com>,
	qemu-trivial@nongnu.org, Anthony Green <green@moxielogic.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-arm@nongnu.org,
	Andrzej Zaborowski <balrogg@gmail.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
	Michael Tokarev <mjt@tls.msk.ru>, Peter Maydell <peter.maydell@linaro.org>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Date: Wed,  6 Feb 2019 16:28:00 +0100
Message-Id: <20190206152807.31896-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:1WV4LHov9H9VzI4geQyG7/VDJuvJVIT/0FzqbTmcyY13bJiZHhz
	FZhMyT1Ljm8EZC+9WvHBArpxWSJ3TpLr0WFLCpoDiVt6wvf7Uu6cf3KW3KUV9Ak5yjPjPiD
	JXZmGyJI1zhvYcKF8/4ftClR7TAi1pqnkcxShBirgoksjzWJQt/2K7utqC6GzjEZuyceqFG
	YzJfzR2gBbQ0mf/dy3Zgg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:gls5uUnZpsc=:KWtERISnbZ4ih/3Cex+Vlz
	e88sTUcug9qjF9LLvTi8ZjRPkqRobfDmUr8ol0GiuX82XujUckv8pI7g4aFAcIOR3EQ8xAcnZ
	v5lF6OA7tATQQfV/Ls31NxoE41oI0Cn0Xb9x0fdA7Mym5kk4RdxLOBfsfk+xWk3wWMU13AadV
	lGm1b1r/XSzGgIcI+X6WnJfAeeLet4WsThobg8fR1s9TLy5gSMxyxtgbLgAOWzfRUGZAqSBA9
	WDgt6GqH8zkXvzbTeZ89fszq4oLbs18b4+Y0/VSKZVC56JDYoPNwovZAGRNiKzi8ywR6oddf1
	znLPTjlkEXwaj2RZlIgXWIFh4yWQRCypEz3ENJSyFnV3TN/uk1k3BQQgDmvkJO7YRouBLrxSO
	XA84nhHp6zVU2R+VHHU3ERlf/exouljAYR3VKwQAX4VSF8XNSNsl7G8rHC2gCtpbpIm/BJDu3
	VN1gCKEFE+XynYkLZqJ+5QPPEqTZCmZvJyu1Br1ce5owBJ8y+lKl6aLJl4CENmFSo4QJzlr5/
	pYWQhOmChKg2z/qEGodHT+iXWX74dYbrbCGPBXs/Pqkg2XosmzH9AckGye5eFJH+XIgmz/KVk
	nhDF3anEEH2/jzSWRIHLWn8OsiEzZl2NpVfNiFM4dZOnS9E0ekgrbJYEU42srWSo8+w9CeWbb
	HDCiSEWewyg38qxHXhi9sesMrk3tJ7Pc2QFIiTDuhvrjZJCqKJNtADai+PJ4XFqJVqAJNIb55
	uIgFkRNqCv23sLeDy52GXBxhaDB7ta8RevVemw+IKpfCq+rQ9SHsxZJuOWg=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.130
Subject: [Qemu-trivial] [PULL 0/7] Trivial patches patches
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
X-List-Received-Date: Wed, 06 Feb 2019 15:28:45 -0000

The following changes since commit 47994e16b1d66411953623e7c0bf0cdcd50bd507:

  Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20190205' into staging (2019-02-05 18:25:07 +0000)

are available in the Git repository at:

  git://github.com/vivier/qemu.git tags/trivial-patches-pull-request

for you to fetch changes up to e67e91b4b55331973f783ca89790ee9f7861ced1:

  hw/input/tsc210x: Fix building with no verbosity (2019-02-06 15:57:06 +0100)

----------------------------------------------------------------
Trivial patches:
* Update copyright
* Fix LGPL in target/moxie
* configure portability fix
* Drop useless inclusion of "hw/i386/pc.h"
* Mark the cpu-cluster device with user_creatable = false
* tsc210x: Fix building with no verbosity

----------------------------------------------------------------

Eric Blake (1):
  configure: Avoid non-portable 'test -o/-a'

Peter Maydell (1):
  qemu-common.h: Update copyright string for 2019

Philippe Mathieu-Daudé (3):
  hw/sparc64/sun4u: Drop useless inclusion of "hw/i386/pc.h"
  hw/unicore32/puv3: Drop useless inclusion of "hw/i386/pc.h"
  hw/input/tsc210x: Fix building with no verbosity

Thomas Huth (2):
  target/moxie: Fix LGPL information in the file headers
  hw/cpu/cluster: Mark the cpu-cluster device with user_creatable =
    false

 configure                | 63 +++++++++++++++++++++-------------------
 hw/cpu/cluster.c         |  3 ++
 hw/input/tsc210x.c       | 18 ++++--------
 hw/sparc64/sun4u.c       |  1 -
 hw/unicore32/puv3.c      |  1 -
 include/qemu-common.h    |  2 +-
 target/moxie/cpu.c       |  2 +-
 target/moxie/cpu.h       |  4 +--
 target/moxie/helper.c    |  4 +--
 target/moxie/mmu.c       |  4 +--
 target/moxie/translate.c |  4 +--
 11 files changed, 52 insertions(+), 54 deletions(-)

-- 
2.20.1


