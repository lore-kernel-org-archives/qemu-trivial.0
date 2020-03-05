Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j9vnj-0007Xo-CI
	for mharc-qemu-trivial@gnu.org; Thu, 05 Mar 2020 14:04:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57413)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <viktor.prutyanov@phystech.edu>) id 1j9viC-0004iZ-9K
 for qemu-trivial@nongnu.org; Thu, 05 Mar 2020 13:59:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <viktor.prutyanov@phystech.edu>) id 1j9vi9-0000JC-LU
 for qemu-trivial@nongnu.org; Thu, 05 Mar 2020 13:59:10 -0500
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244]:40840)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <viktor.prutyanov@phystech.edu>)
 id 1j9vi9-0000Fu-4Q
 for qemu-trivial@nongnu.org; Thu, 05 Mar 2020 13:59:09 -0500
Received: by mail-lj1-x244.google.com with SMTP id 143so7292183ljj.7
 for <qemu-trivial@nongnu.org>; Thu, 05 Mar 2020 10:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phystech-edu.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :organization:mime-version:content-transfer-encoding;
 bh=6ctMZbT0iX5dwuANiokz+Sby/9fJ8AvTdWSX4ROvYbg=;
 b=Gcr/mDzZuAsJurFgzb/OEw0IXr8qAmLvjqRk41k+Cg3KKIjbZAbjlcxElwJE3zY2M2
 5EEjmZ2hwASG4IXVBAWhZn0YaoDL7vAhocHD/CGpQIllYkvr/6vGBvmKhq8YjbWi4i3B
 fHaLULRf60xBfuwggFU+vgGuGpqtLdGzp65Zlb6QsScFiVpmJMdVG+LEiFQyEKEqjY+f
 Qqmj7GWlzzV22eSNsaEEzummn6M9vYDSxQMiv7eMQTO+Wdc232JesKX4daL/Niamp/qi
 3vmimgdgJ2RuB0wUCzG8sqqSQ339Bc0DNW48ya1cbHUSGDDzn77Hibc8E7tAa2Ye3fTJ
 Ohyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=6ctMZbT0iX5dwuANiokz+Sby/9fJ8AvTdWSX4ROvYbg=;
 b=SNgoqYuxteuBIvgn8S2Yo63yiBj+mGBMKGZ+idMl7Q9sfLgBt4V3+I9gXUtI4CqtOU
 yady91oZuikgxy9xNhz3tG1yF828R0gq6YzkYKpseibZiR83PwLm9NtGeaOTJJc7MzTL
 IL0z6nFZwvoAu5us2+SMsLSRLwqoVSuQRv6x0qypFp3uSg4Y8nR5im917Hx4f8EjqUuW
 ebF8RdYKc/8PWkM1xQG6qZ8o2mfox73laYxLyygwZ8PASskIL5QYePgzMe/9ucCcMUc+
 iVIyuj9DI1k7O/BGhn/Zo/22ZphBefNLOIJE7uDbEYi7W2nEFOby2NHn/XCHRCWZ+Uwe
 2NFg==
X-Gm-Message-State: ANhLgQ1Myp/0/MLRGkGD57cSgx6VVGkjMbbyhzK8Yi1f+lpe/9f1G14W
 uK/yMksJsF8RUfwqbbBd8UJS0A==
X-Google-Smtp-Source: ADFU+vvYP15BC4RlolCUBDWr9rDG22YG6kSKpnGmFbIoJmfPEasONKjyo0NgkhBDVI5KqlXv7/oxBQ==
X-Received: by 2002:a2e:9110:: with SMTP id m16mr6072280ljg.42.1583434746956; 
 Thu, 05 Mar 2020 10:59:06 -0800 (PST)
Received: from localhost ([93.175.11.132])
 by smtp.gmail.com with ESMTPSA id j6sm15718532lfk.88.2020.03.05.10.59.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 10:59:06 -0800 (PST)
Date: Thu, 5 Mar 2020 21:59:02 +0300
From: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
To: <kuhn.chenqun@huawei.com>
Cc: <qemu-devel@nongnu.org>, <pbonzini@redhat.com>,
 <zhang.zhanghailiang@huawei.com>, <qemu-trivial@nongnu.org>
