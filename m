Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h1UPG-0004wt-R3
	for mharc-qemu-trivial@gnu.org; Wed, 06 Mar 2019 06:08:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35311)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1h1UPD-0004uE-D7
	for qemu-trivial@nongnu.org; Wed, 06 Mar 2019 06:08:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1h1UPA-000294-MC
	for qemu-trivial@nongnu.org; Wed, 06 Mar 2019 06:08:11 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:53903)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1h1UP1-00020G-4k; Wed, 06 Mar 2019 06:08:00 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA
	(Nemesis)
	id 1M42fG-1h1UOO1oTw-00047x; Wed, 06 Mar 2019 12:07:20 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
	Zhang Chen <zhangckid@gmail.com>,
	zhanghailiang <zhang.zhanghailiang@huawei.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Cornelia Huck <cohuck@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
	Richard Henderson <rth@twiddle.net>, Thomas Huth <thuth@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>, Li Zhijian <lizhijian@cn.fujitsu.com>,
	John Snow <jsnow@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Laurent Vivier <laurent@vivier.eu>, Eduardo Habkost <ehabkost@redhat.com>,
	qemu-block@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Tony Krowiak <akrowiak@linux.ibm.com>, Max Reitz <mreitz@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	Laurent Vivier <lvivier@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-s390x@nongnu.org, Corey Minyard <minyard@acm.org>,
	Pierre Morel <pmorel@linux.ibm.com>
Date: Wed,  6 Mar 2019 12:07:01 +0100
Message-Id: <20190306110711.309-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:huWJROD/LnAr4fe3Kn4dbUHLRTsf78ubzIb9JdRNkYjpgPTTX7h
	V8HutwgUVSyM9mk9OMi8yq/6c8bqZzJup/rW3W+Xv1O4bIy+aYFMQ9JBgYg2Rfd8vzyW69t
	mQRrjMbBIXAr/5SvJSbT7mYbOjHQthvNYw7vSzL7XeeaiktaiYtQglkr8t59gzHdKFOkFrp
	8xF/IeUpmzx5ZJ9ml0l+w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:iryj+e7+eHU=:Pm0r+XO+YdVc3+ydKRjSFg
	xjJ3E7kRbX5eRSDc4EKXwuVS0QW1Xr6d+LilAnfRZZA2zkXZnF80adM2tljys68KD04VLm2AQ
	k4iaqNTJoG2PONCvVuZJkmnV6XINnLRFFAIM7CohGRZVXVRQW1nhALQ4EkSBkJyVb9gI53aDN
	t4ftGpTS1DUOhpOauguTSrnNquyw0FNosNhoJvJYzxixWR53Pr4wjKMd7ufPtWy7g62KyYul4
	1Vrg7iCjoWcr5/H04e7cd/wslDcGKe2uNIKItB0ZtLlZKoBUFBQtt7ujCWiuUdHVaamexH1x8
	mI5kDXiVVeVoKPyUCu80VpEQ35azUpmtdqQtK/kHyBXjI2YLWej3J9iMCKQ3LwUGtUeaYQcNh
	62+NQQLp0Y8n8lOKhIofcEE6NYGznueyZgwZ1eIFPqxVzTol5dDCZw0b52dnxtG/8dqnTFZyE
	2EbEFyu3/iWM2BNseZjRyqVJGhngzfMLhZgMmTfx+HsS+Cb4jRURexjPUYs1utDHxAqW+EdnM
	7VmxBljZmYNVtZ3uK/6yNZqfqT3iVRdTu5NNq7cBkWpHRQfdJobExWdcRptB7k2lZ7QV9SrET
	RxLf6lcZwqK6KNEiQS0cUqYCV9qMn/mvddpxx9QsUl7jkpHi00elzbz6M4t8HvNjAD4sXs/da
	J3MbxzzWJZASkP0PKKIfORZQq6wFypZpW5hovcAjunQHETMx0/wlOHff6nBhNwJ+OBNpnSdF1
	SdxHrlGdTAs4fR/Ih8kt7N77C77UssKdp7/MjWhvvdjNk5kQHb+GQFVsmo4=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.10
Subject: [Qemu-trivial] [PULL 00/10] Trivial branch patches
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
X-List-Received-Date: Wed, 06 Mar 2019 11:08:13 -0000

The following changes since commit a3e3b0a7bd5de211a62cdf2d6c12b96d3c403560:

  Merge remote-tracking branch 'remotes/armbru/tags/pull-qapi-2019-03-05' into staging (2019-03-05 19:23:45 +0000)

are available in the Git repository at:

  git://github.com/vivier/qemu.git tags/trivial-branch-pull-request

for you to fetch changes up to 0e081fde8a3d80383adf2e802fc0c03af44c5436:

  thunk: fix of malloc to g_new (2019-03-06 11:27:32 +0100)

----------------------------------------------------------------
trivial patches pull request (20190206)

- acpi: remove unused functions/variables
- tests: remove useless architecture checks
- some typo fixes and documentation update
- flash_cfi02: fix memory leak

----------------------------------------------------------------

Aarushi Mehta (1):
  thunk: fix of malloc to g_new

Greg Kurz (1):
  bswap: Fix accessors syntax in comment

Igor Mammedov (1):
  hostmem-file: simplify ifdef-s in file_backend_memory_alloc()

Like Xu (1):
  doc: fix typos for documents in tree

Markus Armbruster (1):
  build: Correct explanation of unnest-vars example

Stephen Checkoway (1):
  block/pflash_cfi02: Fix memory leak and potential use-after-free

Thomas Huth (1):
  tests: Remove (mostly) useless architecture checks

Wei Yang (3):
  hw/i386/pc.c: remove unused function pc_acpi_init()
  hw/acpi: remove unused function acpi_table_add_builtin()
  hw/acpi: remove unnecessary variable acpi_table_builtin

 backends/hostmem-file.c        |  9 ++++-----
 docs/COLO-FT.txt               |  2 +-
 docs/amd-memory-encryption.txt |  2 +-
 docs/can.txt                   |  2 +-
 docs/colo-proxy.txt            |  6 +++---
 docs/cpu-hotplug.rst           |  2 +-
 docs/qcow2-cache.txt           |  2 +-
 docs/qemu-block-drivers.texi   |  2 +-
 docs/qemu-cpu-models.texi      |  8 ++++----
 docs/rdma.txt                  |  4 ++--
 docs/replay.txt                |  2 +-
 docs/vfio-ap.txt               |  2 +-
 hw/acpi/core.c                 | 10 +---------
 hw/block/pflash_cfi02.c        | 15 +++++++++++----
 hw/i386/pc.c                   | 27 ---------------------------
 include/hw/acpi/acpi.h         |  1 -
 include/hw/i386/pc.h           |  1 -
 include/qemu/bswap.h           |  8 ++++----
 rules.mak                      |  2 +-
 tests/fdc-test.c               |  7 -------
 tests/ide-test.c               |  7 -------
 tests/ipmi-bt-test.c           |  7 -------
 tests/ipmi-kcs-test.c          |  7 -------
 thunk.c                        |  2 +-
 24 files changed, 39 insertions(+), 98 deletions(-)

-- 
2.20.1


