Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j00uF-0007XE-AI
	for mharc-qemu-trivial@gnu.org; Fri, 07 Feb 2020 05:30:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49806)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j00uC-0007RT-D6
 for qemu-trivial@nongnu.org; Fri, 07 Feb 2020 05:30:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j00uB-0002yE-BN
 for qemu-trivial@nongnu.org; Fri, 07 Feb 2020 05:30:36 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:57940
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j00uB-0002xp-7N
 for qemu-trivial@nongnu.org; Fri, 07 Feb 2020 05:30:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581071434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WITZDPOt21NoNvUdNHIIJ8+C1ZVJatfTEUDXGx7GYm0=;
 b=iu2u1xwjZeTknINXAsOKddENUww2Mw8FKF5AhDwCY2EfBWeCQTuyAZ2EbAwF3T+KWFxEyI
 ozdRlrKW3Ld26GPjjDdRZVE5pYNYz7ICzg8HJ353McUGs+u6Vz3G53o9i/K/fiYBU9DytD
 7kM5f9rzpfUAH2KPHZkSonN8YIF3ZOI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-294-AeyzALweMue3S7iJjG9fNw-1; Fri, 07 Feb 2020 05:30:30 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 88579800D5C;
 Fri,  7 Feb 2020 10:30:29 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-120.brq.redhat.com [10.40.204.120])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2AF2387B1C;
 Fri,  7 Feb 2020 10:30:20 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 qemu-block@nongnu.org
Subject: [PATCH 2/3] MAINTAINERS: Cover qapi/block{-core}.json in 'Block layer
 core' section
Date: Fri,  7 Feb 2020 11:30:11 +0100
Message-Id: <20200207103012.27049-3-philmd@redhat.com>
In-Reply-To: <20200207103012.27049-1-philmd@redhat.com>
References: <20200207103012.27049-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: AeyzALweMue3S7iJjG9fNw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
X-List-Received-Date: Fri, 07 Feb 2020 10:30:37 -0000

List this file in the proper section, so maintainers get
notified when it is modified.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
Cc: Kevin Wolf <kwolf@redhat.com>
Cc: Max Reitz <mreitz@redhat.com>
Cc: qemu-block@nongnu.org
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 903831e0a4..e269e9092c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1842,6 +1842,8 @@ S: Supported
 F: block*
 F: block/
 F: hw/block/
+F: qapi/block.json
+F: qapi/block-core.json
 F: include/block/
 F: qemu-img*
 F: docs/interop/qemu-img.rst
--=20
2.21.1


