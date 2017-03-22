Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cqep6-0006pb-BO
	for mharc-qemu-trivial@gnu.org; Wed, 22 Mar 2017 07:53:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41107)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1cqep3-0006oC-TO
	for qemu-trivial@nongnu.org; Wed, 22 Mar 2017 07:53:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1cqep3-00016y-9C
	for qemu-trivial@nongnu.org; Wed, 22 Mar 2017 07:53:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55662)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
	id 1cqeoy-000125-2b; Wed, 22 Mar 2017 07:52:56 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4CDA8437F72;
	Wed, 22 Mar 2017 11:52:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 4CDA8437F72
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=marcandre.lureau@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 4CDA8437F72
Received: from localhost (ovpn-116-31.phx2.redhat.com [10.3.116.31])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8E43C7C8A0;
	Wed, 22 Mar 2017 11:52:52 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Cc: berrange@redhat.com, qemu-trivial@nongnu.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Date: Wed, 22 Mar 2017 15:52:41 +0400
Message-Id: <20170322115241.2810-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Wed, 22 Mar 2017 11:52:55 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] doc: fix function spelling
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
X-List-Received-Date: Wed, 22 Mar 2017 11:53:03 -0000

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 include/io/channel.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/io/channel.h b/include/io/channel.h
index 5d48906998..db9bb022a1 100644
--- a/include/io/channel.h
+++ b/include/io/channel.h
@@ -315,7 +315,7 @@ ssize_t qio_channel_read(QIOChannel *ioc,
                          Error **errp);
=20
 /**
- * qio_channel_writev:
+ * qio_channel_write:
  * @ioc: the channel object
  * @buf: the memory regions to send data from
  * @buflen: the length of @buf
--=20
2.12.0.191.gc5d8de91d


