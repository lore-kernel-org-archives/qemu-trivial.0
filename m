Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j9uAz-0002LT-TM
	for mharc-qemu-trivial@gnu.org; Thu, 05 Mar 2020 12:20:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40225)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j9uAx-0002HA-BA
 for qemu-trivial@nongnu.org; Thu, 05 Mar 2020 12:20:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j9uAw-0003Iu-73
 for qemu-trivial@nongnu.org; Thu, 05 Mar 2020 12:20:47 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:31344
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j9uAw-0003HC-3Q
 for qemu-trivial@nongnu.org; Thu, 05 Mar 2020 12:20:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583428845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dLkB9BSm7Is6yJ0510IOvVsMgRVA2lYlOEvMCiPgrwI=;
 b=ABjERMJXMx0UEaVmbjZIIcKNViQ41EUD7zvqZcEzg46ifZFmW2qv/PmzOAQAT03PjNsIhH
 wfgujvTPJDTb1vVrUCKAezsXHMVZdjnshh/SmuwavVHXlFkxrNaxnbQB8chQSJaGWT1UCf
 CDAiXf/GBEH9FdFacfLNx5+FzUQFVAA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-8KerrNiMMimRlwpaZH1bHQ-1; Thu, 05 Mar 2020 12:20:43 -0500
X-MC-Unique: 8KerrNiMMimRlwpaZH1bHQ-1
Received: by mail-wr1-f72.google.com with SMTP id w6so2550011wrm.16
 for <qemu-trivial@nongnu.org>; Thu, 05 Mar 2020 09:20:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dLkB9BSm7Is6yJ0510IOvVsMgRVA2lYlOEvMCiPgrwI=;
 b=DMu9opKaPvyi2H/xM+32/ZaE6wuwATlAvgmbfmMMpJlCfVWtQrTJx0JWtCdEPp85zT
 4bIFLglab8mhAcWnFtvaC6mPPJT/Bs9oRTsxQMMySOIzsxrC3p/4bDTqi+k3ZwT61FtH
 JKx/5Lle5WoctW2HiOSpcJwk0ha0YEFbs+CKvOSTCcY10yARdAK6NoYde6hpTKO7/+6q
 MDj3z3vS2gdITryPO18dLgeRKRr9VWq6t7eh+3RLEc/TJIPIHWE7NkwMwTUy8d08rBtu
 7gqGrOT7yhVgPkgolV6xGrgEbAfhhNfgqJHxe9ftUB9WY9Wg5V0SGvAVrbnOQ+GQCaRZ
 1r8g==
X-Gm-Message-State: ANhLgQ0Y64CjiGS4emE/GAVEbhvIMrvZe//DS9JPjKPFP5c2kjs2gK2x
 MOYudsgGTo5qTWTSRgS2o+k7vxbr0s/grdoTocspoDf8aD4sApqvzrFUW/rR9xvejAVPdZvpHqm
 SkxEE8wKC6/9lcfFMPttlMVcKUBsoFFthZg==
X-Received: by 2002:a7b:ca55:: with SMTP id m21mr10644563wml.162.1583428842518; 
 Thu, 05 Mar 2020 09:20:42 -0800 (PST)
X-Google-Smtp-Source: ADFU+vsDv7+ycUAaUOWYb2OGm5L5VPnf3T9wqIt5vfbbAL5YXY9uzfsn5W3Zr1qa7SQnVZaZuoQMy/0TiVnC27tmMpI=
X-Received: by 2002:a7b:ca55:: with SMTP id m21mr10644540wml.162.1583428842269; 
 Thu, 05 Mar 2020 09:20:42 -0800 (PST)
MIME-Version: 1.0
References: <20200305164839.201311-1-palmerdabbelt@google.com>
 <cfc728aa-56a5-6a2d-a997-e1dfd871885c@redhat.com>
In-Reply-To: <cfc728aa-56a5-6a2d-a997-e1dfd871885c@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Date: Thu, 5 Mar 2020 18:20:31 +0100
Message-ID: <CAP+75-XPHkSkcOmLct=jerOPx_WmYTc6a-=f2LfvtFku_p1WBw@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Add a missing "," in riscv_excp_names
To: Palmer Dabbelt <palmerdabbelt@google.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
X-List-Received-Date: Thu, 05 Mar 2020 17:20:48 -0000

Cc'ing qemu-trivial@ in case there is a pending PR in  progress, it
might get merged quicker.

On Thu, Mar 5, 2020 at 6:19 PM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om> wrote:
>
> On 3/5/20 5:48 PM, Palmer Dabbelt wrote:
> > THis would almost certainly cause the exception names to be reported
> > incorrectly.  Covarity found the issue (CID 1420223).  As per Peter's
>
> "This", "Coverity" typos.
>
> Fixes: ab67a1d07a4
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>
> > suggestion, I've also added a comma at the end of the list to avoid the=
 issue
> > reappearing in the future.
> >
> > Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
> > ---
> >   target/riscv/cpu.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index c47d10b739..c0b7023100 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -66,7 +66,7 @@ const char * const riscv_excp_names[] =3D {
> >       "exec_page_fault",
> >       "load_page_fault",
> >       "reserved",
> > -    "store_page_fault"
> > +    "store_page_fault",
> >       "reserved",
> >       "reserved",
> >       "reserved",
> > @@ -74,7 +74,7 @@ const char * const riscv_excp_names[] =3D {
> >       "guest_exec_page_fault",
> >       "guest_load_page_fault",
> >       "reserved",
> > -    "guest_store_page_fault"
> > +    "guest_store_page_fault",
> >   };
> >
> >   const char * const riscv_intr_names[] =3D {
> >


