Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j3zQm-0002HP-8e
	for mharc-qemu-trivial@gnu.org; Tue, 18 Feb 2020 04:44:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43760)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j3zQj-0002AS-L3
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 04:44:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j3zQh-00068s-IO
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 04:44:36 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:34188
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j3zQh-00068V-E3
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 04:44:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582019075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WaAuyfScAf/2MXUb8PYYTyYX7vPM6AQh9bWF3qhXnuk=;
 b=YD4mqRWFD9apKpNvkOYxbJIpbRi2jrVAcoObTbpXvICPVQgKeBxfMSmAVzQ1972dVU3Cqe
 /gTTD76+6aE6JwIhIbwPVieUfLjtQo5s2chRmFPj++HUoKWeGL/jwA4bWAXAj+Hft3xj7k
 W0/3MeWXIrn/MouE9UReIv/ZjJt8p+w=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-28-T8XSi5clP9GFrE1B5WtJQg-1; Tue, 18 Feb 2020 04:44:25 -0500
Received: by mail-wm1-f72.google.com with SMTP id p26so789741wmg.5
 for <qemu-trivial@nongnu.org>; Tue, 18 Feb 2020 01:44:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tvommiOA9aXWAuznO/0p1zmrVr71xLCprwkebrVj7q4=;
 b=TEhzFlumK/cTZpAzdjCBswNzPXBL29cJVdeaeNU5kD+oUggZrrvfqzvAmCBfND9b5F
 kjLwdPPRONbtHUpXN1mXNUq6NuFCpVCwbIFc7CnRdEqWFgy66MemObOjuFRGQYmxofA3
 Co4MvrCW1kT+0PX1pYfDO0nEWFXE1P/Y292uyyT4w1EUCU3u1P0pCN5I6QjRhlaEoLut
 YP6ypLfeEGIDA3V7vBSbvayp/xD00Km2hOR+VO5rVlg2Y0CoN1Zn8ZfsMunCR6DgTcNH
 U7g7/+t0c5T7C9NzHknOMFBf5tUNVZGmo4GvC6rkAZYXJWGEdtn/QF6EYIlnjfH76vGV
 LhPg==
X-Gm-Message-State: APjAAAV+bL7ctH4avitUYeamQzWEXDwGKJvHtlIOxhj5J5jdz0ngxc73
 hJbttKuwxGFeZWpfSUk3ZaWF/aRl+behZkUE2+vYcsqWbrvKLI2oh8gpHPPVsCo8wHhka1FFBcV
 yGD/NuOuS9J0OwFn51w==
X-Received: by 2002:a5d:614a:: with SMTP id y10mr29114185wrt.73.1582019063798; 
 Tue, 18 Feb 2020 01:44:23 -0800 (PST)
X-Google-Smtp-Source: APXvYqy0As7+7ciJRK+XKjLIpE6pVb2XxI1tbeyk9YYhNEXjo0WkLuWIqgxrrVNIN6okm60uRVykQw==
X-Received: by 2002:a5d:614a:: with SMTP id y10mr29114137wrt.73.1582019063586; 
 Tue, 18 Feb 2020 01:44:23 -0800 (PST)
Received: from x1w.redhat.com (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id z10sm2735588wmk.31.2020.02.18.01.44.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 01:44:23 -0800 (PST)
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH RESEND 09/13] migration/multifd: Remove superfluous semicolon
Date: Tue, 18 Feb 2020 10:43:58 +0100
Message-Id: <20200218094402.26625-10-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200218094402.26625-1-philmd@redhat.com>
References: <20200218094402.26625-1-philmd@redhat.com>
MIME-Version: 1.0
X-MC-Unique: T8XSi5clP9GFrE1B5WtJQg-1
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
X-List-Received-Date: Tue, 18 Feb 2020 09:44:39 -0000

Fixes: d32ca5ad798
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 migration/multifd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/migration/multifd.c b/migration/multifd.c
index b3e8ae9bcc..cfaba1369e 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -305,7 +305,7 @@ static int multifd_send_pages(QEMUFile *f)
                 + p->packet_len;
     qemu_file_update_transfer(f, transferred);
     ram_counters.multifd_bytes +=3D transferred;
-    ram_counters.transferred +=3D transferred;;
+    ram_counters.transferred +=3D transferred;
     qemu_mutex_unlock(&p->mutex);
     qemu_sem_post(&p->sem);
=20
--=20
2.21.1


