Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XHv34-00029n-N4
	for mharc-qemu-trivial@gnu.org; Thu, 14 Aug 2014 09:26:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45250)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XHpeO-0007S2-57
	for qemu-trivial@nongnu.org; Thu, 14 Aug 2014 03:40:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XHpeI-000313-0W
	for qemu-trivial@nongnu.org; Thu, 14 Aug 2014 03:40:44 -0400
Received: from szxga01-in.huawei.com ([119.145.14.64]:11355)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1XHpe4-0002xz-Ea; Thu, 14 Aug 2014 03:40:25 -0400
Received: from 172.24.2.119 (EHLO szxeml410-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CAH33641; Thu, 14 Aug 2014 15:30:19 +0800 (CST)
Received: from localhost (10.177.22.69) by szxeml410-hub.china.huawei.com
	(10.82.67.137) with Microsoft SMTP Server id 14.3.158.1;
	Thu, 14 Aug 2014 15:29:50 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 14 Aug 2014 15:29:11 +0800
Message-ID: <1408001361-13580-1-git-send-email-zhang.zhanghailiang@huawei.com>
X-Mailer: git-send-email 1.9.2.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.177.22.69]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.64
X-Mailman-Approved-At: Thu, 14 Aug 2014 09:26:29 -0400
Cc: kwolf@redhat.com, lkurusa@redhat.com,
	zhanghailiang <zhang.zhanghailiang@huawei.com>, mst@redhat.com,
	qemu-trivial@nongnu.org, jan.kiszka@siemens.com,
	riku.voipio@iki.fi, mjt@tls.msk.ru, peter.huangpeng@huawei.com,
	lcapitulino@redhat.com, stefanha@redhat.com,
	luonengjun@huawei.com, pbonzini@redhat.com,
	alex.bennee@linaro.org, rth@twiddle.net
Subject: [Qemu-trivial] [PATCH v6 00/10] fix three bugs about use-after-free
	and several api abuse
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
X-List-Received-Date: Thu, 14 Aug 2014 07:40:50 -0000

Hi,

Ping...

Nine patches of this patch series has been reviewd, and the last patch is not reviewed.

Are these patches accepted? 

Though this series contains ten patches, but most of them only touch a few lines of code,
and it involves several modules. 

So, should these patched be applied to qemu trivial branch?

Any help will be greatly appreciated.

Thanks,
zhanghailiang

This patch set fix three bugs about accessing freed memory and several api abuse.

In qemu, there are serveral places that do not check 
the return value of fstat()/fopen()/malloc(),etc.

Though it is a small probability for the these functions to fail,
but it is better to fix them, Or there may be a serious segmentfault. 

v5 -> v6:
 * Add reviewd-by info

v4 -> v5:
util/path:
 * Use the GLib memory APIs g_malloc/g_strdup/g_realloc 
which would abort on failure (Thanks for the suggestion of Alex Bennée)

slirp:
 * Again use of g_malloc to replace malloc(based on the review of Alex Bennée)

bios-tables-test:
 * Correct the wrong use of g_assert

v3 -> v4:
slirp: 
 * Check return value of '*ex_ptr', not 'ex_ptr',also add error message
(basedon the review of GongLei)

linux-user:
 * It should call unlock_user_struct() before return
(based on the review of Richard Henderson)
  
tests/bios-tables-test: 
 * Remove unnecessary check then return value of fopen() in qtest_init()

v2 -> v3:
ivshmem: 
 * Change the error message which advised by Levente Kurusa 

others: 
 * Add six new patches which check the return value of malloc() and fopen(),
  which may be failed.

v1 -> v2:
ivshmem: 
 * Modified the log message according to reviewing suggestion of Michael

Li Liu (3):
  tcg: check return value of fopen()
  block/vvfat: fix setbuf stream parameter may be NULL
  qtest: check the value returned by fopen()

zhanghailiang (7):
  l2cap: fix access freed memory
  monitor: fix access freed memory
  virtio-blk: fix reference a pointer which might be freed
  ivshmem: check the value returned by fstat()
  util/path: check return value of malloc()
  slirp: check return value of malloc()
  linux-user: check return value of malloc()

 block/vvfat.c            | 5 ++++-
 hw/block/virtio-blk.c    | 5 +++--
 hw/bt/l2cap.c            | 2 +-
 hw/misc/ivshmem.c        | 6 +++++-
 linux-user/syscall.c     | 4 ++++
 monitor.c                | 4 +++-
 slirp/misc.c             | 4 ++--
 tcg/tcg.c                | 4 ++++
 tests/bios-tables-test.c | 5 +++++
 util/path.c              | 6 +++---
 10 files changed, 34 insertions(+), 11 deletions(-)

-- 
1.7.12.4



