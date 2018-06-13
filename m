Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fSxyS-0005K0-5A
	for mharc-qemu-trivial@gnu.org; Wed, 13 Jun 2018 01:05:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49277)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fSxyP-0005He-Ho
	for qemu-trivial@nongnu.org; Wed, 13 Jun 2018 01:05:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fSxyO-0002Cy-8Q
	for qemu-trivial@nongnu.org; Wed, 13 Jun 2018 01:05:33 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:60802 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1fSxyI-00025u-1Z; Wed, 13 Jun 2018 01:05:26 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DD5334022414;
	Wed, 13 Jun 2018 05:05:24 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-24.ams2.redhat.com [10.36.116.24])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 12BF12166BD6;
	Wed, 13 Jun 2018 05:05:22 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, Ben Warren <ben@skyportsystems.com>,
	zhang.zhanghailiang@huawei.com, Markus Armbruster <armbru@redhat.com>,
	qemu-trivial@nongnu.org
Date: Wed, 13 Jun 2018 07:05:17 +0200
Message-Id: <1528866321-23886-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Wed, 13 Jun 2018 05:05:24 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Wed, 13 Jun 2018 05:05:24 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-trivial] [PATCH 0/4] Clean up accelerator options
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
X-List-Received-Date: Wed, 13 Jun 2018 05:05:34 -0000

The current state of the accelerator options is quite messy: There are
three ways of enabling an accelerator (-machine accel=xyz, -accel xyz
and -enable-xyz) and this can be very confusing for the users. This
patch series now tries to standardize our documentation and examples
on the preferred -accel option.

Thomas Huth (4):
  Replace '-machine accel=xyz' with '-accel xyz'
  Replace '-enable-kvm' with '-accel kvm' in docs and help texts
  qemu-options: Improve the documentation of '-accel' and '-machine
    accel=...'
  qemu-options: Do not show -enable-kvm and -enable-hax in the docs
    anymore

 docs/COLO-FT.txt                    |  8 +++----
 docs/can.txt                        |  4 ++--
 docs/multi-thread-compression.txt   |  2 +-
 docs/multiseat.txt                  |  2 +-
 docs/specs/tpm.txt                  |  8 +++----
 hw/block/dataplane/virtio-blk.c     |  4 ++--
 hw/scsi/virtio-scsi-dataplane.c     |  4 ++--
 qemu-doc.texi                       |  3 +--
 qemu-options.hx                     | 44 ++++++++++++-------------------------
 scripts/qtest.py                    |  2 +-
 tests/bios-tables-test.c            |  2 +-
 tests/boot-serial-test.c            |  2 +-
 tests/libqtest.c                    |  2 +-
 tests/migration-test.c              |  8 +++----
 tests/migration/guestperf/engine.py |  2 +-
 tests/pnv-xscom-test.c              |  2 +-
 tests/prom-env-test.c               |  2 +-
 tests/pxe-test.c                    |  2 +-
 tests/qemu-iotests/172              |  2 +-
 tests/qemu-iotests/check            |  2 +-
 tests/vmgenid-test.c                |  2 +-
 21 files changed, 46 insertions(+), 63 deletions(-)

-- 
1.8.3.1


