Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kjjQ1-0006ol-Rt
	for mharc-qemu-trivial@gnu.org; Mon, 30 Nov 2020 08:40:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kjjPo-0006jH-9p
 for qemu-trivial@nongnu.org; Mon, 30 Nov 2020 08:40:31 -0500
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:38818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kjjPh-0000Je-Qw
 for qemu-trivial@nongnu.org; Mon, 30 Nov 2020 08:40:28 -0500
Received: by mail-ed1-x541.google.com with SMTP id y4so16129692edy.5
 for <qemu-trivial@nongnu.org>; Mon, 30 Nov 2020 05:40:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SkOd7hFHuRTWAD2WpxIHqC2LnGgSIlJFl00IyMuh/Pg=;
 b=AZghzpEC32ReTt1DzR4jJxS1/QhlP67nIGFOgfekfe3MMKNwbIM7BSiVRAkxSv1rgk
 09hGtDpO68johGBwelX/8TnMAvb7qE8OrS8Fi8+biTGB7gOOvbBJbkYfxtxOvpFwwX7D
 PALWz4yfAdFPQ/n80rLgP8M8RaxqLvCqDT5YDHicvEeozSFJJ9yQBglDutEA8BYxTuQF
 fYsKHd3s2ShYB4oRyDA3z/xG25XF2zGa5f26tV3nk7nYdCyIsI/gl/0GwmhrWHB6YQ3B
 2UsmIC2NbEqgEY8KDFq9ZbLBA2nN/5uDcbaDiBohUKrFcHjWkxCntAt7XNSJyivw02oe
 7npQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SkOd7hFHuRTWAD2WpxIHqC2LnGgSIlJFl00IyMuh/Pg=;
 b=T6y3uBP0GDsDUQo/R5vWgRykewadjeVEDLrsbPRj7i7uVL1Y48DldrreN4nKSoqoLn
 NcFtQGm7QNL/fwgRedtn9Cag9WIKQ6DVBALFbzpjbtsbSdlvPIjnSAha6HVAqV1PrK+D
 ajoF9yhcyhGuY7UONi7HnLISrz/+DpTgQGORVTV45Nmocsucs6grIv43pgmso3wifOnJ
 IAsnY3fr6AFv3gxSN+hCy1Z00gnnfSXfkBjrbyT8RdpADDLNBp+UiU7Oa/d65/GXPmRc
 O/DpVGB3gYqAle5HEnJ81meKXwLdyrs9Pv0H8+UeeCulRKDI+d7gn8U5Z85Bx7u9tK+3
 ikaQ==
X-Gm-Message-State: AOAM5305s/s4Yqwl/ANwe4+t9fbbltsRLEhsxWS9+8ImMc9hkKUWpEHp
 diKoXHbNXCBLVQIeTRFjeyHscU2YOwB+VjHX996u4/TFtD0=
X-Google-Smtp-Source: ABdhPJwGA7fKTah50YYXa3b2hm48GZ7Rwjh8fLm2UDYXTF0l9aVUFQdxm2cnS8mDg+EGCEE5fF3NWfGJJo1Rb6dhXWk=
X-Received: by 2002:a05:6402:3089:: with SMTP id
 de9mr21631949edb.100.1606743620266; 
 Mon, 30 Nov 2020 05:40:20 -0800 (PST)
MIME-Version: 1.0
References: <20201126111109.112238-1-alex.chen@huawei.com>
In-Reply-To: <20201126111109.112238-1-alex.chen@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 30 Nov 2020 13:40:09 +0000
Message-ID: <CAFEAcA9qt=HUiaYPE7K=7Gkn4Bv+a2msjeYJUDA+Pqhq2UnMxQ@mail.gmail.com>
Subject: Re: [PATCH 0/5] hw/misc: Fix some bad printf format specifiers
To: Alex Chen <alex.chen@huawei.com>
Cc: Jean-Christophe DUBOIS <jcd@tribudubois.net>,
 Peter Chubb <peter.chubb@nicta.com.au>, 
 QEMU Developers <qemu-devel@nongnu.org>, QEMU Trivial <qemu-trivial@nongnu.org>,
 zhanghailiang <zhang.zhanghailiang@huawei.com>, qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::541;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x541.google.com
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
X-List-Received-Date: Mon, 30 Nov 2020 13:40:34 -0000

On Thu, 26 Nov 2020 at 11:23, Alex Chen <alex.chen@huawei.com> wrote:
>
> Find a lot of bad printf format specifiers in hw/misc, fix them.
>
> Alex Chen (5):
>   i.MX25: Fix bad printf format specifiers
>   i.MX31: Fix bad printf format specifiers
>   i.MX6: Fix bad printf format specifiers
>   i.MX6ul: Fix bad printf format specifiers
>   misc/omap_sdrc: Fix bad printf format specifiers



Applied to target-arm.next for 6.0, thanks.

-- PMM

