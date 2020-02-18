Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j3zQR-0001L7-Sa
	for mharc-qemu-trivial@gnu.org; Tue, 18 Feb 2020 04:44:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43290)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j3zQP-0001EG-Ds
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 04:44:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j3zQO-0005sP-Eh
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 04:44:17 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:54474
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j3zQO-0005rs-BP
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 04:44:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582019055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=btZAH3Xrx0pyrx59uFmBzC/cYn5q/bWIwtOk/dCCUTM=;
 b=Odeq0LxkzhFHdlso/0RxKQ0jyZhTa1nXDIATKGeJrSOR62sW26K3wmuwOFtaw+kwk/8Udd
 kl+S/O58WxM1PJ+6TzGsEZXNmtwmK5K51jtsPsnP3In+hqE0sCLUZMjwcS3uDDvsPdLJz7
 9Pbjj9OyEaWgB79adKa6X5oJPxyZB0M=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-351-FN5ovU8qN6KeNHyDmaUjrw-1; Tue, 18 Feb 2020 04:44:09 -0500
Received: by mail-wr1-f70.google.com with SMTP id p8so10509004wrw.5
 for <qemu-trivial@nongnu.org>; Tue, 18 Feb 2020 01:44:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fOzWP1vq62G/ytTmsfycrX2X8S1L1HhF+6M2xyNPCUI=;
 b=hOKEUo40LQZvWI6/yHtHx87EDE7PfJb1xgumESOOMwYl6OWNz8/CsJ3BtxBU/9+tJN
 xquho0L4Sql1CzNXAz4B4MVJ1SPEK2A8Ue8z8PLdBm0ht5CFt2STY0CwkdwTeZ3zKtSr
 Ye3d53wf00+rQlWsJ+Wic1dpy5ga9Qv8+ZhjIBG94qNmD9zcyIJ9gU52yqRRQxv7u8hC
 UGP1YSC2aDHCVc1LG+jHnPfCXbmYknwv9w2cGI09/3UPq9uXwc0m1nWLF/MAKTCGVef5
 3fbtyANJ4ou0rj2/1EbO+8ZLWBjYYUR8rr4eOrOvgoTUbvkIW1QV7NPCRkIcJBFu+wvW
 rbpg==
X-Gm-Message-State: APjAAAXH1L6XbQC+CAPVjAXQU4yJ5GBJcbDSB+x334UrJN1JkdAwF7ZX
 bQ8ENTV+ExK/eeVCyTAALPRIhXyB2Xau4BjVjO+rNp/IaTBL86YtAWLMQfy51A1DU2Ezdsq1w3j
 /ZDQbK4FIIsSGwyEkrw==
X-Received: by 2002:a5d:4bd0:: with SMTP id l16mr29455563wrt.271.1582019047846; 
 Tue, 18 Feb 2020 01:44:07 -0800 (PST)
X-Google-Smtp-Source: APXvYqxXex4vto7lSeGOFbORf+sCSg5xUWpiaGjzs6/mdvqQsy3YvYopDH4Mp9VdIz25S+VFHYwaLg==
X-Received: by 2002:a5d:4bd0:: with SMTP id l16mr29455545wrt.271.1582019047665; 
 Tue, 18 Feb 2020 01:44:07 -0800 (PST)
Received: from x1w.redhat.com (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id z10sm2735588wmk.31.2020.02.18.01.44.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 01:44:07 -0800 (PST)
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
Subject: [PATCH RESEND 01/13] scripts/checkpatch.pl: Detect superfluous
 semicolon in C code
Date: Tue, 18 Feb 2020 10:43:50 +0100
Message-Id: <20200218094402.26625-2-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200218094402.26625-1-philmd@redhat.com>
References: <20200218094402.26625-1-philmd@redhat.com>
MIME-Version: 1.0
X-MC-Unique: FN5ovU8qN6KeNHyDmaUjrw-1
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
X-List-Received-Date: Tue, 18 Feb 2020 09:44:18 -0000

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


