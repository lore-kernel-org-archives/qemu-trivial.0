Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kO5QH-0002OU-Q2
	for mharc-qemu-trivial@gnu.org; Thu, 01 Oct 2020 16:43:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kO5QF-0002NF-M1
 for qemu-trivial@nongnu.org; Thu, 01 Oct 2020 16:43:27 -0400
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:37545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kO5QA-0003YZ-Sa
 for qemu-trivial@nongnu.org; Thu, 01 Oct 2020 16:43:27 -0400
Received: by mail-ed1-x543.google.com with SMTP id n22so7076939edt.4
 for <qemu-trivial@nongnu.org>; Thu, 01 Oct 2020 13:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/ZDqjKscR2h1brTW66ZxSqMk0uKUmy0MPLBI4j0VFAo=;
 b=FbJa7uWLVPKfL0uUo/HMQY9gevlHIYcD3fnOHEuVmJ5knFwz6ZyaKiz+0U/vVX5lvl
 JbEE0Yt6dXTB6xjUmr3mpV87qGQhjt/R77hNwmD8YyRyNbp8bfux5kJp/PUhOSQaRuAP
 xgRjyoUD5ZSi70AS7Ts9akMRfxAHpkFoTXB38xG69426INsBqQ+nvMtxKCMcrQZuWG4x
 mnikUzL12P/m6LAzjuz+sR75yRI7goeP036QwFQW0/zlDSEli2Dzee7+5zfeiLq1WfUs
 BJH6ZQ05T9VWk1HjO5hsjZwu+lO/lSztvQ7wG3TTJbldCbIyQrpRLGMCBzoljH/MSaer
 jECg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/ZDqjKscR2h1brTW66ZxSqMk0uKUmy0MPLBI4j0VFAo=;
 b=Il6o8QV6zbP/lcVt/UwyE687Io0S1BqXeQAmUtKFUpvSKnchq3jt0dm5+qCuc892xQ
 Cfn30toA5uRK3Vx8KoMW4UkFdMgotbP1jbWMTXOm5/NDeZ5D3L9W+APxIrtqBW2FBpA8
 ax1IgxEr94CcXaYVejs7CUfs5zmsyXRIRB8VDqWBisnbq/E9Xub24H/5qjFt61hQVnQu
 2ZoPhedsF/6u2DX0ePVn2OlL1A6hRu8OIzDXUaIOvVh1IKyZ13H8B1iUgrWQvpxAK8Wk
 +ggLBbCEYmqfB1D1zfV+XNvzynDtm/OojXFmo9d3vnQa8Il4tXA37blOKg4WwpKbHERw
 vrBA==
X-Gm-Message-State: AOAM531M6fkP60QokHs/qoslUqOh6Vjngiz29yM/lUWP7OAQLLnCH9NE
 qSv0+Uvb/IBm09cgHZFNRJ92UY1fCwNvl3oBYRMuMQ==
X-Google-Smtp-Source: ABdhPJzMBnUFb72erwW5Op7nIjxffs7QgJxlAqhUxFEf+yGn61M4L0jxFS6n++tCAGLTu7QObvnT52ZzvIfSMaOfbck=
X-Received: by 2002:a50:e68a:: with SMTP id z10mr10644272edm.100.1601585001469; 
 Thu, 01 Oct 2020 13:43:21 -0700 (PDT)
MIME-Version: 1.0
References: <20201001182121.187122-1-thuth@redhat.com>
In-Reply-To: <20201001182121.187122-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 1 Oct 2020 21:43:10 +0100
Message-ID: <CAFEAcA8nQgvgdHE7G8b9sWP4kFeRZvseyFzFvOBFAp8O_A5Xyg@mail.gmail.com>
Subject: Re: [PATCH] hw/rtc/twl92230: Silence warnings about missing
 fallthrough statements
To: Thomas Huth <thuth@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
 QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::543;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x543.google.com
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
X-List-Received-Date: Thu, 01 Oct 2020 20:43:27 -0000

On Thu, 1 Oct 2020 at 19:21, Thomas Huth <thuth@redhat.com> wrote:
>
> When compiling with -Werror=implicit-fallthrough, gcc complains about
> missing fallthrough annotations in this file. Looking at the code,
> the fallthrough is indeed wanted here, but instead of adding the
> annotations, it can be done more efficiently by simply calculating
> the offset with a subtraction instead of increasing a local variable
> one by one.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/rtc/twl92230.c | 50 +++++++++++++++++++++++------------------------
>  1 file changed, 24 insertions(+), 26 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

