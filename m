Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j3zF8-0006Cp-0L
	for mharc-qemu-trivial@gnu.org; Tue, 18 Feb 2020 04:32:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41700)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j3zF1-00069W-Po
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 04:32:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j3zF0-0001BX-H5
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 04:32:31 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:26384
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j3zF0-0001Aj-DR
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 04:32:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582018348;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=btZAH3Xrx0pyrx59uFmBzC/cYn5q/bWIwtOk/dCCUTM=;
 b=bpUThqoZ/VSa7Mg25QML/HcoBQ3pFRc6nxLvMFdA8rEUkYCp+JkWYxeA2qtsaBhokmEsXj
 RxbZt8mMNvzlZK8MORtZ0PoOUe00uxnadoxwU/bJqzFvfVcjlBJHB73maSaideGxEiVFbb
 qM/EVd6BlKs5Gdqh+oc5eMqgQ6Sa7a0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-b668h7EQN4WNSrOz72PZGQ-1; Tue, 18 Feb 2020 04:32:24 -0500
Received: by mail-wr1-f70.google.com with SMTP id j4so10493496wrs.13
 for <qemu-trivial@nongnu.org>; Tue, 18 Feb 2020 01:32:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fOzWP1vq62G/ytTmsfycrX2X8S1L1HhF+6M2xyNPCUI=;
 b=CevXpGxnSGPMNGUF4Y57VH3MPxihQwlkVePVMRtnKqZy4Bf1ajT1HOokQmXF3gE7Mr
 c6hRqqY2nzbK5doY8HIeNew5og/ln6L51tCv6bP0dEw4WdCVHN8sjyj2FaVuWfAugv/9
 JuvK2HYwE7EI8Yo7Ni660B/TFc369pebXie7ffbnhYRUkkdyVzuxbRJXzx7RvtRgB3AU
 yOv4hAAOPglU/qC+EGTkOXh7hLEWbHi1wtf3joid7futpyVeSsE01TdkMw+jYoLL1vkm
 omc8sXLXEg8P7hwTziWCGk7TpzNWNDfBjSlLxmqfJOr3Vjc0Yu3qppQEOzDCUL3rIVXo
 dF3Q==
X-Gm-Message-State: APjAAAVW60rPW/ucVddgDE+UOz/qDOt+ddTtHGz9sxDCAf75MW32a4ZV
 F6u77CVeWmFo63N5b6ggO+b27jEqKTc2jAD/DwaXF3G77OzcSrnXEGMLlNLzzcXuKDA5daumqrt
 lMYizXNbZcm6V07z30Q==
X-Received: by 2002:a1c:dfd6:: with SMTP id w205mr2078146wmg.151.1582018343336; 
 Tue, 18 Feb 2020 01:32:23 -0800 (PST)
X-Google-Smtp-Source: APXvYqwKzJTCtuZVY4mihsMSTwp6sfDROIwMS84Cw40XeYLboxOguDl8FpNkBtltMeBXHcHoTYZifA==
X-Received: by 2002:a1c:dfd6:: with SMTP id w205mr2078014wmg.151.1582018342204; 
 Tue, 18 Feb 2020 01:32:22 -0800 (PST)
Received: from x1w.redhat.com (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id v8sm5146891wrw.2.2020.02.18.01.32.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 01:32:21 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Luc Michel <luc.michel@greensocs.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Richard Henderson <rth@twiddle.net>,
 qemu-block@nongnu.org, Alex Williamson <alex.williamson@redhat.com>,
 Max Reitz <mreitz@redhat.com>, qemu-arm@nongnu.org,
 Juan Quintela <quintela@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Thomas Huth <huth@tuxfamily.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>,
 Alistair Francis <alistair@alistair23.me>, qemu-trivial@nongnu.org,
 Julia Suvorova <jusual@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH 01/13] scripts/checkpatch.pl: Detect superfluous semicolon in
 C code
Date: Tue, 18 Feb 2020 10:32:05 +0100
Message-Id: <20200218093217.25156-2-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200218093217.25156-1-philmd@redhat.com>
References: <20200218093217.25156-1-philmd@redhat.com>
MIME-Version: 1.0
X-MC-Unique: b668h7EQN4WNSrOz72PZGQ-1
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
X-List-Received-Date: Tue, 18 Feb 2020 09:32:35 -0000

Display error when a commit contains superfluous semicolon:

  $ git show 6663a0a3376 | scripts/checkpatch.pl -q -
  ERROR: superfluous trailing semicolon
  #276: FILE: block/io_uring.c:186:
  +                ret =3D -ENOSPC;;
  total: 1 errors, 1 warnings, 485 lines checked

Reported-by: Luc Michel <luc.michel@greensocs.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
Cc: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/checkpatch.pl | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index ce43a306f8..11512a8a09 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -1830,6 +1830,11 @@ sub process {
 =09=09=09ERROR("suspicious ; after while (0)\n" . $herecurr);
 =09=09}
=20
+# Check superfluous trailing ';'
+=09=09if ($line =3D~ /;;$/) {
+=09=09=09ERROR("superfluous trailing semicolon\n" . $herecurr);
+=09=09}
+
 # Check relative indent for conditionals and blocks.
 =09=09if ($line =3D~ /\b(?:(?:if|while|for)\s*\(|do\b)/ && $line !~ /^.\s*=
#/ && $line !~ /\}\s*while\s*/) {
 =09=09=09my ($s, $c) =3D ($stat, $cond);
--=20
2.21.1


