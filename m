Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jClJJ-0001DD-Qf
	for mharc-qemu-trivial@gnu.org; Fri, 13 Mar 2020 10:29:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52001)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jClJG-0001Cc-IR
 for qemu-trivial@nongnu.org; Fri, 13 Mar 2020 10:29:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jClJF-00024V-D0
 for qemu-trivial@nongnu.org; Fri, 13 Mar 2020 10:29:10 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:37409)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jClJF-00021o-7M
 for qemu-trivial@nongnu.org; Fri, 13 Mar 2020 10:29:09 -0400
Received: by mail-ot1-x343.google.com with SMTP id i12so5006422otp.4
 for <qemu-trivial@nongnu.org>; Fri, 13 Mar 2020 07:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=d7ExToA7ukFgaIlGlPhMKk8Km2pb+rGkei+b6krgOkM=;
 b=qZyixREPridVpxFGXnekwCA1wEFxdbXDOObBp0di8XzaYvCdGNL1TKjKpcauMuGtdi
 TFVGwmBfZ4TLQ1N/p+d78CmNwWHwNb2T9D4bsdela98KXb+LhxXqHkGh/Pi8LcEKXMPf
 d7ZWFOYszeQ1QvD4B72cFWTFU6w9QBksOP2aSR30XtrAF1p83zdlgn5aRbrFIaB20b9/
 4RPPoHxpbaHxTGGog4aHeal6/E00BAWkPsboGZC2TQagU7Ah4G8AZnOb932Np83O2fsp
 7xwMZ+3jAjfk63pSyREGGPcxgTKZOjJKxZQliFSfxLc0pzfznvdMW2MftDWzyPJDBVD8
 uUmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=d7ExToA7ukFgaIlGlPhMKk8Km2pb+rGkei+b6krgOkM=;
 b=aaemXsxXcDA7O3ZqgDfFo6W/0YwDGV16+B8zBLUkd0D/dGeOj0Iz5F2Et524FzEgHO
 1qX82ZS/QC5ol59j2C+2zVFd1AC+bhwat6YILCOz5M7mwQsVZ5s+A268SCZ1nbzGh9So
 811eMJwNpJd5lKp7uihDW6AGU5Motq01HjUeyh7QRlf3NaAd1pSZBD0YWCV5AQCPT7GY
 jqyA2JJpS2s6Z5PCklQWmQJAR0beHUEZT7EmHTL5y90Q1UV/EU6ntAUVTvMstwB9dHjC
 HpE+Dq8Tsf0tLHCe4sXA+s1iGhV5CbJSCgVRwuaUxvAcaB0S2o4c3BdP9NIOYzxFRVZC
 ogrA==
X-Gm-Message-State: ANhLgQ1eJKK50yvf6d55fHBfCyuc3xsgF8RRsK3RD6s85JVZizbxJn/V
 uBoNAzBfl/sBWhiQOjQnuVCPXGl9M161T0XrFMa2Mg==
X-Google-Smtp-Source: ADFU+vsd8TxBx6Lk8dbWCxWoA5LHQvluGxwglrALxjwp73ZAAqWySSOdVoRlh6Tq5Vq8mHVM+PGMNB2fdOJt8ZCXbhc=
X-Received: by 2002:a05:6830:19e2:: with SMTP id
 t2mr10680836ott.97.1584109748226; 
 Fri, 13 Mar 2020 07:29:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200313123242.13236-1-kuhn.chenqun@huawei.com>
In-Reply-To: <20200313123242.13236-1-kuhn.chenqun@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Mar 2020 14:28:57 +0000
Message-ID: <CAFEAcA9kM_=52JT=XyhjDLA3CUSpeKwCB2nhLRrjY+MaBLw1yg@mail.gmail.com>
Subject: Re: [PATCH v4] hw/net/imx_fec: write TGSR and TCSR3 in
 imx_enet_write()
To: Chen Qun <kuhn.chenqun@huawei.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, 
 zhanghailiang <zhang.zhanghailiang@huawei.com>,
 Euler Robot <euler.robot@huawei.com>, 
 Jason Wang <jasowang@redhat.com>, Peter Chubb <peter.chubb@nicta.com.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
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
X-List-Received-Date: Fri, 13 Mar 2020 14:29:11 -0000

On Fri, 13 Mar 2020 at 12:33, Chen Qun <kuhn.chenqun@huawei.com> wrote:
>
> The current code causes clang static code analyzer generate warning:
> hw/net/imx_fec.c:858:9: warning: Value stored to 'value' is never read
>         value =3D value & 0x0000000f;
>         ^       ~~~~~~~~~~~~~~~~~~
> hw/net/imx_fec.c:864:9: warning: Value stored to 'value' is never read
>         value =3D value & 0x000000fd;
>         ^       ~~~~~~~~~~~~~~~~~~
>
> According to the definition of the function, the two =E2=80=9Cvalue=E2=80=
=9D assignments
>  should be written to registers.
>
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>


Applied to target-arm.next; thanks for working through the code
review process.

-- PMM

