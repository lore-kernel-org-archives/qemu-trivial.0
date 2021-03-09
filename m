Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lJcS4-00076f-6H
	for mharc-qemu-trivial@gnu.org; Tue, 09 Mar 2021 08:31:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJcS2-00073s-Rc
 for qemu-trivial@nongnu.org; Tue, 09 Mar 2021 08:31:06 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:40567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJcRz-0004pm-LO
 for qemu-trivial@nongnu.org; Tue, 09 Mar 2021 08:31:06 -0500
Received: by mail-ej1-x62e.google.com with SMTP id ci14so27570983ejc.7
 for <qemu-trivial@nongnu.org>; Tue, 09 Mar 2021 05:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Uh6c7+CuRro54PmfG9+edXZYQI4DvJM5hX/S9b/HXRQ=;
 b=tWUn+Unx8EQfoiSrfLpp6oNksmtsQ9Ks9979vyAZaxC4f4+nZFh/0fwiQ9Wq/W5K/7
 7snh+XHRUtT0aHYKwkSxoJqj22OeBkbgLofLEL/j+iehUVCXnn/wIP4JlokBH0IzIU6t
 P3wZ9B62XknWwriCPsIApRdHxOLVPeuVbmMaz2NQP2ZEARY2SM8DFhJ+iP4kZaejaq6q
 xKMhxSnqQW1GhZje6hFOzFMkVXzTs0cI4rjeRuzPmM6G8dcXGuXXhTWJ+xihqS/xuKKd
 KRV+CsoOEMvn4XkXLMoB+NpZFGE2zBMSGxH/mo/MnhjPUQLWnuu+kgitEp8aAQb5P4gv
 Ow8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Uh6c7+CuRro54PmfG9+edXZYQI4DvJM5hX/S9b/HXRQ=;
 b=PyHsebD5FArXe4+GoywzGd7+JMF01piV1IzgHjA2EcjZDB5q1i4mzjuYE329fUdj1l
 oPJu2t71+ZDyf4dfhEUotMO2nlGWTwGW7y/oJCBd9ve08dkythjihnJiswp06U4zjpUM
 r9FBJVvBNDv4hmz4z9OgJFA1lpXVQMPIYu4RuHFWFQEw+z0pmaTJMQNUmbBBfIjkjWWB
 9qxVY/ZUtt5jYwtHwQWH46wsyGIfiOJUJXme6fgtEtGg7mr6bQMdNHMdte/ClbxRw4f7
 AC+P3BLmGYKgwfrLujXkkR3DcYeDnEzlNqIc0quQ7xYsAK8u1c3n25Rafw+eihqQTjYh
 H1vQ==
X-Gm-Message-State: AOAM530KVLd8pMxy0AAOPtgJUXsyYxfKRGUOLGHvEaTnnnZV9BoWgkAV
 +66Q+//m8MUNPS6UzhZulzkNlsIGTF4FgqnPqUTbUg==
X-Google-Smtp-Source: ABdhPJw23STRnbaB6W0AKZirdcx0rj9PYAuyjERiplaroMNjwl24ObhC6mB79aSl/jY8BOF/uzBy2pS8r/mcwafhnXU=
X-Received: by 2002:a17:906:1ecc:: with SMTP id
 m12mr20188623ejj.4.1615296661722; 
 Tue, 09 Mar 2021 05:31:01 -0800 (PST)
MIME-Version: 1.0
References: <20210309111510.79495-1-mjt@msgid.tls.msk.ru>
In-Reply-To: <20210309111510.79495-1-mjt@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Mar 2021 13:30:44 +0000
Message-ID: <CAFEAcA_0KRbyMu_PUhfxeVR5H+34duhTKCarW_JmCynU7i1p6g@mail.gmail.com>
Subject: Re: [PATCH V2 trivial] Various spelling fixes
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
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
X-List-Received-Date: Tue, 09 Mar 2021 13:31:07 -0000

On Tue, 9 Mar 2021 at 11:23, Michael Tokarev <mjt@tls.msk.ru> wrote:
>
> An assorted set of spelling fixes in various places.
>
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> Reviewed-by: Stefan Weil <sw@weilnetz.de>
> ---
> V1: https://lists.nongnu.org/archive/html/qemu-devel/2020-12/msg05959.html
> Changes: incorporated suggestions by Stefan Weil and added his R-b.
>
> Please note: this also patches one file in disas/


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

