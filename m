Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j9ptg-0008Np-AK
	for mharc-qemu-trivial@gnu.org; Thu, 05 Mar 2020 07:46:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41882)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j9ptN-0007kx-LQ
 for qemu-trivial@nongnu.org; Thu, 05 Mar 2020 07:46:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j9ptM-0001pa-J9
 for qemu-trivial@nongnu.org; Thu, 05 Mar 2020 07:46:21 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:57939
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j9ptM-0001pL-FM
 for qemu-trivial@nongnu.org; Thu, 05 Mar 2020 07:46:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583412380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PX36u3szPgZ2Q41knWXAoeXL+fhHmUrIIdFIn10MJtI=;
 b=Xk5phjzFY4/qeHNpugGsyn3awK2cUsg7BRv51zeAmrewZZbEXftUDw/MdC06f+yhlMAe+b
 baSEUUXlffXnL38uFSUNBmwnmnR6tRXq9RsOALHGaji1x1ELfgWuOnN8TW3VP+6hqSRKR1
 a7bWd3Gl/jKfv6QiGPa9O8i14+lXUDU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-2-dadow9FpPda26IACANhonQ-1; Thu, 05 Mar 2020 07:46:18 -0500
X-MC-Unique: dadow9FpPda26IACANhonQ-1
Received: by mail-ed1-f72.google.com with SMTP id p21so4234848edr.22
 for <qemu-trivial@nongnu.org>; Thu, 05 Mar 2020 04:46:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AaV1ZZro3f+XiD92hHRr5sJi0Jy1dhCplYtiC3TxZ9Q=;
 b=NvDAtRm5Yh9NGcyDB263EwXD83OOGl0myfmGRbfNSvjYj9HTL2hLWSa6fT0P2x3UFt
 pQvuAiv/XowaLIyQlay/NKSZjNCNBFVFabMvLNoR8d4bVfK2Nn+IcouRpXuNHnoU0/wp
 xT9lYp49siiufaKYV94pFJ8oURDew/s//E7QqLmF6xdFeMtFCkOxNFyd4FcVqyo4mO6h
 r7QBKbVH/1kE/RLK5PHMwVz7rc+RSEAYB2nuwou66dIUxEDBW5/bbZiem6g8CR3ELqrC
 bjM0C8DntFe9lF5wlp3pnsAwv+hMEIRk5QPn6suT7EZF99iJSP4L6T3VtpBUxRnOyQf7
 CzYw==
X-Gm-Message-State: ANhLgQ3up0E45X9gKAnTJqkpUMcK5KNQHlcQWpulZNtHojj1FVqKGHZv
 NGN8K61c7XUmGuv6szyoJwCJOfHPe8ufBtVALS4kbDLgB50DgHtBKOCqnrqyWybej1uXVMw9WNu
 ZO7Lj2r3iJ5ccumBXEw==
X-Received: by 2002:a17:907:20ae:: with SMTP id
 pw14mr5158865ejb.347.1583412376856; 
 Thu, 05 Mar 2020 04:46:16 -0800 (PST)
X-Google-Smtp-Source: ADFU+vsXzhx6R4H7sx/neIO4/kU2XBgcI7lnVex83myb4LLHWpAvKquZR8H+zNUYUqKhe7Q024X6Zw==
X-Received: by 2002:a17:907:20ae:: with SMTP id
 pw14mr5158849ejb.347.1583412376669; 
 Thu, 05 Mar 2020 04:46:16 -0800 (PST)
Received: from localhost.localdomain (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id q26sm1529544ejb.50.2020.03.05.04.46.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 04:46:16 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v2 9/9] virtfs-proxy-helper: Make the helper_opts[] array const
Date: Thu,  5 Mar 2020 13:45:25 +0100
Message-Id: <20200305124525.14555-10-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200305124525.14555-1-philmd@redhat.com>
References: <20200305124525.14555-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
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
X-List-Received-Date: Thu, 05 Mar 2020 12:46:23 -0000

Reduce a bit the memory footprint by making the helper_opts[]
array const.

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Acked-by: Greg Kurz <groug@kaod.org>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 fsdev/virtfs-proxy-helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fsdev/virtfs-proxy-helper.c b/fsdev/virtfs-proxy-helper.c
index aa1ab2590d..de061a8a0e 100644
--- a/fsdev/virtfs-proxy-helper.c
+++ b/fsdev/virtfs-proxy-helper.c
@@ -43,7 +43,7 @@
 #define BTRFS_SUPER_MAGIC 0x9123683E
 #endif
=20
-static struct option helper_opts[] =3D {
+static const struct option helper_opts[] =3D {
     {"fd", required_argument, NULL, 'f'},
     {"path", required_argument, NULL, 'p'},
     {"nodaemon", no_argument, NULL, 'n'},
--=20
2.21.1


