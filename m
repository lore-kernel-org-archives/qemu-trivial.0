Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m6wRY-0002iE-4Y
	for mharc-qemu-trivial@gnu.org; Fri, 23 Jul 2021 10:46:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1m6wRS-0002co-3N
 for qemu-trivial@nongnu.org; Fri, 23 Jul 2021 10:46:23 -0400
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:40528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1m6wRO-0007O5-4V
 for qemu-trivial@nongnu.org; Fri, 23 Jul 2021 10:46:20 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-451-XN45O_3LN4usXJ3ZhdIOmQ-1; Fri, 23 Jul 2021 10:46:05 -0400
X-MC-Unique: XN45O_3LN4usXJ3ZhdIOmQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E986802E3D;
 Fri, 23 Jul 2021 14:46:03 +0000 (UTC)
Received: from bahia.lan (unknown [10.39.192.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1DFF35D6AD;
 Fri, 23 Jul 2021 14:46:01 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, Greg Kurz <groug@kaod.org>
Subject: [PATCH 0/2] configure: Fixes for --cross-cc-FOO
Date: Fri, 23 Jul 2021 16:45:59 +0200
Message-Id: <20210723144601.1038381-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Fri, 23 Jul 2021 14:46:23 -0000

This series fixes some issues I've hit while trying to compile=0D
TCG checks with a cross-compiler, as an alternative to using=0D
docker.=0D
=0D
This isn't a regression in QEMU 6.1: the issues have been around=0D
since they got merged in QEMU 3.0. Hence clearly QEMU 6.2 material.=0D
=0D
Greg Kurz (2):=0D
  configure: Fix trivial typo in --cross-cc-cflags-FOO=0D
  configure: Fix excessive error detection when handling --cross-cc-FOO=0D
=0D
 configure              | 29 ++++++++++++++++++-----------=0D
 docs/devel/testing.rst |  2 +-=0D
 2 files changed, 19 insertions(+), 12 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


