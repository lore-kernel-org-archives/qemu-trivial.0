Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1otNyP-0002M1-K2
	for mharc-qemu-trivial@gnu.org; Fri, 11 Nov 2022 01:57:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1otNyL-0002Jg-OJ
 for qemu-trivial@nongnu.org; Fri, 11 Nov 2022 01:57:07 -0500
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1otNyJ-0004i2-Qr
 for qemu-trivial@nongnu.org; Fri, 11 Nov 2022 01:57:05 -0500
Received: by mail-il1-x133.google.com with SMTP id o13so2157557ilc.7
 for <qemu-trivial@nongnu.org>; Thu, 10 Nov 2022 22:57:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dwxPKaTKuqFCxlTt0EAmk64pqWsofw6qrkLiqHT60S8=;
 b=qChbM/esLFzbrLe5hZCuw3Xiw+x6Q4lMtKQPdUL10ovGh7kJPKPzC1td2kpkHawOpq
 V/XHLoOsgHUy1064VPhApuVVewAhQ6I1qlBHAfkZRDQ5QMmLPTCeX9fomITg5ayxrw8E
 rshnXZg/G4p0I+pKLaY3zRrhuAuO+ip2ne4c9QqNy/c3TcacuZM+q/ujv0bLwhqx3Aa6
 tOoCiRvDKuTvjUBP3ZpZoVp9IxY/zGA26eAVmw7NBCFOwxZCkNzWge993P/sVuD/KZoS
 4MMWAoUE2SAsgSSDSixaU8trY18TdgIVIIblR2WBxVAxqv2kJpNSNPtn85rOXKRLfsE1
 nEHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dwxPKaTKuqFCxlTt0EAmk64pqWsofw6qrkLiqHT60S8=;
 b=P+26UQf7HVNUwGyQfLmj/0XHofSDBxX6x7ukpOBJDPiAQRdI0hH2AxB3pa9825yTGj
 iYHblOKAm7nYkl1L+AfEHbk5OKN/kA00UhCtC/jScKB0sk8vcNs/bmyQAJiNU6GhIq0s
 mhKnSBW81DDjQiF/Rb/sZgzfMRbFZCRUwgEPpRRWuV9FIZRH2ib6AAgx2bDg3NxhX3in
 qOB76mFqLKZ7H/Q8Rnw3DTMhgU6YsGhLnpk+X6kKDyi8MZUkwRaidSKI+Olk+pmqbOIm
 w9/eRJM6JY8ns5D9+hP/HkhSYyTwBY7mDig7gIA/BpEvAGy0S0Koc1nK7Jg5R9Mef0E0
 51uA==
X-Gm-Message-State: ANoB5pkrwcHCrM/P33WLuBaLUWStmf7J8NMtXZ43MP5ZUC7DEVrMT0h4
 iZkJizNLr4cDAyV2G0SMIXvWg/jcIXSSVSurfMmd/g==
X-Google-Smtp-Source: AA0mqf4ChH7QtdIMlwl+RHpzLpPrv1nZa5fw5gzb6V615BmBjwafLZcdbBKZpPoOH+XLBPZS7FN0I1sEOMHcXD2k3vw=
X-Received: by 2002:a92:c745:0:b0:2f9:8a1e:914b with SMTP id
 y5-20020a92c745000000b002f98a1e914bmr453814ilp.259.1668149822442; Thu, 10 Nov
 2022 22:57:02 -0800 (PST)
MIME-Version: 1.0
References: <20221110190825.879620-1-sw@weilnetz.de>
 <CAARzgwwcXhnUJe0gHLAf7Vb6oGUQ+cGRp82T9qdD3adoWCrnrA@mail.gmail.com>
In-Reply-To: <CAARzgwwcXhnUJe0gHLAf7Vb6oGUQ+cGRp82T9qdD3adoWCrnrA@mail.gmail.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Fri, 11 Nov 2022 12:26:51 +0530
Message-ID: <CAARzgwzYLccKdJ6tXE3A5bzHNesAo7+8iy6D7BvmitX7dTL8bg@mail.gmail.com>
Subject: Re: [PATCH for-7.2] Fix several typos in documentation (found by
 codespell)
To: Stefan Weil <sw@weilnetz.de>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>, 
 "Michael S . Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2607:f8b0:4864:20::133;
 envelope-from=ani@anisinha.ca; helo=mail-il1-x133.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 11 Nov 2022 06:57:07 -0000

On Fri, Nov 11, 2022 at 10:59 AM Ani Sinha <ani@anisinha.ca> wrote:
>
> On Fri, Nov 11, 2022 at 12:38 AM Stefan Weil <sw@weilnetz.de> wrote:
> >
> > Those typos are in files which are used to generate the QEMU manual.
> >
> > Signed-off-by: Stefan Weil <sw@weilnetz.de>
>
> For acpi-bits.rst,
> Reviewed-by: Ani Sinha <ani@anisinha.ca>
>
> > ---
> >
> > I did not fix memory_region_init_resizeable_ram. That might be done after 7.2.
> >
> > Stefan
> >
> >  docs/devel/acpi-bits.rst       | 2 +-
> >  docs/system/devices/can.rst    | 2 +-
> >  hw/scsi/esp.c                  | 6 +++---
> >  include/exec/memory.h          | 6 +++---
> >  qapi/virtio.json               | 4 ++--
> >  qemu-options.hx                | 6 +++---
> >  tests/qtest/libqos/qgraph.h    | 2 +-
> >  tests/qtest/libqos/virtio-9p.c | 2 +-
> >  8 files changed, 15 insertions(+), 15 deletions(-)
> >
> > diff --git a/docs/devel/acpi-bits.rst b/docs/devel/acpi-bits.rst
> > index c9564d871a..5e22be8ef6 100644
> > --- a/docs/devel/acpi-bits.rst
> > +++ b/docs/devel/acpi-bits.rst
> > @@ -132,7 +132,7 @@ Under ``tests/avocado/`` as the root we have:
> >
> >     (a) They are python2.7 based scripts and not python 3 scripts.
> >     (b) They are run from within the bios bits VM and is not subjected to QEMU
> > -       build/test python script maintainance and dependency resolutions.
> > +       build/test python script maintenance and dependency resolutions.
> >     (c) They need not be loaded by avocado framework when running tests.

btw, if we are going to fix this doc file for typo before the release,
may I also suggest another trivial fix?

https://gitlab.com/anisinha/qemu/-/commit/4bd915a7390d799b332c11f23b6d5982efac5dac#9dedb1d2dec506845c6145696c561451a8b4b659_44_44

(removal of the reference to README from the doc).

