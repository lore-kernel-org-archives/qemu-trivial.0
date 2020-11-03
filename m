Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kZtLh-0000kc-4e
	for mharc-qemu-trivial@gnu.org; Tue, 03 Nov 2020 05:15:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kZtLf-0000jM-MK
 for qemu-trivial@nongnu.org; Tue, 03 Nov 2020 05:15:31 -0500
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:43961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kZtLd-0005oo-Sn
 for qemu-trivial@nongnu.org; Tue, 03 Nov 2020 05:15:31 -0500
Received: by mail-ej1-x643.google.com with SMTP id k3so23242210ejj.10
 for <qemu-trivial@nongnu.org>; Tue, 03 Nov 2020 02:15:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=z4wgo89ml5eirsaQqj0zoNUPYZPMiyabBFQs6dGJs40=;
 b=GsdobSG4weqgm1rWDU55JtAdqpFfSFkdNm0GhDcJQuzf5KMlf2y/Fsu2Z6AMgW+6w4
 4hasH9OKIh01yTrZZYQ/WdOb5QoSd0LhIkqjeAQRXGArawCdiXq/iZCqc5hfTsOD2AGm
 VnfbNJLEUxlAJGLFOs2HpZ6ByMfn4ymigj/JzwXpAN+GnER4UT0MNUYNFxnZRxcNXosY
 RH/FNFc9I9VrM293eof2sot6VtFkTY1RXgIP6eT5jsNYQTT1Ovhz5204SreR7bcLVdGJ
 z9h/0SYubNoPMeCQ7YGF/YXfW+WZJvauhYQr9ZzIsE41r2edBRY93LAH2jwxFQg97Rlb
 RaXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z4wgo89ml5eirsaQqj0zoNUPYZPMiyabBFQs6dGJs40=;
 b=nXu03mIBtSZFioQpvTwt5ggy+Of/TQEZScR2IpkJnX2ZHBMJm+1IzKfJws0qespJYI
 6F/JpOQyLyn4hdOcXKaBXKYABjsx0bqlxpcxOKSsC7KIdRN2leB8PkiCadrUp3p9dVvp
 IQ3aKgco9yDTk/tGQd11nmgbyzgwUmVfR8iz0vWkwLp5TOHdWk6qmdgMEN2zCohMcAbo
 ww/oxF87khzOacQ/5N5Vf1DXY5xNqK5huUVzwDXEjXm4AExMoePQ3a6AwuQyDIeLXmZf
 MJfWbJ/JqS2Wzcx64/1Safpwy46gS7QIN6aIkqI460Mt5neGK7hH6ZbSyShoL1MpQE4V
 gheA==
X-Gm-Message-State: AOAM531b6pEfyNZlgQAoD4pDmE+gqx26v6LOeqkMl90wM4jcmkG1I7Pr
 P7kMBfwVi+2VRuQRnxnvUPaCMTujkmnN4b1NEbigkw==
X-Google-Smtp-Source: ABdhPJxnxEoizVY0rh69WmRSFUqQNmh3NFVNS1wvbzddOdfKH3ibeYgT8BsltAIe2dshPLh6OUkDpmqERX2SqfflFXo=
X-Received: by 2002:a17:906:7254:: with SMTP id
 n20mr18525559ejk.382.1604398528163; 
 Tue, 03 Nov 2020 02:15:28 -0800 (PST)
MIME-Version: 1.0
References: <20201103015228.2250547-1-kuhn.chenqun@huawei.com>
In-Reply-To: <20201103015228.2250547-1-kuhn.chenqun@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Nov 2020 10:15:16 +0000
Message-ID: <CAFEAcA-P8iM1PpKajNv7R3EOtFrM6_bWg9Lo_YRY87E+D2uKZQ@mail.gmail.com>
Subject: Re: [PATCH 0/6] fix uninitialized variable warning
To: Chen Qun <kuhn.chenqun@huawei.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, 
 zhanghailiang <zhang.zhanghailiang@huawei.com>, Gan Qixin <ganqixin@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::643;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x643.google.com
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
X-List-Received-Date: Tue, 03 Nov 2020 10:15:31 -0000

On Tue, 3 Nov 2020 at 02:07, Chen Qun <kuhn.chenqun@huawei.com> wrote:
>
> Hi all,
>   There are some variables initialized warnings reported by the compiler,
> even if the default CFLAG for the compiler parameters are uesed.
>
> This serial has added some default values or changed the assignment places for the variablies to fix them.


Hi; if you're reporting/fixing compiler errors/warnings please
can you include the compiler version that produced the error
in the commit message? This is helpful for telling us whether
it's a problem with older compilers or whether this is a new
compiler that checks for some things more carefully.

thanks
-- PMM

