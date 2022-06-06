Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ny9cQ-0006I1-6t
	for mharc-qemu-trivial@gnu.org; Mon, 06 Jun 2022 06:05:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ny9c9-0006FJ-Qs
 for qemu-trivial@nongnu.org; Mon, 06 Jun 2022 06:05:39 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:33486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ny9bv-0002FL-6i
 for qemu-trivial@nongnu.org; Mon, 06 Jun 2022 06:05:35 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id v106so24836423ybi.0
 for <qemu-trivial@nongnu.org>; Mon, 06 Jun 2022 03:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AgnpbB3uaCK9ZoYnv0dBLc6i1r4aYAr3ASAqi88cT5o=;
 b=FpLu/WhRvhcqlN93cUNcwGvNC3m7zO5B7mEPwJI+0KsqWM35r3h/LquLIL/rhmai3l
 /tZzlKIwoPmRh7YtQ7I7SPse0NAPrZnpCqS+2+jipj4BpotXwXvXoWAAIZ3JKmPf3+e/
 fSInGUpRDdRTdgeVhz9grkP0lAZTMahCvN9YCJrLFIl5dc71HWb2rQpZFV3jy9pBSRSB
 pm9QkUfKnLZyUACwjQULUGBjZOsHDuTykmVWw/3hIqLbEXPMtKGMs4ZcDwKunsj42Sc9
 K39LInl2m2rC7h83ukpRcxyQYXZmIFLq3gMaTo4PvKvt5enB/mPSKOv/i1YQ5oJBZZFW
 JHnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AgnpbB3uaCK9ZoYnv0dBLc6i1r4aYAr3ASAqi88cT5o=;
 b=Q3KAhKzCutcFSvG8+dii+wmpRioBWZDDG8Z7uUBh1iyH1OT2b+D0KbNjXFU5BztqCF
 ZlvvAA22ZzX5i5yxTjGHHqOOGxC0W/jCQfKdkGDNZFZuLZkCjZjaW9uM0vti0N6DBxLL
 VBgSKOAz3/TNnPcmvLeYUqGtwMkMqT9gXGUCh0VXxxzKI2DgKEWsd17feVrUQiz8soVw
 /O/VmtxjvlCPj7wys2L059UVy7Sb67Hb65jm1NtUQzlnZ2MyJ1VxfJUQm2x5rYpZvr3p
 86sMjPvfMY+7CFSVP8NO5D6n71i/fy5DsuADQz/8Dzqh9BICtnglZPV0Udrjma3OryVm
 +caA==
X-Gm-Message-State: AOAM531wniFcU8BtSPOIzTgmFkdHBJmMX3XYLCpLTn16UZsUOthAcYKr
 1MeKTUqnIwTnlOiA5W83un8GPH5nvN9cMIUmut/GxA==
X-Google-Smtp-Source: ABdhPJxw7GfDa9Eh3KNL6BAx8yHUAkGyfwTfoUBY6WNH4d503/Fym+/3IYkBIhXMrgaoxhm1VRWJrXrsf7IWBS956+4=
X-Received: by 2002:a05:6902:728:b0:663:5591:aa2c with SMTP id
 l8-20020a056902072800b006635591aa2cmr9108690ybt.288.1654509900842; Mon, 06
 Jun 2022 03:05:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220505095015.2714666-1-peter.maydell@linaro.org>
 <CAFEAcA9khsVoAi9TB=wFNB-pkEiGXfghvpBr6WKQd5zyCNLTGA@mail.gmail.com>
In-Reply-To: <CAFEAcA9khsVoAi9TB=wFNB-pkEiGXfghvpBr6WKQd5zyCNLTGA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Jun 2022 11:04:50 +0100
Message-ID: <CAFEAcA_M7ZXYG4g3wubY79BQ8gN2_cFVBgcJzRJy-kaQhaD6+A@mail.gmail.com>
Subject: Re: [PATCH v2] Fix 'writeable' typos
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Cc: Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2e.google.com
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
X-List-Received-Date: Mon, 06 Jun 2022 10:05:44 -0000

On Mon, 23 May 2022 at 15:42, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Ping for qemu-trivial? Or I can take it through the arm queue
> if you prefer.

I'll take this via the arm queue, then.

thanks
-- PMM

