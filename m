Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j8kny-0006dW-0W
	for mharc-qemu-trivial@gnu.org; Mon, 02 Mar 2020 08:08:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48736)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kuhn.chenqun@huawei.com>) id 1j8knk-0006GN-KQ
 for qemu-trivial@nongnu.org; Mon, 02 Mar 2020 08:08:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kuhn.chenqun@huawei.com>) id 1j8knj-0003O0-Hi
 for qemu-trivial@nongnu.org; Mon, 02 Mar 2020 08:08:04 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:51534 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1j8kng-0003Is-Vi; Mon, 02 Mar 2020 08:08:01 -0500
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 1DED558FCFC53BDD039D;
 Mon,  2 Mar 2020 21:07:53 +0800 (CST)
Received: from huawei.com (10.133.205.93) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.439.0; Mon, 2 Mar 2020
 21:07:44 +0800
From: Chen Qun <kuhn.chenqun@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <peter.maydell@linaro.org>, <zhang.zhanghailiang@huawei.com>, Chen Qun
 <kuhn.chenqun@huawei.com>
Subject: [PATCH v3 00/12] redundant code: Fix warnings reported by Clang
 static code analyzer
Date: Mon, 2 Mar 2020 21:07:02 +0800
Message-ID: <20200302130715.29440-1-kuhn.chenqun@huawei.com>
X-Mailer: git-send-email 2.21.0.windows.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [10.133.205.93]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.32
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
X-List-Received-Date: Mon, 02 Mar 2020 13:08:06 -0000

v1->v2:
- Patch1: Add John Snow review comment.
- Patch9: Move the 'dst_type' declaration to while() statement.
- Patch12: Add Philippe Mathieu-Daud=C3=A9 review comment.
- Patch13: Move the 'set' declaration to the for() statement.

v2->v3:
- Patch1: Add Kevin Wolf review comment.
- Patch2: Keep the 'flags' then use it(Base on Kevin's comments).
- Patch3: Add Kevin Wolf review comment.
- Patch9: Add Francisco Iglesias and Alistair Francis review comment.
- Patch12: Juan Quintela has added it to the queue and delete it.
- Patch12->Patch11: Add Philippe Mathieu-Daud=C3=A9 review comment.
- Patch13->Patch12: Add Philippe Mathieu-Daud=C3=A9 review comment.

Chen Qun (12):
  block/stream: Remove redundant statement in stream_run()
  block/iscsi:Remove redundant statement in iscsi_open()
  block/file-posix: Remove redundant statement in raw_handle_perm_lock()
  scsi/esp-pci: Remove redundant statement in esp_pci_io_write()
  scsi/scsi-disk: Remove redundant statement in
    scsi_disk_emulate_command()
  display/pxa2xx_lcd: Remove redundant statement in
    pxa2xx_palette_parse()
  display/exynos4210_fimd: Remove redundant statement in
    exynos4210_fimd_update()
  display/blizzard: Remove redundant statement in
    blizzard_draw_line16_32()
  dma/xlnx-zdma: Remove redundant statement in zdma_write_dst()
  timer/exynos4210_mct: Remove redundant statement in
    exynos4210_mct_write()
  usb/hcd-ehci: Remove redundant statements
  monitor/hmp-cmds: Remove redundant statement in
    hmp_rocker_of_dpa_groups()

 block/file-posix.c           |  1 -
 block/iscsi.c                |  2 +-
 block/stream.c               |  3 +--
 hw/display/blizzard.c        |  1 -
 hw/display/exynos4210_fimd.c |  1 -
 hw/display/pxa2xx_lcd.c      |  1 -
 hw/dma/xlnx-zdma.c           | 10 +++++-----
 hw/scsi/esp-pci.c            |  1 -
 hw/scsi/scsi-disk.c          |  1 -
 hw/timer/exynos4210_mct.c    |  4 ----
 hw/usb/hcd-ehci.c            |  3 ---
 monitor/hmp-cmds.c           |  5 +----
 12 files changed, 8 insertions(+), 25 deletions(-)

--=20
2.23.0



