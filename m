Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jABST-0004vQ-EC
	for mharc-qemu-trivial@gnu.org; Fri, 06 Mar 2020 06:48:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48023)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <viktor.prutyanov@phystech.edu>) id 1jABSQ-0004ut-DD
 for qemu-trivial@nongnu.org; Fri, 06 Mar 2020 06:47:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <viktor.prutyanov@phystech.edu>) id 1jABSN-0003fn-NN
 for qemu-trivial@nongnu.org; Fri, 06 Mar 2020 06:47:57 -0500
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243]:34235)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <viktor.prutyanov@phystech.edu>)
 id 1jABSN-0003bl-8f
 for qemu-trivial@nongnu.org; Fri, 06 Mar 2020 06:47:55 -0500
Received: by mail-lj1-x243.google.com with SMTP id j19so1913868lji.1
 for <qemu-trivial@nongnu.org>; Fri, 06 Mar 2020 03:47:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phystech-edu.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :organization:mime-version:content-transfer-encoding;
 bh=DQ+V1IeSmPQO9wkH9m1UPFVySzxnNCk5Wge4L88LvqI=;
 b=W1PYg+hy2x5x1YUw6CmS5SJmWLzxlzPI9+OCbT4uBr8xkm+MVkBUGayr6zlCiVGo8w
 a2utMnYlY5LNGcS1WnQf4NQMMmdG6SQzKstfZ2Jl9/OurcU9GXpd7Y6nqGqDgjeqslEG
 jp61jQ30R1immi9L34eYN87MLtOEtO1xoqqSHrwPNS4GmS7yCUMpFnF50XemCuIM3xDU
 EeowFmzPggrZXk5O21mU9Tfhbm19zCqxDUXHJ49/tdDOqBvptdYT8FFuoLiOAAr9N5pF
 7RElL++IUxGx4+UWtsKf5oMm7t3DtpnojauLQzab+zgkt3U/acAZkIA7TIePACMURfj5
 hIVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=DQ+V1IeSmPQO9wkH9m1UPFVySzxnNCk5Wge4L88LvqI=;
 b=Wc1JsCU5w6i5BKhplDy+NRRqU8M6RNX1X6zZV8WqCcZcLwwU06ukOMurJYgJsDXco8
 V5mTFWCU5g0ZY63pPyib4lOiYAvnWlJwJbxA1xuyjS6n4vtyNkSU23AsSfXJ0Vahc+i3
 htNWfqyURF4NSbUL87iq8O0ZwrMDIthavg4pJ6OmQB9ocnBNbbzxj8u2tXbFTOtfSMhT
 9lJq1LkKreA6995sFAHLnuSVihrYTMLGy0gN87gFcZ7hK7c6EZtm7l5z1ANrtj0oKnV+
 A02t6YuitLHp4kLJgnvZiIzAKtq+ihFz/CbAisdSLteO754eKP0HoGq5S9C4aeQutjlk
 6OLg==
X-Gm-Message-State: ANhLgQ05/xyBFh+oZsHyiyFIolbhv3jG/pKVMwplwJRMLGg2gbDHbWJc
 VyWYXaWsPplD8/086FF1VmdTFalaegjhTQ==
X-Google-Smtp-Source: ADFU+vt5o1YUKRBnfj7lBa1ij+K9BW2EHcyy2plPPp+i5PiKcrxaXSuIi1rqNSQXkqKw6qJk15uDbw==
X-Received: by 2002:a2e:998f:: with SMTP id w15mr49100lji.58.1583495273573;
 Fri, 06 Mar 2020 03:47:53 -0800 (PST)
Received: from localhost ([93.175.11.132])
 by smtp.gmail.com with ESMTPSA id s8sm18949689ljs.45.2020.03.06.03.47.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2020 03:47:53 -0800 (PST)
Date: Fri, 6 Mar 2020 14:47:49 +0300
From: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
To: "Chenqun (kuhn)" <kuhn.chenqun@huawei.com>
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, Zhanghailiang <zhang.zhanghailiang@huawei.com>
Subject: Re: [PATCH] contrib/elf2dmp: prevent uninitialized warning
Message-ID: <20200306144749.64f08e84@phystech.edu>
In-Reply-To: <7412CDE03601674DA8197E2EBD8937E83B66F9DA@dggemm531-mbx.china.huawei.com>
References: <20200207041601.89668-1-kuhn.chenqun@huawei.com>
 <20200305215902.24bbe6ce@phystech.edu>
 <7412CDE03601674DA8197E2EBD8937E83B66F9DA@dggemm531-mbx.china.huawei.com>
Organization: MIPT
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::243
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
X-List-Received-Date: Fri, 06 Mar 2020 11:47:59 -0000

On Fri, 6 Mar 2020 02:18:07 +0000
"Chenqun (kuhn)" <kuhn.chenqun@huawei.com> wrote:

