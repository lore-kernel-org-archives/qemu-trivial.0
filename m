Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ihGiu-00009x-Gg
	for mharc-qemu-trivial@gnu.org; Tue, 17 Dec 2019 12:33:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45019)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1ihGir-000083-4F
 for qemu-trivial@nongnu.org; Tue, 17 Dec 2019 12:33:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1ihGio-0005bm-II
 for qemu-trivial@nongnu.org; Tue, 17 Dec 2019 12:33:23 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:56911
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ihGio-0005Zw-Ez
 for qemu-trivial@nongnu.org; Tue, 17 Dec 2019 12:33:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576604001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=nO8L9Ff0gTs0Ghul9qOGY/vgywrMy48c7WRyGNxm0bk=;
 b=hILAafoJCE8SllL86u9H9CT0hSHE8hortfnFc4H98w3KwitSNwp8y/oLPy3kX6V/hmQswl
 CqRYJBk1VTZ4cZCkwQFzaSFeQRf6xgLvn9cf8kMpN7UosocePK9aH7eyxr7/J4wSqwQAsX
 kFpUmNn38Wgeh2+sTdN+mvbyrE6jzzc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-UBfwbRvfMCW-lwDPShNRGA-1; Tue, 17 Dec 2019 12:33:18 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 38484189CD14;
 Tue, 17 Dec 2019 17:33:16 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-147.brq.redhat.com [10.40.205.147])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 90A977C82C;
 Tue, 17 Dec 2019 17:33:02 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Max Reitz <mreitz@redhat.com>, Fam Zheng <fam@euphon.net>,
 Peter Chubb <peter.chubb@nicta.com.au>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Jason Wang <jasowang@redhat.com>, qemu-block@nongnu.org,
 Andrew Jeffery <andrew@aj.id.au>, Gerd Hoffmann <kraxel@redhat.com>,
 Hannes Reinecke <hare@suse.com>
Subject: [PATCH 0/6] Fix more GCC9 -O3 warnings
Date: Tue, 17 Dec 2019 18:32:46 +0100
Message-Id: <20191217173252.4672-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: UBfwbRvfMCW-lwDPShNRGA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
X-List-Received-Date: Tue, 17 Dec 2019 17:33:26 -0000

Fix some trivial warnings when building with -O3.

Philippe Mathieu-Daud=C3=A9 (6):
  audio/audio: Add missing fall through comment
  hw/display/tcx: Add missing fall through comments
  hw/net/imx_fec: Rewrite fall through comments
  hw/timer/aspeed_timer: Add a fall through comment
  hw/scsi/megasas: Silent GCC9 duplicated-cond warning
  qemu-io-cmds: Silent GCC9 format-overflow warning

 audio/audio.c           | 1 +
 hw/display/tcx.c        | 2 ++
 hw/net/imx_fec.c        | 8 +++++---
 hw/scsi/megasas.c       | 3 ++-
 hw/timer/aspeed_timer.c | 2 +-
 qemu-io-cmds.c          | 1 +
 6 files changed, 12 insertions(+), 5 deletions(-)

--=20
2.21.0


