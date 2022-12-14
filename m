Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p5U74-0000Mg-LA
	for mharc-qemu-trivial@gnu.org; Wed, 14 Dec 2022 10:56:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1p5U72-0000Kc-7s
 for qemu-trivial@nongnu.org; Wed, 14 Dec 2022 10:56:04 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1p5U70-0005Z0-DQ
 for qemu-trivial@nongnu.org; Wed, 14 Dec 2022 10:56:03 -0500
Received: by mail-wm1-x330.google.com with SMTP id ja17so8738706wmb.3
 for <qemu-trivial@nongnu.org>; Wed, 14 Dec 2022 07:56:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ASc0yeNpS0LBJzq7UnF5zrxoCeXzDliiC3DYV25XDZ8=;
 b=gL49x+Rt73lJS2J66ADa7UkmGYRnM1+zuk1P25G95CGmpRZVUFlBJLO8wBglG+AAgU
 wBBfLUqXwPY/tQTykBuV/zO3Q9XD2CC5Hj2it/iLGKuwHzyYnzPFqxrm0wGkMuyvTDT+
 XXe+Dcask3LHvMZUzjkYdbzt+UhEAzQRRf/Ma+u7+enx+814QgzQ8b7r/ms4gVaBauQW
 b53VLGs2eGM9IXdzhGOXTriw64i1qI0hR1XOeHOm/hrmI+BkRwMa/RB6MOjkjy2fmaae
 nif14+5jA7RMtBsPcQrfeJ3OV61ZV5qXaUiFKg+iqzEvhdONhb4kwdvY6N+AiHXD+yRC
 NUoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ASc0yeNpS0LBJzq7UnF5zrxoCeXzDliiC3DYV25XDZ8=;
 b=x8ZkDhnSVqRk8FGwDLU+f1xIe3MZveVfDLKaZO03E0q3Hgm6DSSEKoh5+LyTVQ/fbt
 77+6GhDovell8poAQeVG/RLj0Yg4iI7ppu2SnY2iIrLSChm1le+0yLWdR2+QN4iAgNvU
 d21s9UuByzaoOnPWU8MI0GZTCE9oTRbY8pG6QzYlNjOpc7ev5OV2iBLXMk6EjfYPYohj
 z90Y6elIt90B9F6kL44MS3QKUMbHtiWAig9hMT9IpIYHH/e1iSnoLMSI3SSayalbYbiu
 Kh8FTn9wKRmkBMPnPxr0Ojo6l8hzBqVp9XyJii7Cq/oETFWcsJmbL6277vQqv4DweEk3
 B19Q==
X-Gm-Message-State: ANoB5pkoWOjcmn2ubqVyLj+C19rxD7UOnTTMiI108L6AFAIOKpUyBv6Z
 RYRVxacaAUslVUK1rJHbNl/MpjiygzzdYvkmwU4okMMp8zh/iAn2
X-Google-Smtp-Source: AA0mqf7YccPsLkZjarN+yVikAU8REkEJva2tiZrCJFDxv/rsoid+RdN598iFmvHQN1YGifbMAlPMElRSz6X+mk+a4ik=
X-Received: by 2002:a05:600c:1d8e:b0:3d1:cda5:bdc7 with SMTP id
 p14-20020a05600c1d8e00b003d1cda5bdc7mr162519wms.204.1671033360862; Wed, 14
 Dec 2022 07:56:00 -0800 (PST)
MIME-Version: 1.0
References: <20221203132346.34479-1-ani@anisinha.ca>
 <6e398f40b980f314b0316746e3e8d9c41c3894a7.camel@wdc.com>
In-Reply-To: <6e398f40b980f314b0316746e3e8d9c41c3894a7.camel@wdc.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Wed, 14 Dec 2022 21:25:49 +0530
Message-ID: <CAARzgwy4Lp_KP2OrPo4cz9GqhUMu-kXpHa42sfgfK2fTeFpWyw@mail.gmail.com>
Subject: Re: [PATCH] docs/acpi/bits: document BITS_DEBUG environment variable
To: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Cc: "mst@redhat.com" <mst@redhat.com>,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>, 
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::330;
 envelope-from=ani@anisinha.ca; helo=mail-wm1-x330.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 14 Dec 2022 15:56:05 -0000

On Mon, Dec 5, 2022 at 3:39 AM Wilfred Mallawa <wilfred.mallawa@wdc.com> wrote:
>
> On Sat, 2022-12-03 at 13:23 +0000, Ani Sinha wrote:
> > Debug specific actions can be enabled in bios bits acpi tests by
> > passing
> > BITS_DEBUG in the environment variable while running the test.
> > Document that.
> >
> > CC: qemu-trivial@nongnu.org
> > Signed-off-by: Ani Sinha <ani@anisinha.ca>
> > ---
> >  docs/devel/acpi-bits.rst | 3 +++
> >  1 file changed, 3 insertions(+)
> Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>

michael, reminder to queue this for the next PR.

> >
> > diff --git a/docs/devel/acpi-bits.rst b/docs/devel/acpi-bits.rst
> > index 4a94c7d83d..9eb4b9e666 100644
> > --- a/docs/devel/acpi-bits.rst
> > +++ b/docs/devel/acpi-bits.rst
> > @@ -52,6 +52,9 @@ Under ``tests/avocado/`` as the root we have:
> >     for their tests. In order to enable debugging, you can set
> > **V=1**
> >     environment variable. This enables verbose mode for the test and
> > also dumps
> >     the entire log from bios bits and more information in case
> > failure happens.
> > +   You can also set **BITS_DEBUG=1** to turn on debug mode. It will
> > enable
> > +   verbose logs and also retain the temporary work directory the
> > test used for
> > +   you to inspect and run the specific commands manually.
> >
> >     In order to run this test, please perform the following steps
> > from the QEMU
> >     build directory:
>

