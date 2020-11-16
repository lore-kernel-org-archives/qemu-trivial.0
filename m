Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kei6U-0005bQ-Sm
	for mharc-qemu-trivial@gnu.org; Mon, 16 Nov 2020 12:15:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kei6P-0005Zd-PX
 for qemu-trivial@nongnu.org; Mon, 16 Nov 2020 12:15:43 -0500
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:42628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kei6N-0005gF-Bb
 for qemu-trivial@nongnu.org; Mon, 16 Nov 2020 12:15:41 -0500
Received: by mail-ej1-x644.google.com with SMTP id i19so25462741ejx.9
 for <qemu-trivial@nongnu.org>; Mon, 16 Nov 2020 09:15:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=L5mMiBadc9w/evurIbvGFs4bOERi8qxxgcjltNn6VIs=;
 b=X0Vgm+nRxTw3U3iTBRdtyaLn9s7B2xADRzGZsAQSlAj7qaPHGCO7O0Mfje+zMWEwMK
 Qg5UArU7Dd2x26CPnD3MwdnNFhVDgwvHP9TsCV4tgdEl6YIl4tWHUUgOZivDsID9cH1I
 7LtJ7QjWOKlj35J1b6YKykeV7+OB6dpdBOCxJEu/Y8eRJMFy0iE3sO0I0xmNuss4e73O
 oxQyUYpM5zn+8VKhdbE5RnUh3G8B2tAbz8oRZ+QM8wrs7MrENdm1tVxbwUvSa2/mBqBq
 T4n3Y/oRn8O11lmmZi0huZE3NHR4Sj7gHKwB+lwp3HApLqfJswqlwqbGSpsUqjqEYY5X
 PaOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L5mMiBadc9w/evurIbvGFs4bOERi8qxxgcjltNn6VIs=;
 b=Bm/NVFRTdfWLPmJ1ccF+wYI2qcPIZdLHCb9gmlrBERdJo3RcWOg5532aTp1c2sWfNM
 8kcDNRT7eO6Gu8oIRuEHoGkW3Mp17ooZhiKyL0Vuf0HnwHgjW4fUgGifz8gP7TyYae6j
 Fou37YBx1uDi3U6pzWOnRoOV0ejEx+HxhLrVnafIUr5KeymKVFWGq0WU4ncRqVsu5x5y
 YyogDqDjDeOSV8hk0lJ/KSV06pI9gUVryXUI5/D5zBa0QziU/ke2og4XDen+pRVfGNgu
 KKLh3d6p6AK6v6o/eAMMSz4kIoGuIZzzmcUvDCVL0K8xqWnkOQ4MLcdedVSPaW9DsPmI
 UVPg==
X-Gm-Message-State: AOAM532D61pwC4SdjPU+CwNYnueXvSW7pO9flhRRzHnUpgiyaBuu7kkt
 Ln7RH1oSzUpf7eVjmK2yWFkcMVqPLaWXqoq7VEzlQw==
X-Google-Smtp-Source: ABdhPJyzJSCaEQIo8u2ye6+2VjuT/d6ANKBUJAognrKtcu2r87Tt225mJW5qMCCIQEly8YLpKabXINhcQygPMUQJXdE=
X-Received: by 2002:a17:906:1542:: with SMTP id
 c2mr5865408ejd.382.1605546937127; 
 Mon, 16 Nov 2020 09:15:37 -0800 (PST)
MIME-Version: 1.0
References: <20201115184903.1292715-1-ganqixin@huawei.com>
 <20201115184903.1292715-14-ganqixin@huawei.com>
 <c2ca2185-4253-da71-eab4-f96b29067c96@amsat.org>
 <882df4ee-948c-7e00-d951-9b14ea40b2df@redhat.com>
 <877dqldyoh.fsf@dusky.pond.sub.org>
In-Reply-To: <877dqldyoh.fsf@dusky.pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Nov 2020 17:15:25 +0000
Message-ID: <CAFEAcA-u3jZT2bU6snRL7BWXHUzXuVr9gByssOjoicGZ2-MLXQ@mail.gmail.com>
Subject: Re: [PATCH 13/13] bcm2835_cprman: put some peripherals of bcm2835
 cprman into the 'misc' category
To: Markus Armbruster <armbru@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>,
 zhanghailiang <zhang.zhanghailiang@huawei.com>, 
 QEMU Trivial <qemu-trivial@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 QEMU Developers <qemu-devel@nongnu.org>, Gan Qixin <ganqixin@huawei.com>, 
 "Chenqun (kuhn)" <kuhn.chenqun@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x644.google.com
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
X-List-Received-Date: Mon, 16 Nov 2020 17:15:43 -0000

On Mon, 16 Nov 2020 at 17:09, Markus Armbruster <armbru@redhat.com> wrote:
> But TYPE_CPRMAN_PLL is *not* a descendant of TYPE_SYS_BUS_DEVICE, it's a
> bus-less device:
>
>     static const TypeInfo cprman_pll_info = {
>         .name = TYPE_CPRMAN_PLL,
> --->    .parent = TYPE_DEVICE,
>         .instance_size = sizeof(CprmanPllState),
>         .class_init = pll_class_init,
>         .instance_init = pll_init,
>     };

I'm really dubious of devices that directly inherit from
TYPE_DEVICE, because their reset method won't be automatically
called. In this case it looks like the TYPE_BCM2835_CPRMAN
device's reset method manually calls reset on these devices,
though, so it isn't actually buggy, just confusing.

thanks
-- PMM

