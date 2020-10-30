Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kYVVW-0004sX-Vp
	for mharc-qemu-trivial@gnu.org; Fri, 30 Oct 2020 10:35:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kYVVR-0004nS-UQ
 for qemu-trivial@nongnu.org; Fri, 30 Oct 2020 10:35:55 -0400
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:39150)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kYVVP-00020J-91
 for qemu-trivial@nongnu.org; Fri, 30 Oct 2020 10:35:53 -0400
Received: by mail-ej1-x642.google.com with SMTP id bn26so8923219ejb.6
 for <qemu-trivial@nongnu.org>; Fri, 30 Oct 2020 07:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=lA++Hl5Ff23cexy9HPHp57mTBkMdUE4lxCl2ZEu5RIM=;
 b=FYQYJtbqal6X0CHAm7FeiWXGeqGqRbSLTOTh1aDXPr/tlVrKLucN+qHwwX53e6ItMp
 uvnyA/0L++AZYAXpSmmbcxfLM7m/D4cwKXMMVejo6OxPpLHqDojWmDwA5xgR9F+RC9TE
 1fHoAi4hOo1etOJaE6eE/G/Y6tSI4lkOv0huUguz/uHBuqSLcwxxi7ppm5v7fr5r4a5T
 VXEqa4j7B5OZLs6y2Gtj5VoMXVJj6iVvC1Po3dQ3OoAc3CCZNYvShUgXZtzYxCGaVN0s
 +7C8N0H80vNc4v489ZrzalwxIdSIuaObjM/2NtGvrbAVj/v+0J1uvs6BCVs6EkZK4MJd
 pxrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lA++Hl5Ff23cexy9HPHp57mTBkMdUE4lxCl2ZEu5RIM=;
 b=Ccw+1ASZaHe9B9/niWvLyEMDL8a+S1SolEK6J01C1ZDfabT9Nz/CaPA6I0dlxQYGLO
 nSp1+f6JaQjdcUemtFLgjJEw7E9thN9StSV7DTHFxcBafVBbwKs3mLQIObOh4QgtHAWF
 kGRStBlGF4HDyoZRQBIGt1y9crv4HZz3+XcqvH0lTvSMbi87n6IwaC0ik+V/UUUa7m9g
 k+Xo5oPPXCNPjYSTXSYFCo+3iiof6l2pf7NqtZTTdkkDHbN4ss0R5nOtVcD2TJgXK2do
 KMqmQHCwtTNjkxbACnjWnMzVKrvIAEPJx1yLG6GrcamLlDK77fkKRS/TTT01JNAP950W
 hiFQ==
X-Gm-Message-State: AOAM53098vwjoYBs/opQap09GwO+8KhR2fPHILJSRsAXaj4bPb39uLbx
 x//t9atYFoQ00Y4Kdis5MpVYohGedkmPlRdV58F3AQ==
X-Google-Smtp-Source: ABdhPJwvOxrrKtyKgJhUGZ+kKOdLBqn04/bm4a7JzmV/3Cmy/KMzHtdyrwuJlxSC2OC2Mq6ppur09aEmua64N9JA1pA=
X-Received: by 2002:a17:906:af8c:: with SMTP id
 mj12mr2669056ejb.85.1604068548940; 
 Fri, 30 Oct 2020 07:35:48 -0700 (PDT)
MIME-Version: 1.0
References: <5F9BE993.4050406@huawei.com>
 <CAFEAcA8hpb2UVd3PSY4XuEpKYeu1Am1+41DQ=gN48xbAv281TQ@mail.gmail.com>
In-Reply-To: <CAFEAcA8hpb2UVd3PSY4XuEpKYeu1Am1+41DQ=gN48xbAv281TQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 30 Oct 2020 14:35:37 +0000
Message-ID: <CAFEAcA-WTw-0EvT1REbTrtgLB9sBbnJBuNW9LMh7eOtsXtrDTw@mail.gmail.com>
Subject: Re: [PATCH] hw/display/omap_lcdc: Fix potential NULL pointer
 dereference
To: AlexChen <alex.chen@huawei.com>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU <qemu-devel@nongnu.org>, 
 QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x642.google.com
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
X-List-Received-Date: Fri, 30 Oct 2020 14:35:55 -0000

On Fri, 30 Oct 2020 at 14:29, Peter Maydell <peter.maydell@linaro.org> wrot=
e:
>
> On Fri, 30 Oct 2020 at 10:23, AlexChen <alex.chen@huawei.com> wrote:
> >
> > In omap_lcd_interrupts(), the pointer omap_lcd is dereferenced before
> > being check if it is valid, which may lead to NULL pointer dereference.
> > So move the assignment to surface after checking that the omap_lcd is v=
alid.
> >
> > Reported-by: Euler Robot <euler.robot@huawei.com>
> > Signed-off-by: Alex Chen <alex.chen@huawei.com>
> > ---
> >  hw/display/omap_lcdc.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)

> Applied to target-arm.next, thanks.

Whoops, spoke too soon. This doesn't compile:

../../hw/display/omap_lcdc.c: In function =E2=80=98omap_update_display=E2=
=80=99:
../../hw/display/omap_lcdc.c:88:10: error: =E2=80=98surface=E2=80=99 may be=
 used
uninitialized in this function [-Werror=3Dmaybe-uninitialized]
         !surface_bits_per_pixel(surface)) {
          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


because the early exit check
    if (!omap_lcd || omap_lcd->plm =3D=3D 1 || !omap_lcd->enable ||
        !surface_bits_per_pixel(surface)) {
        return;
    }

uses 'surface' and this patch moves the initialization of that
variable down below its first use.

thanks
-- PMM

