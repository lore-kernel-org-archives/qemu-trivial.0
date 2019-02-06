Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1grToa-00071w-0S
	for mharc-qemu-trivial@gnu.org; Wed, 06 Feb 2019 15:29:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46503)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1grToX-00070I-Fg
	for qemu-trivial@nongnu.org; Wed, 06 Feb 2019 15:28:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1grToW-0004CF-8o
	for qemu-trivial@nongnu.org; Wed, 06 Feb 2019 15:28:57 -0500
Received: from mx1.redhat.com ([209.132.183.28]:59100)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1grToT-00046L-BY; Wed, 06 Feb 2019 15:28:53 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 29EAB7E9CF;
	Wed,  6 Feb 2019 20:28:51 +0000 (UTC)
Received: from blue.redhat.com (ovpn-116-162.phx2.redhat.com [10.3.116.162])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A48E0104811A;
	Wed,  6 Feb 2019 20:28:50 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, berrange@redhat.com, armbru@redhat.com,
	mreitz@redhat.com
Date: Wed,  6 Feb 2019 14:28:48 -0600
Message-Id: <20190206202848.16999-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Wed, 06 Feb 2019 20:28:51 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] qapi: Fix qcow2 encryption doc typo
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Feb 2019 20:28:58 -0000

Present since commit b25b387f (2.10).

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 qapi/block-core.json | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 0f349d46033..ee1ab7a8a25 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -2998,7 +2998,7 @@

 ##
 # @BlockdevQcow2EncryptionFormat:
-# @aes: AES-CBC with plain64 initialization venctors
+# @aes: AES-CBC with plain64 initialization vectors
 #
 # Since: 2.10
 ##
--=20
2.20.1


