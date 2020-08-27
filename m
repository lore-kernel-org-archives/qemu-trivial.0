Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kBEDN-0006et-Kj
	for mharc-qemu-trivial@gnu.org; Thu, 27 Aug 2020 05:29:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kBEDL-0006aW-OG
 for qemu-trivial@nongnu.org; Thu, 27 Aug 2020 05:28:59 -0400
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:35752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kBEDJ-000428-36
 for qemu-trivial@nongnu.org; Thu, 27 Aug 2020 05:28:59 -0400
Received: by mail-ej1-x642.google.com with SMTP id a26so6749311ejc.2
 for <qemu-trivial@nongnu.org>; Thu, 27 Aug 2020 02:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lNKyWQVmt7GlUFWHoZTwmyRNJK2j89UAb8nPiiUG4IE=;
 b=noNzADQDPVadXawjYSe5fCn2sn+gbSUutTNtls9utIQ8+0mnQee2MJAT6N2nt8QcA/
 bp0rwSKoeQNSBFA76EQzURfFMdnjsHHXKW7vfN5P1iP3F272SNpARzb8JXN2dl+GTfom
 xShxvoKl7Och+vstOo+OnvnedZFwt47uEggDuTAkkVRAYT0Xd3y3apUI0lzYLAvrS6DB
 z1bss0+M65MZ3l0Qrmya8jzCNDSDyNQZSxH3Tc0+MVKkmlxycMaDtZhRRAYuIZ8ca7Or
 8BNTuUu79X0xswikQdzdMakT+33fGggjoN8e4ujtwl6E5P/KGZ6ELutXEcdYzVTExXZZ
 M9+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lNKyWQVmt7GlUFWHoZTwmyRNJK2j89UAb8nPiiUG4IE=;
 b=Tpry6YhRKTrz9tFp4Nw3AMB1xr6hR9/hkvnfNFQmBH052ev5nULMx2XxDl+GU1CRs6
 lXnDt9y5eseTqp5RGQmv9YmeqGkupFLNY4fBzI21tjSX2XEwI1MXLooo6rlgoBwrWq77
 Xnxa933QlbBaU7b1URtxqNklOsGYW4/2vrAsGHIgBYXF1LPAbdl/4FCrHYVJ5IPcJHwy
 Q1kjeMShpmKYL2lJNSLnemf87wUBuWCoc1nKD7CxGnUNx8f5i9aUU3WcyKWV1fAvChrj
 +wctO5BmsjdDZ1j0yu9j2Ze+/yOUFatwI3xM1wnbQ+ehBAC7Yd1Y7i6W132IGO8BeEJX
 PWug==
X-Gm-Message-State: AOAM533nnW5y9Ns3WW+ipT4+ytZHoFaJObabz5W7lBH/YXv9sqIJUwXT
 xdzIkU2Jd1qa2m7WSnFckcjqWB8FuNmqYCzNR4XOnQ==
X-Google-Smtp-Source: ABdhPJwMqiizVrdloQm+Nzhr9AVWDNwQZEGlWjrIKB2LZj0N2vYUuyPx8PQj4alBYvlGEWVuZqB8C9vLsDoz9TOJ+dA=
X-Received: by 2002:a17:907:2066:: with SMTP id
 qp6mr10748116ejb.85.1598520535238; 
 Thu, 27 Aug 2020 02:28:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200825112447.126308-1-kuhn.chenqun@huawei.com>
 <20200825112447.126308-10-kuhn.chenqun@huawei.com>
 <CAFEAcA_SLjM28bHH8WxBdHAFdLgE6zgqNAj9EpOVp77WL-iqKg@mail.gmail.com>
 <7412CDE03601674DA8197E2EBD8937E83B8E58BD@dggemm511-mbx.china.huawei.com>
In-Reply-To: <7412CDE03601674DA8197E2EBD8937E83B8E58BD@dggemm511-mbx.china.huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 Aug 2020 10:28:44 +0100
Message-ID: <CAFEAcA-MU2tginRvDOUk8+sEQiDm3ZxNZ2sb-vsw4jFaomHa7Q@mail.gmail.com>
Subject: Re: [PATCH v2 09/10] hw/intc: Remove redundant statement in
 exynos4210_combiner_read()
To: "Chenqun (kuhn)" <kuhn.chenqun@huawei.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, 
 Pannengyuan <pannengyuan@huawei.com>,
 Zhanghailiang <zhang.zhanghailiang@huawei.com>, 
 Euler Robot <euler.robot@huawei.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Thu, 27 Aug 2020 09:29:00 -0000

On Thu, 27 Aug 2020 at 08:01, Chenqun (kuhn) <kuhn.chenqun@huawei.com> wrote:
>
> > Subject: Re: [PATCH v2 09/10] hw/intc: Remove redundant statement in
> > exynos4210_combiner_read()

> > The code as it stands is definitely wrong, but I'm not sure this is the correct fix.
> > Surely the intention must have been to return the actual register value from
> > the reg_set[] array, not to return 0 ?
> >
> > I suspect the correct fix here is simply to delete the "return 0" line and leave
> > the assignment to val as it is.
>
> Hi Peter,
>   I think you're right.
>
> > Ideally you should check the h/w datasheet to confirm.
>  I checked the Exynos 4210 datasheet and found that 'Interrupt Combiner Operation' had only five types of registers.

> Please confirm that if there is no problem, I will modify it in later version.

Thanks for checking the datasheet -- I agree and we should keep
the "val = s->reg_set[offset >> 2];" and only delete the "return 0".

-- PMM

