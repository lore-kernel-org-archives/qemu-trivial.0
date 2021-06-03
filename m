Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lor3S-0004WN-7J
	for mharc-qemu-trivial@gnu.org; Thu, 03 Jun 2021 13:22:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lor3O-0004SK-Vn
 for qemu-trivial@nongnu.org; Thu, 03 Jun 2021 13:22:47 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:38718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lor3M-0003Yt-MT
 for qemu-trivial@nongnu.org; Thu, 03 Jun 2021 13:22:46 -0400
Received: by mail-ej1-x633.google.com with SMTP id og14so5079950ejc.5
 for <qemu-trivial@nongnu.org>; Thu, 03 Jun 2021 10:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1Em2+Rud4fjo+KjI5Oe92Lv0fR80tZA+23VCQKg8lVA=;
 b=Ntf78IWHxgtDeF0Cg3ZM0GLSEuYf0SCNjl6SxHxZ84r53SIq83nwkkltq0kMGll4BL
 cq8+Yzsiv1DgkF5grMUuW0g0VAavOxIjeagNWheY2T6BcLvI5f1lj6lTXKONhVBjaa67
 7LDB7VGNO126oSkx0i2bBKqH55AkEYXEv3X5S5sF+OWp6lWetSWBPHR5QhyzZG8OJrCZ
 h6GVWjiL4YRXkGpsvKkq4hojrDyBivwq2wxUWHI5GHhCltWKI+D1guMK2cMD2z1X8lGp
 H326JxeUz7nlm7ei6V/JC2hNWAQ/t9kedYw7/jvDW10TfV2P6icZPrc3r/ORi7X3lmvJ
 ZWPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1Em2+Rud4fjo+KjI5Oe92Lv0fR80tZA+23VCQKg8lVA=;
 b=gABbYyabN50BkCqbNk+V63oILLbuddRT/0zMUqbMLrOOAxjwMczWJzBuYoD5D4gDN/
 T7PP2tUkRRheNTeWGQoW3RZRJFfg5Z2jahcOvPwrWgafshcrQTrDtMu86/icteswqWfQ
 RkTQA7+D4p8Yui/rdFWjJz0qjSsVlDX4O5dSFLNl4WHL4Yn+meQBLR4JfiGxBDliKMiJ
 e5bXHUDTk2Z7tUUB9MyNfGvjbJc9Aa/S0XcZqvy5GSbKVn46agktp7IIHOytY7Ah/Zha
 Cdw9n3o000bcFsU6kcrL2fHim+ffxC5fgs7b2kxWDH/wOtBCN/wmcfDNbZCRRrn8zLNJ
 3inA==
X-Gm-Message-State: AOAM530hymo63fjR1UCCvPvWsXQs3wISWOqs+N/NUI6tL3puul+Ey8hP
 4l72jwuo3DTVy8D7gwj8ohXE1PgBdVZhBrWThdC4Ug==
X-Google-Smtp-Source: ABdhPJz4PyLP8xcQJeZ6UKpdiK8DclOZsTDtilTxFjNj5NoTHmwHbZ4vmLrXjSjW9hH7xynv8qwgE9PbvkZg5RO9Zuk=
X-Received: by 2002:a17:906:d1d2:: with SMTP id
 bs18mr463337ejb.56.1622740963197; 
 Thu, 03 Jun 2021 10:22:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210525025823.3208218-1-swethajoshi139@gmail.com>
 <331a819e-1745-4d4b-cc4a-82521a58186a@linaro.org>
 <CAFEAcA8RbVafdjn2hkXifAPUF=wxZup20PqPcRpQ1ivtnWCxww@mail.gmail.com>
 <CALf2nm+LFqM2=vDs8=YfyxQSUT-0xxaCiVmcQzrKoOa+zaTtdg@mail.gmail.com>
 <CAFEAcA-oX0JR80UYzYKvczHsfxWG6oH3Pg4pbM6ByDe57XEHHw@mail.gmail.com>
 <CALf2nmKhPaWJa944dR+kFAQ1hCLXF0XPwXaHTqJQ-C6EW7ACKg@mail.gmail.com>
 <CAFEAcA9E4s3dST0GJkdg24DDAn90WU1FEmXwoKD6oQmNSB1vVA@mail.gmail.com>
 <CABSBigR1L9sE36eYA0Mq4smx1E9A4umTOKTe_x97foSMkryRnw@mail.gmail.com>
 <CALf2nmLOqtwacgrQ91TTz9_QRUmFS9ZNii2Kk7-tQ7LNp9vw2Q@mail.gmail.com>
In-Reply-To: <CALf2nmLOqtwacgrQ91TTz9_QRUmFS9ZNii2Kk7-tQ7LNp9vw2Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Jun 2021 18:22:10 +0100
Message-ID: <CAFEAcA8oAtjVom+BXtcgao4O252ipmFzv-iNTSzDaJChcQkr9g@mail.gmail.com>
Subject: Re: [PATCH_V3] Adding ifdefs to call the respective routines only
 when their configs are enabled
To: Swetha Joshi <swethajoshi139@gmail.com>
Cc: Dongjiu Geng <gengdongjiu1@gmail.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, 
 QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
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
X-List-Received-Date: Thu, 03 Jun 2021 17:22:47 -0000

On Fri, 28 May 2021 at 20:41, Swetha Joshi <swethajoshi139@gmail.com> wrote:
>
> I apologize for the delay, here are the repro steps:
> 1. Remove CONFIG_ARM_VIRT=y from arm-softmmu.mak
> 2. In .gitlab-ci.yml, crossbuild.yml and in tests/vm/Makefile.include, in all the places where we disable kvm using -disable-kvm, replace this with -enable-kvm
> 3. Build

Thanks; I reproduced the link errors and have sent a patchset
that I hope fixes this:
https://patchew.org/QEMU/20210603171259.27962-1-peter.maydell@linaro.org/

If you could test that it works for you that would be great.

-- PMM

