Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iCNNf-0003WD-8s
	for mharc-qemu-trivial@gnu.org; Mon, 23 Sep 2019 08:23:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48801)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iCNNa-0003Qb-2J
 for qemu-trivial@nongnu.org; Mon, 23 Sep 2019 08:23:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iCNNY-00038k-TM
 for qemu-trivial@nongnu.org; Mon, 23 Sep 2019 08:23:45 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:40971)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iCNNY-00038W-OA
 for qemu-trivial@nongnu.org; Mon, 23 Sep 2019 08:23:44 -0400
Received: by mail-ot1-x342.google.com with SMTP id g13so11869534otp.8
 for <qemu-trivial@nongnu.org>; Mon, 23 Sep 2019 05:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=urlOqGf19tZHHy0Qjq++AtBU+IqZo0KLvFBHIIF6J1M=;
 b=ww6Jo+d+HaFs0E53DrX65hMsfsxxeMvu45lb7/WdioG1RY4Fi4JJ7YdVCKPYb3aKpZ
 xR1g7cuF3Q+4R7vtQVX9N7fXii6XPFm5K77vM0FZrbktoYxoc+DyoJauYWmE3FaIm6eP
 +e5icFtXRzKhkGJl7HP8JU2oAyxZE/aiy9aZcBj6y5JXxSLvMYnL0qaJ12MXyM7+TLFQ
 +ffno8B4JLIXQ4hS0PUGcuNv56+4sBwbqUtpDtHf5llsPufZEd7zMwMejur0cxAIr1Bh
 WFxNiMwE7Y8vPurTUzCn1T1iMYWgS8Fuhl8wR7AmRrljTBFx3jwwjNdgx8sgKCYgT6su
 F0Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=urlOqGf19tZHHy0Qjq++AtBU+IqZo0KLvFBHIIF6J1M=;
 b=eIsJ+qYL7Ct4xQpucF7HvG114tC2eAn+2OdBOZ/J/Eeoj/fIudRHqhzHxiTTVuwuvZ
 wqzPxgtI8LK6DSnGsFX9+Zp6krI78gRWeh3UjB6H0fj9+zHvxWIY6JmxxYM6awby+4ry
 +gfA8xd2qF22QskG/SWAMrQxrDs3h673kCiFI43AoEcz7b9xMDlMtXxKYAFt/74LLoWL
 hhJdThJmCfnCiXXf3fu345CEYWr5o2R1DLoi0jxhaNdAWqwOIhTmGdLkWZlar7NB3kEE
 GpBhHyWrdBkXvmXyaOHN5Jr5DNWtXdp1en/kSWFPZPt8Liv6IP3uSq8VTfsZcyUbQBTV
 KaEw==
X-Gm-Message-State: APjAAAVRroVxH05ZBCouzmRvF30+mtYWEARJHXihAtDXmzW5+uoFBVML
 +7CLk21Y2iJX6d2Q6NUqP59/DtGlANlfJz9ZhuCj7g==
X-Google-Smtp-Source: APXvYqy15j0sB6LR4FvCLmdIUl2D7xFMEPhKFgJUkq+p/AVyN8DQ0BNVivV1Y0LHo8MmHLP6BkVWVCyMyCm8FfKpFW8=
X-Received: by 2002:a05:6830:1357:: with SMTP id
 r23mr3755656otq.91.1569241423967; 
 Mon, 23 Sep 2019 05:23:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190923121712.22971-1-thuth@redhat.com>
In-Reply-To: <20190923121712.22971-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 Sep 2019 13:23:33 +0100
Message-ID: <CAFEAcA9jOD_mFOeVaAo5qsoj-Q0-U5qF8c85Am4ObgSn3b6irg@mail.gmail.com>
Subject: Re: [PATCH] Disallow colons in the parameter of "-accel"
To: Thomas Huth <thuth@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
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
X-List-Received-Date: Mon, 23 Sep 2019 12:23:49 -0000

On Mon, 23 Sep 2019 at 13:21, Thomas Huth <thuth@redhat.com> wrote:
>
> Everybody who used something like "-machine accel=kvm:tcg" in the past
> might be tempted to specify a similar list with the -accel parameter,
> too, for example "-accel kvm:tcg". However, this is not how this
> options is thought to be used, since each "-accel" should only take care
> of one specific accelerator.
>
> In the long run, we really should rework the "-accel" code completely,
> so that it does not set "-machine accel=..." anymore internally, but
> is completely independent from "-machine". For the short run, let's
> make sure that users cannot use "-accel xyz:tcg", so that we avoid
> that we have to deal with such cases in the wild later.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  vl.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/vl.c b/vl.c
> index 630f5c5e9c..68f47a9c25 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -3554,6 +3554,11 @@ int main(int argc, char **argv, char **envp)
>                      g_slist_free(accel_list);
>                      exit(0);
>                  }
> +                if (optarg && strchr(optarg, ':')) {
> +                    error_report("Don't use ':' with -accel, "
> +                                 "use -M accel=... in this case instead");
> +                    exit(1);
> +                }

This seems pretty ugly. If -accel is the way we're recommending
users configure the accelerator then it should support syntax
for specifying everything we could do with the old -machine...
option. If it can't do that yet, we shouldn't switch over to it
until it can.

thanks
-- PMM

