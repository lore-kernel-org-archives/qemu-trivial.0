Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hlvvU-0007pf-RF
	for mharc-qemu-trivial@gnu.org; Fri, 12 Jul 2019 09:49:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60072)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hlvvS-0007pL-OZ
 for qemu-trivial@nongnu.org; Fri, 12 Jul 2019 09:49:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hlvvR-0006Jm-Jz
 for qemu-trivial@nongnu.org; Fri, 12 Jul 2019 09:49:26 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:36433)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hlvvR-0006J3-CX
 for qemu-trivial@nongnu.org; Fri, 12 Jul 2019 09:49:25 -0400
Received: by mail-ot1-x342.google.com with SMTP id r6so9509120oti.3
 for <qemu-trivial@nongnu.org>; Fri, 12 Jul 2019 06:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=fbn8G26cboF8xKkdv/2z9l8bJWzPj2pB0FAG8zPAuFI=;
 b=kHKs3Mip0gaKLAzeh2UcQE8CI0xxl9oJ8U2xJ3aLe2elG3j7PaqIaDT/bFZLu8ek43
 ASdKUk7ChGwrUYGME7GCC7/00CmXeZSl14cLiPwri2HzIAnGYkuOkevazMu/vvbC1hXV
 g7r88diYq1kpKfznZ4mlYqrUGeXI8yeANp+K2vWxgpcTaOVBu5o4LKujW7E9C08gOjtx
 duAsJlMcmI2yWSx1yKAb/E4jCcnkPC+CJX+/6MQ1NaD8igZJ2xmLO1K8fMpgEWIYcoLk
 cGAlcCEhrnUBlqV1gv74oeSVQz1eiNn5gG+Yg3X1isdMMJS7MB4uLILnIBf9HpFGAWnf
 XfsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fbn8G26cboF8xKkdv/2z9l8bJWzPj2pB0FAG8zPAuFI=;
 b=VqVbWDY5DFZcsoGVeehkFNuZ0XpfpNSjhEpHsCeOU4Yf+q+RdMHmyPFmOUCRxVYW9f
 WhdDlYPaqJ7o/E92o0wkjXscJEoLgvBoGJs7Npe5D1GOoobHjpDrvrSc/rX+N+PAkgpA
 BFxWY6fBKaX6OLmJt6RDm1eapzX77By3ox4oc3o/E73zcZXAWD/OZXC3RP8MtuHGkPp5
 Pd9g/X0y34tzGJ56wB/iZm2AU8q89nIGkmJqEHv3vHdzCNQBIZwWXE0J7slJ/LPURbg/
 YpHTi5LBbIfw0WAvUhf8sZQzZyXIOnZqmOsHbz4bjI3B0wwQ8IE/lCCI4o1sYW9ouYVh
 0Reg==
X-Gm-Message-State: APjAAAW4qbQlbqVvzJQd0pbqVYCHuRb+Vk/M4y9yXRU/UCtzWSVgAxZX
 mHNDn+mCcCaL0A/PPFIu20a3ZSxWz9Vv8PrspH2SUw==
X-Google-Smtp-Source: APXvYqzVWktfX1KGrg7ytq3LSTNc2k97oEPP3jpBHpZSemibQbTQ2heQkbPlHq6OPkpz1/nsJ0jblXDZZjdt3PlsV7Q=
X-Received: by 2002:a9d:6a0f:: with SMTP id g15mr3377614otn.135.1562939364395; 
 Fri, 12 Jul 2019 06:49:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190712134307.31112-1-sw@weilnetz.de>
In-Reply-To: <20190712134307.31112-1-sw@weilnetz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Jul 2019 14:49:13 +0100
Message-ID: <CAFEAcA9M_jPad==BzrbXJmHD5xf6EJZF+Eq2ohJ_R78BmRdvDw@mail.gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, 
 Eduardo Habkost <ehabkost@redhat.com>, Like Xu <like.xu@linux.intel.com>, 
 Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] Remove old global
 variables max_cpus and smp_cpus
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
X-List-Received-Date: Fri, 12 Jul 2019 13:49:27 -0000

On Fri, 12 Jul 2019 at 14:43, Stefan Weil <sw@weilnetz.de> wrote:
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
> v2: Remove also max_cpus (merci =C3=A0 Laurent Vivier <laurent@vivier.eu>=
)
>
>  include/sysemu/sysemu.h | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
> index 984c439ac9..e70edf7c1c 100644
> --- a/include/sysemu/sysemu.h
> +++ b/include/sysemu/sysemu.h
> @@ -103,8 +103,6 @@ extern const char *keyboard_layout;
>  extern int win2k_install_hack;
>  extern int alt_grab;
>  extern int ctrl_grab;
> -extern int smp_cpus;
> -extern unsigned int max_cpus;
>  extern int cursor_hide;
>  extern int graphic_rotate;
>  extern int no_quit;

Hi -- this looks like an inadvertent duplicate of Alex's
patch from yesterday:

https://patchew.org/QEMU/20190711130546.18578-1-alex.bennee@linaro.org/

thanks
-- PMM

