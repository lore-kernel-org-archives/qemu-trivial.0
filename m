Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1koWdS-0004cC-8N
	for mharc-qemu-trivial@gnu.org; Sun, 13 Dec 2020 14:02:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1koWdP-0004aO-PY
 for qemu-trivial@nongnu.org; Sun, 13 Dec 2020 14:02:19 -0500
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:43605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1koWdJ-0006jQ-6b
 for qemu-trivial@nongnu.org; Sun, 13 Dec 2020 14:02:19 -0500
Received: by mail-ej1-x641.google.com with SMTP id jx16so19531656ejb.10
 for <qemu-trivial@nongnu.org>; Sun, 13 Dec 2020 11:02:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=buNuIOZbCmq7wBqzmxBcMpet/2vErNoixuf6OJ7tAuU=;
 b=Qk2ou86o42E8B8UdxO0ZyzGzD2+OTJHgAYJ63Ok3+8J+kkcqHHb21QEGmlHYPzUje7
 bhASgbs993aPW1sfvzaOTxwj67+1YvTy+9pTNeKH6XAPFY3ceah67SrfTwKSxtyCebr+
 x0PKmpxDrSLk1qIf4JVai62DeQB+x7BFyGsGaOrYAn8XYBYHMEVMXUnzON48cSrbzma1
 nDA1dZtY12CtSAb33aWgdsNWN7uo08UIKsU20BNHF8OHqCYYEgYb9PX8WrJ/zlN4h+BW
 i3bdX2Y1SEivqnMI8uZQWW7S58xI/E5pob4QpGNRGbXuGIIwoApwAL94/JgBr24jPNwl
 kEoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=buNuIOZbCmq7wBqzmxBcMpet/2vErNoixuf6OJ7tAuU=;
 b=WwRg30CgM64RwhnlSazX1xBymeiqTgJbwCZDrUMfP5NO+AgFBUnDYgtTQ97sF87HmP
 cHClX3PtehXA+pBy9wm6ItwcC/J+1Ud/oDfnL2qU/j5CCw/yNi3wdtveK8OchDR6ACWf
 zCx0JrMAanSPJla1cE2JoV+O9wLS6SsgnMNHygG4cIGvwbqBbBjKq5SEB/swGk6Ir2OA
 mVZu1QcS1+/xUFkrrLG2VzItKOG1bEWCPXViNSy1lwuNI3OOQhkhKtrQIhzPmXFHs/as
 2A5tUZVXUugZXNito0PT/i+1yts6RSnG7QgKQW/F0RDsVFpRRuKH5l9NfOStqtAvVJUO
 RScw==
X-Gm-Message-State: AOAM531z735UnBFSlkbZZ+gu2mGhEux8tRyrYU0N3LUZ9g4MbtYYKw3h
 3ZCUBiaXiyATLbrXP+RBw6x6kKnXi/WHG1YOpIwycw==
X-Google-Smtp-Source: ABdhPJzJBE6/LxUF9CudI6lwM8ErZPZnHfV+UuW2zGiT0EGBo+I9Qjt5/rtkZj9GI1bAYfikgxz+YEzhYBM7arhIy2I=
X-Received: by 2002:a17:906:6b88:: with SMTP id
 l8mr19846783ejr.482.1607886129134; 
 Sun, 13 Dec 2020 11:02:09 -0800 (PST)
MIME-Version: 1.0
References: <20200915171639.1355800-1-f4bug@amsat.org>
 <619d329d-f6b3-1e73-e151-a58e366db15d@amsat.org>
 <3647a01c-0932-3446-9bc7-e138ced496dd@amsat.org>
 <f89e9e7d-5ab3-769a-f3d8-22fc05d80af6@amsat.org>
 <8af60250-2c96-28bd-f05c-ee38e390df1a@vivier.eu>
In-Reply-To: <8af60250-2c96-28bd-f05c-ee38e390df1a@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 13 Dec 2020 19:01:57 +0000
Message-ID: <CAFEAcA-3enD96MsiD95L+dx=VTf9qMHhoe5g7XcLox+WoG=Tfw@mail.gmail.com>
Subject: Re: [PATCH v2] hw/block/nand: Decommission the NAND museum
To: Laurent Vivier <laurent@vivier.eu>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 QEMU Developers <qemu-devel@nongnu.org>, QEMU Trivial <qemu-trivial@nongnu.org>,
 Kevin Wolf <kwolf@redhat.com>, "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Qemu-block <qemu-block@nongnu.org>, Max Reitz <mreitz@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::641;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x641.google.com
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
X-List-Received-Date: Sun, 13 Dec 2020 19:02:20 -0000

