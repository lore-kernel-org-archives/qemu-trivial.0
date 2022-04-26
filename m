Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1njQo1-0003sR-26
	for mharc-qemu-trivial@gnu.org; Tue, 26 Apr 2022 15:25:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1njQny-0003oa-9t
 for qemu-trivial@nongnu.org; Tue, 26 Apr 2022 15:24:59 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135]:33731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1njQnv-0006oQ-Eq
 for qemu-trivial@nongnu.org; Tue, 26 Apr 2022 15:24:57 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-2eba37104a2so194017997b3.0
 for <qemu-trivial@nongnu.org>; Tue, 26 Apr 2022 12:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=J4OeUXytOsHiT4tBgP9VqPD34w1OCIW8DzSwEEq1d6Q=;
 b=wghuzmp/FlyTMuMM0GGAO8XMqGvpXMNzBU44RMsqXTfRyHJkjNAC0Iapu1QqXUIf6F
 8vYhW+JErtUpaeRDTuCyBs+oJCokf35q7DGW+9u34imCJhKP/+OCzaMwHEDUOA6zV3SA
 8kNK6NTij2hIcBYmW0sYmFiWrUZLvDI7R+X53tducXmQK4kNsyv3hjo7pQ7NGwBDlye1
 klYhCfgaJ0h4itp5Q7vzWJBnQS13uD/GaS0/ycZsZkrzQ2fXrtZ1VENBigaPtOm9GdlU
 ItAFpkoMdLeuxj9e3/tAK2C1vBDmzbdqd+CE3RpFjzVcAnbpuIYHV6t5u17jnfdKco0N
 ljMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=J4OeUXytOsHiT4tBgP9VqPD34w1OCIW8DzSwEEq1d6Q=;
 b=Oyk8KnYUotXV/VoKBI1IH9lY8Pvb9sey2+VhlJzPMc8d4bTh6LwifXF5mSlm6lAHrP
 CeGv9KtBbC4W03SJxPfxsveDSNO8lJiskM2xvPpMSnhiIXnq2wLxoJ94ranUjlztH1Wz
 H2nzLclid8mHsJiI1rSbcC9p3k9IKm+3pFbfGMv8MHHkStmSYm4CiRTCY/95RXGxM+23
 GpEL6QSA36yx0Dkau4pC+LlQ61T+MveIzLVW9vfhW897F+pslLZl/2qQuJLC8oYnxDAn
 jSc4DZ5IDOQPlrv8DFe0co2a9ihjD01ltNf+7F/xhk9fEfDSoVOfX1T1A4Zr4mn3tVes
 gxnA==
X-Gm-Message-State: AOAM533j2DaUkcmihoVYYsM7I2A2vl5aQjOdpKCWsf9m2dsx9SqM3YG1
 dZEXFrrk1oJQNMgG3Kttd99gLv/KaNDv6mNkZvCWYsJc40U=
X-Google-Smtp-Source: ABdhPJyr8BQrixxcSGVNLbynrakT4xxB5pX8lqImChPd6sZSg2H05qoUR1Mp6waColn/QQRyALnP1Q2Dnbv0CwL5uMI=
X-Received: by 2002:a81:ac57:0:b0:2f1:99ec:91a2 with SMTP id
 z23-20020a81ac57000000b002f199ec91a2mr23657378ywj.329.1651001094383; Tue, 26
 Apr 2022 12:24:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220318173038.3350098-1-peter.maydell@linaro.org>
 <CAFEAcA_5=5uauENSDRYQdaXJQJ5pnf9eUBHicA3LWjyScZ2SuQ@mail.gmail.com>
 <2eb3f904-1b0c-d5bf-18f4-064f8b663cf6@weilnetz.de>
 <1531213e-b869-d760-2f84-89b9fd4f7467@weilnetz.de>
 <3fd9f0a0-70d6-4b68-b8ca-318f69f4b1c0@vivier.eu>
In-Reply-To: <3fd9f0a0-70d6-4b68-b8ca-318f69f4b1c0@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 26 Apr 2022 20:24:43 +0100
Message-ID: <CAFEAcA__1-sQ9B2=DErkic3q07qNAVuSfHjr__mBGbi9MYYGbA@mail.gmail.com>
Subject: Re: [PATCH] Fix 'writeable' typos
To: Laurent Vivier <laurent@vivier.eu>
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
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
X-List-Received-Date: Tue, 26 Apr 2022 19:24:59 -0000

On Tue, 26 Apr 2022 at 19:45, Laurent Vivier <laurent@vivier.eu> wrote:
>
> Le 26/04/2022 =C3=A0 17:19, Stefan Weil a =C3=A9crit :
> > Am 26.04.22 um 17:15 schrieb Stefan Weil:
> >> Am 26.04.22 um 17:04 schrieb Peter Maydell:
> >>> On Fri, 18 Mar 2022 at 17:30, Peter Maydell <peter.maydell@linaro.org=
> wrote:
> >>>>
> >>>> We have about 25 instances of the typo/variant spelling 'writeable',
> >>>> and over 500 of the more common 'writable'.  Standardize on the
> >>>> latter.
> >
> >> You missed the one and only "Writeable". :-)
> >>
> >> It's trivial to fix that, too, so maybe qemu-trivial can do that
> >> without a v2.
> >>
> >> Reviewed-by: Stefan Weil <sw@weilnetz.de>
> >
> > ... and I nearly missed several WRITEABLE.
> > Maybe those can be fixed later.
> >
>
> As I have missed this patch during my collect for the today pull request,=
 perhaps we can have a v2?

Sure.

-- PMM

