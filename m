Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nOhmD-0004FX-CO
	for mharc-qemu-trivial@gnu.org; Mon, 28 Feb 2022 10:17:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nOhmC-0004FE-7F
 for qemu-trivial@nongnu.org; Mon, 28 Feb 2022 10:17:28 -0500
Received: from [2607:f8b0:4864:20::b32] (port=46839
 helo=mail-yb1-xb32.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nOhmA-0002Qi-Kh
 for qemu-trivial@nongnu.org; Mon, 28 Feb 2022 10:17:27 -0500
Received: by mail-yb1-xb32.google.com with SMTP id b35so21122638ybi.13
 for <qemu-trivial@nongnu.org>; Mon, 28 Feb 2022 07:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fZ6ibge3nQij0TZ3fJ9eg2Ef1dKq56sQMHovVHgpLDE=;
 b=CJ/P3MT5sjqDkZZm3lNYUC+1Vf2dGPlTDRaT/05bd++zjt3CQAjMmCGKwLyMjV6rim
 ImTkKNbuj65as7Q+DuvMO/sFRQ5V2tK3GBYXEqj9PDKqQlHV4hzc+War0nhcEkrMAY1y
 ZbkM4IEeZz7otx7DrImKKIfl6f912TPXvDuBA1oWJmfplcbFLQra9T9n81OxhY8eluyj
 PvkABMrLFw1iEw/WdWEvwglfzAWbQDAo6Jf4E4rrAlmt6FzeEA2mMUaQ4MQGLb3KPFAY
 +KypdqBbt7rJQ9L6Z6sKsmDzDCJk6G/PUo87DVYHUH6Kp8YPxsB1SLBc0mVsLVNFZos8
 IfOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fZ6ibge3nQij0TZ3fJ9eg2Ef1dKq56sQMHovVHgpLDE=;
 b=YpyJGiqZXfbDmYDc4bIzqNE+RN4Kz5BzSKiWCaQSih4ykHuYuD31TLHLtz0gGWUzMy
 GzKFdEB/P6uCHkrt0vbuboWqSwCn4gcg4eS1BZnYHIMw0qWsz6aiKySi/03gAKaaD8WH
 j3jBOwf/xHkSvy+Gkkw0Wu5HioHIO2uTlPNSTyqQuqoj2HbJc2yzHTrV3IjETuR/CcWa
 yXuVWlZiL2JzNrMXP7f3GgjlTGdZ+O6iKqP1E2tKfaZxAMQMfjn17K+0BrF6bxNfFsd6
 Rf8nWd3Spz13u4kq6MEblwYHDSn/hOiDAOF+d5OtSnUKCMoB3AnTMdI4R/6b49HeQuGd
 YWnA==
X-Gm-Message-State: AOAM531iMzNI7tni9m3CLRsaNpv/y2lDyYeIgpq/7JGMidwHVLKeTKrJ
 A+gdnLwZmiRpI6k7T1I3poKl6SvchRR5GQBDOccvJg==
X-Google-Smtp-Source: ABdhPJwlS2SwuRRQtPb43v0q6nkkuVFhpVOskptFKAHkcZ1B8nUnXeLtTIM0lI9xWVYxmiU2XV4Z36e1fTq+qpqhgcg=
X-Received: by 2002:a05:6902:83:b0:61a:709b:d841 with SMTP id
 h3-20020a056902008300b0061a709bd841mr18459371ybs.140.1646061445539; Mon, 28
 Feb 2022 07:17:25 -0800 (PST)
MIME-Version: 1.0
References: <eddf5c19-5582-7d88-5232-2052f87583ae@mit.edu>
 <CAFEAcA-dStng7OmArapZTMXx=fF9cme3VftLAAd-nQgcv0ZgGA@mail.gmail.com>
 <YhzeYQ7akrGqAIW7@redhat.com> <949b0675-cbae-51dc-5a3b-d0215738279b@mit.edu>
In-Reply-To: <949b0675-cbae-51dc-5a3b-d0215738279b@mit.edu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Feb 2022 15:17:14 +0000
Message-ID: <CAFEAcA99UBCvE-YTn++BSMTh5S11JqLJB4XsjdiV9D90aBGXjw@mail.gmail.com>
Subject: Re: [PATCH] explicitly link libqemuutil against rt
To: Simeon Schaub <schaub@mit.edu>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b32
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb32.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 28 Feb 2022 15:17:28 -0000

On Mon, 28 Feb 2022 at 15:13, Simeon Schaub <schaub@mit.edu> wrote:
>
> We generally target glibc 2.12 in the Julia ecosystem, since CentOS 6 is
> still quite common in the HPC community.

Unfortunately you're on your own there then -- CentOS 6 is
well out of QEMU upstream's supported-build-platforms list,
and we will not carry portability fixes required only for it.

thanks
-- PMM

