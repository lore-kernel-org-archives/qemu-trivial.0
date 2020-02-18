Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j3zQR-0001KN-L7
	for mharc-qemu-trivial@gnu.org; Tue, 18 Feb 2020 04:44:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43259)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j3zQO-0001Ao-Cr
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 04:44:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j3zQN-0005rS-Dp
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 04:44:16 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:57734
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j3zQN-0005r1-AQ
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 04:44:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582019055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O50p9vS8lAM1KgCOESGEUWsExX65Aroq2vWKbIYHyYM=;
 b=beJmDIntki0QCRq/p+q1l1wFUMoCpRBdFJHepydra6qn4Zvr7fmRGh+MWMVNLIUmhmLApQ
 xEA0kVR5WSOx4Ra8q7USPEnTGtpekjdQoaglYJZBlr42P60+1gXL76nuu54l0OtX7FPbvc
 yJ7TRFYwlG6Enl+hKj/UlG2lxGvLtNk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-dl-zPM36NSCZrCRXEsHOEw-1; Tue, 18 Feb 2020 04:44:13 -0500
Received: by mail-wm1-f72.google.com with SMTP id m4so878530wmi.5
 for <qemu-trivial@nongnu.org>; Tue, 18 Feb 2020 01:44:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5tYW7J9DRdD0EtwNm+zUUQ5S0X5D36o436wq58i4uWY=;
 b=ljNZWSs+gCyTvY6YhORM/ejx1Uj7xLgr7acGiRbnHtrUqxJ6ybxB6f7h6LO3Gy9bqg
 g1RT8piuHM0wHdGrwb8pAdii5zMOcNFBlB4rw3aRKsvSxIEd/Pe8w76Qc6ns29nlDd3T
 fSyXShBndAXE9uv4zv21vaJNOxLk2wA9EYA0VTTTVjLDUpgI2VL1olnOogyW6hKY8Vc5
 BgoIjeZdDFwpG0aTo4pUNrglMH/g1NolR5Zf3xFOu41cFGP4wrC/xX/4HMJYAqH4+R0G
 kWDNCETbTYLHPFfZ5+DVdVkDHYbePh5v1NCaE9PJdHeG46UWRmiZAU70kIONxrDiAbLJ
 SOSg==
X-Gm-Message-State: APjAAAWJt8PMBf1gHkAFlN5qF0Jgb/Jk5kOv0sVCNaW6VKi+ezrOSTIT
 6rEvpgu+f3pldZKelOcm2tnyuaFOJA1/PCK/PkrofeTRrJmJAj2blh4Fxb96MRVZve6IWftud5d
 2Wzsg8NcIsp3axeu0/Q==
X-Received: by 2002:adf:8b54:: with SMTP id v20mr28935363wra.390.1582019051937; 
 Tue, 18 Feb 2020 01:44:11 -0800 (PST)
X-Google-Smtp-Source: APXvYqxMtdGZ9ZNI7NaaHAT7y+lFX7mMTPGE38ySlsJjVzxj2/xLbNLLthxR5dkf47Vg3kq+jdf8sg==
X-Received: by 2002:adf:8b54:: with SMTP id v20mr28935311wra.390.1582019051646; 
 Tue, 18 Feb 2020 01:44:11 -0800 (PST)
Received: from x1w.redhat.com (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id z10sm2735588wmk.31.2020.02.18.01.44.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 01:44:11 -0800 (PST)
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
Subject: [PATCH RESEND 03/13] block: Remove superfluous semicolons
Date: Tue, 18 Feb 2020 10:43:52 +0100
Message-Id: <20200218094402.26625-4-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200218094402.26625-1-philmd@redhat.com>
References: <20200218094402.26625-1-philmd@redhat.com>
MIME-Version: 1.0
X-MC-Unique: dl-zPM36NSCZrCRXEsHOEw-1
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
X-List-Received-Date: Tue, 18 Feb 2020 09:44:17 -0000

Fixes: 132ada80c4a
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 block.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/block.c b/block.c
index 9c810534d6..9db0b973fe 100644
--- a/block.c
+++ b/block.c
@@ -2435,13 +2435,13 @@ BdrvChild *bdrv_root_attach_child(BlockDriverState =
*child_bs,
     if (bdrv_get_aio_context(child_bs) !=3D ctx) {
         ret =3D bdrv_try_set_aio_context(child_bs, ctx, &local_err);
         if (ret < 0 && child_role->can_set_aio_ctx) {
-            GSList *ignore =3D g_slist_prepend(NULL, child);;
+            GSList *ignore =3D g_slist_prepend(NULL, child);
             ctx =3D bdrv_get_aio_context(child_bs);
             if (child_role->can_set_aio_ctx(child, ctx, &ignore, NULL)) {
                 error_free(local_err);
                 ret =3D 0;
                 g_slist_free(ignore);
-                ignore =3D g_slist_prepend(NULL, child);;
+                ignore =3D g_slist_prepend(NULL, child);
                 child_role->set_aio_ctx(child, ctx, &ignore);
             }
             g_slist_free(ignore);
--=20
2.21.1


