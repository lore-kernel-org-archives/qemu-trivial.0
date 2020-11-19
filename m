Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kffTG-0003Pm-A8
	for mharc-qemu-trivial@gnu.org; Thu, 19 Nov 2020 03:39:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kffTE-0003PU-Iw
 for qemu-trivial@nongnu.org; Thu, 19 Nov 2020 03:39:12 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:40150)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kffT8-00008H-GW
 for qemu-trivial@nongnu.org; Thu, 19 Nov 2020 03:39:12 -0500
Received: by mail-ej1-x633.google.com with SMTP id oq3so6718137ejb.7
 for <qemu-trivial@nongnu.org>; Thu, 19 Nov 2020 00:39:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dlLZzA6K9QTuMfGNpdOXP+aZ77ceZwT+wdu0FDc4SMA=;
 b=F2nKAWq6LGim6G1TjM7iC7e1ChfhwWr3B6mK1oGDh+ZEXTPrjb3HR65PGu2Jnt+VVV
 FEo8z+hRYwkeovTbo0TVlN/iJmQVkcG6gCAsBMTrnK+ZNKYg+VOy7oR4GEqlAjwlJa3j
 /PslAP1mRLOtNnSC102FXUmVDAgva0aOfIuYCwy0oa8WjolfP5LXKyXHEh9uReNYKqHq
 czo5XIraQKG7NikM/UhSUfrDrOQPXnWe0OH3Qied2UABAafXoAFiynG4smTxwhO5wBfb
 nnfjgTm1+rLxIg1ZUPRDKx6zdvh0ibOgF9a4Gx178WRHmA55Bw6fl0pyPR6N4Efff4eX
 6xPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dlLZzA6K9QTuMfGNpdOXP+aZ77ceZwT+wdu0FDc4SMA=;
 b=W++Ki33fk3mwe7ap87l9NNz5hFPquyWtROslfeATpsWDYT2trYH0siqGqGcsytKJNY
 24nJNQ0dM2Z77j/bv0NFoA/7ym29ndE0BtlTIXmmWDe9IjgmSNKR5rm+n2R0ODdAQ5l4
 RSxwyTzrt0FHvMC0gf09ygAtwv8RsT0as23sGnQi4wrh1sLe82kPyu6LFIkePXl3yXuN
 vgza9a8ObX781uYub+L3JYY8MkD5y5aTH+HXFcq7YPZylvn95BSv93UiBJ/Q8l6v7g8N
 F2Jlsnd6WLCf7IgykMXjNlV1+0WG3JuDUjIostU12v3EdcI9HXS07BsszPWTxFSJK+VH
 QFDw==
X-Gm-Message-State: AOAM530X1NQnpMMlbq3U690g6WT9uhqLZNoaXYOlWXT41Glmv3P6QGqg
 jOkuFbk201IEIhmWqgCOgIg5Qo9wGzgpXAkyslNlzw==
X-Google-Smtp-Source: ABdhPJwr5Y1200sPvl4PzNXFJKIgWa5yzUIL7BU1zorhk7OmNG+evGwvLb/qzHiNvTmqwmYOZAGWVeVQ6XnMActtNKo=
X-Received: by 2002:a17:906:1542:: with SMTP id
 c2mr17184449ejd.382.1605775144864; 
 Thu, 19 Nov 2020 00:39:04 -0800 (PST)
MIME-Version: 1.0
References: <20201118115646.2461726-1-kuhn.chenqun@huawei.com>
 <20201118115646.2461726-2-kuhn.chenqun@huawei.com>
 <CAFEAcA81CeW=RdrABuAZx2pL6L-nE_AaQ2vbryqm7amUbRjM-g@mail.gmail.com>
 <7412CDE03601674DA8197E2EBD8937E83BA86327@dggemm531-mbx.china.huawei.com>
In-Reply-To: <7412CDE03601674DA8197E2EBD8937E83BA86327@dggemm531-mbx.china.huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Nov 2020 08:38:53 +0000
Message-ID: <CAFEAcA9nwqj-7bDa5oPo9z8h9uaeHAC0dX-KdeZ6hkgZJQDqZA@mail.gmail.com>
Subject: Re: [PATCH-for-5.2? 1/2] tests/qtest: variable defined by g_autofree
 need to be initialized
To: "Chenqun (kuhn)" <kuhn.chenqun@huawei.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, 
 Hao Wu <wuhaotsh@google.com>, Havard Skinnemoen <hskinnemoen@google.com>, 
 Zhanghailiang <zhang.zhanghailiang@huawei.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Euler Robot <euler.robot@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 19 Nov 2020 08:39:12 -0000

On Thu, 19 Nov 2020 at 08:35, Chenqun (kuhn) <kuhn.chenqun@huawei.com> wrot=
e:
>
> > -----Original Message-----
> > >  static void tim_add_test(const char *name, const TestData *td,
> > > GTestDataFunc fn)  {
> > > -    g_autofree char *full_name;
> > > -
> > > -    full_name =3D g_strdup_printf("npcm7xx_timer/tim[%d]/timer[%d]/%=
s",
> > > -                                tim_index(td->tim),
> > timer_index(td->timer),
> > > -                                name);
> > > +    g_autofree char *full_name =3D g_strdup_printf(
> > > +        "npcm7xx_timer/tim[%d]/timer[%d]/%s", tim_index(td->tim),
> > > +        timer_index(td->timer), name);
> >
> > Which compiler is so unintelligent that it cannot see that a declaratio=
n
> > immediately followed by an assignment must always initialize the variab=
le ???
> >
> Hi Peter,
>   Glib requires that all g_auto* macros must be initialized.
>   https://developer.gnome.org/glib/stable/glib-Miscellaneous-Macros.html#=
g-autofree

Yes, and we initialize it with the "full_name =3D ..." line.
The g_autofree documentation says "this macro has similar constraints
as g_autoptr()", and the g_autoptr() documentation says
"You must initialise the variable in some way =E2=80=94 either by use of an
initialiser or by ensuring that it is assigned to unconditionally
before it goes out of scope."

In this case the test code is doing the second of those two things.

thanks
-- PMM

