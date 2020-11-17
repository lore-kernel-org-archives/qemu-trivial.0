Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1keyr9-0004Ad-Ku
	for mharc-qemu-trivial@gnu.org; Tue, 17 Nov 2020 06:09:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1keyr8-00048D-8X
 for qemu-trivial@nongnu.org; Tue, 17 Nov 2020 06:09:02 -0500
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:44621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1keyr6-0003C2-JD
 for qemu-trivial@nongnu.org; Tue, 17 Nov 2020 06:09:01 -0500
Received: by mail-ed1-x543.google.com with SMTP id l5so21957284edq.11
 for <qemu-trivial@nongnu.org>; Tue, 17 Nov 2020 03:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2IH4vI/cojJ2JGnrZTz/JsoKacG5tD4dYZfJttKUyuo=;
 b=kJc0CBNzZkqodB/4osuhe08RMTsRPJW0cLdehbOpP0hPrxTbC8CSjhoF4dTbBxhowa
 HQePcmlFBDoalfA+lOXCG/lm+L16j8ZAQCfxf6qvNa4jhXGgo3yLfufUM9pqNet/jTN2
 jd9lGSOwltNn6r5bCQP4+Q4bgdY5msKYouR95CPA1nA5ZdACIbwgfW/0SROT1NmGNlnG
 xlL97R1abIJzvIBO17gvhS5CJv1/RX56GS0cH8ZTOhfrvReLkIzI2w8Q/Qaxpq1aQ1rw
 ++EKjJ81RRdErCALolzm7mbd9IPiZbGOKmIW+wHGfLdlOdidS1MeRpZVcZILwrFoQFTW
 /G8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2IH4vI/cojJ2JGnrZTz/JsoKacG5tD4dYZfJttKUyuo=;
 b=dVQJcgte6crb24KS+3Sl0nn+Mk5Jwx0KW/kGtPh3+bG/1CAFG8rKubthPhoxkE0Pn2
 ZsTmhvDsKXkx75a9Q/PUwiTNQKKi5VJdaPOJ3oOzgn+Pt8uRct6YsYqXzQsBfRO75l7d
 2SYcux5CUfcD6Mk9vE6BIONw+7tnJm+F0LWd4r581GDX+zyUvG0WWZk4wt6es1ba313a
 1uPyfqgzARkWf5hYcjetbtuFSuTX9aCaueZDy1fbRtcHElH0Ayjvbf3eobkpMunveyud
 c/Wl80titidZv0zEa17RzY9a28LyqXjVRK1fLw3Obmk333icZxbL7pMi1mqsohiOt9WT
 Jj0g==
X-Gm-Message-State: AOAM533Z5Plvib7VPhU7T58g7JffoZuyvXZVp6/WPYoZLy4dT9URefN9
 aG4D/Up4g8RSIBopBJFlwPDeFw4ezAdImHwWhijaCg==
X-Google-Smtp-Source: ABdhPJzBpBeSyMX0rxzJFws3Ph5+8RIUPv0Qg+ZwOsDMMaQZvbspJrbOySccuF0CTchI1uGtPQie/ZJz/CwtDE1GSGg=
X-Received: by 2002:a05:6402:3089:: with SMTP id
 de9mr20719188edb.100.1605611339133; 
 Tue, 17 Nov 2020 03:08:59 -0800 (PST)
MIME-Version: 1.0
References: <20201115184903.1292715-1-ganqixin@huawei.com>
 <20201115184903.1292715-14-ganqixin@huawei.com>
 <c2ca2185-4253-da71-eab4-f96b29067c96@amsat.org>
 <882df4ee-948c-7e00-d951-9b14ea40b2df@redhat.com>
 <877dqldyoh.fsf@dusky.pond.sub.org>
 <CAFEAcA-u3jZT2bU6snRL7BWXHUzXuVr9gByssOjoicGZ2-MLXQ@mail.gmail.com>
 <873618czgj.fsf@dusky.pond.sub.org>
In-Reply-To: <873618czgj.fsf@dusky.pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Nov 2020 11:08:48 +0000
Message-ID: <CAFEAcA8fUnjmDy-1g0fsQyaNCHDqvEnLgE5073h-dGkCk7Rztg@mail.gmail.com>
Subject: Re: [PATCH 13/13] bcm2835_cprman: put some peripherals of bcm2835
 cprman into the 'misc' category
To: Markus Armbruster <armbru@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>,
 zhanghailiang <zhang.zhanghailiang@huawei.com>, 
 QEMU Trivial <qemu-trivial@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Gan Qixin <ganqixin@huawei.com>, "Chenqun (kuhn)" <kuhn.chenqun@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::543;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x543.google.com
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
X-List-Received-Date: Tue, 17 Nov 2020 11:09:02 -0000

On Tue, 17 Nov 2020 at 05:41, Markus Armbruster <armbru@redhat.com> wrote:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
> > I'm really dubious of devices that directly inherit from
> > TYPE_DEVICE, because their reset method won't be automatically
> > called. In this case it looks like the TYPE_BCM2835_CPRMAN
> > device's reset method manually calls reset on these devices,
> > though, so it isn't actually buggy, just confusing.
>
> I guess this is a trap for unwary implementers, aggravated by our usual
> dearth of qdev documentation.  I can see ~100 .parent = TYPE_DEVICE
> lines.  Checking them all manually won't be fun.  Any automation ideas?
>
> The concept "bus-less device" is sane.  We used not to have it, and the
> resulting need for pseudo-busses was annoying enough to make us add
> bus-less devices.

Yeah, the problem really is that our reset handling remains a
mess. I'm not sure (a) what the right model for reset is and
(b) what would be a feasible transition plan to get from
here to there...

thanks
-- PMM

