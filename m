Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h3QL2-0005Ku-Vh
	for mharc-qemu-trivial@gnu.org; Mon, 11 Mar 2019 15:11:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60001)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1h3QL0-0005Hs-Bv
	for qemu-trivial@nongnu.org; Mon, 11 Mar 2019 15:11:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1h3QKz-0003Qx-PG
	for qemu-trivial@nongnu.org; Mon, 11 Mar 2019 15:11:50 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:45687)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1h3QKz-0003PF-EW; Mon, 11 Mar 2019 15:11:49 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA
	(Nemesis)
	id 1McpW8-1gTXHg42J0-00ZxL0; Mon, 11 Mar 2019 20:11:35 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Laszlo Ersek <lersek@redhat.com>,
	Riku Voipio <riku.voipio@iki.fi>, Paolo Bonzini <pbonzini@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>, Peter Maydell <peter.maydell@linaro.org>,
	Gerd Hoffmann <kraxel@redhat.com>
Date: Mon, 11 Mar 2019 20:11:23 +0100
Message-Id: <20190311191128.30562-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:uiggGIFE87+5Ro86d2bMo0VnUBp95H9mK+y59bi/ruNY/bG2eWF
	smvx/WpiH3TKo7c2eC+LCkIhKP45PQKHZtziai0Wa1eKnY0Ahb0BG7lGEbOOF6B9nDROjU/
	Y/yRObodqZyCHw+CAm98a2qgmGTVgEYvwnuoM4v1Vmdtu6/iBYMbWWpavchK2xvRXUuqRxw
	4iIgIHV1rEse2lhSn1qlA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:jXYyqVadXbE=:3W5fVw1FVWyKosngBRcka8
	yLveP20m8YprKPH6slqrsXbFW/9Gs8xUGJzfCXesmAmuxhi2UZHJfBCJh8Mh6laNxd0TYdgZY
	7GTcVnsV7+iof0XGC76maq70KslVm3iXqxAYNFRUDuPJEqxLrc2D6p+LjuHlC+V/AxeZgmO17
	7x1Nj0LWKn8cfYUaDQtzfeFDE5ySgENc0qxKr5JJFLCMMZogFg92SbObdkSyMqgtLahjFvZ4P
	bQVSYJ5sIE5RkbsyAc2pBucFuxGUmbQwQpGiGkV+DBOzbMFYB6oZmLo4VWMnjU+k3JWb9liay
	DdfZ2uMFy2MGDv54k9WgkNfggBN737yuc0yQTjbYmh82BLpvc0/mzNiEd8bys5+kfK/OZUm9R
	NyplwUXyhBi97g7m9joiSwKN55Gi1vjAMHzmkD1JXEw0wG5baS8iTDfF93FPzkbg4PA3B6sh0
	Q2Vh3S+UzN1VjvtEa5JiO5J3lnp3HBjjmm5JaQLunCnr4tcokfAs82+OfqT7VSN/O41FL+Pad
	JyOP58/FzoIdfrB5T1eJpy1IEpLyJho6OeSXruxrlOqUQUkKYvz0UAJf0SXndJJxt4p3Mlf1N
	1h2Lwi87eeo69xxnwtkgBb3rfyTCWCLeTD6NIlKnqF/wPZPiA+XLW4OBgF25PrtvSFSUBJn5Z
	AiYe0B6Ghimq7YX9dOYUlcSB7gSTaC6niWu3Sf/QfDk6d+SyIyU8nU3h62gaCO3DVcLnOVy29
	gA1mOFziZCXSa1EaX4XUIXd0zzCLjwp8e7ROjbXYcleq2OG0FFh1Dm3kePk=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.13
Subject: [Qemu-trivial] [PULL 0/5] Trivial branch patches
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
X-List-Received-Date: Mon, 11 Mar 2019 19:11:51 -0000

The following changes since commit 208d92df447bde0f1f810fae8a2c523cdeb7a28f:

  Merge remote-tracking branch 'remotes/cohuck/tags/s390x-20190311' into staging (2019-03-11 16:27:14 +0000)

are available in the Git repository at:

  git://github.com/vivier/qemu.git tags/trivial-branch-pull-request

for you to fetch changes up to 3b777a79c1cfa40f39f96220bc733eccd7392c9c:

  hw/nvram/fw_cfg: Use the ldst API (2019-03-11 18:48:20 +0100)

----------------------------------------------------------------
fw_cfg and thunk code clean up

----------------------------------------------------------------

Aarushi Mehta (1):
  thunk: improve readability of allocation loop

Philippe Mathieu-Daudé (4):
  hw/nvram/fw_cfg: Remove the unnecessary boot_splash_filedata_size
  hw/i386: Remove unused include
  hw/arm/virt: Remove null-check in virt_build_smbios()
  hw/nvram/fw_cfg: Use the ldst API

 hw/acpi/piix4.c         | 1 -
 hw/arm/virt.c           | 4 ----
 hw/nvram/fw_cfg.c       | 9 ++++-----
 include/sysemu/sysemu.h | 1 -
 thunk.c                 | 2 +-
 vl.c                    | 1 -
 6 files changed, 5 insertions(+), 13 deletions(-)

-- 
2.20.1


