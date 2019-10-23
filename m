Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iNFjP-0002GV-Ja
	for mharc-qemu-trivial@gnu.org; Wed, 23 Oct 2019 08:27:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34619)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fziglio@redhat.com>) id 1iNFjN-0002Eh-I8
 for qemu-trivial@nongnu.org; Wed, 23 Oct 2019 08:27:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <fziglio@redhat.com>) id 1iNFjM-00007u-H6
 for qemu-trivial@nongnu.org; Wed, 23 Oct 2019 08:27:13 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:43910
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <fziglio@redhat.com>) id 1iNFjM-00007X-D4
 for qemu-trivial@nongnu.org; Wed, 23 Oct 2019 08:27:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571833630;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CGzk93WfUIysNZwO3uWZD42RzDLieVYJKoUgml5RCA8=;
 b=K7k/s3Ui+Cu+LeNUV7RBUAgWuFjkMwH5GY5w+EqtqaDcHIpanAXIzL0oKEfXTARwQmHEYk
 Us/7mokuAH01vF5EN7asu9sZ+MvJhYD8fqSh5j6X/ByazBmsYNHDUZhPw/qsw9eyHCqlWT
 GL3ZO2E2O6ulLIjktwF3EerAlAv2Jl0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-BKHL_aazPmaA7aF3o3yCHA-1; Wed, 23 Oct 2019 08:27:04 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 42999801E5C;
 Wed, 23 Oct 2019 12:27:03 +0000 (UTC)
Received: from fziglio.remote.csb (unknown [10.34.247.51])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 36285600CC;
 Wed, 23 Oct 2019 12:26:59 +0000 (UTC)
From: Frediano Ziglio <fziglio@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>,
	Laurent Vivier <laurent@vivier.eu>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
 Frediano Ziglio <fziglio@redhat.com>
Subject: [PATCH 3/3] qemu-timer: reuse MIN macro in qemu_timeout_ns_to_ms
Date: Wed, 23 Oct 2019 13:26:52 +0100
Message-Id: <20191023122652.2999-3-fziglio@redhat.com>
In-Reply-To: <20191023122652.2999-1-fziglio@redhat.com>
References: <20191023122652.2999-1-fziglio@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: BKHL_aazPmaA7aF3o3yCHA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
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
X-List-Received-Date: Wed, 23 Oct 2019 12:27:15 -0000

Signed-off-by: Frediano Ziglio <fziglio@redhat.com>
---
 util/qemu-timer.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/util/qemu-timer.c b/util/qemu-timer.c
index d428fec567..094a20a05a 100644
--- a/util/qemu-timer.c
+++ b/util/qemu-timer.c
@@ -322,11 +322,7 @@ int qemu_timeout_ns_to_ms(int64_t ns)
     ms =3D DIV_ROUND_UP(ns, SCALE_MS);
=20
     /* To avoid overflow problems, limit this to 2^31, i.e. approx 25 days=
 */
-    if (ms > (int64_t) INT32_MAX) {
-        ms =3D INT32_MAX;
-    }
-
-    return (int) ms;
+    return (int) MIN(ms, (int64_t) INT32_MAX);
 }
=20
=20
--=20
2.21.0


