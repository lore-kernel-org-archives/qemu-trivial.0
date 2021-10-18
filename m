Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcSxG-0006Yk-07
	for mharc-qemu-trivial@gnu.org; Mon, 18 Oct 2021 09:45:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mcSxB-0006VQ-Dm
 for qemu-trivial@nongnu.org; Mon, 18 Oct 2021 09:45:25 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:34466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mcSx9-0007jf-Ct
 for qemu-trivial@nongnu.org; Mon, 18 Oct 2021 09:45:24 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-220-CyGRPhX_PfuRsHwvtGOs8w-1; Mon, 18 Oct 2021 09:45:11 -0400
X-MC-Unique: CyGRPhX_PfuRsHwvtGOs8w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 780989F92A;
 Mon, 18 Oct 2021 13:45:10 +0000 (UTC)
Received: from bahia.huguette (unknown [10.39.192.124])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F1867908B;
 Mon, 18 Oct 2021 13:45:09 +0000 (UTC)
Subject: [PATCH] README: Fix some documentation URLs
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Date: Mon, 18 Oct 2021 15:45:08 +0200
Message-ID: <163456470882.196333.17366490695504718038.stgit@bahia.huguette>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
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
X-List-Received-Date: Mon, 18 Oct 2021 13:45:26 -0000

All of these pages live in the wiki, not in the main web site.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 README.rst |   14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/README.rst b/README.rst
index 79b19f1481e1..23795b837740 100644
--- a/README.rst
+++ b/README.rst
@@ -59,9 +59,9 @@ of other UNIX targets. The simple steps to build QEMU are=
:
=20
 Additional information can also be found online via the QEMU website:
=20
-* `<https://qemu.org/Hosts/Linux>`_
-* `<https://qemu.org/Hosts/Mac>`_
-* `<https://qemu.org/Hosts/W32>`_
+* `<https://wiki.qemu.org/Hosts/Linux>`_
+* `<https://wiki.qemu.org/Hosts/Mac>`_
+* `<https://wiki.qemu.org/Hosts/W32>`_
=20
=20
 Submitting patches
@@ -84,8 +84,8 @@ the Developers Guide.
 Additional information on submitting patches can be found online via
 the QEMU website
=20
-* `<https://qemu.org/Contribute/SubmitAPatch>`_
-* `<https://qemu.org/Contribute/TrivialPatches>`_
+* `<https://wiki.qemu.org/Contribute/SubmitAPatch>`_
+* `<https://wiki.qemu.org/Contribute/TrivialPatches>`_
=20
 The QEMU website is also maintained under source control.
=20
@@ -144,7 +144,7 @@ reported via GitLab.
=20
 For additional information on bug reporting consult:
=20
-* `<https://qemu.org/Contribute/ReportABug>`_
+* `<https://wiki.qemu.org/Contribute/ReportABug>`_
=20
=20
 ChangeLog
@@ -168,4 +168,4 @@ main methods being email and IRC
 Information on additional methods of contacting the community can be
 found online via the QEMU website:
=20
-* `<https://qemu.org/Contribute/StartHere>`_
+* `<https://wiki.qemu.org/Contribute/StartHere>`_



