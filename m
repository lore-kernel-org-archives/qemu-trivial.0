Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iT5Dw-0007Dg-5D
	for mharc-qemu-trivial@gnu.org; Fri, 08 Nov 2019 09:26:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38138)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iT5Dt-0007A0-3A
 for qemu-trivial@nongnu.org; Fri, 08 Nov 2019 09:26:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iT5Dr-0007I4-RC
 for qemu-trivial@nongnu.org; Fri, 08 Nov 2019 09:26:49 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:28793
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iT5Dr-0007Hu-NG
 for qemu-trivial@nongnu.org; Fri, 08 Nov 2019 09:26:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573223207;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=8W3VjnwZihgA8y5clORFGnv7BxO2RxkGBcMPeB2hj7w=;
 b=T6WijnFeov5XAtMGTRDQloWV2kXOJcNU8a6jNG1aB45jvgOzMrUq6cY+h90Nvxqkn/F7kZ
 54j5etof7hh3LEdt/s61UrnsEst0TLbTSMVi0kOgNpn26XCE3bATI1TlPoIzGU7YxYjh6g
 reCIpM7p8isjDO0ZLqFPpMM6y8akYAs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-175-J-7Go_AUMnOQBseuoZ3l1Q-1; Fri, 08 Nov 2019 09:26:43 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA0C4800C72;
 Fri,  8 Nov 2019 14:26:42 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.206.29])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 51ED9101E58D;
 Fri,  8 Nov 2019 14:26:16 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	Eric Blake <eblake@redhat.com>
Cc: qemu-trivial@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>
Subject: [PATCH 0/3] hw: Remove dynamic field width from trace event
Date: Fri,  8 Nov 2019 15:26:10 +0100
Message-Id: <20191108142613.26649-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: J-7Go_AUMnOQBseuoZ3l1Q-1
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
X-List-Received-Date: Fri, 08 Nov 2019 14:26:50 -0000

Eric noted in [1] the dtrace via stap backend can not support
the dynamic '*' width format.
I'd really like to use dynamic width in trace event because the
read/write accesses are easier to read but it is not a priority.
Since next release is close, time to fix LP#1844817 [2].

[1] https://lists.gnu.org/archive/html/qemu-devel/2019-09/msg04720.html
[2] https://bugs.launchpad.net/qemu/+bug/1844817

Philippe Mathieu-Daud=C3=A9 (3):
  hw/block/pflash: Remove dynamic field width from trace event
  hw/mips/gt64xxx: Remove dynamic field width from trace event
  trace: Forbid dynamic field width in event format

 hw/block/pflash_cfi01.c       |  8 ++++----
 hw/block/pflash_cfi02.c       |  8 ++++----
 hw/mips/gt64xxx_pci.c         | 34 +++++++++++++++++-----------------
 hw/block/trace-events         |  8 ++++----
 hw/mips/trace-events          |  4 ++--
 scripts/tracetool/__init__.py |  3 +++
 6 files changed, 34 insertions(+), 31 deletions(-)

--=20
2.21.0


