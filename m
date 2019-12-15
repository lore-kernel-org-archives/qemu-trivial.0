Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1igOD9-0008J1-SO
	for mharc-qemu-trivial@gnu.org; Sun, 15 Dec 2019 02:21:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52082)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1igOD6-0008IZ-Tg
 for qemu-trivial@nongnu.org; Sun, 15 Dec 2019 02:21:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1igOD5-0006Xe-30
 for qemu-trivial@nongnu.org; Sun, 15 Dec 2019 02:20:59 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:30272
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1igOD4-0006XG-Vd
 for qemu-trivial@nongnu.org; Sun, 15 Dec 2019 02:20:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576394458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=WGmLDxaS1NmzoYdgqZpJheMtBdJ9K0TNan1OBA+rUb8=;
 b=ADUoZMoDoMX5pCxt16uav39oyh4GYN9gw7MwLomKgwJ8MbxkRmV1FwoWT3WD6AjAwbuzAv
 1EnDwgyhEKMSAoPU90dm9vfxZdeVN0RHnUsMl8X1SEgzDOtTKXQfgwKvCuWf1SELFTBZFN
 5l5YNFotOXwzAVl1F+NRxRg809bqo6E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-111-hJ8Ds1FZMEiVxP8jDHUHMQ-1; Sun, 15 Dec 2019 02:20:55 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8BDC7DBF6;
 Sun, 15 Dec 2019 07:20:53 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-147.brq.redhat.com [10.40.205.147])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B6B78384;
 Sun, 15 Dec 2019 07:20:48 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v2 0/2] hw/timer/m48t59: Convert to trace events
Date: Sun, 15 Dec 2019 08:20:43 +0100
Message-Id: <20191215072045.7198-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: hJ8Ds1FZMEiVxP8jDHUHMQ-1
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
X-List-Received-Date: Sun, 15 Dec 2019 07:21:02 -0000

Another trivial cleanup series.

v2: Rebased on 4.2

Philippe Mathieu-Daud=C3=A9 (2):
  MAINTAINERS: Add missing m48t59 files to the PReP section
  hw/timer/m48t59: Convert debug printf()s to trace events

 hw/rtc/m48t59-internal.h |  5 -----
 hw/rtc/m48t59.c          | 11 +++++------
 MAINTAINERS              |  2 ++
 hw/rtc/trace-events      |  6 ++++++
 4 files changed, 13 insertions(+), 11 deletions(-)

--=20
2.21.0


