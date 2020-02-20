Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j4oat-0001C9-W8
	for mharc-qemu-trivial@gnu.org; Thu, 20 Feb 2020 11:22:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56539)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1j4oas-0001A7-2f
 for qemu-trivial@nongnu.org; Thu, 20 Feb 2020 11:22:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1j4oar-00013n-0y
 for qemu-trivial@nongnu.org; Thu, 20 Feb 2020 11:22:30 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:33330
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1j4oaq-000124-TK
 for qemu-trivial@nongnu.org; Thu, 20 Feb 2020 11:22:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582215746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=90XxUVJClHVX9ZIEzjbVDV0xE3nAzZrkmioDqBw5JMg=;
 b=GNp961L2s4a3/Z3UJ9N0Lavse1ysXMEdaOxAtd2/ui9N/74W6VM/vikJZvC1z7kLji5Qzk
 GBH+UJS7lMgdnB1ISul2sCcAWE9gjTwxy9dsoqZP39SUx4aZ7I8dTsdz17GBGPe4Cnmjia
 kqAF/g8qlsxtYTK1ukSHZ9A6IGWIBi0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-224--lql1mL2MGG7MLX7ZDDmeA-1; Thu, 20 Feb 2020 11:22:19 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F40A4800D5A;
 Thu, 20 Feb 2020 16:22:17 +0000 (UTC)
Received: from blue.redhat.com (ovpn-116-180.phx2.redhat.com [10.3.116.180])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9F0CD1001281;
 Thu, 20 Feb 2020 16:22:17 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH] maint: Include top-level *.rst files early in git diff
Date: Thu, 20 Feb 2020 10:22:13 -0600
Message-Id: <20200220162214.3474280-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: -lql1mL2MGG7MLX7ZDDmeA-1
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
X-List-Received-Date: Thu, 20 Feb 2020 16:22:31 -0000

We are converting more doc files to *.rst rather than *.texi.  Most
doc files are already listed early in diffs due to our catchall
docs/*, but a few top-level files get missed by that glob.

Signed-off-by: Eric Blake <eblake@redhat.com>
---

Both *.texi and *.rst entries make sense while we are still converting
things, but we'll need a followup to drop *.texi when the conversion
is complete...

 scripts/git.orderfile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/git.orderfile b/scripts/git.orderfile
index 1f747b583a9e..abd8a67a2b4e 100644
--- a/scripts/git.orderfile
+++ b/scripts/git.orderfile
@@ -11,6 +11,7 @@

 # Documentation
 docs/*
+*.rst
 *.texi

 # build system
--=20
2.24.1


