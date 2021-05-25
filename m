Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1llSja-0007cS-19
	for mharc-qemu-trivial@gnu.org; Tue, 25 May 2021 04:48:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llSjU-0007ab-FW
 for qemu-trivial@nongnu.org; Tue, 25 May 2021 04:48:16 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:40945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llSjQ-00048C-7K
 for qemu-trivial@nongnu.org; Tue, 25 May 2021 04:48:10 -0400
Received: by mail-ed1-x531.google.com with SMTP id t3so35168223edc.7
 for <qemu-trivial@nongnu.org>; Tue, 25 May 2021 01:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vofBthghFCTcVro4Nfb47W557uQUlbvXOBkr1OTQzFk=;
 b=pIffcDKSlyAZMmy9B8UkTpPE/0Uq2thlNFCbfULGw+5gOp62eSrAKc0V1eR98eeqp4
 AVy6h9G4L9l2IVBsN/pOH8rlF3hY/StqUAHBi/A7fAlBmBoiLW7FmYiw2sQVjwk/CVz1
 xg1MrB/GINux9fiyyTImzDjzSLi7+PTOSJLpynPuHqQbbVb1FWKqR0TIa3T1eZycbYVg
 QS4Vg8m4HPMqMIUOXL/8LB2JBLj7f9qhqKe5koGFq6XoH1qQCpOgZn4ryW+buFDwHHAJ
 wTjaY+43Ow08A3edWiO0PWYz+iJc5ChmEHFfp3AL7I6Q5QDZPPuiXWkuGqv02I0P7NDT
 NIWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vofBthghFCTcVro4Nfb47W557uQUlbvXOBkr1OTQzFk=;
 b=Qbgjk9LrFN/KjJZ2BHHxCOubSI1Q5nsrgJEbUbBJ+TuxAhg27R6bQrvn1g2tbrWheB
 dlb02Z+O5XfJMNsbOqutwLbxIe8nyMms9T7nPJXiOcbELy2NU7Ilx0Eev3JeI14BrnTX
 FdI1cYcKm52oM8d3Ua0YZXXwf2+JEyIvGWIFh7lENrBbqRnM8Z8x/0EC1sF5Cd/w9nJB
 F+IYGPt8fA8YBYpc1u5+XrCa5i/e1MsI33KOfiLD7bX0nCDEpy6Ve3V2IdR6FnSu7tAt
 4odqtOOqJETz/iIvg7GcFnW8PFr+MCoCqhEfsIiS9aA/OYT1HrcLuin3yXjqcOkITj6k
 vsxQ==
X-Gm-Message-State: AOAM530h84wE/l7/mHLWKsjbUGwCK0LDtYvRnW5v/5WSyl6eEdo9Sduq
 x65Mu0THuXGmAgZf3vCfKWSOiPW+GMj5traNYhD/AQ==
X-Google-Smtp-Source: ABdhPJy+hUbw6LCq4zLD4TsltSDdEeGjLzUHRtuE4Yg3lzREoIdYh5Y4EXSqBrA6WcTMcYWjWnIF/bpYDTRre22ubBY=
X-Received: by 2002:a05:6402:203c:: with SMTP id
 ay28mr30223830edb.100.1621932486647; 
 Tue, 25 May 2021 01:48:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210511192950.2061326-1-jsnow@redhat.com>
In-Reply-To: <20210511192950.2061326-1-jsnow@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 May 2021 09:47:43 +0100
Message-ID: <CAFEAcA-Tt-bacKbipQkMF9s0OPgbYd4dSygfdDRAe+itpmzr4w@mail.gmail.com>
Subject: Re: [PATCH] docs: fix broken reference
To: John Snow <jsnow@redhat.com>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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
X-List-Received-Date: Tue, 25 May 2021 08:48:16 -0000

On Tue, 11 May 2021 at 20:29, John Snow <jsnow@redhat.com> wrote:
>
> Long story short, we need a space here for the reference to work
> correctly.
>
>
> Longer story:
>
> Without the space, kerneldoc generates a line like this:
>
> one of :c:type:`MemoryListener.region_add\(\) <MemoryListener>`,:c:type:`MemoryListener.region_del\(\)
>
> Sphinx does not process the role information correctly, so we get this
> (my pseudo-notation) construct:
>
> <text>,:c:type:</text>
> <reference target="MemoryListener">MemoryListener.region_del()</reference>
>
> which does not reference the desired entity, and leaves some extra junk
> in the rendered output. See
> https://qemu-project.gitlab.io/qemu/devel/memory.html#c.MemoryListener
> member log_start for an example of the broken output as it looks today.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  include/exec/memory.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index 5728a681b27..3b9ca696061 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -571,7 +571,7 @@ struct MemoryListener {
>       * @log_start:
>       *
>       * Called during an address space update transaction, after
> -     * one of #MemoryListener.region_add(),#MemoryListener.region_del() or
> +     * one of #MemoryListener.region_add(), #MemoryListener.region_del() or
>       * #MemoryListener.region_nop(), if dirty memory logging clients have
>       * become active since the last transaction.
>       *
> --

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

