Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lE9Ny-00020z-OF
	for mharc-qemu-trivial@gnu.org; Mon, 22 Feb 2021 06:28:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lE9Nx-00020j-1I
 for qemu-trivial@nongnu.org; Mon, 22 Feb 2021 06:28:17 -0500
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:21692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lE9Nv-0004jd-GH
 for qemu-trivial@nongnu.org; Mon, 22 Feb 2021 06:28:16 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-BF-qc03rOPKkeDRutEOL5A-1; Mon, 22 Feb 2021 06:28:11 -0500
X-MC-Unique: BF-qc03rOPKkeDRutEOL5A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 30420107ACE6;
 Mon, 22 Feb 2021 11:28:10 +0000 (UTC)
Received: from bahia.lan (ovpn-112-183.ams2.redhat.com [10.36.112.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 429A85B6AA;
 Mon, 22 Feb 2021 11:28:09 +0000 (UTC)
Subject: [PATCH] docs/system: Document the removal of "compat" property for
 POWER CPUs
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, groug@kaod.org
Date: Mon, 22 Feb 2021 12:28:08 +0100
Message-ID: <161399328834.51902.14269239378658110394.stgit@bahia.lan>
User-Agent: StGit/0.21
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
X-List-Received-Date: Mon, 22 Feb 2021 11:28:17 -0000

This is just an oversight.

Fixes: f518be3aa35b ("target/ppc: Remove "compat" property of server class =
POWER CPUs")
Cc: groug@kaod.org
Signed-off-by: Greg Kurz <groug@kaod.org>
---
 docs/system/removed-features.rst |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/docs/system/removed-features.rst b/docs/system/removed-feature=
s.rst
index c8481cafbd5c..04ffa90d48ca 100644
--- a/docs/system/removed-features.rst
+++ b/docs/system/removed-features.rst
@@ -115,6 +115,12 @@ The RISC-V no MMU cpus have been removed. The two CPUs=
: ``rv32imacu-nommu`` and
 ``rv64imacu-nommu`` can no longer be used. Instead the MMU status can be s=
pecified
 via the CPU ``mmu`` option when using the ``rv32`` or ``rv64`` CPUs.
=20
+``compat`` property of server class POWER CPUs (removed in 6.0)
+'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+The ``max-cpu-compat`` property of the ``pseries`` machine type should be =
used
+instead.
+
 System emulator machines
 ------------------------
=20



