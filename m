Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j3zQk-0002BM-3k
	for mharc-qemu-trivial@gnu.org; Tue, 18 Feb 2020 04:44:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43697)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j3zQg-00024G-FZ
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 04:44:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j3zQf-00066s-Bp
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 04:44:34 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:26500
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j3zQf-00066J-6I
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 04:44:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582019072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LTgf94kcfqSZ8hoLehGhAHOfOM4ZjXUraqazHdrIszo=;
 b=OOLN9yr84AS9rJHiV1Jp8hF4j+8F8lB+kYGkAuAbFTZsQma+2k9fTFrETI4OPo3PgF97A5
 e9iXQrJSjZDCTMbrC6EAQMXF9dCldLfZk9W+oSSC3LD7ywpltENQQdMx8WAMY5UAweXmPo
 1ZqrIArnc+AXANZDrZ9niu33U/NXvJU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-390-I8NivY0aOYKjv2sWFTa4jg-1; Tue, 18 Feb 2020 04:44:31 -0500
Received: by mail-wm1-f72.google.com with SMTP id q125so885124wme.1
 for <qemu-trivial@nongnu.org>; Tue, 18 Feb 2020 01:44:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JB0VIXdKqYha385dFm6Nf/XSPsPS/89dyx6biXJISb4=;
 b=KZZtAN52p+ZdUg1bY2bfTdn7tkheC1QgP6Kj0FILptO5mH1SuAG5LFef9Dg7arrVnN
 sGzNr9drZyDqLDmDKME1pmLkhIcpV6OfiyKXmkRgKQlFSla0aMoK/riwb/E16LU5USZv
 5QaFu0TPDpX454ZAtHTK51JF3/OoKZa35UYJbTFoB4pSiJffSymPHUlTz65AFJrP960N
 cHcRdWVdNiOzXKA7cxPKOr9s32Jlk6d/7X6Sm+GNWucd3XQIatS/7ZwB+mqvvHoV9cGx
 ZGtoiv6fmZHtqI5+DgyZWpiPNUVKwImDhgljT0N9rB7XdITCbCmrlHSHB5YHrqVdJxz/
 RrcQ==
X-Gm-Message-State: APjAAAXF4WpVKgrU7vPDvSZo7hsKCxF/0PN93FX1DWHAQ3qY9k/1fTmc
 BGmvuL8ECns/oMg2GYcdlyLe0Ew9jMLng34iI+Ar9Jot8ckGQAqzqS8MiNQdHb10CkTpYs4Wa89
 /OImK85K+z4QKYNW+3w==
X-Received: by 2002:a05:600c:149:: with SMTP id
 w9mr2049955wmm.132.1582019069958; 
 Tue, 18 Feb 2020 01:44:29 -0800 (PST)
X-Google-Smtp-Source: APXvYqxnFCOD91POciOMTASDtCIuoeJf2e54H4Bms3bKGGaIUFJS8YQBdVHc1g4og/fenKxGkrsntQ==
X-Received: by 2002:a05:600c:149:: with SMTP id
 w9mr2049912wmm.132.1582019069668; 
 Tue, 18 Feb 2020 01:44:29 -0800 (PST)
Received: from x1w.redhat.com (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id z10sm2735588wmk.31.2020.02.18.01.44.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 01:44:29 -0800 (PST)
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
 Emanuele Giuseppe Esposito <e.emanuelegiuseppe@gmail.com>
Subject: [PATCH RESEND 12/13] tests/qtest/libqos/qgraph: Remove superfluous
 semicolons
Date: Tue, 18 Feb 2020 10:44:01 +0100
Message-Id: <20200218094402.26625-13-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200218094402.26625-1-philmd@redhat.com>
References: <20200218094402.26625-1-philmd@redhat.com>
MIME-Version: 1.0
X-MC-Unique: I8NivY0aOYKjv2sWFTa4jg-1
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
X-List-Received-Date: Tue, 18 Feb 2020 09:44:35 -0000

Fixes: fc281c80202
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
Cc: Emanuele Giuseppe Esposito <e.emanuelegiuseppe@gmail.com>
---
 tests/qtest/libqos/qgraph.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/libqos/qgraph.c b/tests/qtest/libqos/qgraph.c
index 7a7ae2a19e..ca01de0743 100644
--- a/tests/qtest/libqos/qgraph.c
+++ b/tests/qtest/libqos/qgraph.c
@@ -474,7 +474,7 @@ QOSEdgeType qos_graph_edge_get_type(QOSGraphEdge *edge)
     if (!edge) {
         return -1;
     }
-    return edge->type;;
+    return edge->type;
 }
=20
 char *qos_graph_edge_get_dest(QOSGraphEdge *edge)
@@ -590,7 +590,7 @@ void qos_add_test(const char *name, const char *interfa=
ce,
                   QOSTestFunc test_func, QOSGraphTestOptions *opts)
 {
     QOSGraphNode *node;
-    char *test_name =3D g_strdup_printf("%s-tests/%s", interface, name);;
+    char *test_name =3D g_strdup_printf("%s-tests/%s", interface, name);
     QOSGraphTestOptions def_opts =3D { };
=20
     if (!opts) {
--=20
2.21.1


