Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kADyQ-00062a-41
	for mharc-qemu-trivial@gnu.org; Mon, 24 Aug 2020 11:01:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kADyO-00060r-KU
 for qemu-trivial@nongnu.org; Mon, 24 Aug 2020 11:01:24 -0400
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:43960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kADyM-0008Cb-CD
 for qemu-trivial@nongnu.org; Mon, 24 Aug 2020 11:01:24 -0400
Received: by mail-ej1-x641.google.com with SMTP id m22so12302045eje.10
 for <qemu-trivial@nongnu.org>; Mon, 24 Aug 2020 08:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5QQZFfKmiN4x/jvCiWb3vKnwE+Dwwj/ayaYHLvhSp2M=;
 b=XsCySBueoXC1+4WtqMIxuoGYkAxZuj6zayjJ3AbVLvqp2ejEF7cAdvxOjYzgsUyJri
 KraneBi/vnKNvINB45o6BnKZBXa5AT9eh40/5otVbDKd9nn5HfwLZCsZVyCM8zkjBTj3
 Xq/cOErKovXIm6KNLRdB69spHJmaGPXfXUYWUuw/Y8N53j2YDLsehHRaVnxY4fo8zxo4
 lW0S3GIKtpHnuF0p79I8v5Fz5O3OrBihZkwychKLx1POulC7M9CCENG3FBxqTMz57Y6P
 AwSbb6hH/0eLrjTThhPwSGrWVrGFBKyBR9JfrIHijN3YrUm+nDgXcw6HKDAwnEd/phB6
 DR2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5QQZFfKmiN4x/jvCiWb3vKnwE+Dwwj/ayaYHLvhSp2M=;
 b=ghy5Aq937TNhhZWIl4WDmps2+NbbWaBB4ECxL7TJCyXs+BuJV2Fn3bKaXX5M71fSOX
 VRwthdFWtmbNGeqsNagTPbqJVUW3CpnEKlBWimkaxxNuDZn9wQIP1LhJkeQupUyOOam/
 I8Iq+R4jAPncOuBP+QFNgzz/R0OZuxswceUt/LaV/81j9uIbp+hZC7M1G3iun8EgCluN
 UukR7DLzI9uxpAXUvYNrLkdVCTwbRID2tLklvrYK1PFkSlNe2BPYX4RXR8eei3kYZQyN
 PejD74HyoHyxIH03MEaCOed/NFlOJhvDZHZbsRS16onQXQx11kyEgZtZCbBodyfp4xdS
 4+KA==
X-Gm-Message-State: AOAM533q1QgVNcHkr429AB/lz7S5wPWCsDx+G/s6Wp0T9NMvyIYCWxsM
 Gxm3BfP1MknmLDinlPbjmvN0E2VXXkf9FGpjhGTfzA==
X-Google-Smtp-Source: ABdhPJxcDjtDEzYUye6x3Dmzg9ujqCZ3q1JWqsI1T/KJO2NJFYT7C0yQKEAOoevS9VYORj54vtxQ75ponhqtDc2LUgA=
X-Received: by 2002:a17:906:59b:: with SMTP id 27mr6296618ejn.56.1598281280785; 
 Mon, 24 Aug 2020 08:01:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200812190206.31595-1-f4bug@amsat.org>
 <1ccf070b-7abd-ebfd-2788-92a81b4fc8fe@amsat.org>
In-Reply-To: <1ccf070b-7abd-ebfd-2788-92a81b4fc8fe@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Aug 2020 16:01:09 +0100
Message-ID: <CAFEAcA-nLLM3dqC=71JSfu9+8=xsnpfavD0Wk4Lkuf+EOytgQA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] hw/misc/unimp: Improve how offset/value are
 displayed
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::641;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x641.google.com
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
X-List-Received-Date: Mon, 24 Aug 2020 15:01:25 -0000

On Sat, 22 Aug 2020 at 21:02, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> On 8/12/20 9:02 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> > This series aims to ease looking at the '-d unimp' output reported
> > by the UnimplementedDevice.
> >
> > - read/write accesses are now aligned
> > - the value format width uses the access size
> > - the offset (address) uses the size of the memory region it belongs
> >
> > Series fully reviewed.
>
> ping?

What tree were you expecting these to go in via? Probably worth
being specific about who you're pinging in this kind of case ;-)

-- PMM

