Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i0wD9-0005Wo-Cm
	for mharc-qemu-trivial@gnu.org; Thu, 22 Aug 2019 19:09:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53154)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1i0wD0-0005ML-GH
 for qemu-trivial@nongnu.org; Thu, 22 Aug 2019 19:09:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1i0wCu-0004hD-5C
 for qemu-trivial@nongnu.org; Thu, 22 Aug 2019 19:09:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55162)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1i0wCs-0004ex-2x; Thu, 22 Aug 2019 19:09:26 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0B4E4308FC20;
 Thu, 22 Aug 2019 23:09:23 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 56DBE8D6B;
 Thu, 22 Aug 2019 23:09:19 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Date: Fri, 23 Aug 2019 01:09:13 +0200
Message-Id: <20190822230916.576-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Thu, 22 Aug 2019 23:09:23 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 0/3] mailmap: Clean up
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
X-List-Received-Date: Thu, 22 Aug 2019 23:09:38 -0000

Trivial cleanup of .mailmap to have a nice 'git shortlog' output.

Philippe Mathieu-Daud=C3=A9 (3):
  mailmap: Reorder by sections
  mailmap: Update philmd email address
  mailmap: Add many entries to improve 'git shortlog' statistics

 .mailmap | 123 +++++++++++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 115 insertions(+), 8 deletions(-)

--=20
2.20.1


