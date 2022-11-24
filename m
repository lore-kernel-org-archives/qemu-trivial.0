Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oyDev-0001gU-Kq
	for mharc-qemu-trivial@gnu.org; Thu, 24 Nov 2022 09:57:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oyDet-0001f9-Sk
 for qemu-trivial@nongnu.org; Thu, 24 Nov 2022 09:57:00 -0500
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oyDer-00039q-RQ
 for qemu-trivial@nongnu.org; Thu, 24 Nov 2022 09:56:59 -0500
Received: by mail-io1-xd2a.google.com with SMTP id q21so1355291iod.4
 for <qemu-trivial@nongnu.org>; Thu, 24 Nov 2022 06:56:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KY4f8p07/7XjfVAh6K2YSLPpB0sFJLfy6Elxjys+V0A=;
 b=zeMgXuBnc5oIP5COTjhWsoaydh13iF5/ZzQvAjL17wETx1P3xfNdx4i9/+x/pACGqF
 gtFZ47bv6En665/A9OuKM2r4N4X6Mg0Jz+WVj9w41SzLtrLdJfkHNj5hraFMBKA/VVdt
 t0UCITqabxKB6XHWf6JXfz3J4GoO+vGfsH8FxtTk++YtwzEcp8QA4ldMaEBhrzbAbr/f
 v7oiTROxrP/K/WRIMuzt8HMv1nTWNHPYf1UsJnN9rxJ5TmZf2uBImqSXXToWgWdNvS0U
 CQ7DVwO7ZReQNx6o26IoV6g2nbkeJOl61LdlbwkBIgcno5EcuX1obR7LR6CBL8ZLJ8kw
 84xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KY4f8p07/7XjfVAh6K2YSLPpB0sFJLfy6Elxjys+V0A=;
 b=HHoI1ENb/7RqhzjQtYJdsF+Zpsendi1ueDaeRd7Lucz6EevB6yAZEomxZTIMXChZ0g
 uzPnWCCYHPcwQVIwgdqp51ZLbloqJmLdKJO0vKKUYFWbxJlz1pmYSJcJ9SQyRFMQYYgg
 /rZrkWCsVcQnm3BuXzmXCj4K3kemFGxQMVwZNbb5e8Y4eWbOR6oNFMgJZe2CV80m2q3c
 GwQ0hyhpZGVnz3eqoh3Y7/nHk+uP/V6+gwuowJXYhmTrKFfWpf4huk3YNkgyF6/Os99R
 eheQ+bhCt7+bgun73GFSygethUj1wUxavP2gwfvRRr+RrPEGXOE2YR+91GUXaa0Pv9Lc
 xxCg==
X-Gm-Message-State: ANoB5pm9nOZ42VEM0yD8nYtgNQ41jHabA44GZoMO/xJsoxw2Cxkcggrz
 R3NlrKh0hlHBLHpgfYhZaO48p1Co6U9vfe33bHCpkg==
X-Google-Smtp-Source: AA0mqf70M3imoKI/dX3oslJ+eNKbh9FpZlR+c0gUyiuFEbKp7JrcLXo1ai3JjEmb4Ht/FrMljbMpdwrcb4NH+wWx2tY=
X-Received: by 2002:a6b:fe12:0:b0:6dd:e590:6628 with SMTP id
 x18-20020a6bfe12000000b006dde5906628mr7945834ioh.3.1669301816495; Thu, 24 Nov
 2022 06:56:56 -0800 (PST)
MIME-Version: 1.0
References: <20221124135834.924426-1-ani@anisinha.ca>
 <20221124091625-mutt-send-email-mst@kernel.org>
In-Reply-To: <20221124091625-mutt-send-email-mst@kernel.org>
From: Ani Sinha <ani@anisinha.ca>
Date: Thu, 24 Nov 2022 20:26:45 +0530
Message-ID: <CAARzgwxy0poHY5GbG9Pz0H6RnKjz6f_8PUiCWhUBJJ+gBU_9bg@mail.gmail.com>
Subject: Re: [PATCH] acpi/tests/avocado/bits: add SPDX license identifiers for
 bios bits tests
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, 
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Maydell Peter <peter.maydell@linaro.org>, 
 John Snow <jsnow@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Igor Mammedov <imammedo@redhat.com>, qemu-trivial@nongnu.org,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=ani@anisinha.ca; helo=mail-io1-xd2a.google.com
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
X-List-Received-Date: Thu, 24 Nov 2022 14:57:00 -0000

On Thu, Nov 24, 2022 at 7:47 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Thu, Nov 24, 2022 at 07:28:34PM +0530, Ani Sinha wrote:
> > Added the SPDX license identifiers for biosbits tests.
> > Also added a comment on each of the test scripts to indicate that they =
run
> > from within the biosbits environment and hence are not subjected to the=
 regular
