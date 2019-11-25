Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iZEa0-0000hK-9g
	for mharc-qemu-trivial@gnu.org; Mon, 25 Nov 2019 08:39:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43991)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1iZEZt-0000ar-IJ
 for qemu-trivial@nongnu.org; Mon, 25 Nov 2019 08:38:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1iZEZr-0007lx-IA
 for qemu-trivial@nongnu.org; Mon, 25 Nov 2019 08:38:57 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:50476
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1iZEZp-0007hp-Ik
 for qemu-trivial@nongnu.org; Mon, 25 Nov 2019 08:38:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574689132;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wo8nMmg5eLNgbhvYGkzsTMpiAjxrROXdulWsJagBLNU=;
 b=ANFtlJBwk4CpyXY52JYK0TkXNusbR9+GQQA1g22lgewCP/7iPtH8QuWZ3KVLQo3isNeZmv
 80N/L9HU/szrIj06g3oAs8H3Q/D4Bc4GoFVvdbPXf7avOWg+j9hpb/nV84ClQ2LuC20vVA
 B9tQOCx/oQa427ZEscSce6/J9LOCN3Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-208-dxS8kqqFNAau4tSY7DjKEQ-1; Mon, 25 Nov 2019 08:38:49 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CCB2DDB61;
 Mon, 25 Nov 2019 13:38:48 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-134.ams2.redhat.com
 [10.36.116.134])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 83BBF19C6A;
 Mon, 25 Nov 2019 13:38:48 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 056A011385C7; Mon, 25 Nov 2019 14:38:47 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	tao3.xu@intel.com
Subject: [PATCH 1/2] util/cutils: Turn FIXME comment into QEMU_BUILD_BUG_ON()
Date: Mon, 25 Nov 2019 14:38:45 +0100
Message-Id: <20191125133846.27790-2-armbru@redhat.com>
In-Reply-To: <20191125133846.27790-1-armbru@redhat.com>
References: <20191125133846.27790-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: dxS8kqqFNAau4tSY7DjKEQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
X-List-Received-Date: Mon, 25 Nov 2019 13:38:59 -0000

qemu_strtoi64() assumes int64_t is long long.  This is marked FIXME.
Replace by a QEMU_BUILD_BUG_ON() to avoid surprises.

Same for qemu_strtou64().

Fix a typo in qemu_strtoul()'s contract while there.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 util/cutils.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/util/cutils.c b/util/cutils.c
index fd591cadf0..b372dd3e68 100644
--- a/util/cutils.c
+++ b/util/cutils.c
@@ -502,7 +502,7 @@ int qemu_strtoul(const char *nptr, const char **endptr,=
 int base,
  * Convert string @nptr to an int64_t.
  *
  * Works like qemu_strtol(), except it stores INT64_MAX on overflow,
- * and INT_MIN on underflow.
+ * and INT64_MIN on underflow.
  */
 int qemu_strtoi64(const char *nptr, const char **endptr, int base,
                  int64_t *result)
@@ -517,8 +517,9 @@ int qemu_strtoi64(const char *nptr, const char **endptr=
, int base,
         return -EINVAL;
     }
=20
+    /* This assumes int64_t is long long TODO relax */
+    QEMU_BUILD_BUG_ON(sizeof(int64_t) !=3D sizeof(long long));=20
     errno =3D 0;
-    /* FIXME This assumes int64_t is long long */
     *result =3D strtoll(nptr, &ep, base);
     return check_strtox_error(nptr, ep, endptr, errno);
 }
@@ -541,8 +542,9 @@ int qemu_strtou64(const char *nptr, const char **endptr=
, int base,
         return -EINVAL;
     }
=20
+    /* This assumes uint64_t is unsigned long long TODO relax */
+    QEMU_BUILD_BUG_ON(sizeof(uint64_t) !=3D sizeof(unsigned long long));
     errno =3D 0;
-    /* FIXME This assumes uint64_t is unsigned long long */
     *result =3D strtoull(nptr, &ep, base);
     /* Windows returns 1 for negative out-of-range values.  */
     if (errno =3D=3D ERANGE) {
--=20
2.21.0


