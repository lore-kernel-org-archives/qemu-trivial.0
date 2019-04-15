Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hFwXr-0000bL-Rl
	for mharc-qemu-trivial@gnu.org; Mon, 15 Apr 2019 04:00:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34266)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <like.xu@linux.intel.com>) id 1hFwXp-0000aC-Ol
	for qemu-trivial@nongnu.org; Mon, 15 Apr 2019 04:00:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <like.xu@linux.intel.com>) id 1hFwXo-0001Pe-Om
	for qemu-trivial@nongnu.org; Mon, 15 Apr 2019 04:00:49 -0400
Received: from mga09.intel.com ([134.134.136.24]:40824)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <like.xu@linux.intel.com>)
	id 1hFwXo-0001NR-9F; Mon, 15 Apr 2019 04:00:48 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Apr 2019 01:00:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,352,1549958400"; d="scan'208";a="140739270"
Received: from xulike-server.sh.intel.com ([10.239.48.134])
	by fmsmga008.fm.intel.com with ESMTP; 15 Apr 2019 01:00:43 -0700
From: Like Xu <like.xu@linux.intel.com>
To: qemu-trivial@nongnu.org
Cc: Igor Mammedov <imammedo@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Markus Armbruster <armbru@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, Thomas Huth <thuth@redhat.com>,
	qemu-devel@nongnu.org, like.xu@intel.com
Date: Mon, 15 Apr 2019 15:59:43 +0800
Message-Id: <1555315185-16414-1-git-send-email-like.xu@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.24
Subject: [Qemu-trivial] [Qemu-devel] [PATCH v3 0/2] vl.c: make
 current_machine as non-global variable
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
X-List-Received-Date: Mon, 15 Apr 2019 08:00:50 -0000

This patch makes the remaining dozen or so uses of the global
current_machine outside vl.c use qdev_get_machine() instead,
and then make current_machine local to vl.c instead of global.

With type assertion in qdev_get_machine(), it will be hard to
misuse this function if machine hasn't been created yet.
For obj-common cases, qdev_get_machine_uncheck() is applied
without semantic change.

---
Changes in v3:
    - add TYPE_MACHINE assertion for qdev_get_machine() usage
    - apply qdev_get_machine_uncheck() for obj-common usage
Changes in v2:
    - make the variable current_machine "static" (Thomas Huth)

Like Xu (2):
  vl.c: refactor current_machine as non-global variable
  core/qdev: refactor qdev_get_machine() with type assertion

 accel/kvm/kvm-all.c    |  6 ++++--
 device-hotplug.c       |  3 ++-
 device_tree.c          |  3 ++-
 exec.c                 |  6 ++++--
 hw/core/qdev.c         | 16 +++++++++++++---
 hw/ppc/spapr_rtas.c    |  3 ++-
 include/hw/boards.h    |  1 -
 include/hw/qdev-core.h |  1 +
 migration/savevm.c     |  9 ++++++---
 qmp.c                  |  3 ++-
 qom/cpu.c              |  5 +++--
 target/i386/kvm.c      |  3 ++-
 target/ppc/kvm.c       |  3 ++-
 vl.c                   |  4 ++--
 14 files changed, 45 insertions(+), 21 deletions(-)

-- 
1.8.3.1


