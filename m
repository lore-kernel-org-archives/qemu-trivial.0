Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kb2XQ-0003nF-Qi
	for mharc-qemu-trivial@gnu.org; Fri, 06 Nov 2020 09:16:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kb2XP-0003mo-FT
 for qemu-trivial@nongnu.org; Fri, 06 Nov 2020 09:16:23 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:36135)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kb2XM-0000jF-Jn
 for qemu-trivial@nongnu.org; Fri, 06 Nov 2020 09:16:23 -0500
Received: by mail-ej1-x635.google.com with SMTP id o21so2153766ejb.3
 for <qemu-trivial@nongnu.org>; Fri, 06 Nov 2020 06:16:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2r+AQ2dd4LfTfleMslIR2TLv1KRDqDqrZHe13NS9LSw=;
 b=sfLoz2JR1utr6LgMj+mAB80a2PcGzR3WVFDX7NkrgF6Ndq+3qpvjFAWza84XR7jISb
 eC5vqZVkIYWePnpKVgrGAyYfDbxoG/we113UqIoLEVzaAz4mcY4A7G8lHejyq04Ev3JM
 9Pw0E9xHzwB91OCXDZvDytXDy4DQWGeM6U/J7y+Ol7xt5W0gu9/LBTB4yFsKnnMj/yqK
 vokNvjTUPJ4cZXafoN1Mh2gUQfGakphk2jNjhjAvOV7CfCyLEsxL5oVWmdu8YWyvbiMd
 baF/s2D+1HCdhAVCt68uh0R3v1EhK+lGpsxTVKL0eliOWyhDvaldn2iIZJRbXcOR/PUL
 SEOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2r+AQ2dd4LfTfleMslIR2TLv1KRDqDqrZHe13NS9LSw=;
 b=I1Z9BO8PanifoL9RlGqk1Q2XYn85K0gXxjHe68Hu2+UlZd9uUl7c+avbtDgdSe/m84
 Bwt6hGvHlfPUUrbCgJtZ1CnllLaA0iYLAwxW3Jo9VgdiPuEOw9Z4a0ylb8x1Rc4Yvyil
 u7sxwCOo2BU08/PhVMzRRqzMDdua2Hp2ERBaq2KP66uATljjdni2XXHzy0UUD2quC0Cn
 lX9O5w0dDoqiYsq9ErSwKRngRATmAuNHoApjDy0xhC3Nr61zY8hzCu2D3HNJdoT08gsv
 BH7wZ+MOCvew6cTjVOKQU+MoTqsK1uf2gwf3jndoBObssaxcapoNfzb3NQdD+VQFpksP
 9tLg==
X-Gm-Message-State: AOAM533b3fpiUAOi/suBfhqdO8b0tciyOelqSnb7/NlbWtfWrPVRgE6h
 tVJFwiNY6nwZ9ODvplOdxwl6M0I57oYJ/uYQReuoKA==
X-Google-Smtp-Source: ABdhPJwyq3j31Jt+miM0WDUYjRd6q6P9UMAVEHB5eluBsM6Xk0KWI1BCAfdTZMYl75geYp6YWVZdfUNr20IEM9AFkGo=
X-Received: by 2002:a17:907:9e3:: with SMTP id ce3mr2267791ejc.4.1604672178854; 
 Fri, 06 Nov 2020 06:16:18 -0800 (PST)
MIME-Version: 1.0
References: <20201105154208.12442-1-ganqixin@huawei.com>
 <CAFEAcA9QMBqF0Bm44q4m1d=QaPVBJodH9rwuYhGx5H6zy6ULcg@mail.gmail.com>
 <87d00qk51l.fsf@dusky.pond.sub.org>
 <CAFEAcA-_5vRbsi5fFpyLV2OyDX5TVrpAx7_Z43wqvb1zhQO_8w@mail.gmail.com>
 <37c519e4-d72b-944c-ed70-038f9c606be9@redhat.com>
In-Reply-To: <37c519e4-d72b-944c-ed70-038f9c606be9@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Nov 2020 14:16:07 +0000
Message-ID: <CAFEAcA_a=vBjLM8_-KDkYfFuTLDW6cMsQ48or70uwwVusW2q7w@mail.gmail.com>
Subject: Re: [PATCH] scripts/checkpatch.pl: Modify the line length limit of
 the code
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>, Gan Qixin <ganqixin@huawei.com>, 
 "Daniel P. Berrange" <berrange@redhat.com>,
 zhanghailiang <zhang.zhanghailiang@huawei.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>, 
 QEMU Developers <qemu-devel@nongnu.org>,
 "Chenqun (kuhn)" <kuhn.chenqun@huawei.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
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
X-List-Received-Date: Fri, 06 Nov 2020 14:16:23 -0000

On Fri, 6 Nov 2020 at 14:08, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com=
> wrote:
> Can we keep the error please? Maybe 132 is the next display logical
> limit once we increased the warning from 80 to 100.
>
> I understand hardware evolved, we have larger displays with better
> resolution and can fit more characters in a line.
> I am a bit wary however functions become heavier (more code into
> a single function). Maybe this checkpatch change should go with
> a another one warning when a function has more than 80 lines,
> excluding comments? (Even 80 is too much for my taste).

Personally I just don't think checkpatch should be nudging people
into folding 85-character lines, especially when there are
multiple very similar lines in a row and only one would get
folded, eg the prototypes in target/arm/helper.h -- some of
these just edge beyond 80 characters and I think wrapping them
is clearly worse for readability. If we don't want people
sending us "style fix" patches which wrap >80 char lines
(which I think we do not) then we shouldn't have checkpatch
complain about them, because if it does then that's what we get.

thanks
-- PMM

