Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lTjGc-0003MN-V3
	for mharc-qemu-trivial@gnu.org; Tue, 06 Apr 2021 06:49:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lTjGb-0003LI-SX
 for qemu-trivial@nongnu.org; Tue, 06 Apr 2021 06:49:05 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:34372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lTjGL-0005wN-Hl
 for qemu-trivial@nongnu.org; Tue, 06 Apr 2021 06:49:05 -0400
Received: by mail-ej1-x632.google.com with SMTP id b7so21195036ejv.1
 for <qemu-trivial@nongnu.org>; Tue, 06 Apr 2021 03:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9l89O94e5XxYokmPTnjI3FGTeWRxmYILQ1nvY+3lCcc=;
 b=JZp2D851oaFUmOATi8RAltm8hHNjeNVT8yEkbjWhZxiWGCaRhl5re2SmWjgFUe7iSP
 PyIie/8ZCa7UCo/iqTP7pRcKoZ+RZjF0Y3mpTEjpPKTpZuo9vVHpgrkY5bYcJMoRsiBc
 T0wsC+/+gq3htY3yqDp1iwu+NJlej2cg+aDZ07dPG0s0D1QgPWSL9vlU6tZ9jAwGfuDz
 YgvDOws8SaCOcnisqwMTHfn+iew4/VGGUPWs8zBxPGIzCcYhtGAs+CcAeyFqt/eshZ5e
 aOlsjMOtHQrvO26TyUz9VooC4PpP6uDbCditRZygQ6yuUwtGPZ2qvb4tCWdWh/Ht6+SE
 dutw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9l89O94e5XxYokmPTnjI3FGTeWRxmYILQ1nvY+3lCcc=;
 b=rjSWXvvN+U3yStmyQwjzCcG+liOpVFElp7snyTnac5Ig0/YeGWLkDPdLisx5F2HwjX
 ffseTvKzJVRDlvPE1foMANmJobyFDGDc+IlCgk7lDK/siztTxlydR07JMKUTH6RVqWww
 cs+DNna59eF+GRjWtB5Jujd2bIHz06swbnXgqR75ex21uKP/wxn+BpTGnVMqgXvVbi/u
 d5PV0z4XZipNtPSm/4bj4W3HMnbbUllciBgqMYHjMf2B7ZZSWqleZvjGPFZbAXFDBlZa
 eR9n+IidlMFqlc/nK9npqpz4O1N0NnQ8R4+R5ad7YbTFGnSf6Xb941cmM30A7xg8wDlq
 6oLg==
X-Gm-Message-State: AOAM532ZbOOF6+ORFwgNvcrh6OYqCp+iz9rdXBwhU2OCsaJl05ONRO1q
 9RwT861fECDqr45rD/uAo5PzUZemYKP8mSiAGnXZt41qx/cIRA==
X-Google-Smtp-Source: ABdhPJzCWCePjOJn6yaCgS294NFyFmgdnl8+3gJdajTE5GebNV5J4kt9XExuq/2GhYyqeMEVi/khxCgUJ/WuB9Hud/s=
X-Received: by 2002:a17:906:1dd3:: with SMTP id
 v19mr33046810ejh.4.1617706128139; 
 Tue, 06 Apr 2021 03:48:48 -0700 (PDT)
MIME-Version: 1.0
References: <84v98zkb09.wl-Peter.Chubb@data61.csiro.au>
In-Reply-To: <84v98zkb09.wl-Peter.Chubb@data61.csiro.au>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 Apr 2021 10:48:10 +0000
Message-ID: <CAFEAcA8OZy+mMnmQfYPkj-EYbt8_yodaKuOQGGYXDvOPmK5_Tw@mail.gmail.com>
Subject: Re: Remove myself as i.mx31 maintainer
To: "Chubb, Peter (Data61, Eveleigh)" <Peter.Chubb@data61.csiro.au>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
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
X-List-Received-Date: Tue, 06 Apr 2021 10:49:06 -0000

On Tue, 6 Apr 2021 at 10:42, Chubb, Peter (Data61, Eveleigh)
<Peter.Chubb@data61.csiro.au> wrote:
>
>
> Remove Peter Chubb as i/MX31 maintainer.
>
> I'm leaving my current job and will no longer have access to the
> hardware to test or maintain this port.
>
> Signed-off-by: Peter Chubb <peter.chubb@data61.csiro.au>


Applied to target-arm.next. Thanks for your work on QEMU !

-- PMM

