Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j9ewz-0004rj-Iu
	for mharc-qemu-trivial@gnu.org; Wed, 04 Mar 2020 20:05:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39530)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j9ewn-0004MI-Gs
 for qemu-trivial@nongnu.org; Wed, 04 Mar 2020 20:05:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j9ewm-0005VY-B5
 for qemu-trivial@nongnu.org; Wed, 04 Mar 2020 20:05:09 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:38824
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j9ewm-0005VK-7a
 for qemu-trivial@nongnu.org; Wed, 04 Mar 2020 20:05:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583370307;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9Pobed26pNltZm/I9CiNxzmUNaY+9kG51Kk6vz3G8IU=;
 b=X/J0eLP3sQpHv6ZdQuxX28qB9S6qZTcXRetEOOxsjGqa4PazofSDgdcO7t6Fkp5NLyFfYV
 2nI/PtXGHhjzBmME4TgAdodlonl6B013fmSjxPvkQiQMDf+yp9LFCDfw/NgJnucz8NzDC2
 u9ZV/qNV+2c0g8ELiPZLolj2iu+rXXc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-84-Jh66vniMOdSxBWuncqcTtg-1; Wed, 04 Mar 2020 20:05:06 -0500
X-MC-Unique: Jh66vniMOdSxBWuncqcTtg-1
Received: by mail-wr1-f72.google.com with SMTP id d7so1641366wrr.0
 for <qemu-trivial@nongnu.org>; Wed, 04 Mar 2020 17:05:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jMnU2Ro3TeTUnU2ZUl/yMOyKuppxic5kPK7lhjxznVI=;
 b=F/3jI8AG5Yc8J08RAlTUZxzOFKZ1AjtljxJDO4vBSGZjo7mw4TOMexuof6sHBS7pgt
 4kQuuWEIOS3XkpCILdzOSd5xT9oXKCCf5WJPx8Q8SWMR9xo78ktyyNiMjqhNFX4+ZEBw
 x/t3TIDQT3DY9mSy4Faj4PpnVko2qz2jsP8w8Bp4cbUCQqpOlbzaCqAkyHCq8sTA8xDj
 yOkrTkz+LiaWlZH9NDp+yH2KFLtvZreZqHk5+q+qOy3zOVaPkjlkPwGFEXDwCn0oGK2O
 QPkZvG6HCH0lALB/UZR61a/YcSJUyoK0deE1woVLRFBUpy5BD0KB/XGYDqywRwFjy+0m
 A41w==
X-Gm-Message-State: ANhLgQ3DZzesFoUUk7c2ldRs8ga7rmDCGotzPrZFGIj7gsmcLgPXeRms
 CubNFpCExNyUR9cPUGQd3B5I+BMm94FHbWW1ek3kw2jhwXH7faaH2Gs3nIhpBPe3xCAXifZzXAh
 g6FC2ndS4dTugbyuTbw==
X-Received: by 2002:a1c:488b:: with SMTP id v133mr5910584wma.159.1583370304859; 
 Wed, 04 Mar 2020 17:05:04 -0800 (PST)
X-Google-Smtp-Source: ADFU+vsACmAuVe5lYfeAoDO8kBmBnjPUB2CXcZOhSjuKqXRx0ACmPOcBDdZJM9Oi+/8DUXp8ycY47Q==
X-Received: by 2002:a1c:488b:: with SMTP id v133mr5910560wma.159.1583370304662; 
 Wed, 04 Mar 2020 17:05:04 -0800 (PST)
Received: from localhost.localdomain (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id g7sm39625648wrm.72.2020.03.04.17.05.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2020 17:05:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Greg Kurz <groug@kaod.org>, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH 3/3] virtfs-proxy-helper: Make the helper_opts[] array const
Date: Thu,  5 Mar 2020 02:04:46 +0100
Message-Id: <20200305010446.17029-4-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200305010446.17029-1-philmd@redhat.com>
References: <20200305010446.17029-1-philmd@redhat.com>
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
X-List-Received-Date: Thu, 05 Mar 2020 01:05:10 -0000

Reduce a bit the memory footprint by making the helper_opts[]
array const.

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


