Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j3zQU-0001Rd-3A
	for mharc-qemu-trivial@gnu.org; Tue, 18 Feb 2020 04:44:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43330)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j3zQR-0001Jw-DQ
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 04:44:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j3zQQ-0005tZ-BO
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 04:44:19 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:25248
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j3zQQ-0005tL-6i
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 04:44:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582019057;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=twD42LsJdxtk70mtkC2JiuCyIG9SZpU8nshsRUT8WmY=;
 b=SldHK8Rrfd6BY2LmOD1u15FZt//tPevNahvQBieOVIzG/RefR9jwgOctBm7SlbANIPhNOM
 nJ+yp+LOCOicZnZgf32lMGzkOMen+Vf94OZskjygnJSCD3NNMJ3eTSY05+yu21YkKSt00n
 vyW9LyxTPUg5c72THw07P4ZArKXpfsQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-147-QiD0VXHyMTmUVjDLvUCuCg-1; Tue, 18 Feb 2020 04:44:15 -0500
Received: by mail-wm1-f72.google.com with SMTP id g138so230465wmg.8
 for <qemu-trivial@nongnu.org>; Tue, 18 Feb 2020 01:44:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IhIk9nB8PMGzSNjXgBFB3gJKa0gAiyLYRyAtuExQk+A=;
 b=eMj247KHgIpwZ7sFrO0eGFd7QMLlmT/G2HATmmWaXMcPVaOelrS1YtgQJ3dx/rmwJx
 qdDWun3fE5XdFvt5kzN8kOh6/+mPaYa5cJwJQmb/FXEV4satyVn/+lWW41a8z/MCZ/5O
 Hie6FBB/1XG0nP9xt/vPrUlqPe4fI8F3yXWON3KflmoHbHysRE1jyQW6bpnnWz3HN9oO
 FTp0aM8u6TU8uz3mXpy1T018fPUeJDHogwAqZSGOaGoTL54QDvDD7g8k5iKNIdZCE+oZ
 HcOprOd4Cprr2s17WJ2d4bxI+NvyMECvVc2dw2Mj0o4Wab03W2XQe2AKbhz79ulUq+Cb
 SM9w==
X-Gm-Message-State: APjAAAWJoNNRA9/jOtheaDK1IahlfQuxlts3lW17XJ+7Gipbyph1yDTt
 XS7LMEHsOc9IftOhb88UAk6NCMlwJQLwMvd8vkK8xl5fYHvkKUG40dr8Q8fiB/4Hyn+e32be88U
 /YOYzNSTyrHwGxTp4ZA==
X-Received: by 2002:a05:600c:34d:: with SMTP id
 u13mr2157068wmd.77.1582019053919; 
 Tue, 18 Feb 2020 01:44:13 -0800 (PST)
X-Google-Smtp-Source: APXvYqyxSaLMTZVbF80I8bs0+LLcodBrB/Et/yW70LRDg9VCjT1WlC6Vrdyy+j7Ie6N1FZP9RWoAjw==
X-Received: by 2002:a05:600c:34d:: with SMTP id
 u13mr2157015wmd.77.1582019053713; 
 Tue, 18 Feb 2020 01:44:13 -0800 (PST)
Received: from x1w.redhat.com (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id z10sm2735588wmk.31.2020.02.18.01.44.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 01:44:13 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Max Reitz <mreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Fam Zheng <fam@euphon.net>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <rth@twiddle.net>, Julia Suvorova <jusual@redhat.com>,
 Thomas Huth <huth@tuxfamily.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>, qemu-trivial@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Gerd Hoffmann <kraxel@redhat.com>, Luc Michel <luc.michel@greensocs.com>,
 Laurent Vivier <lvivier@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH RESEND 04/13] block/io_uring: Remove superfluous semicolon
Date: Tue, 18 Feb 2020 10:43:53 +0100
Message-Id: <20200218094402.26625-5-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200218094402.26625-1-philmd@redhat.com>
References: <20200218094402.26625-1-philmd@redhat.com>
MIME-Version: 1.0
X-MC-Unique: QiD0VXHyMTmUVjDLvUCuCg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
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
X-List-Received-Date: Tue, 18 Feb 2020 09:44:20 -0000

Fixes: 6663a0a3376
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
Cc: Stefano Garzarella <sgarzare@redhat.com>
---
 block/io_uring.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/io_uring.c b/block/io_uring.c
index 56892fd1ab..a3142ca989 100644
--- a/block/io_uring.c
+++ b/block/io_uring.c
@@ -187,7 +187,7 @@ static void luring_process_completions(LuringState *s)
                     ret =3D 0;
                 }
             } else {
-                ret =3D -ENOSPC;;
+                ret =3D -ENOSPC;
             }
         }
 end:
--=20
2.21.1


