Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iw4yi-00058m-Mh
	for mharc-qemu-trivial@gnu.org; Mon, 27 Jan 2020 09:03:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57324)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1iw4yg-00057s-08
 for qemu-trivial@nongnu.org; Mon, 27 Jan 2020 09:02:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1iw4yd-0001Ea-GW
 for qemu-trivial@nongnu.org; Mon, 27 Jan 2020 09:02:57 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:48695
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1iw4yd-0001BA-2M
 for qemu-trivial@nongnu.org; Mon, 27 Jan 2020 09:02:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580133774;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=5LIVx1f+8fMGBTfLAnXnB1uwqs+4uNhf7K1YgWiRV2s=;
 b=MLUJ2bmLO1YpJRY6KvAiEisi+4GcwU16fec+k+ybPQ51euskJExBklnEXAJW+sxoLYLQDS
 6MqfGLo257ET8hhw1oNqv10UBG1R8QPWDnbNQzGtWHmymcl7cAcdC8O8Uo5HgoKgXVGOdn
 NWJ2AhoqyrKxOf52bk6jax9SQXCh1EQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-295-hhQV-4QGM2WUdlfDj0Ydag-1; Mon, 27 Jan 2020 09:02:52 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D223A1005510;
 Mon, 27 Jan 2020 14:02:50 +0000 (UTC)
Received: from thuth.com (ovpn-117-94.ams2.redhat.com [10.36.117.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 43F6A86441;
 Mon, 27 Jan 2020 14:02:48 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH] tests/Makefile: Fix inclusion of the qos dependency files
Date: Mon, 27 Jan 2020 15:02:45 +0100
Message-Id: <20200127140245.20065-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: hhQV-4QGM2WUdlfDj0Ydag-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
X-List-Received-Date: Mon, 27 Jan 2020 14:02:59 -0000

The qos dependency files can be found under tests/qtest/libqos and
not under tests/qtest/qos.

Fixes: 1cf4323ecd0 ("Move the libqos files under tests/qtest/")
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/Makefile.include | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index c6827ce8c2..4ee68ca7dd 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -917,6 +917,6 @@ all: $(QEMU_IOTESTS_HELPERS-y)
=20
 -include $(wildcard tests/*.d)
 -include $(wildcard tests/qtest/*.d)
--include $(wildcard tests/qtest/qos/*.d)
+-include $(wildcard tests/qtest/libqos/*.d)
=20
 endif
--=20
2.18.1


