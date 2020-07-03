Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jrM79-000460-3N
	for mharc-qemu-trivial@gnu.org; Fri, 03 Jul 2020 09:52:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jrM78-00042a-0X
 for qemu-trivial@nongnu.org; Fri, 03 Jul 2020 09:52:26 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:35000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jrM76-0000Ww-Cf
 for qemu-trivial@nongnu.org; Fri, 03 Jul 2020 09:52:25 -0400
Received: by mail-ot1-x343.google.com with SMTP id d4so26763809otk.2
 for <qemu-trivial@nongnu.org>; Fri, 03 Jul 2020 06:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XPJsWCIrHF39xH7oRa7xgSt2AymTiJs4Z8j99EMpnQ0=;
 b=mf78nj9pNLBxKEUJID7pVG5rzyJXGQNeYgN7zncKhFnWb4O4AXQQxIJeLtBqhTnIHP
 66ueDgP0/WZMYnfoFJNSlM7Q8L+cIhC1lyl2dK9ILI9s3riEsOEs94REWdQkg9EsqWse
 Gozr5YfCDRmTrOPHta3SvwRqg5Y47bT/yUDCTzGYhQnx/qRBQRbskarC4ZCQeOcWZ6LJ
 DJEQOxYycNLL+oROI3XfSvMbhuDemkIAnv+y0TYWYV3+Pf9itlpveoqrhGgfiYx7sq75
 IXagF2nue9hL4zSUzaTgEJiOqXQ5u7IbBPYITTFodSc3GkbI4pTWhbAnYDM54arYAtQi
 FmKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XPJsWCIrHF39xH7oRa7xgSt2AymTiJs4Z8j99EMpnQ0=;
 b=oCZw7VRYyknT8mZioE8aKePrPhOsxkqPKBSAucZ049e9uxJkkW+Lb5IkzQFDyK8xxN
 3CPcPAUWWBNH/jJQw6N+CAQCoajQi3AIyw7KRol309HW0D2jyMFxOniCXF/K7CAWwC7l
 /QHWQCwEDfYwaIhkoYba1fZ0OemgClcyixcWnVQ2qKYtgq1XcxwBqNcT13PAsUOLAGPf
 /1mFRW6aCkgnIxdF4HwwP+J5olEZpWsFXpfx5CXLwXB5uDGOIem4Ir1+9tbIkXGt61WA
 II0Y4eO6TPtbgKSW/o0E4BUVZ8HFZigoX6usR6zJa+u6sRC5A+mcpk7Lq/8jQyHJkuEi
 iodA==
X-Gm-Message-State: AOAM532oogWZJdhPWvPks4yK9K3GCcauPEvPJ1SBCXF77gnz9Os5IJLc
 WVJQKBYwA8GKb4Owwz1UmeGRWc5/i1ao9L3LRGPP6Q==
X-Google-Smtp-Source: ABdhPJx7qZ23Xx6FbBpO/xw7CRu/6RTm7/Pj62z6RrHrWU0Acvksq18+vZuTz3idktWpDnGQCXSQs/HmqGYYVlA0z1w=
X-Received: by 2002:a9d:7303:: with SMTP id e3mr24570302otk.221.1593784343129; 
 Fri, 03 Jul 2020 06:52:23 -0700 (PDT)
MIME-Version: 1.0
References: <CA+XhMqy6B_mtdwCYDAw0ZRAsmKROMw4hbw8pRznj9yPH2TwtPA@mail.gmail.com>
In-Reply-To: <CA+XhMqy6B_mtdwCYDAw0ZRAsmKROMw4hbw8pRznj9yPH2TwtPA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Jul 2020 14:52:12 +0100
Message-ID: <CAFEAcA98566jHbGuWWFO+bpQMmOTrkYZmBoB9KWSWzz2aT_O2w@mail.gmail.com>
Subject: Re: [PATCH 6/9] Including endian.h for bswap operations
To: David CARLIER <devnexen@gmail.com>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::343;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x343.google.com
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
X-List-Received-Date: Fri, 03 Jul 2020 13:52:26 -0000

On Tue, 30 Jun 2020 at 01:46, David CARLIER <devnexen@gmail.com> wrote:
>
> From 2f65cab41a8f4508532b3893815f222bf2293463 Mon Sep 17 00:00:00 2001
> From: David Carlier <devnexen@gmail.com>
> Date: Mon, 29 Jun 2020 22:19:34 +0000
> Subject: [PATCH 6/9] Including endian.h for bswap operations.
>
> Signed-off-by: David Carlier <devnexen@gmail.com>
> ---
>  include/qemu/bswap.h | 2 ++
>  1 file changed, 2 insertions(+)8

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