> >-----Original Message-----
> >From: Viktor Prutyanov [mailto:viktor.prutyanov@phystech.edu]
> >Sent: Friday, March 6, 2020 2:59 AM
> >To: Chenqun (kuhn) <kuhn.chenqun@huawei.com>
> >Cc: qemu-devel@nongnu.org; pbonzini@redhat.com; Zhanghailiang
> ><zhang.zhanghailiang@huawei.com>; qemu-trivial@nongnu.org
> >Subject: Re: [PATCH] contrib/elf2dmp: prevent uninitialized warning
> >
> >On Fri, 7 Feb 2020 12:16:01 +0800
> ><kuhn.chenqun@huawei.com> wrote:
> > =20
> >> From: Chen Qun <kuhn.chenqun@huawei.com>
> >>
> >> Fix compilation warnings:
> >> contrib/elf2dmp/main.c:66:17: warning: =E2=80=98KdpDataBlockEncoded=E2=
=80=99 may be
> >> used uninitialized in this function [-Wmaybe-uninitialized]
> >>          block =3D __builtin_bswap64(block ^ kdbe) ^ kwa;
> >>                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >> contrib/elf2dmp/main.c:78:24: note: =E2=80=98KdpDataBlockEncoded=E2=80=
=99 was
> >> declared here uint64_t kwn, kwa, KdpDataBlockEncoded;
> >>                         ^~~~~~~~~~~~~~~~~~~
> >>
> >> Reported-by: Euler Robot <euler.robot@huawei.com>
> >> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
> >> ---
> >>  contrib/elf2dmp/main.c | 25 ++++++++++++-------------
> >>  1 file changed, 12 insertions(+), 13 deletions(-)
> >>
> >> diff --git a/contrib/elf2dmp/main.c b/contrib/elf2dmp/main.c index
> >> 9a2dbc2902..203b9e6d04 100644
> >> --- a/contrib/elf2dmp/main.c
> >> +++ b/contrib/elf2dmp/main.c
> >> @@ -76,6 +76,7 @@ static KDDEBUGGER_DATA64 *get_kdbg(uint64_t
> >> KernBase, struct pdb_reader *pdb, DBGKD_DEBUG_DATA_HEADER64 =20
> >kdbg_hdr; =20
> >>      bool decode =3D false;
> >>      uint64_t kwn, kwa, KdpDataBlockEncoded;
> >> +    uint64_t KiWaitNever, KiWaitAlways;
> >>
> >>      if (va_space_rw(vs,
> >>                  KdDebuggerDataBlock + offsetof(KDDEBUGGER_DATA64,
> >> Header), @@ -84,21 +85,19 @@ static KDDEBUGGER_DATA64
> >> *get_kdbg(uint64_t KernBase, struct pdb_reader *pdb, return NULL;
> >>      }
> >>
> >> -    if (memcmp(&kdbg_hdr.OwnerTag, OwnerTag, sizeof(OwnerTag))) {
> >> -        uint64_t KiWaitNever, KiWaitAlways;
> >> -
> >> -        decode =3D true;
> >> +    if (!SYM_RESOLVE(KernBase, pdb, KiWaitNever) ||
> >> +            !SYM_RESOLVE(KernBase, pdb, KiWaitAlways) ||
> >> +            !SYM_RESOLVE(KernBase, pdb, KdpDataBlockEncoded)) {
> >> +        return NULL;
> >> +    }
> >>
> >> -        if (!SYM_RESOLVE(KernBase, pdb, KiWaitNever) ||
> >> -                !SYM_RESOLVE(KernBase, pdb, KiWaitAlways) ||
> >> -                !SYM_RESOLVE(KernBase, pdb, KdpDataBlockEncoded))
> >> {
> >> -            return NULL;
> >> -        }
> >> +    if (va_space_rw(vs, KiWaitNever, &kwn, sizeof(kwn), 0) ||
> >> +            va_space_rw(vs, KiWaitAlways, &kwa, sizeof(kwa), 0)) {
> >> +        return NULL;
> >> +    }
> >>
> >> -        if (va_space_rw(vs, KiWaitNever, &kwn, sizeof(kwn), 0) ||
> >> -                va_space_rw(vs, KiWaitAlways, &kwa, sizeof(kwa),
> >> 0)) {
> >> -            return NULL;
> >> -        }
> >> +    if (memcmp(&kdbg_hdr.OwnerTag, OwnerTag, sizeof(OwnerTag))) {
> >> +        decode =3D true;
> >>
> >>          printf("[KiWaitNever] =3D 0x%016"PRIx64"\n", kwn);
> >>          printf("[KiWaitAlways] =3D 0x%016"PRIx64"\n", kwa); =20
> >
> >Hi!
> >
> >I suppose the problem is in your compiler, because kdbg_decode() is
> >only used when KdpDataBlockEncoded is already initialized by
> >SYM_RESOLVE().
> > =20
> Hi  Viktor,
>=20
>        I know it's actually initialized when  'decode =3D true;',
> otherwise ' return kdbg;'  no need to initialize.=20
>      But usually the compiler cannot understand it, because it seems
> that the initialization is only in the if() statement.

As for me, my GCC 9.2.1 doesn't show any warning while building elf2dmp.

> If we put the initialization outside the if() statement, it might
> looks better without affecting the functionality ?

For now, your original patch affects the functionality. The utility
tries to resolve symbols as little as possible during conversion,
because we don't know exactly how Windows kernel works. This is the
reason why KDBG header should be checked before resolving 3 symbols.

>=20
> Thanks.
> >--
> >Viktor Prutyanov =20



--=20
Viktor Prutyanov

