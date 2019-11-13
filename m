Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iUzsx-0004TI-Dm
	for mharc-qemu-trivial@gnu.org; Wed, 13 Nov 2019 16:09:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46018)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <crobinso@redhat.com>) id 1iUzsh-0004Jj-3H
 for qemu-trivial@nongnu.org; Wed, 13 Nov 2019 16:08:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <crobinso@redhat.com>) id 1iUzse-0006FQ-R0
 for qemu-trivial@nongnu.org; Wed, 13 Nov 2019 16:08:49 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:30718
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <crobinso@redhat.com>) id 1iUzse-0006EF-HJ
 for qemu-trivial@nongnu.org; Wed, 13 Nov 2019 16:08:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573679327;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=eJCqJWR8acQwzfcefPriX5xuSEUaakfykNzq7QUKrVQ=;
 b=dgtzcaZ4QOwkDYIBlKTFOKzMk6hfPk9znQryRdb125pCySLnRSFmFzmmB9H84SsjLOuptq
 Gy4Z9yytneBfU6wI5DjFZ5v2k1htBhlbrcJ34i9q+CKLo6xB2sZP9lLV1UD9EwcvFdcDtN
 +JW0tLIvmDhsHLPYXDNOuPieeBPBf7w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-92-iOGmqgjHMYuNgDAp_dSHhw-1; Wed, 13 Nov 2019 16:08:46 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 71134835B63;
 Wed, 13 Nov 2019 21:08:45 +0000 (UTC)
Received: from worklaptop.redhat.com (ovpn-125-32.rdu2.redhat.com
 [10.10.125.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B73431084192;
 Wed, 13 Nov 2019 21:08:41 +0000 (UTC)
From: Cole Robinson <crobinso@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-trivial <qemu-trivial@nongnu.org>, Cole Robinson <crobinso@redhat.com>
Subject: [PATCH] tests: fix modules-test 'duplicate test case' error
Date: Wed, 13 Nov 2019 16:09:35 -0500
Message-Id: <d64c9aa098cc6e5c0b638438c4959eddfa7e24e2.1573679311.git.crobinso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: iOGmqgjHMYuNgDAp_dSHhw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
X-List-Received-Date: Wed, 13 Nov 2019 21:08:53 -0000

./configure --enable-sdl --audio-drv-list=3Dsdl --enable-modules

Will generate two identical test names: /$arch/module/load/sdl
Which generates an error like:

(tests/modules-test:23814): GLib-ERROR **: 18:23:06.359: duplicate test cas=
e path: /aarch64//module/load/sdl

Add the subsystem prefix in the name as well, so instead we get:

/$arch/module/load/audio-sdl
/$arch/module/load/ui-sdl

Signed-off-by: Cole Robinson <crobinso@redhat.com>
---
 tests/modules-test.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/modules-test.c b/tests/modules-test.c
index d1a6ace218..88217686e1 100644
--- a/tests/modules-test.c
+++ b/tests/modules-test.c
@@ -64,7 +64,8 @@ int main(int argc, char *argv[])
     g_test_init(&argc, &argv, NULL);
=20
     for (i =3D 0; i < G_N_ELEMENTS(modules); i +=3D 2) {
-        char *testname =3D g_strdup_printf("/module/load/%s", modules[i + =
1]);
+        char *testname =3D g_strdup_printf("/module/load/%s%s",
+                                         modules[i], modules[i + 1]);
         qtest_add_data_func(testname, modules + i, test_modules_load);
         g_free(testname);
     }
--=20
2.23.0


