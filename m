Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j3zJr-0002tS-Nx
	for mharc-qemu-trivial@gnu.org; Tue, 18 Feb 2020 04:37:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42224)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j3zJp-0002qv-Sv
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 04:37:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j3zJo-0002zU-TS
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 04:37:29 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:51029
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j3zJo-0002zJ-QZ
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 04:37:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582018648;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=btZAH3Xrx0pyrx59uFmBzC/cYn5q/bWIwtOk/dCCUTM=;
 b=DzInd2ZS2wX5GNbrbSXo/XCQMSspGjp08c3HfexZ3voNYd6nSJnuvm5/qY6z8qiJ0t55zU
 ez5W1lrykZaGXY4ZQ3Pvj+u7U7p0s64In26TEiZIABpEHPEqTX4moIvTaevAXRUWVBajK9
 Ad2GZeB2J+CWATRT7QTTsIRyBK/Qsj8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-Nw8m9TwYMhGB5i1ME-6C7w-1; Tue, 18 Feb 2020 04:37:27 -0500
Received: by mail-wm1-f71.google.com with SMTP id q125so878199wme.1
 for <qemu-trivial@nongnu.org>; Tue, 18 Feb 2020 01:37:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fOzWP1vq62G/ytTmsfycrX2X8S1L1HhF+6M2xyNPCUI=;
 b=SdEFb4PIDL33PPUdbEQjIUiIVZPJ+EtWk3XJQuJDfSph514jkjwb89jC24snd7ldgg
 g4PQ1MooNuelUtKxreRIjn09S53QSSLdPA3WUG231yH9xmed/5w1+jwUWnIadmluAcuo
 d+cgq2zviYjluGD5vHpouXrWsKK/tG8xkfg2Z8Q0VKEoeC8NDuEbhKnaLPX0fSu0IZIJ
 OwPuJC4L4KoQafN9LRcvni5HaSz/m0mDIiUDrRwMt4gZ0FA8Ede6hpfLeZtrJOnWzimP
 /PrpGmMGml+uq/bF5tiR+f+d8MIuNJOXOStfRg3sPOr0WiDiyKlCJr6jOubMy5rDOhW+
 wL7A==
X-Gm-Message-State: APjAAAV+VHXv09ghzZLYXrANdsYNw9iGUN84KkTlrHLNUpSqUkzcmdt9
 VrCN3qHLhnwWfKdZxQtv2jhqnousWrlyqHAmmFOaxbVwdf8HwRv+NuQHhDAkvReh/IV7obiH8Fe
 5VgzSWstFwqESadwr6w==
X-Received: by 2002:adf:fa86:: with SMTP id h6mr27392523wrr.418.1582018645870; 
 Tue, 18 Feb 2020 01:37:25 -0800 (PST)
X-Google-Smtp-Source: APXvYqyTg70OncI5YQkA8HrTBP7wvax5CL6p4INAKPHOMRyenWyW1nb1mw2qqwkl+HY6l0u2kie1Pw==
X-Received: by 2002:adf:fa86:: with SMTP id h6mr27392492wrr.418.1582018645661; 
 Tue, 18 Feb 2020 01:37:25 -0800 (PST)
Received: from x1w.redhat.com (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id 133sm2817232wme.32.2020.02.18.01.37.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 01:37:25 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <huth@tuxfamily.org>, Julia Suvorova <jusual@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org,
 qemu-arm@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Aarushi Mehta <mehta.aaru20@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 Stefan Hajnoczi <stefanha@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Luc Michel <luc.michel@greensocs.com>, Laurent Vivier <lvivier@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Richard Henderson <rth@twiddle.net>, qemu-block@nongnu.org,
 Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH 01/13] scripts/checkpatch.pl: Detect superfluous semicolon in
 C code
Date: Tue, 18 Feb 2020 10:37:08 +0100
Message-Id: <20200218093720.25640-2-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200218093720.25640-1-philmd@redhat.com>
References: <20200218093720.25640-1-philmd@redhat.com>
MIME-Version: 1.0
X-MC-Unique: Nw8m9TwYMhGB5i1ME-6C7w-1
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
X-List-Received-Date: Tue, 18 Feb 2020 09:37:31 -0000

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


