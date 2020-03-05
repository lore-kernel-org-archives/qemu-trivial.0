Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j9psy-00070h-BF
	for mharc-qemu-trivial@gnu.org; Thu, 05 Mar 2020 07:45:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41630)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j9psn-0006Ut-Og
 for qemu-trivial@nongnu.org; Thu, 05 Mar 2020 07:45:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j9psm-0001PO-L7
 for qemu-trivial@nongnu.org; Thu, 05 Mar 2020 07:45:45 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:48370
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j9psm-0001Ow-HX
 for qemu-trivial@nongnu.org; Thu, 05 Mar 2020 07:45:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583412344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HfnT8d1lOc8oOW388s3B4mt/9tuFbIC8PeXMCcmaMOk=;
 b=arjfed0zfDmzfwX7S+UVdHfY7DDTi/rdqzG6nXzwk1Z6OB8mjeSo1ZhCvnBxJtR3E3icZJ
 lOvtZUM83lxPVuHRXN7gbImEOB4tS7Txv6i2/lNd6xx5W4CsFGkdiF1WoTjUUAjQ7weGxa
 +i27of4MHO1dnoijeeh03lNRQGMsMdU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-0FxFvF-8NDa5mwvsDLPoiw-1; Thu, 05 Mar 2020 07:45:42 -0500
X-MC-Unique: 0FxFvF-8NDa5mwvsDLPoiw-1
Received: by mail-wm1-f71.google.com with SMTP id p17so698191wmc.9
 for <qemu-trivial@nongnu.org>; Thu, 05 Mar 2020 04:45:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7WthtJEuF/N+eAMadHF0Sd51QGcmnmZoupRAgou8XDo=;
 b=Z1ic/VjIANAFlXxOfSwJxR8cpZ+qwKAfoO0XotmwYl4eXWX4u+XP4Qz0LrqxeYuk1v
 ajOj+R0TRZpl72ruwpDmEk/zZ/YXFVJBz4JJPEibCrYbE9psKUognvZ7gBkkV5hJABM+
 LnD+sDUtVxea8fHfhij+UYTzejUr0a0I2tIziL8Qog2CaKndl2kgRD6pr2eLeShFymbE
 qhTcML/n9H/qVmU3J6m5KBcm/QNgdtR+/nj/gmRNSFQgV5yuwmHmnJYrTRrhP9U9PwiJ
 r1ctRB6NH6T7YRny8uRDw0ixenc04PDMbIuNqP3eXzATj1viaJw+DRN6nidgeMeykSOk
 Dxyg==
X-Gm-Message-State: ANhLgQ28Fm3J9jlpeCoAiT/2Pg4Z49wTgSajMNdCXaT0gzyG6tpeJA2j
 +zbm8LPROh+rwgKumhOjUb3csiF5+vhB9Dz9ZT0vgg0x9pFHFFNkQ60rLkDhrNTtREzuIrzoj9w
 8vJgEIpJI5iq+u1Rstw==
X-Received: by 2002:a1c:6884:: with SMTP id d126mr9090951wmc.38.1583412339473; 
 Thu, 05 Mar 2020 04:45:39 -0800 (PST)
X-Google-Smtp-Source: ADFU+vszSRNbFNB70lPwi1+dJrIysVzEGOnhLy69XyNqvWJZ5pFATslY5R70zu29Mm0icEgl9lXtrw==
X-Received: by 2002:a1c:6884:: with SMTP id d126mr9090927wmc.38.1583412339278; 
 Thu, 05 Mar 2020 04:45:39 -0800 (PST)
Received: from localhost.localdomain (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id m3sm25274864wrx.9.2020.03.05.04.45.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 04:45:38 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v2 2/9] hw/audio/fmopl: Move ENV_CURVE to .heap to save 32KiB
 of .bss
Date: Thu,  5 Mar 2020 13:45:18 +0100
Message-Id: <20200305124525.14555-3-philmd@redhat.com>
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
X-List-Received-Date: Thu, 05 Mar 2020 12:45:47 -0000

This buffer is only used by the adlib audio device. Move it to
the .heap to release 32KiB of .bss (size reported on x86_64 host).

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/audio/fmopl.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/audio/fmopl.c b/hw/audio/fmopl.c
index 173a7521f2..356d4dfbca 100644
--- a/hw/audio/fmopl.c
+++ b/hw/audio/fmopl.c
@@ -186,7 +186,7 @@ static int32_t *VIB_TABLE;
=20
 /* envelope output curve table */
 /* attack + decay + OFF */
-static int32_t ENV_CURVE[2*EG_ENT+1];
+static int32_t *ENV_CURVE;
=20
 /* multiple table */
 #define ML 2
@@ -1090,6 +1090,7 @@ FM_OPL *OPLCreate(int clock, int rate)
 =09OPL->clock =3D clock;
 =09OPL->rate  =3D rate;
 =09OPL->max_ch =3D max_ch;
+    ENV_CURVE =3D g_new(int32_t, 2 * EG_ENT + 1);
 =09/* init grobal tables */
 =09OPL_initialize(OPL);
 =09/* reset chip */
@@ -1127,6 +1128,7 @@ void OPLDestroy(FM_OPL *OPL)
 #endif
 =09OPL_UnLockTable();
 =09free(OPL);
+    g_free(ENV_CURVE);
 }
=20
 /* ----------  Option handlers ----------       */
--=20
2.21.1