On Sun, 13 Dec 2020 at 17:21, Laurent Vivier <laurent@vivier.eu> wrote:
>
> Le 16/10/2020 =C3=A0 18:52, Philippe Mathieu-Daud=C3=A9 a =C3=A9crit :
> > Cc'ing qemu-trivial@ since this patch is reviewed.
> >
> > On 10/15/20 8:12 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> >> ping^2...
> >>
> >> On 10/1/20 7:31 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> >>> ping qemu-block or qemu-arm?
> >>>
> >>> On 9/15/20 7:16 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> >>>> This is the QEMU equivalent of this Linux commit (but 7 years later)=
:
> >>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/c=
ommit/?id=3Df7025a43a9da2
> >>>>
> >>>>      The MTD subsystem has its own small museum of ancient NANDs
> >>>>      in a form of the CONFIG_MTD_NAND_MUSEUM_IDS configuration optio=
n.
> >>>>      The museum contains stone age NANDs with 256 bytes pages, as we=
ll
> >>>>      as iron age NANDs with 512 bytes per page and up to 8MiB page s=
ize.
> >>>>
> >>>>      It is with great sorrow that I inform you that the museum is be=
ing
> >>>>      decommissioned. The MTD subsystem is out of budget for Kconfig
> >>>>      options and already has too many of them, and there is a genera=
l
> >>>>      kernel trend to simplify the configuration menu.
> >>>>
> >>>>      We remove the stone age exhibits along with closing the museum,
> >>>>      but some of the iron age ones are transferred to the regular NA=
ND
> >>>>      depot. Namely, only those which have unique device IDs are
> >>>>      transferred, and the ones which have conflicting device IDs are
> >>>>      removed.
> >>>>
> >>>> The machine using this device are:
> >>>> - axis-dev88
> >>>> - tosa (via tc6393xb_init)
> >>>> - spitz based (akita, borzoi, terrier)
> >>>>
> >>>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> >>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> >>>> ---
> >>>> Peter, as 4 of the 5 machines are ARM-based, can this go via your tr=
ee?
> >>>> ---
> >>>>   hw/block/nand.c | 13 ++++++-------
> >>>>   1 file changed, 6 insertions(+), 7 deletions(-)
> >>>>
> >>>> diff --git a/hw/block/nand.c b/hw/block/nand.c
> >>>> index 5c8112ed5a4..5f01ba2bc44 100644
> >>>> --- a/hw/block/nand.c
> >>>> +++ b/hw/block/nand.c
> >>>> @@ -138,7 +138,7 @@ static void mem_and(uint8_t *dest, const uint8_t=
 *src, size_t n)
> >>>>   # define ADDR_SHIFT        16
> >>>>   # include "nand.c"
> >>>> -/* Information based on Linux drivers/mtd/nand/nand_ids.c */
> >>>> +/* Information based on Linux drivers/mtd/nand/raw/nand_ids.c */
> >>>>   static const struct {
> >>>>       int size;
> >>>>       int width;
> >>>> @@ -154,15 +154,14 @@ static const struct {
> >>>>       [0xe8] =3D { 1,    8,    8, 4, 0 },
> >>>>       [0xec] =3D { 1,    8,    8, 4, 0 },
> >>>>       [0xea] =3D { 2,    8,    8, 4, 0 },
> >>>> -    [0xd5] =3D { 4,    8,    9, 4, 0 },
> >>>>       [0xe3] =3D { 4,    8,    9, 4, 0 },
> >>>>       [0xe5] =3D { 4,    8,    9, 4, 0 },
> >>>> -    [0xd6] =3D { 8,    8,    9, 4, 0 },
> >>>> -    [0x39] =3D { 8,    8,    9, 4, 0 },
> >>>> -    [0xe6] =3D { 8,    8,    9, 4, 0 },
> >>>> -    [0x49] =3D { 8,    16,    9, 4, NAND_BUSWIDTH_16 },
> >>>> -    [0x59] =3D { 8,    16,    9, 4, NAND_BUSWIDTH_16 },
> >>>> +    [0x6b] =3D { 4,        8,        9, 4, 0 },
> >>>> +    [0xe3] =3D { 4,        8,        9, 4, 0 },
> >>>> +    [0xe5] =3D { 4,        8,        9, 4, 0 },
> >>>> +    [0xd6] =3D { 8,        8,        9, 4, 0 },
> >>>> +    [0xe6] =3D { 8,        8,        9, 4, 0 },
> >>>>       [0x33] =3D { 16,    8,    9, 5, 0 },
> >>>>       [0x73] =3D { 16,    8,    9, 5, 0 },
> >>>>
> >>>
> >>
> >
>
> Applied to my trivial-patches branch.

Er, I made review comments on this one; it needs a respin.

thanks
-- PMM

