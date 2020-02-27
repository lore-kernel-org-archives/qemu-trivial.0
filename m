Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j7G0a-0001iL-Mu
	for mharc-qemu-trivial@gnu.org; Thu, 27 Feb 2020 05:03:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35337)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j7G0X-0001dW-RW
 for qemu-trivial@nongnu.org; Thu, 27 Feb 2020 05:03:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j7G0W-0002aQ-Rd
 for qemu-trivial@nongnu.org; Thu, 27 Feb 2020 05:03:05 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:26531
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j7G0W-0002ZK-NP
 for qemu-trivial@nongnu.org; Thu, 27 Feb 2020 05:03:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582797783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7uPfE4iEFnYWU7lgYjg6n8W9+J+9kIh7GVAn+snpbUk=;
 b=e3LVizOKOIaAhnQ0HYS6eZOkXpfosJxYWSGW7huJe/qaXiyptb/B/Zji158Jj/VHTSoFgV
 1GCoaGQUCThnTKh3lHc/Y+EaB6ITX97kHcz83BYUygaIFtSE/Bpf6UnWLfyVexfIjO8JcZ
 URLd7kZiEd9z9pAhJcorRTChrWCc+a8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-435-DwZLYB3XOpy2NU3Ttzz2RQ-1; Thu, 27 Feb 2020 05:02:59 -0500
X-MC-Unique: DwZLYB3XOpy2NU3Ttzz2RQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D042213FC;
 Thu, 27 Feb 2020 10:02:57 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-195.brq.redhat.com [10.40.205.195])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E098B8C091;
 Thu, 27 Feb 2020 10:02:52 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH 0/2] misc: Improve error reporting on Windows
Date: Thu, 27 Feb 2020 11:02:48 +0100
Message-Id: <20200227100250.20514-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
X-List-Received-Date: Thu, 27 Feb 2020 10:03:08 -0000

Two patches to improve bug reports on Windows.
(i.e. https://bugs.launchpad.net/qemu/+bug/1657841)

Philippe Mathieu-Daud=C3=A9 (2):
  chardev: Improve error report by calling error_setg_win32()
  util/oslib-win32: Improve error report by calling error_setg_win32()

 chardev/char-pipe.c | 2 +-
 chardev/char-win.c  | 2 +-
 util/oslib-win32.c  | 3 ++-
 3 files changed, 4 insertions(+), 3 deletions(-)

--=20
2.21.1


