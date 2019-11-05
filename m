Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iS03K-0008OF-JW
	for mharc-qemu-trivial@gnu.org; Tue, 05 Nov 2019 09:43:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54683)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1iS03I-0008KD-4z
 for qemu-trivial@nongnu.org; Tue, 05 Nov 2019 09:43:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1iS03H-0002hR-3y
 for qemu-trivial@nongnu.org; Tue, 05 Nov 2019 09:43:24 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:34973)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1iS03E-0002fS-LH; Tue, 05 Nov 2019 09:43:20 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1M7v18-1iWxrR1i5q-0053TC; Tue, 05 Nov 2019 15:42:55 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Fabien Chouteau <chouteau@adacore.com>, qemu-ppc@nongnu.org,
 Paul Durrant <paul@xen.org>, Michael Tokarev <mjt@tls.msk.ru>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Cleber Rosa <crosa@redhat.com>,
 Claudio Fontana <claudio.fontana@huawei.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 0/4] Trivial branch patches
Date: Tue,  5 Nov 2019 15:42:43 +0100
Message-Id: <20191105144247.10301-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ts98NfmfLnlsGeB7aeJ8lq36UwPs48GJqE0eLgOW0C9sAWmiD0o
 A+bEsOAg3Py4/VEjzLFyHEeW7gV4jDIo9Qxq+PKmuFAtCyaNV0Xu+iyYd2cmQRurTGwwZyD
 eAbdmiUQv/wMO1FDdYmuB7ZWXrh6SeWel3GrRu37pSYrriexBpdho5bC3O5k0ZEUpqCwCuM
 PHbrzpTPBN7148ETqrsPg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:HiWFcm3zl4c=:9Havqf+6M3eDHoN+3p5uq/
 S/DOD4piNU4EaSkrAYOo2HCCpmKaEdPxO69KJV9sSJvIl0qTxqse6tdHd2A/v9Egq2LDYzKZ+
 CMado3YPPoSGwAibKayV2kfqUbfwcCZW71G2M4cp2UNB2BbBdv6hDARJmUUJObXLQw6xb948J
 ifhlkmHnw70f+Yne2CuyoZjyotn60Jb1sttZiM24BtRiuR+HzRO4d+PqsR576oix8q/QxH5TB
 /2O1s/M1M5aCyhYgl+jYx/wW63Qgs6oXsA95KY+np4rAgIXDmB/FwTtUFvdGu3/qDm0n4Zms5
 L4WCcocizQ+Gbw/Xt4/xhjL/v0iJ1TUSe/DVGpOopUMKCH+BqCIPH70FGx01DB7R1ziDZCQxG
 MQqJBwWhUujr0d+jLvGSGOvQffG9uLdTzAIpknwYGjiB3HHBtRwCwGxJlkFeo5vXgsLvVoJYE
 BA7TIU8QDXaockqseH2kdE9h3zVOi02jjzadX1NbrJEOyfzdermQnt9jykdDbGWAMOCsXTg9N
 lLBPTpFAUDf9XYuKr7RtkVgvAwzQBPUt/86dWR/TKE5J0AtmK5YS9DQmxzq3ySO7pPdDIjNeJ
 SyTHkq4JPv157lZdN2+Z/7PiaHBmWdMs+MR2X0D5RkLPZDUX69xJTMoyvwHz2nbt8del5xw0x
 9O/U5EgBA5Jptz+hxkU8T2y+jWwdAiDk58VKgjA8kRQbXkI/wNhMs2r8jl0+1yUC1CtfG3XGk
 3C0oa/3Fi5zUUKHkOedbJMPy01xbbo0Mj2QB+0QO8ZB5G4puCEOdsmUtZbh/O4E/eE5OtZ4M3
 CJ4NNEtgjAoOREhJWhx8QClAVZnUgbzsQFEOykmIANRJKdEsTZYk4l9xJgT7P1uDEwOdGbuzk
 SssoIYkyNKfVWjPRnpUkIa7kSycgYAeae6eer+wk8=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 212.227.126.130
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
X-List-Received-Date: Tue, 05 Nov 2019 14:43:25 -0000

The following changes since commit 36609b4fa36f0ac934874371874416f7533a5408:

  Merge remote-tracking branch 'remotes/palmer/tags/palmer-for-master-4.2-sf1' into staging (2019-11-02 17:59:03 +0000)

are available in the Git repository at:

  git://github.com/vivier/qemu.git tags/trivial-branch-pull-request

for you to fetch changes up to a37a36a11b584e083b1c578f1d60e6e0f7878d5f:

  global: Squash 'the the' (2019-11-05 15:06:09 +0100)

----------------------------------------------------------------
Trivial fixes (20191105)

----------------------------------------------------------------

Dr. David Alan Gilbert (1):
  global: Squash 'the the'

Greg Kurz (1):
  qom: Fix error message in object_class_property_add()

Philippe Mathieu-Daudé (2):
  hw/misc/grlib_ahb_apb_pnp: Avoid crash when writing to PnP registers
  hw/misc/grlib_ahb_apb_pnp: Fix 8-bit accesses

 disas/libvixl/vixl/invalset.h       |  2 +-
 docs/interop/pr-helper.rst          |  2 +-
 docs/specs/ppc-spapr-hotplug.txt    |  2 +-
 docs/specs/ppc-xive.rst             |  2 +-
 docs/specs/tpm.txt                  |  2 +-
 hw/misc/grlib_ahb_apb_pnp.c         | 12 ++++++++++++
 include/hw/xen/interface/io/blkif.h |  2 +-
 qom/object.c                        | 10 ++++------
 scripts/dump-guest-memory.py        |  2 +-
 9 files changed, 23 insertions(+), 13 deletions(-)

-- 
2.21.0


