Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mNXxD-0003aO-Go
	for mharc-qemu-trivial@gnu.org; Tue, 07 Sep 2021 06:03:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNXxC-0003ZT-Ip
 for qemu-trivial@nongnu.org; Tue, 07 Sep 2021 06:03:46 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:40488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNXxA-0003g3-27
 for qemu-trivial@nongnu.org; Tue, 07 Sep 2021 06:03:46 -0400
Received: by mail-wr1-x433.google.com with SMTP id q26so12601748wrc.7
 for <qemu-trivial@nongnu.org>; Tue, 07 Sep 2021 03:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IjlI2vIY9cIMj9Ms+llOX4SlIUFYo4akexoOYkpBaIU=;
 b=WykjNdi9YbSgjGhNaiz2CEkNG8MxSshjz8Jr/GqozFD8xyNKxBU84SSw1IL1eL8VXY
 SRdd+NcmsFOs3x9JwyeYj87OwIWmkxUwEnnCwHzIMtMrnoVVPza0oIC6TLAnDcYT7j2N
 cGITBQWlYhl2TvoLgvUOPV9+aWWkV2PbzkZ4d5LWak5pgV5wtuIxWUYxNKiLMzy7eh4o
 hEb/TBcIC/huVoEpfd6P3zIZW9948fxptv1ML82FGwY/8CV18aDMEfEhyeTzMqSSZ/NP
 uyl2075JVUTzP+s11Z+/1kpLgbrNW5vl58OK1E6HVQzQXGgADvl7QIs+qBOpLKrXsOvG
 ukww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IjlI2vIY9cIMj9Ms+llOX4SlIUFYo4akexoOYkpBaIU=;
 b=d9BkjnaIvrXicW51ATrQxo2bgE3GEhSAkufHGwN8973C+MhTOMJHZbtVTT+bQnfExZ
 CBP3o7V+w6cNqS5DwtG7Kxs81P8lVx03li8eYFG6NyAnKNvUpv/LJvfztqoz2t9ekO9P
 ZQu3KOEjYGYZkXuI784YLTPc41DhPICk3xy3f9EYRRLXMFZzIV6TllpwKGIkKFafvhKg
 UaPb1mMkhD0J2c8BL0qW7ZrKjpxyVTLW/LE0bUStrDRfv4eePmIBnZoDoavDkRN7ChIc
 7v/EwFrxaQKv+2tZHHw4l6he9bDwSqkj7w62S2+6OM36Xq4l4TFNCYHJCH6mW0Pv3DUz
 oblA==
X-Gm-Message-State: AOAM530QdemFNLIXmnR6UGwA/PyZycvNwUhPkEmqPgLllgsKjaYXc0zs
 lrf2Su+c+xMNJ1wOlYMy2RH/mar4+s6y45AmLgKD/Q==
X-Google-Smtp-Source: ABdhPJzOXc7eP+ydp+vlvrVbybFTAZY2tOhzF39iDiKJqSg9QGibf+7ldXtVejoYg9hFX5HS6SkFmJgea9xth3Tiqa0=
X-Received: by 2002:adf:c18a:: with SMTP id x10mr18253476wre.302.1631009020700; 
 Tue, 07 Sep 2021 03:03:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210525025823.3208218-1-swethajoshi139@gmail.com>
 <331a819e-1745-4d4b-cc4a-82521a58186a@linaro.org>
 <CAFEAcA8RbVafdjn2hkXifAPUF=wxZup20PqPcRpQ1ivtnWCxww@mail.gmail.com>
 <CALf2nm+LFqM2=vDs8=YfyxQSUT-0xxaCiVmcQzrKoOa+zaTtdg@mail.gmail.com>
 <CAFEAcA-oX0JR80UYzYKvczHsfxWG6oH3Pg4pbM6ByDe57XEHHw@mail.gmail.com>
 <CALf2nmKhPaWJa944dR+kFAQ1hCLXF0XPwXaHTqJQ-C6EW7ACKg@mail.gmail.com>
 <CAFEAcA9E4s3dST0GJkdg24DDAn90WU1FEmXwoKD6oQmNSB1vVA@mail.gmail.com>
 <CABSBigR1L9sE36eYA0Mq4smx1E9A4umTOKTe_x97foSMkryRnw@mail.gmail.com>
 <CALf2nmLOqtwacgrQ91TTz9_QRUmFS9ZNii2Kk7-tQ7LNp9vw2Q@mail.gmail.com>
 <CAFEAcA8oAtjVom+BXtcgao4O252ipmFzv-iNTSzDaJChcQkr9g@mail.gmail.com>
 <CALf2nmKgaZiBOfEWpMt4Yq-NyCYrsFNPwb1hZ0adwoXUs4T6pA@mail.gmail.com>
 <CALf2nmLLZ5smxqYJyA+_MPunaQqaM7-Ub9CVurTE1pM0ErOS+w@mail.gmail.com>
 <CAFEAcA9GM72tvOLDZfW=TmvV=DN1cAeXJ_MScWb3oivAR7X9LQ@mail.gmail.com>
 <CALf2nmJ-uRf=8Bq2hotai7MOD9uRVUQ0YHS667AjfVKJDYd4Qg@mail.gmail.com>
In-Reply-To: <CALf2nmJ-uRf=8Bq2hotai7MOD9uRVUQ0YHS667AjfVKJDYd4Qg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Sep 2021 11:02:51 +0100
Message-ID: <CAFEAcA8B5eiw3nM6fZpP8skw8uz0+V+9VEpbfHAvAk1Qz_VXrg@mail.gmail.com>
Subject: Re: [PATCH_V3] Adding ifdefs to call the respective routines only
 when their configs are enabled
To: Swetha Joshi <swethajoshi139@gmail.com>
Cc: Dongjiu Geng <gengdongjiu1@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>, 
 QEMU Trivial <qemu-trivial@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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
X-List-Received-Date: Tue, 07 Sep 2021 10:03:46 -0000

On Fri, 4 Jun 2021 at 16:06, Swetha Joshi <swethajoshi139@gmail.com> wrote:
>
> Can y oh I let me know once it goes in mainline? Thanks!

Sorry for having forgotten about this -- I was just clearing
out some of my old email backlog and found your email again.
You probably discovered this long ago, but this patchset to remove
the dependency between arm kvm and the virt board went into mainline
back in late June and was in the 6.1 release.

thanks
-- PMM