> > maintanance acivities
>
>
> activities?

This came from John's suggestion here:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg899480.html .

"Could I please ask for a comment in each .py file that isn't designed
to run directly in the host v/environment? Just a small nod to the fact
that it runs in a special VM so I can exclude it from other regular
maintenance operations / considerations for dependency management in the
host testing env.

# Designed to run only in the biosbits VM.

would be more than sufficient.
"
I can reword this in any way that sounds better.

>
> > for QEMU and is excluded from the dependency management
> > challenges in the host testing environment.
> >
> > Cc: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> > Cc: Paolo Bonzini <pbonzini@redhat.com>
> > Cc: Maydell Peter <peter.maydell@linaro.org>
> > Cc: John Snow <jsnow@redhat.com>
> > Cc: Thomas Huth <thuth@redhat.com>
> > Cc: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> > Cc: Igor Mammedov <imammedo@redhat.com>
> > Cc: Michael Tsirkin <mst@redhat.com>
> > Cc: Thomas Huth <thuth@redhat.com>
> > Cc: qemu-trivial@nongnu.org
> > Signed-off-by: Ani Sinha <ani@anisinha.ca>
> > ---
> >  tests/avocado/acpi-bits/bits-tests/smbios.py2    | 4 ++++
> >  tests/avocado/acpi-bits/bits-tests/testacpi.py2  | 4 ++++
> >  tests/avocado/acpi-bits/bits-tests/testcpuid.py2 | 4 ++++
> >  3 files changed, 12 insertions(+)
> >
> > Apologies for this. Somehow this patch fell off my tree between multipl=
e
> > revisions. Quite trivial and does not affect any QEMU codebase.
> >
> > diff --git a/tests/avocado/acpi-bits/bits-tests/smbios.py2 b/tests/avoc=
ado/acpi-bits/bits-tests/smbios.py2
> > index 9667d0542c..fc623de072 100644
> > --- a/tests/avocado/acpi-bits/bits-tests/smbios.py2
> > +++ b/tests/avocado/acpi-bits/bits-tests/smbios.py2
> > @@ -1,6 +1,8 @@
> >  # Copyright (c) 2015, Intel Corporation
> >  # All rights reserved.
> >  #
> > +# SPDX-License-Identifier: BSD-3-Clause
> > +#
> >  # Redistribution and use in source and binary forms, with or without
> >  # modification, are permitted provided that the following conditions a=
re met:
> >  #
> > @@ -24,6 +26,8 @@
> >  # (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE US=
E OF THIS
> >  # SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> >
> > +# This script runs only from the biosbits VM.
> > +
> >  """SMBIOS/DMI module."""
> >
> >  import bits
> > diff --git a/tests/avocado/acpi-bits/bits-tests/testacpi.py2 b/tests/av=
ocado/acpi-bits/bits-tests/testacpi.py2
> > index dbc150076e..f818a9cce6 100644
> > --- a/tests/avocado/acpi-bits/bits-tests/testacpi.py2
> > +++ b/tests/avocado/acpi-bits/bits-tests/testacpi.py2
> > @@ -1,6 +1,8 @@
> >  # Copyright (c) 2015, Intel Corporation
> >  # All rights reserved.
> >  #
> > +# SPDX-License-Identifier: BSD-3-Clause
> > +#
> >  # Redistribution and use in source and binary forms, with or without
> >  # modification, are permitted provided that the following conditions a=
re met:
> >  #
> > @@ -24,6 +26,8 @@
> >  # (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE US=
E OF THIS
> >  # SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> >
> > +# This script runs only from the biosbits VM.
> > +
> >  """Tests for ACPI"""
> >
> >  import acpi
> > diff --git a/tests/avocado/acpi-bits/bits-tests/testcpuid.py2 b/tests/a=
vocado/acpi-bits/bits-tests/testcpuid.py2
> > index ac55d912e1..7adefbe355 100644
> > --- a/tests/avocado/acpi-bits/bits-tests/testcpuid.py2
> > +++ b/tests/avocado/acpi-bits/bits-tests/testcpuid.py2
> > @@ -1,6 +1,8 @@
> >  # Copyright (c) 2012, Intel Corporation
> >  # All rights reserved.
> >  #
> > +# SPDX-License-Identifier: BSD-3-Clause
> > +#
> >  # Redistribution and use in source and binary forms, with or without
> >  # modification, are permitted provided that the following conditions a=
re met:
> >  #
> > @@ -24,6 +26,8 @@
> >  # (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE US=
E OF THIS
> >  # SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> >
> > +# This script runs only from the biosbits VM.
> > +
> >  """Tests and helpers for CPUID."""
> >
> >  import bits
> > --
> > 2.34.1
>

