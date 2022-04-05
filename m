Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nbhrP-0004e8-RA
	for mharc-qemu-trivial@gnu.org; Tue, 05 Apr 2022 08:00:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nbhrO-0004be-MA
 for qemu-trivial@nongnu.org; Tue, 05 Apr 2022 08:00:34 -0400
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29]:39614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nbhrL-00013d-BH
 for qemu-trivial@nongnu.org; Tue, 05 Apr 2022 08:00:34 -0400
Received: by mail-yb1-xb29.google.com with SMTP id x21so16714022ybd.6
 for <qemu-trivial@nongnu.org>; Tue, 05 Apr 2022 05:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=jsL3SaC+BvHWkRuT9Z1eWf1K2DKZ+te7EBJvcTxyINU=;
 b=DnNMzoLp2iCX4x8Iat5fPqxJkVU+zXwLqEyK3DZyghrj79Ro/cpdLR52NL67blGOcO
 tb+kLlFOG/QBD9ZYeXCBBluqDaLN03OWVwGlJZxDjclhysfipDTbBGWVSQpuFDFMpm2H
 ZOxmIS4wHeJtYMxoPXLK24DD2cxob10aPamSVVOJFjq9iyb9dZ+YZCprqs72hrh3jpof
 4zOm6LliLVWPJJBxRtjwQ6uTIlZYcebcRFhKaJ0s3jatMgI3mHwUy5d6ylrSlMV6Wvf5
 8cz8Ol463ck5X1dR40gpdQZJO/8bAc1XJV5BrkTqJTmZam8wOpsh9ub9Qjlj7vh9V5c6
 YA4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jsL3SaC+BvHWkRuT9Z1eWf1K2DKZ+te7EBJvcTxyINU=;
 b=hHG45tMujuNeYlw6Jya6eZMHqFqWWxwIVQUe4hHH9umvaqHRZUIZtzKeQEGwfxw75z
 H9bOAYLNw+P/+B+9FaZZtH6we5c0HBCHq+1DmtzgJsK/hTFMvq2uCHhIN1ZWKIpgIXix
 dV1drsn2zfc5TWYTJ7xkjysg2vMm25Gxexf53q449niTfG99oWXPBCBFgrteGyWJiK45
 90K9s635U1FUUNp+1gyv093BbBDqLbNpx9Rrt/nOeP6qNops1QIgSI1jPyiz7vV4BCHi
 3qXk63XKwLUBdaPdXilPdFTHTJpk51QKEaR7xC8ydVsFEVvHbJ6sWeq4wZ44xotbEwv0
 8GjQ==
X-Gm-Message-State: AOAM532L1FtDHh/Ewvyv2gXz8WW5hgwQOWnS9jBGQ/aaf7s2W4+krFK7
 6sudWF7q1Iv2fGjSrJaK2bazIFVmxFxgDx3Uk7hMsQ==
X-Google-Smtp-Source: ABdhPJziIX5xaBDtvEKG7/QKjfqVUygKMtzuYV8UZflMywe/H7T3oyWRB0/RscBfxer8JaFNazKhFi7u14sOvCKt4yg=
X-Received: by 2002:a25:cdc8:0:b0:633:8aa6:6a3 with SMTP id
 d191-20020a25cdc8000000b006338aa606a3mr2149503ybf.288.1649160030136; Tue, 05
 Apr 2022 05:00:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220405112838.15360-1-shentey@gmail.com>
In-Reply-To: <20220405112838.15360-1-shentey@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 5 Apr 2022 13:00:19 +0100
Message-ID: <CAFEAcA-uyzmOk87QDwUGW8iFKiB7V0zp-8OUhL88aWkdQUROfw@mail.gmail.com>
Subject: Re: [PATCH] hw/ppc/ppc405_boards: Initialize g_autofree pointer
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, 
 "open list:405 ref405ep and..." <qemu-ppc@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 05 Apr 2022 12:00:35 -0000

On Tue, 5 Apr 2022 at 12:32, Bernhard Beschow <shentey@gmail.com> wrote:
>
> Resolves the only compiler warning when building a full QEMU under Arch L=
inux:
>
>   Compiling C object libqemu-ppc-softmmu.fa.p/hw_ppc_ppc405_boards.c.o
>   In file included from /usr/include/glib-2.0/glib.h:114,
>                    from qemu/include/glib-compat.h:32,
>                    from qemu/include/qemu/osdep.h:132,
>                    from ../src/hw/ppc/ppc405_boards.c:25:
>   ../src/hw/ppc/ppc405_boards.c: In function =E2=80=98ref405ep_init=E2=80=
=99:
>   /usr/include/glib-2.0/glib/glib-autocleanups.h:28:3: warning: =E2=80=98=
filename=E2=80=99 may be used uninitialized in this function [-Wmaybe-unini=
tialized]
>      28 |   g_free (*pp);
>         |   ^~~~~~~~~~~~
>   ../src/hw/ppc/ppc405_boards.c:265:26: note: =E2=80=98filename=E2=80=99 =
was declared here
>     265 |         g_autofree char *filename;
>         |                          ^~~~~~~~
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  hw/ppc/ppc405_boards.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
> index 7e1a4ac955..326353ea25 100644
> --- a/hw/ppc/ppc405_boards.c
> +++ b/hw/ppc/ppc405_boards.c
> @@ -262,7 +262,7 @@ static void ref405ep_init(MachineState *machine)
>      /* allocate and load BIOS */
>      if (machine->firmware) {
>          MemoryRegion *bios =3D g_new(MemoryRegion, 1);
> -        g_autofree char *filename;
> +        g_autofree char *filename =3D NULL;
>          long bios_size;
>
>          memory_region_init_rom(bios, NULL, "ef405ep.bios", BIOS_SIZE,

The compiler's wrong here, because there's no way to get to the free
without passing through the actual initialization:

        filename =3D qemu_find_file(QEMU_FILE_TYPE_BIOS, machine->firmware)=
;

I think I would prefer a fix which hoisted that up to the declaration,
rather than setting it to NULL and then unconditionally overwriting that
(which some future compiler version might notice and warn about):

 g_autofree char *filename =3D qemu_find_file(QEMU_FILE_TYPE_BIOS,
machine->firmware);

thanks
-- PMM

