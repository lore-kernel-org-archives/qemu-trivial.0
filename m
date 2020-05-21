Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jbqMv-0004RB-Ha
	for mharc-qemu-trivial@gnu.org; Thu, 21 May 2020 14:56:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jbqMu-0004Q1-Ha
 for qemu-trivial@nongnu.org; Thu, 21 May 2020 14:56:36 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:43816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jbqMt-0004eq-7O
 for qemu-trivial@nongnu.org; Thu, 21 May 2020 14:56:36 -0400
Received: by mail-oi1-x243.google.com with SMTP id i22so7098592oik.10
 for <qemu-trivial@nongnu.org>; Thu, 21 May 2020 11:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TF/4RMNyI5qjXnX73kTH6e164dARfUFpER4eJwbwepk=;
 b=x13aPp24N7diruopnilbK14LbEKg+qUFvVXyFPZtSKlRVaelrpa1LGdwgWd1A4OZDr
 ewHTubmW4VbEqWXZOGNEj8UjNBTyKMCP0r3QkqAN6fVWrhiWyrgUv5VfegaOvnNHFZPu
 Sv9AISsNcu2I0sknLgXgTK2/qhCh1FG/89ISw9c/uMKuyuO1dkFVilkXOilPutz9eaCB
 sc+A3Ks9KoEaDvEIGAEgwogPWhqc494cZVq+LV65QiE+KkaCDgrsR4QDD3gdROAJg06q
 9YNC3vWCRAWASOK05glsCJ0VIoEk3HKcg5J7PIW4BZMYuCSfeObLtsZUKfeUIkjnkns3
 GluA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TF/4RMNyI5qjXnX73kTH6e164dARfUFpER4eJwbwepk=;
 b=jgWvR95tw929uN9tOwbwOempjfC3KUa4LFpMclNhqv6GpWb5WyH5aruNe57XIRta9+
 TZF0FwDO/7FZpfColA0+eQ8xM3xalaf0CbFmfEXSrZPoySP19Wkf1IuFdjF968uDoefF
 RwbDBRGKj1a6ru+wd00zLAWVxMeLV6CzkdakpRMpXbZm/zv4OK6CG0rfKc+Ll0k75VJI
 jVCNsDyTtaaX+HyengKqre1YjUMRkW4WIT9eqLeZ3381SFIm6mKv6t0S60UXVZX/YibQ
 5df2Ar1FMWsh4WOQMci1Vh53sIAOC25RpSyGPV7d9wTV5UXxYmNlrlkH/pWHDwdfv6Bt
 /lhA==
X-Gm-Message-State: AOAM531OPfm2gROGdvd950HriJLhddrmc3oLV8f7lhduZubaXJ9Cbz5a
 P98wWVFkbfnH5j4vueu4uKikMzzJAMRLxuLkZ8hU3A==
X-Google-Smtp-Source: ABdhPJyyOWw//6yaWNPXFnep6pcVnM1AEIzNZf759TwBmJp93O5shnhmWBPzt+8quhBqFAng0w62U+fp7aOsw652udo=
X-Received: by 2002:a05:6808:6c6:: with SMTP id
 m6mr6391567oih.163.1590087393845; 
 Thu, 21 May 2020 11:56:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA_i=HsBtpJh_o4+NWNeUihvNTccfB67gs0WrXttYdTc2A@mail.gmail.com>
 <20200521184923.19360-1-e.mikitas@gmail.com>
In-Reply-To: <20200521184923.19360-1-e.mikitas@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 May 2020 19:56:23 +0100
Message-ID: <CAFEAcA8FFc_Vf-UQO9f_3qoXiCJf9N1uWh7qB-WXrEWTzKBu8Q@mail.gmail.com>
Subject: Re: [PATCH] ssi/imx_spi: Removed unnecessary cast and fixed condition
 in while statement
To: Eden Mikitas <e.mikitas@gmail.com>
Cc: Alistair Francis <alistair@alistair23.me>,
 Jean-Christophe DUBOIS <jcd@tribudubois.net>, 
 Peter Chubb <peter.chubb@nicta.com.au>, qemu-arm <qemu-arm@nongnu.org>, 
 QEMU Developers <qemu-devel@nongnu.org>, QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::243;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x243.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Thu, 21 May 2020 18:56:36 -0000

On Thu, 21 May 2020 at 19:49, Eden Mikitas <e.mikitas@gmail.com> wrote:
>
> The ecspi controller is supposed to support burst length of 1 to 4096 bits,
> meaning it is possible to configure it to use a value that isn't a multiple
> of 8 (to my understanding). In that case, since tx_burst is always
> decremented by 8, it will underflow. Sorry I didn't include an explanation.

Ah, yes, I misread the code. On the first time into the loop
tx_burst must be positive, but this is a while() condition
and on subsequent loops we might end up negative. So all
the code changes in this patch are correct, they just need
to be split into two commits I think.

> > This seems like a separate change to the first one;
> > in general unrelated changes should be each in their
> > own patch, rather than combined into a single patch.
>
> Should I resubmit this as a patch?

Yes, if you could submit a 2-patch patch series where
one patch is the fix for handling burst lengths which aren't
multiples of 8, and the other is the fix for saving all the
data into the rx fifo rather than just the low byte, that
would be great.

thanks
-- PMM

