Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B8ADD15DAF
	for <qemu-trivial@archiver.kernel.org>; Wed,  3 Dec 2025 16:29:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1vQpio-0004zG-30; Wed, 03 Dec 2025 11:28:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vQpil-0004wk-9i
 for qemu-trivial@nongnu.org; Wed, 03 Dec 2025 11:28:51 -0500
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vQpij-0002xc-UG
 for qemu-trivial@nongnu.org; Wed, 03 Dec 2025 11:28:51 -0500
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-786635a8ce4so51313557b3.2
 for <qemu-trivial@nongnu.org>; Wed, 03 Dec 2025 08:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1764779327; x=1765384127; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Kv1ONXZalTzUliu3Lf3hacUz8qwrxGUwXvTGqJG1wgI=;
 b=dXPo115Dko0kpuIzXTt0Qc048odvkMpAluchELjZ4cSa5821wIE3VVMlhQSHjE+kXm
 cL3pEArnkfk+7bH0x+BODXfohjUFC5wTg++7kD4ugVpLy63K6SqcYd2r8GFkactGFAem
 YqNwRvKkXZlkOsnOHAPcVUubGAG0byuHHmI6FiNXUfObqUh2yx4deczQPv8tOGiHA7J0
 XP6IpEDwNzt1hj8DO46Iqe+iHzSZ2bIMik3LVNA/O/3rjKCc+r6L5NCUH6wPpDTn1VE6
 XaUK6D0w11Yl4PQqSMvAx4tYD5PhH111uAcgMxfzagl33r8RgfxuOm7XXZZEFhVz53Tj
 h3og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764779327; x=1765384127;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Kv1ONXZalTzUliu3Lf3hacUz8qwrxGUwXvTGqJG1wgI=;
 b=IsUT4x4DGpdW0TU0utb+dkJXVtDKHjOoNAtlOd5f0mo6GHc3t38tEV1oJVBc103eW7
 0Z3jQtW8+xzk00W5GKzN7kJjyEG4v4/Pyc6Y3Tag0IA02SfC9XhB9u/V0/H1vpOMFaAs
 ekCZ0mVCJHwRLF31S2woCM7LIuMXN6ehQ8onH+NDpT1GRGuk+igLEgLq35ey095RPE0j
 ZjIXktggwu+jW+p2IgstnrYaox54lL52lng8fWCQvOOgb+GFAnk+SLC9/LNbJctJYj74
 aufQtUDwJNJIuz/8hhzp1jVe8WP6Tb4kmaFpBnrPuk4PCTz0Fos8yYOmjFf5HM1VUhKh
 joPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpocUnA7BGVa0Tn2M7GwWi1R2Lamy+Tn1RkfjT/cDuQQrVRIHsuG5EzxW5E+6snS/AXfBOsqDaJ57LaRk=@nongnu.org
X-Gm-Message-State: AOJu0YzL8uGdOcjmP8WmwDrm4mQI9Zg5PmrgDyXpH1tvP/3xIKobyNlL
 c4IDKtPFMtMrThNxsC8OHwpfxgxpXoNq/mzeLZsh/1PFeUJLy0/iDDOAz8qSyroBjcHmGTp5tFr
 HKcb4zcOLhkSqxh9zlBBfc0Tw1j8klNMmdVHicOR8QQ==
X-Gm-Gg: ASbGncu9zz1KKUsD4R1IyzeRfR3d8ZcS0reLKCSmX4+TeYgJQEpBtRTt3Z7mlz1HQe4
 lQc6albveYHKsebERdIckCGsEC1U/QKGc8BgABeRADYjccFGs8AIi/cApZpmw7zzQ/0kOUULO7X
 kLOoIQIzvBqhynFn2C+cDFb51sKOV2/dC9kYneCKI0AKL2wsI/vmKzmN3d/lgKyjwxbx5EAjiwv
 fe/bhLe3Ehz/GMk4CeuNYaPBuA5J+HNda7W4pXZqH+oCjaEK0y/T+1KuNG2xR53azvwl8kA
X-Google-Smtp-Source: AGHT+IFTyV0plQbL7g6XrqADTbAVgQFyEy0YpWk2YvVgxRSkzxwuQ5lWfM4E4GzxBhfRRvUVsGf1S7o7b0xKaiQH/BU=
X-Received: by 2002:a05:690c:6107:b0:786:91ac:e16b with SMTP id
 00721157ae682-78c0bf06e61mr21460807b3.9.1764779327313; Wed, 03 Dec 2025
 08:28:47 -0800 (PST)
MIME-Version: 1.0
References: <20251203131511.153460-1-dave@treblig.org>
 <87a4zzu230.fsf@draig.linaro.org> <aTBCLbDbpXgkTLHr@gallifrey>
 <CAFEAcA-Uy0UQwGEK+f95BJmDripg1-8vhzPF5qRSY40=duhRUQ@mail.gmail.com>
 <aTBjTzbaX0befChO@gallifrey>
In-Reply-To: <aTBjTzbaX0befChO@gallifrey>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 3 Dec 2025 16:28:35 +0000
X-Gm-Features: AWmQ_bmKHQQ_YhvSy6UczQB4KFywWqzPdsfZy-7wLfs6xNs3GYGEc-n_hvBIGiE
Message-ID: <CAFEAcA-y5ucBTOgngim5cpuKbFYXajOz0zEeT2S0rC3wnMPSrw@mail.gmail.com>
Subject: Re: [PATCH] qemu-options.hx: Document -M as -machine alias
To: "Dr. David Alan Gilbert" <dave@treblig.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 qemu-trivial@nongnu.org, mjt@tls.msk.ru, laurent@vivier.eu, thuth@redhat.com, 
 pbonzini@redhat.com, jak@jak-linux.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1131.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org
Sender: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org

On Wed, 3 Dec 2025 at 16:20, Dr. David Alan Gilbert <dave@treblig.org> wrote:
>
> * Peter Maydell (peter.maydell@linaro.org) wrote:
> > Surprisingly, this and -h/--help are our only two options where
> > we provide a short synonym. I note that this handling of -M
> > is not consistent with how we document -h/--help, where we
> > print both on a single line:
> > -h or -help     display this help and exit
> >
> > But it would be trickier to fit that in for -machine and
> > perhaps confusing given the suboptions.
>
> Right, that's one of the two reasons I kept it separate.
> The other reason, is that I couldn't figure out how '-help' and '-h'
> both got defined - why is the second DEF(...) not needed?

A piece of delicious fudge lurking in system/vl.c: we have
this hardcoded entry in the qemu_options[] array before
the ones that are generated via the macro-magic from
qemu-options.hx:

    { "h", 0, QEMU_OPTION_h, QEMU_ARCH_ALL },

So we recognize -h on the command line and turn it into
QEMU_OPTION_h, the same as -help, but it doesn't result in
anything in the documentation (we leave that up to the
strings and RST in the DEF("help"...) section).

thanks
-- PMM

