Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kX4gE-0000Kx-6B
	for mharc-qemu-trivial@gnu.org; Mon, 26 Oct 2020 11:45:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kX4gC-0000IT-LS
 for qemu-trivial@nongnu.org; Mon, 26 Oct 2020 11:45:04 -0400
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:43031)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kX4gA-0002su-6z
 for qemu-trivial@nongnu.org; Mon, 26 Oct 2020 11:45:04 -0400
Received: by mail-ej1-x644.google.com with SMTP id k3so14254857ejj.10
 for <qemu-trivial@nongnu.org>; Mon, 26 Oct 2020 08:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dfyPxWsY/ClcaYOXGTCrEyosp1SlX/TZrjT5/qz1DWM=;
 b=kc7Y/gZZrO1nf5y0n3GalzKJioW1vn0vDCr6Yhl4+BR8gjqpaP/E072LWWD72Z3wss
 j7lxKq45nV1yT3hrMEnokMNfXwo79CgWaRI2tMm1NNEBp1hEZ3o+KIr9dev2mugC9mMU
 bhwWg+iy1aTbImhsa23JThRDwfkWDt+MGmHc2jxJqVo81KEQisQkB2oafl8X4Pk4ZkST
 t2tYBGHwfJickz92oJej83mECQHosPq6Sl/gx0ILZbdhr7cGhXoYYOGw8cJZMMbg9ALC
 NQMdJWhDcqytrX+8ROE/zoG8qFPesi6Jn6+EtdOAjAQjgMdk8n7/5w7MTsoiDvzUc3L5
 Rs+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dfyPxWsY/ClcaYOXGTCrEyosp1SlX/TZrjT5/qz1DWM=;
 b=Gpu/70jvJbJfy7zFG1fbvbI391K47Et+TDNBeMhKWFAfB8SKiUhuIiroEhFuKwQO3+
 RPy0pvwuYAhh8GqPu0w9uhgov4jssNpdnVsO8ipDQLU9vVSHeJkTMeDYpcIFTVZi/Iks
 tS8VHzUoP4qaKIvpY8i5IhQuh4B7ubZYSiJ3W6GTCosd1lyUEaWKyyT8SRZ/4sJWP0d8
 eAT7vD+QAikL+RFxsGMt0y6pHKtyqE1RzNnCdaILjdEIxsJHYJwpZoLHrzagJGoSqfM1
 MBFQW0W54sQY87lOOSduh5Wr3QY84WmDw/DoUubqts+pwKI5lZdrJfnhebtGQFknF8TM
 E0Gw==
X-Gm-Message-State: AOAM530oVPb9irg8ruFSX+tFJ8WpN+ofr0XexO73W29MdI8f5Qjo2KIZ
 sG+lvFzewA7xxAKd0UjxZivE2grcCpwNiS86G+sCYw==
X-Google-Smtp-Source: ABdhPJxIlBhJQDSMzTfNQXD8Nif1KXPylhuw3kDkCqESQnJIooko17OkNBDfacKxjSYi045OpBkchebHIdKbrdJ/T+g=
X-Received: by 2002:a17:906:ce21:: with SMTP id
 sd1mr16569080ejb.4.1603727100114; 
 Mon, 26 Oct 2020 08:45:00 -0700 (PDT)
MIME-Version: 1.0
References: <20201022162843.1841780-1-jsnow@redhat.com>
 <576a881d-2c64-3e40-31b7-43680a1988f8@redhat.com>
 <22839fc4-a1b9-0510-ff19-3a713fd8a187@redhat.com>
 <88ac9998-51fb-0cca-8b7a-a2204ee0f9b2@redhat.com>
 <35df91c4-49e5-bc9e-e153-a27b7f443ffd@redhat.com>
In-Reply-To: <35df91c4-49e5-bc9e-e153-a27b7f443ffd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Oct 2020 15:44:48 +0000
Message-ID: <CAFEAcA9mx033XOUbdez+bKZ5Xr9aBa+1eVnzj_gwU-jCgdX83w@mail.gmail.com>
Subject: Re: [PATCH] CHANGELOG: remove disused file
To: John Snow <jsnow@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>, 
 QEMU Trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x644.google.com
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
X-List-Received-Date: Mon, 26 Oct 2020 15:45:05 -0000

On Mon, 26 Oct 2020 at 15:23, John Snow <jsnow@redhat.com> wrote:
> My point in removing it is just getting rid of the runaround. If we
> don't have the changelog information in CHANGELOG, why have the file and
> pretend like we do?
>
> Moving it into README.rst makes it visible on github and gitlab to
> people stopping by for the first time.

I'd agree with this, I think.

thanks
-- PMM

