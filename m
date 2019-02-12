Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gtYQ7-00021g-NJ
	for mharc-qemu-trivial@gnu.org; Tue, 12 Feb 2019 08:48:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45118)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1gtYQ6-00020f-0B
	for qemu-trivial@nongnu.org; Tue, 12 Feb 2019 08:48:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1gtYQ5-000698-3t
	for qemu-trivial@nongnu.org; Tue, 12 Feb 2019 08:48:17 -0500
Received: from mx1.redhat.com ([209.132.183.28]:46622)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgilbert@redhat.com>)
	id 1gtYQ3-00063z-2L; Tue, 12 Feb 2019 08:48:15 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E3544C0578F8;
	Tue, 12 Feb 2019 13:48:12 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-116-178.ams2.redhat.com
	[10.36.116.178])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6B22F6019F;
	Tue, 12 Feb 2019 13:48:00 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, pbonzini@redhat.com, kraxel@redhat.com,
	mst@redhat.com
Cc: qemu-trivial@nongnu.org
Date: Tue, 12 Feb 2019 13:47:54 +0000
Message-Id: <20190212134758.10514-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Tue, 12 Feb 2019 13:48:12 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 0/4] a few trivials
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
X-List-Received-Date: Tue, 12 Feb 2019 13:48:18 -0000

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Just cleaning out my trivial pile; a few more traces and
a couple of error reporting tweaks.

Dave


Dr. David Alan Gilbert (4):
  pckbd: Convert DPRINTF->trace
  HMP: Prepend errors with 'Error:'
  kvm: Add kvm_set_ioeventfd* traces
  wavcapture: Convert to error_report

 accel/kvm/kvm-all.c    |  3 +++
 accel/kvm/trace-events |  2 ++
 audio/wavcapture.c     | 39 +++++++++++++++++----------------------
 hmp.c                  |  2 +-
 hw/input/pckbd.c       | 19 ++++++-------------
 hw/input/trace-events  |  7 +++++++
 6 files changed, 36 insertions(+), 36 deletions(-)

--=20
2.20.1


