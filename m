Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jPZEU-0004AJ-VF
	for mharc-qemu-trivial@gnu.org; Fri, 17 Apr 2020 18:13:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43218)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1jPZES-00042B-Dr
 for qemu-trivial@nongnu.org; Fri, 17 Apr 2020 18:13:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1jPZEQ-0004RR-UI
 for qemu-trivial@nongnu.org; Fri, 17 Apr 2020 18:13:07 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:32149
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1jPZEQ-0004OM-Lt
 for qemu-trivial@nongnu.org; Fri, 17 Apr 2020 18:13:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587161585;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rm4z9yZ5KT4UD5XNUPVEIR5dSciIm209TvrkYH8ktCg=;
 b=GmQqnaqJovf6le8oNIFoRBXN5ZtBe5fNj/Jobc91dZt/9Zv1fob4b9wyKWtIqRbELHWy4N
 dVvUkpMTKRrZJyMTYES84Nv02iuuemP0dpgZcMXqNkUh0gMYk6/mGaGP1JQhpMymr7Jlj5
 W5xuOyFp1MNMfERSRisO+aalWiDYgvU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-i8Nx50rhNxW4bCe1rvKB5Q-1; Fri, 17 Apr 2020 18:13:03 -0400
X-MC-Unique: i8Nx50rhNxW4bCe1rvKB5Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 933D118C35A1;
 Fri, 17 Apr 2020 22:13:02 +0000 (UTC)
Received: from blue.redhat.com (ovpn-115-59.phx2.redhat.com [10.3.115.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0992219C4F;
 Fri, 17 Apr 2020 22:13:01 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, qemu-trivial@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 qemu-block@nongnu.org (open list:Block layer core)
Subject: [PATCH] qemu-img: Fix stale doc comment
Date: Fri, 17 Apr 2020 17:12:58 -0500
Message-Id: <20200417221258.900117-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
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
X-List-Received-Date: Fri, 17 Apr 2020 22:13:10 -0000

Missed in commit e13c59fa.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 qemu-img-cmds.hx | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qemu-img-cmds.hx b/qemu-img-cmds.hx
index 37cb36335218..5a341d06bf4d 100644
--- a/qemu-img-cmds.hx
+++ b/qemu-img-cmds.hx
@@ -7,7 +7,7 @@ HXCOMM command structures and help message.
 HXCOMM HXCOMM can be used for comments, discarded from both rST and C

 HXCOMM When amending the rST sections, please remember to copy the usage
-HXCOMM over to the per-command sections in qemu-img.texi.
+HXCOMM over to the per-command sections in docs/tools/qemu-img.rst.

 DEF("amend", img_amend,
     "amend [--object objectdef] [--image-opts] [-p] [-q] [-f fmt] [-t cach=
e] -o options filename")
--=20
2.26.1


