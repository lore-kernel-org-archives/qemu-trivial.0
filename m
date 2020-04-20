Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jQabo-0007XO-7J
	for mharc-qemu-trivial@gnu.org; Mon, 20 Apr 2020 13:53:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36688 helo=eggs1p.gnu.org)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1jQabk-0007Um-Tf
 for qemu-trivial@nongnu.org; Mon, 20 Apr 2020 13:53:25 -0400
Received: from Debian-exim by eggs1p.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1jQabe-0004ui-Nm
 for qemu-trivial@nongnu.org; Mon, 20 Apr 2020 13:53:24 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:56325
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jQabe-0004qH-8I
 for qemu-trivial@nongnu.org; Mon, 20 Apr 2020 13:53:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587405197;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K4ofxEhdp2LKF3VnjVWmK4rtE3cwGs/aI9dibt/RcMI=;
 b=DnaBdy/QHB8mjSxPgnHYDPx2z11hEFC7iVvaBm8IMYAx8uQyxV/JTfzRbZzqebve4GHJtG
 71CziGPdzhq0yUEKefX6POr97DVKZsnOLW1dqZGiNaFNKAY2C0YdkUpsvQJf3uE6ADBFDc
 J6H3OB2AEurI4MCCLaptxKlr6rfBGu4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-84-wtAowj7mOXO-BHX1fCvbtw-1; Mon, 20 Apr 2020 13:53:15 -0400
X-MC-Unique: wtAowj7mOXO-BHX1fCvbtw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6F67F8017F6;
 Mon, 20 Apr 2020 17:53:14 +0000 (UTC)
Received: from blue.redhat.com (ovpn-116-80.rdu2.redhat.com [10.10.116.80])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C9187A103F;
 Mon, 20 Apr 2020 17:53:13 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH 2/2] tools: Fix use of fcntl(F_SETFD) during socket activation
Date: Mon, 20 Apr 2020 12:53:08 -0500
Message-Id: <20200420175309.75894-3-eblake@redhat.com>
In-Reply-To: <20200420175309.75894-1-eblake@redhat.com>
References: <20200420175309.75894-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.61; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs1p.gnu.org: First seen = 2020/04/20
 09:01:45
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
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
X-List-Received-Date: Mon, 20 Apr 2020 17:53:25 -0000

Blindly setting FD_CLOEXEC without a read-modify-write will
inadvertently clear any other intentionally-set bits, such as a
proposed new bit for designating a fd that must behave in 32-bit mode.
However, we cannot use our wrapper qemu_set_cloexec(), because that
wrapper intentionally abort()s on failure, whereas the probe here
intentionally tolerates failure to deal with incorrect socket
activation gracefully.  Instead, fix the code to do the proper
read-modify-write.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 util/systemd.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/util/systemd.c b/util/systemd.c
index 1dd0367d9a84..5bcac9b40169 100644
--- a/util/systemd.c
+++ b/util/systemd.c
@@ -23,6 +23,7 @@ unsigned int check_socket_activation(void)
     unsigned long nr_fds;
     unsigned int i;
     int fd;
+    int f;
     int err;

     s =3D getenv("LISTEN_PID");
@@ -54,7 +55,8 @@ unsigned int check_socket_activation(void)
     /* So the file descriptors don't leak into child processes. */
     for (i =3D 0; i < nr_fds; ++i) {
         fd =3D FIRST_SOCKET_ACTIVATION_FD + i;
-        if (fcntl(fd, F_SETFD, FD_CLOEXEC) =3D=3D -1) {
+        f =3D fcntl(fd, F_GETFD);
+        if (f =3D=3D -1 || fcntl(fd, F_SETFD, f | FD_CLOEXEC) =3D=3D -1) {
             /* If we cannot set FD_CLOEXEC then it probably means the file
              * descriptor is invalid, so socket activation has gone wrong
              * and we should exit.
--=20
2.26.1


