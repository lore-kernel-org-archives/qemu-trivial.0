Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lmDWt-0005E5-08
	for mharc-qemu-trivial@gnu.org; Thu, 27 May 2021 06:46:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lmDWW-00056g-MJ
 for qemu-trivial@nongnu.org; Thu, 27 May 2021 06:45:57 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:38430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lmDWT-0007hn-PI
 for qemu-trivial@nongnu.org; Thu, 27 May 2021 06:45:56 -0400
Received: by mail-ed1-x533.google.com with SMTP id o5so310349edc.5
 for <qemu-trivial@nongnu.org>; Thu, 27 May 2021 03:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CR8hUhEBdJ60hmdhochqHz6Yl1u78molGc7Hdjcll1U=;
 b=z03M78oazbXOfknAllMky+MqB6dhEcPw5ZCzWpOwagRWSM6BTGg8CGyUQjPii16VLt
 DirHgOcAumFZRqhYd9eL56A0r2+fTNqQEJRT+dwtoH8xG34o5BW3mgnzIrXTAKZXv4ik
 HQSO7UByuOQALiRGadk8Aa2WEQ4qKOy+8hBNXylyBXKmmeDVBmF4QOR0PVG7KBxuYJ54
 pJUt2/Z9Xm7nZFuEY25JPIwTCIPMkiKm9OqXSIbN9MOwV9OSn7aAyMvPUrxKOoC5VV8D
 WmCxfgRQ4QcAJkOUl+wk28t2ECZX+ei8CLZ1uXNZLNcIo9NMozxue/VATWS5r1eP+4Nu
 BYzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CR8hUhEBdJ60hmdhochqHz6Yl1u78molGc7Hdjcll1U=;
 b=iRUQN3g+nqjpdGJzCgqHIygg92HnPEBU0jwzot/6IBrDh2mAAmULKYeWx2zcl3F6BX
 1hpSP6B8zPwULIEU3NqNoUkv/IoJkUzHYNkpcn9llG96zpSTbdxWLi+PwTnTQ8DFvwE+
 HnTBwesHdLzvnLlj6gxcJI9ATOOOiBBvfq36sgzpiXnxK7ZuU1CB/R15iQD9JdJdtEbb
 3f74SKGjorFXkYpj5wJdpH4OuJwAxI4iFn9zD9TY2Uy9mL7zV5o2/rbEb+pGRjmk6o4Q
 aebQ0UqUiKTq0IJjS3jEwX6wpB49SKIehHxsytZtQl0hNKFOksZVlzHh7OP09EydTP1W
 XRMQ==
X-Gm-Message-State: AOAM5321mxddJIxg+5LjxYyhvXzkoAgV0KdR7wz5Rxl3b3PjlmhU4/7x
 4e1zb+gCTAi0vmFkQFQnj1dWKdSKkaprps7HajMDzw==
X-Google-Smtp-Source: ABdhPJwf9SMJdCaAkpBd0ElUFNZiq8K/PUM4igRSt2qz8+FRoS7yOL62OPRFf1IilqVsNDKqpYD8k9PWSdv9U/CfSY4=
X-Received: by 2002:a05:6402:19a:: with SMTP id
 r26mr3387468edv.44.1622112351801; 
 Thu, 27 May 2021 03:45:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210524024655.11115-1-someguy@effective-light.com>
 <CAFEAcA_Z-fe1pT8=-TCFxVkpBpXpKXD+vKi1i=CBFLg4ANYE1A@mail.gmail.com>
 <CIHRTQ.JLYE6DOVVWC1@effective-light.com>
In-Reply-To: <CIHRTQ.JLYE6DOVVWC1@effective-light.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 May 2021 11:45:26 +0100
Message-ID: <CAFEAcA8koCJTd5JY4NWX26EPpHq_QMwi11-FYf4OJhZyhecT-w@mail.gmail.com>
Subject: Re: [PATCH] linux-user: make process_pending_signals thread-safe
To: Hamza Mahfooz <someguy@effective-light.com>
Cc: Laurent Vivier <laurent@vivier.eu>, QEMU Trivial <qemu-trivial@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
X-List-Received-Date: Thu, 27 May 2021 10:45:58 -0000

On Thu, 27 May 2021 at 11:37, Hamza Mahfooz <someguy@effective-light.com> wrote:
>
>
>
> On Thu, May 27 2021 at 11:16:56 AM +0100, Peter Maydell
> <peter.maydell@linaro.org> wrote:
> > If we do want to change from sigprocmask() to pthread_sigmask(), we
> > should be consistent about doing that, not just change this call
> > only.)
> On that note, do you think it would worthwhile to have a Coccinelle
> script replace all instances of sigprocmask with pthread_sigmask (in
> linux-user, of course)?

What issue are we trying to fix by making this change ?

There are only 7 calls so a coccinelle script seems like overkill.

thanks
-- PMM

