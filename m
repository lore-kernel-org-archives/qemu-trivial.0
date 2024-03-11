Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rjjM3-00077V-VC
	for mharc-qemu-trivial@gnu.org; Mon, 11 Mar 2024 13:22:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rjjLz-00075D-F7
 for qemu-trivial@nongnu.org; Mon, 11 Mar 2024 13:22:24 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rjjLq-0002u4-Ok
 for qemu-trivial@nongnu.org; Mon, 11 Mar 2024 13:22:18 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5683089d4bbso4153561a12.2
 for <qemu-trivial@nongnu.org>; Mon, 11 Mar 2024 10:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710177733; x=1710782533; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ExZDLlcW/aPce/t871JYwvQeW26VYQ80tHmn7HDLWXk=;
 b=PPFCxA1ulRLl3VBWbEiUodPtMsbIehnkSCLfF3kzDwWQADlW12LwgHJpoyFWl0GqF6
 /jPEA5cmXPtyHbzXAhCLTHv6e/j6y+uHw41Z1E6Cx6uqET7O8xdjRp25H43CnPU6x4y6
 T9phT5cEzqMDPAzrkl7ayssuWM/NCVzgtSAvBQ9QaNRorPEPlyXYb+pg+Y6VGWVLRluq
 x/5V1XTbnRZaGV7giPL0wO6kZAg10/vswtME0+YOHyeA/O51EsjzgYl8Rw/F383Dd5+/
 UlvpGADeArpJGVXdpUJLyx8tPcS/nCHEyKOGE6/hFDQoiJNxYnbqp8Qp71aiIe2IadUr
 czLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710177733; x=1710782533;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ExZDLlcW/aPce/t871JYwvQeW26VYQ80tHmn7HDLWXk=;
 b=Qa+jw2nxVaKqJb0+VlqxVf/PEEXMl/Oa/KoL1cy3Fpgd6aFmB65BCiYsycjSoDk04S
 eS1hJyDVD18pIQZNxAW/BZ59gz+V+Vr8IHBGRcG0B1Gcw7XmnotdugnXgP51izCJ8ZHV
 8ZGu70ryxmuIVG4FbhRp3mFuMmxNBCdZ5Fr6tL/jUi4NCGnMCia2mYIJWUzRIQsZ14KD
 yHCikzws1lO2CJ7B48L25TgmQqfpYOdm1xGsGlqY7xZD9woZNN5JtJAgiEqAGa62F8Pw
 92J7PHNgrqswBbNFDvhPM7xeM13K/ygyzMhYjdwwfoLvNh+g46T85sjOuTy0cul4/h12
 2Pfw==
X-Gm-Message-State: AOJu0YwgUEZaI0j3XvbEbOnXbHWps0lV89ZLTroI2RddkAE7d97/gXI1
 VZiel7XqHfjcMJZO+JgkiMTAWU5Gn3rAAYawmd/5WjIjss9Xr1jrNYS1gwsJ/CfCQNTvX2/DfN4
 t/VfDiM50PVq389QWFNYaQumR+Z+RR2FpKQCGSw==
X-Google-Smtp-Source: AGHT+IFF0OpGwSHdUV1J4PmqeK91GpjTlDrECYjZKgU3NfG2tj+QmRdHv6mkOkcFXNZzdjJuk/JTE0JUcCFXGPBam+M=
X-Received: by 2002:a50:934a:0:b0:568:1882:651f with SMTP id
 n10-20020a50934a000000b005681882651fmr4979227eda.25.1710177732969; Mon, 11
 Mar 2024 10:22:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240311120346.9596-1-anisinha@redhat.com>
 <CAFEAcA_kh4sXkxsk10hCB9vAaJg2oNAv3DS_QhkHmFsWtVdUBw@mail.gmail.com>
In-Reply-To: <CAFEAcA_kh4sXkxsk10hCB9vAaJg2oNAv3DS_QhkHmFsWtVdUBw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Mar 2024 17:22:02 +0000
Message-ID: <CAFEAcA9jEdC7_TbKAr2s26TgtadU1uB+90i4QTCta1tGf2YJLA@mail.gmail.com>
Subject: Re: [PATCH] docs: update copyright date to the year 2024
To: Ani Sinha <anisinha@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 11 Mar 2024 17:22:24 -0000

On Mon, 11 Mar 2024 at 12:06, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Mon, 11 Mar 2024 at 12:04, Ani Sinha <anisinha@redhat.com> wrote:
> >
> > We are already in the third month of 2024 but the copyright notices still refer
> > to 2023. Update the date to 2024 in documentation and help texts.
> >
> > Cc: peter.maydell@linaro.org
> > Cc: qemu-trivial@nongnu.org
> > Signed-off-by: Ani Sinha <anisinha@redhat.com>
> > ---
> >  docs/conf.py              | 2 +-
> >  include/qemu/help-texts.h | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
>
> Oops, yes, we always forget this. Thanks for catching it.
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

I'll take this via target-arm.next since I want to do a pullreq
before softfreeze anyway.

thanks
-- PMM

