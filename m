Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kMvOo-0002PV-LQ
	for mharc-qemu-trivial@gnu.org; Mon, 28 Sep 2020 11:49:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kMvOo-0002PM-0y
 for qemu-trivial@nongnu.org; Mon, 28 Sep 2020 11:49:10 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:38053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kMvOm-0001Sq-4P
 for qemu-trivial@nongnu.org; Mon, 28 Sep 2020 11:49:09 -0400
Received: by mail-ej1-x631.google.com with SMTP id gx22so9245631ejb.5
 for <qemu-trivial@nongnu.org>; Mon, 28 Sep 2020 08:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ttw+TU6VsZYGQg1kHmP3ni0TLoY2zJuzQRwAgvD5cYQ=;
 b=DPQw6qL7Ji/WMRQ5ReL5mLrazcNrceuk2oHPa9vi3GhCTaZ8rrO9Z1hm5eEHxF/Jkr
 fI4CgxO8y0D08/n+WThC8q8rv+lsstu2tMECBmJ2LukjvsF2SXCUdEfkilzZUF+StULr
 1UBQnXXh5gOIu+lEQk6VcaQR6XIStLfjvaRcJh0MKRVtgJuPh8ZoUwxcAX3rJiwN0hZp
 Oh/FY18wGnFsL4vFLKLWCN6HzFh0X04npuYAX0bNaXtgqe/mQvE0oZB61e3JRRmzvTTp
 tzQse3+ThuJc0FMvZFToWjCOAAPnfOnYz8sJTkMO50x0QIJLZGcLGDhqBshwflB4y7Ys
 vWfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ttw+TU6VsZYGQg1kHmP3ni0TLoY2zJuzQRwAgvD5cYQ=;
 b=V9Vx67NPysGsXr/IMj7hFgTUSdtIuyKNirCi6RQ/BCHiBvWBlPGMbAfi80Mff5eM8s
 scAdGSMDnO73i50Ep6TrF8fZ8PRE3NNZvWPLocszgDfn9xPSx1SeoP67PI0d/7+CqSmf
 wZ1bUUBMqdOVGPpVUfeWafTj3ujSVRXZgazTltetAb09MNtliwiNqS/HQF/pXHPD0GJt
 87oqA/bR062+1i6hV05XOB6N1VARMDQ38fIZGDeq1eYQuyeS/RpBAJCVMKhmrHSmsqp/
 KzbVQ+PYXt7CChjMOrVT4QUulRUBOdWG+fimOh1vj+ZvBWS16FhZl1ROcPSRIkkeOsji
 rEew==
X-Gm-Message-State: AOAM531F5ljFIsz7XZGLCH1oC02N+v8z99ACIFjEXuDTPIeL6XH3O4y3
 Tc/G0Vrg9OkE9p3crdnBMGeHK7M2Euu9A0G9VOwJlg==
X-Google-Smtp-Source: ABdhPJwMSjLPiP8K7SHH+dv/REIlEKH0Nyhze6dO/tnpUU2s5Y99gAyaa7hOdkjpDRXGJDp7OK+TFYDeTdu2q3M6BsY=
X-Received: by 2002:a17:906:4a53:: with SMTP id
 a19mr2404568ejv.56.1601308146586; 
 Mon, 28 Sep 2020 08:49:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200928091602.383870-1-laurent@vivier.eu>
In-Reply-To: <20200928091602.383870-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Sep 2020 16:48:55 +0100
Message-ID: <CAFEAcA8jPB4zt_8h_LxS=NXeysirmowjTQM3buvMQeQOwnfsZw@mail.gmail.com>
Subject: Re: [PULL 0/8] Trivial branch for 5.2 patches
To: Laurent Vivier <laurent@vivier.eu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
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
X-List-Received-Date: Mon, 28 Sep 2020 15:49:10 -0000

On Mon, 28 Sep 2020 at 10:21, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit c122bca9cd7b986be4d473240a4fec6315b7a2c2:
>
>   Merge remote-tracking branch 'remotes/ericb/tags/pull-bitmaps-2020-09-21' i=
> nto staging (2020-09-23 15:11:38 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu.git tags/trivial-branch-for-5.2-pull-request
>
> for you to fetch changes up to c66790b5dfc2430c04bf5876cf485e1f538af7f2:
>
>   docs/system/deprecated: Move lm32 and unicore32 to the right section (2020-=
> 09-23 19:19:57 +0200)
>
> ----------------------------------------------------------------
> Trivial Patches Pull request 20200928
>

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.2
for any user-visible changes.

-- PMM

