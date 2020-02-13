Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j2HUz-0002uE-MY
	for mharc-qemu-trivial@gnu.org; Thu, 13 Feb 2020 11:37:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54906)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j2HUx-0002tw-S7
 for qemu-trivial@nongnu.org; Thu, 13 Feb 2020 11:37:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j2HUw-0005vs-VZ
 for qemu-trivial@nongnu.org; Thu, 13 Feb 2020 11:37:55 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:36059)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j2HUw-0005sg-RH
 for qemu-trivial@nongnu.org; Thu, 13 Feb 2020 11:37:54 -0500
Received: by mail-ot1-x344.google.com with SMTP id j20so6196261otq.3
 for <qemu-trivial@nongnu.org>; Thu, 13 Feb 2020 08:37:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hVljpjxOKu8zZchbn5tT/3JBUBI5cy6tSobo0vQSXeM=;
 b=L3nnJqLqpu/qUQXyOCwWVszb4apJqEwuxW1+LjlG16MJld+HWnSjWN+fkf7KgIA0Cy
 hZq7aSDa/wFDmy0Um+tfJgFlDcm+jxTcMacn/Y7w6asUKLdlIsSB23nKqj7FwtGP68sg
 YDTL0EKHyhQtpGCmnT8LO6FhGx7n6JRs75/eg3gO8qip0y3x2LaEEk1i1Gkpgt5Ni91e
 DDoetm5dir9gTenqORPf9pyBVWY1xF1iJtUEisaxvMdX5TGGldpC7oD/guuSXVBRfoVn
 0rt++FkyHAYAp7NYrlUJH6EghMaKOupXD/d9PtF0EXDgEIdzQqTI/2FqKKt0cTJ1IxyV
 C1Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hVljpjxOKu8zZchbn5tT/3JBUBI5cy6tSobo0vQSXeM=;
 b=MyPDMOxUp7dMJQtVgoIpWugqw474RFMa1GsYSoIXrLqHpB4bDYmdigB+hgrgHu0KQF
 Bxyc6+p+kAePfI/3oFhqKGaru1pgtQbICx6t1ltYYwV/hNaUc8bzyFKX2Olyx77egrtu
 Plk5zPCGXBuWpq/RIDg8x4hSERlH5zF4rfnrRG19RGJf5COC3sTgvh2QT+kHw2NGeVf8
 iQm5GIwCMzGFbufnXgbsVo4MxXR0oa686BclDOyU2aW5Tk62KikK3FpvUY6FPvULmOjC
 hCDQ+midPxJGaKI71iFEpA4uAwpk6ezAd0RAOQyw9MKRpv7Oh0D+au+CtYbMBX42K+/r
 +WHg==
X-Gm-Message-State: APjAAAWcuHk5h2X+K8zu3okC8k7dvl5rnmBVDWQ6T7y0Zy8FLWaJ/v2I
 qbv8h9rtG/GzQVXo3zgSqLctudKGTMqvctHD8QumVQ==
X-Google-Smtp-Source: APXvYqxG8OEormYOnBSOmeNiShQntR8YpqzS98pZae0JTWsIm1iNp9e2Fq+fZeWfx2ZcrKWazSYIq2gJ6LqyJBRYtlA=
X-Received: by 2002:a05:6830:13d3:: with SMTP id
 e19mr14074260otq.135.1581611872788; 
 Thu, 13 Feb 2020 08:37:52 -0800 (PST)
MIME-Version: 1.0
References: <20200212033641.249560-1-kuhn.chenqun@huawei.com>
 <ce5d39c0-d532-4b54-a39c-01c9c97cbb59@redhat.com>
 <7412CDE03601674DA8197E2EBD8937E83B1163F4@dggemm531-mbx.china.huawei.com>
 <99531e05-f8fc-ef0a-ca62-6d477c899e78@redhat.com>
 <20200212161957.GA5028@habkost.net>
 <87r1yy4l4g.fsf@dusky.pond.sub.org>
 <24243b1d-f3a1-1778-8b50-4d4776393cdf@redhat.com>
In-Reply-To: <24243b1d-f3a1-1778-8b50-4d4776393cdf@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Feb 2020 16:37:41 +0000
Message-ID: <CAFEAcA8n1pFFTw7EhV5b8UE+XGWgVsxma++SHuh=ns7VeCPNjA@mail.gmail.com>
Subject: Re: [PATCH] hw/char/exynos4210_uart: Fix memleaks in
 exynos4210_uart_init
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, 
 Zhanghailiang <zhang.zhanghailiang@huawei.com>, 
 "i.mitsyanko@gmail.com" <i.mitsyanko@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 "Chenqun (kuhn)" <kuhn.chenqun@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
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
X-List-Received-Date: Thu, 13 Feb 2020 16:37:56 -0000

On Thu, 13 Feb 2020 at 16:33, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
> > * unrealize() must clean up everything realize() creates.
>
> Hmm I guess remember someone once said "only for hot-pluggable objects,
> else don't bother". But then we make a non-hot-pluggable object as
> hot-pluggable and have to fix leaks. Or we start a new hot-pluggable
> device based on some code without unrealize()...

Yeah. Almost all our devices are not hot-pluggable and don't
have unrealize code. Better to just have them stay that way,
or to add untested unreachable code in an unrealize method? Dunno.

thanks
-- PMM

