Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kSI8g-00013j-4D
	for mharc-qemu-trivial@gnu.org; Tue, 13 Oct 2020 07:06:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kSI8c-00010D-8t
 for qemu-trivial@nongnu.org; Tue, 13 Oct 2020 07:06:38 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:33314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kSI8X-0007Qf-VZ
 for qemu-trivial@nongnu.org; Tue, 13 Oct 2020 07:06:37 -0400
Received: by mail-ej1-x632.google.com with SMTP id c22so27692686ejx.0
 for <qemu-trivial@nongnu.org>; Tue, 13 Oct 2020 04:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/C126p7BpyaMEvADAJEjb+nfleY5q/1Dy/V1iZCjhgc=;
 b=NKW4A69zb5D/Tg3iY4dd3p35TIzs+jf4xN8ZdljBEC8s2rct/SMTYDY6FdErSQsTKw
 J2ocStDK1joJVn1klDjoLnjxVTejdpNX+XFGrN4r5zCv5q8Jda6twNr9L3sMhnJFPKoL
 Vrr+BpLKY4sTCx1JXST9DsPDIsaWu3GI+fbE5GvJ2QYGZbywzule2bkZZpytXmb5V4Cg
 D8XtzPBWNeVRMEOQUJdDsAcipRsYVTTOmOLsNFIyYX6aSEKyDqro+tIux+jJRvWBRlej
 h58jkxkHlBp57yLzAEndt13KwON0mdRfSxjaOw8K3CBBBDt/tnf4uo2dwnJfBjc8Cv/A
 VnsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/C126p7BpyaMEvADAJEjb+nfleY5q/1Dy/V1iZCjhgc=;
 b=byANO4LZ36cml219/yLG9fmYtbM3khFeIl1ahpj4GkOmDgeZClcFN5x1rmnRHstt/V
 CidDhsAh6nBhoVt4p7xyzqZc6dspcyy9DurQXuBDZAS3T/43RXRlWdD99+ZYhKB1iNxZ
 pXsm2paBEfRS+EmcGszAxxjuxvKwK2X1zqWRtiRBjxFhvVz360vUJ3vZP3FMClr6HYBq
 Ubl4uCkkL85DWiZAwR/yrYSaHHJr3HopyxgYoysVOKP/njdbVt/VlCqQoqvrCFIAX4iL
 2zX3lV6OyB9LmA7qusI8Px1YES3iL4OH/tWAJ4fL/fF4lD1KwjfRTx/b97DOs2pnBfBt
 SDzQ==
X-Gm-Message-State: AOAM530mP8itORtVGmUrdp5QZmnCgtCagh6oFqt2i4iyfg2me1YlRJTY
 Yj3yDX900nGl2HfvPGfGB/bEToiva/H5C166ojbUrQ==
X-Google-Smtp-Source: ABdhPJyxZbZn4hFA7PFB0IeloYL0WNDTzzHRPJmSnwMoVuyxkFVLlYBRts6qwJ8K3xASjqNkGk0RFf6GPkchVCjC+5U=
X-Received: by 2002:a17:906:c7d9:: with SMTP id
 dc25mr32156139ejb.482.1602587191266; 
 Tue, 13 Oct 2020 04:06:31 -0700 (PDT)
MIME-Version: 1.0
References: <20201013065313.7349-1-laurent@vivier.eu>
In-Reply-To: <20201013065313.7349-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Oct 2020 12:06:20 +0100
Message-ID: <CAFEAcA81HdRLh25MoC+=ZS7TERAzbZt_Ns+-Lp=oZFL69nMsoA@mail.gmail.com>
Subject: Re: [PULL 00/15] Trivial branch for 5.2 patches
To: Laurent Vivier <laurent@vivier.eu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Tue, 13 Oct 2020 11:06:38 -0000

On Tue, 13 Oct 2020 at 07:56, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit 2387df497b4b4bcf754eb7398edca82889e2ef=
54:
>
>   Merge remote-tracking branch 'remotes/armbru/tags/pull-qapi-2020-10-10'=
 int=3D
> o staging (2020-10-12 11:29:42 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu.git tags/trivial-branch-for-5.2-pull-reque=
st
>
> for you to fetch changes up to ef3a1d9fc36140f8933fbced70ee21fd9740b33c:
>
>   meson.build: drop duplicate 'sparc64' entry (2020-10-12 23:11:32 +0200)
>
> ----------------------------------------------------------------
> Trivial Patches Pull request 20201013
>
> ----------------------------------------------------------------

Compile failure on ppc64be:

../../hw/rtc/twl92230.c: In function =E2=80=98menelaus_rx=E2=80=99:
../../hw/rtc/twl92230.c:289:23: error: array subscript is above array
bounds [-Werror=3Darray-bounds]
         return s->dcdc[addr - MENELAUS_VCORE_CTRL1];
                       ^
cc1: all warnings being treated as errors

thanks
-- PMM

