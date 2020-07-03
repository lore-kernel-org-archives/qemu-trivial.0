Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jrM62-0001qY-0g
	for mharc-qemu-trivial@gnu.org; Fri, 03 Jul 2020 09:51:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jrM60-0001p9-Mj
 for qemu-trivial@nongnu.org; Fri, 03 Jul 2020 09:51:16 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:37078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jrM5y-00008F-01
 for qemu-trivial@nongnu.org; Fri, 03 Jul 2020 09:51:16 -0400
Received: by mail-oi1-x242.google.com with SMTP id 12so20047271oir.4
 for <qemu-trivial@nongnu.org>; Fri, 03 Jul 2020 06:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1laTjOxvsyel3DgT9gokiMsrS2tuuAdMfjCDLNi3/z4=;
 b=aGsexenihmwvsdIieMzsQiF/AJKgTMgkWiFm7LlFtNaJGmgv7LJO6aP/LS4TKRxpYM
 V2KFqJwxgGDG+hj0zz6NDSbKMpRyS68+/UHJmnrrIpfaTyCFjOIL9TAojnJHoU9hN+4R
 25rLjM27x2IFlyAi9Qmgvmris2OI3a9VsmKWhW2Lk/f3lbFwuDdE6jzAT1kHjLpSPJP/
 fYbK14Ne4Hnw19rrVXjADchvENxIaUkJ2MIiWhpqpBptCYSES+ln0isrLYpU18JnHxna
 KgfedTGaKaYjOWeiMFvehH7uWr17LoJvfXbpmdhBl5+5Xyo4vHwKxjEtycbWYQFVyY5/
 e/xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1laTjOxvsyel3DgT9gokiMsrS2tuuAdMfjCDLNi3/z4=;
 b=ktlEv536At5UGwt0jfPFyiB4OLK2I1qnI3pLmA//dPTibbBru/MjeNLitJJs3Z/4KL
 x9sDUVa5JFSqjRgnWs9uDzn5mQWKLk59S2iQcsmUds9fZjHAyL4b+zAEPhCf0iNLnU5k
 mrc/MQA+5O5KzydelR2pYbQ8NNVX9RHJimAarRGQHXO1J+gaxAfH7jQlm1vlNfBOhwU8
 7UFSJAx2CoKgwAwQ2GYeshYbwWcjacMdzcuq8rhtFrgkVwcRaqHEwSYUHDroB0vP9g71
 DbCz1yj/0LsC7EbGr1WOYil3EuheeWhWiuvxhNBU7+HH1M9h4o0cu6FlDc4tkXP0/Vgg
 cuYw==
X-Gm-Message-State: AOAM530OzOSzSD87F3M3p89Us+vuNBIFwFq0stDtJQz6ZsuyxcG2BJh/
 vDPjbpQmPf/OJlOftw3YQCggUbF6YdQqctZRBcyJ9w==
X-Google-Smtp-Source: ABdhPJzVSOI76LYrrC5jYW3uGhxjIGYl3x7owFqVPZMVZ4tLNB1QJPTY7WG3wacOBOp4V/Vd2a73ZO7v+FBuk3rDS2M=
X-Received: by 2002:aca:2819:: with SMTP id 25mr21197531oix.48.1593784272914; 
 Fri, 03 Jul 2020 06:51:12 -0700 (PDT)
MIME-Version: 1.0
References: <CA+XhMqwUHwc-FPgP-YfKPz5CL8BKSQY+0qTJ5uBRhfu22jsh1g@mail.gmail.com>
In-Reply-To: <CA+XhMqwUHwc-FPgP-YfKPz5CL8BKSQY+0qTJ5uBRhfu22jsh1g@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Jul 2020 14:51:01 +0100
Message-ID: <CAFEAcA-nUw4=KbhxSTehpOEvPF6fF+WYRHMkXhQcnoBatt-65A@mail.gmail.com>
Subject: Re: [PATCH 2/9] Enabling *pty api
To: David CARLIER <devnexen@gmail.com>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::242;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x242.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Fri, 03 Jul 2020 13:51:16 -0000

On Tue, 30 Jun 2020 at 01:46, David CARLIER <devnexen@gmail.com> wrote:
>
> From 8b205a027dacad08ce9187474d9490667904a4e2 Mon Sep 17 00:00:00 2001
> From: David Carlier <devnexen@gmail.com>
> Date: Mon, 29 Jun 2020 22:14:53 +0000
> Subject: [PATCH 2/9] Enabling *pty api
>
> Signed-off-by: David Carlier <devnexen@gmail.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

