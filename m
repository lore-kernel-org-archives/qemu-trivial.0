Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hpGMk-00035V-Uu
	for mharc-qemu-trivial@gnu.org; Sun, 21 Jul 2019 14:15:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34697)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mlevitsk@redhat.com>) id 1hpGMh-0002vB-C5
 for qemu-trivial@nongnu.org; Sun, 21 Jul 2019 14:15:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlevitsk@redhat.com>) id 1hpGMg-0001Sw-EG
 for qemu-trivial@nongnu.org; Sun, 21 Jul 2019 14:15:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52188)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlevitsk@redhat.com>)
 id 1hpGMd-0001QL-05; Sun, 21 Jul 2019 14:15:15 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2638CC057F2E;
 Sun, 21 Jul 2019 18:15:13 +0000 (UTC)
Received: from maximlenovopc.usersys.redhat.com (unknown [10.35.206.70])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C52071001DE1;
 Sun, 21 Jul 2019 18:15:10 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Cc: Max Reitz <mreitz@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, Kevin Wolf <kwolf@redhat.com>,
 qemu-trivial@nongnu.org, qemu-block@nongnu.org,
 Maxim Levitsky <mlevitsk@redhat.com>
Date: Sun, 21 Jul 2019 21:15:06 +0300
Message-Id: <20190721181508.28608-1-mlevitsk@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Sun, 21 Jul 2019 18:15:14 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 0/2] RFC: Trivial error message fixes for
 luks format
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
X-List-Received-Date: Sun, 21 Jul 2019 18:15:21 -0000

These are attempts to improve a bit error message
based on bunch of luks related bugzillas assigned to me.
Feel free to reject these if you think that it doesn't
make the messages better.

Best regards,
	Maxim Levitsky

Maxim Levitsky (2):
  LUKS: better error message when creating too large files
  qemu-img: better error message when opening a backing file fails

 block.c        |  1 +
 block/crypto.c | 25 +++++++++++++++++++++----
 qemu-img.c     |  2 +-
 3 files changed, 23 insertions(+), 5 deletions(-)

-- 
2.17.2