Subject: Re: [PATCH] contrib/elf2dmp: prevent uninitialized warning
Message-ID: <20200305215902.24bbe6ce@phystech.edu>
In-Reply-To: <20200207041601.89668-1-kuhn.chenqun@huawei.com>
References: <20200207041601.89668-1-kuhn.chenqun@huawei.com>
Organization: MIPT
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::244
X-Mailman-Approved-At: Thu, 05 Mar 2020 14:04:53 -0500
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
X-List-Received-Date: Thu, 05 Mar 2020 18:59:13 -0000

On Fri, 7 Feb 2020 12:16:01 +0800
<kuhn.chenqun@huawei.com> wrote:

> From: Chen Qun <kuhn.chenqun@huawei.com>
>=20
> Fix compilation warnings:
> contrib/elf2dmp/main.c:66:17: warning: =E2=80=98KdpDataBlockEncoded=E2=80=
=99 may be
> used uninitialized in this function [-Wmaybe-uninitialized]
>          block =3D __builtin_bswap64(block ^ kdbe) ^ kwa;
>                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> contrib/elf2dmp/main.c:78:24: note: =E2=80=98KdpDataBlockEncoded=E2=80=99=
 was
> declared here uint64_t kwn, kwa, KdpDataBlockEncoded;
>                         ^~~~~~~~~~~~~~~~~~~
>=20
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
> ---
>  contrib/elf2dmp/main.c | 25 ++++++++++++-------------
>  1 file changed, 12 insertions(+), 13 deletions(-)
>=20
> diff --git a/contrib/elf2dmp/main.c b/contrib/elf2dmp/main.c
> index 9a2dbc2902..203b9e6d04 100644
> --- a/contrib/elf2dmp/main.c
> +++ b/contrib/elf2dmp/main.c
> @@ -76,6 +76,7 @@ static KDDEBUGGER_DATA64 *get_kdbg(uint64_t
> KernBase, struct pdb_reader *pdb, DBGKD_DEBUG_DATA_HEADER64 kdbg_hdr;
>      bool decode =3D false;
>      uint64_t kwn, kwa, KdpDataBlockEncoded;
> +    uint64_t KiWaitNever, KiWaitAlways;
> =20
>      if (va_space_rw(vs,
>                  KdDebuggerDataBlock + offsetof(KDDEBUGGER_DATA64,
> Header), @@ -84,21 +85,19 @@ static KDDEBUGGER_DATA64
> *get_kdbg(uint64_t KernBase, struct pdb_reader *pdb, return NULL;
>      }
> =20
> -    if (memcmp(&kdbg_hdr.OwnerTag, OwnerTag, sizeof(OwnerTag))) {
> -        uint64_t KiWaitNever, KiWaitAlways;
> -
> -        decode =3D true;
> +    if (!SYM_RESOLVE(KernBase, pdb, KiWaitNever) ||
> +            !SYM_RESOLVE(KernBase, pdb, KiWaitAlways) ||
> +            !SYM_RESOLVE(KernBase, pdb, KdpDataBlockEncoded)) {
> +        return NULL;
> +    }
> =20
> -        if (!SYM_RESOLVE(KernBase, pdb, KiWaitNever) ||
> -                !SYM_RESOLVE(KernBase, pdb, KiWaitAlways) ||
> -                !SYM_RESOLVE(KernBase, pdb, KdpDataBlockEncoded)) {
> -            return NULL;
> -        }
> +    if (va_space_rw(vs, KiWaitNever, &kwn, sizeof(kwn), 0) ||
> +            va_space_rw(vs, KiWaitAlways, &kwa, sizeof(kwa), 0)) {
> +        return NULL;
> +    }
> =20
> -        if (va_space_rw(vs, KiWaitNever, &kwn, sizeof(kwn), 0) ||
> -                va_space_rw(vs, KiWaitAlways, &kwa, sizeof(kwa), 0))
> {
> -            return NULL;
> -        }
> +    if (memcmp(&kdbg_hdr.OwnerTag, OwnerTag, sizeof(OwnerTag))) {
> +        decode =3D true;
> =20
>          printf("[KiWaitNever] =3D 0x%016"PRIx64"\n", kwn);
>          printf("[KiWaitAlways] =3D 0x%016"PRIx64"\n", kwa);

Hi!

I suppose the problem is in your compiler, because kdbg_decode() is
only used when KdpDataBlockEncoded is already initialized by
SYM_RESOLVE().=20

--=20
Viktor Prutyanov

