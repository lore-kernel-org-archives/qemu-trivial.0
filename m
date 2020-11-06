Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kaza5-0005JK-4M
	for mharc-qemu-trivial@gnu.org; Fri, 06 Nov 2020 06:06:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kaza3-0005JD-RI
 for qemu-trivial@nongnu.org; Fri, 06 Nov 2020 06:06:55 -0500
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:35264)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kaza1-0006Mv-VC
 for qemu-trivial@nongnu.org; Fri, 06 Nov 2020 06:06:55 -0500
Received: by mail-ej1-x643.google.com with SMTP id p5so1361376ejj.2
 for <qemu-trivial@nongnu.org>; Fri, 06 Nov 2020 03:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wzNB+ZPocv9izgv7Ouydj5ESivB9v3PlCDHixLFnuFw=;
 b=NdygL/XGN3m10gVgEIHeQSmqjGw2XEJr3pMPqegqWtVhhTf2MkXRkDiC/oRJpwuwrs
 gMWYeR5BxgsTr/WWsntxQeiVVxARDRWgOiKvB4hcV5Z0oZ+gl2pCn+b5DRNQZOO+eq3I
 AXxarTODhQWdJPhHfcRnhQMHEAqwgDYd+ACAls1IgxwHQQBOnw3gWc0fGsx6Sjw+gm9D
 bZUgMqE+4gwdfDWb9Okmh1TKNpZQQJV3SblzD81/3jMz1XWjkcU6U4cD2NuuLKvRjTNT
 o9+fw1b0ke7PA/06Ln9zWLxQsuuGGf3g+AVKk8cLPStLS9C+12sPclRH+cujI9jnUwwG
 KlNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wzNB+ZPocv9izgv7Ouydj5ESivB9v3PlCDHixLFnuFw=;
 b=Tf+HXVqz1WPtxnVhM3nkhD//L4y1kENnSTbQkXjXIvxmt0h/RNi/9P+EOiLGGvVNWa
 9SsLYGuG5EmckNo96GT165beotRmKr5xva5IcNfaqB1usHijqTC3KCytCM2LykYhTk7y
 fMX+Ft5VdOWMxIA7+9CapEJ19HUDNKPtliqOdNXDixG+oOs3u14w4DXxsTTOBDVnZ2Ex
 qbq3FOn0kDs1qzb+9hE4SthPyFl9jpdFbii00y4R89ZzdllAVehbdZjrZPuPq7CieXM+
 pRffKO5QmQakNT2cVLEMvhM//jLj5lqJ6hsWiPW6ULxy4b25OMeapWSJnTopDIZij6Jz
 /fKg==
X-Gm-Message-State: AOAM531PsfINvZOdoiRB0AM4UsfN3TaXkSU0zZex2CBWD6S8Jj3iHvQ5
 +6QiPJw4Xh5agzwjnmEv+6FvP4sqqkJN6vcOhHmoGg==
X-Google-Smtp-Source: ABdhPJxWPr7GuyFAJQ/616aUYX8SRB/mnXCCpp5+x+aNoevjdh+JYCas5GZ332uTeyCf0joqIWo35vQtvvTu3R+Pw0U=
X-Received: by 2002:a17:906:7254:: with SMTP id
 n20mr1404024ejk.382.1604660809325; 
 Fri, 06 Nov 2020 03:06:49 -0800 (PST)
MIME-Version: 1.0
References: <20201105154208.12442-1-ganqixin@huawei.com>
In-Reply-To: <20201105154208.12442-1-ganqixin@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Nov 2020 11:06:37 +0000
Message-ID: <CAFEAcA9QMBqF0Bm44q4m1d=QaPVBJodH9rwuYhGx5H6zy6ULcg@mail.gmail.com>
Subject: Re: [PATCH] scripts/checkpatch.pl: Modify the line length limit of
 the code
To: Gan Qixin <ganqixin@huawei.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, 
 "Daniel P. Berrange" <berrange@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Chenqun (kuhn)" <kuhn.chenqun@huawei.com>, 
 zhanghailiang <zhang.zhanghailiang@huawei.com>
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
X-List-Received-Date: Fri, 06 Nov 2020 11:06:56 -0000

On Fri, 6 Nov 2020 at 06:15, Gan Qixin <ganqixin@huawei.com> wrote:
>
> Modify the rule that limit the length of lines according to the following ideas:
>
> --add a variable max_line_length to indicate the limit of line length and set it to 100 by default
> --when the line length exceeds max_line_length, output warning information instead of error
> --if/while/etc brace do not go on next line whether the line length exceeds max_line_length or not
>
> Signed-off-by: Gan Qixin <ganqixin@huawei.com>
> ---
>  scripts/checkpatch.pl | 18 +++++-------------
>  1 file changed, 5 insertions(+), 13 deletions(-)

For the code changes
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

but we also need to update our coding style documentation
to match. I'll send out a patch with some proposed text.

Side note: the kernel version of this checkpatch change
(kernel commit bdc48fa11e46f867) suppresses all line-length
warnings for the "--file" use case. Do we care about that?

thanks
-- PMM

