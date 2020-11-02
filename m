Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kZWUO-0002lA-VA
	for mharc-qemu-trivial@gnu.org; Mon, 02 Nov 2020 04:51:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kZWUN-0002ge-Ly
 for qemu-trivial@nongnu.org; Mon, 02 Nov 2020 04:50:59 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:44594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kZWUL-0007O6-17
 for qemu-trivial@nongnu.org; Mon, 02 Nov 2020 04:50:59 -0500
Received: by mail-ed1-x530.google.com with SMTP id w1so12578925edv.11
 for <qemu-trivial@nongnu.org>; Mon, 02 Nov 2020 01:50:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QP3mO4N0e2zy5Xe68Nrspvl6MDsRH3Wb8REYuar2i7c=;
 b=yLjZZc66UST0vC9FV1d/x44LtC1CjemfSDSwBhvVLyqmzNV+6lDYzUxkVKnaujtPV0
 O1LBreo4zXOHaqLmfLOkjAl1+ZgY1ayTRIljfHHe+SpjBC4TFwzmKzwSEWqN/r6ybl0D
 Lq86cJwe18b+ZABpVaqAQw4aE1P4heVFnOzy3hke+yKnHxoOxGsjh3tkQ08Ep079s/wn
 dU99f8VrDFoIqqpuO8ZSQIeDlenuwRUP+UZyLF5M7DDFFhXIth4PHen9M+OVC+gwu4TZ
 dZjPi76EaSX0OzO6GqyskzenV9LBug0s4CM0gW9oyX4KvurSPGkQuWGAkJ8hMrMCgaWd
 SyjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QP3mO4N0e2zy5Xe68Nrspvl6MDsRH3Wb8REYuar2i7c=;
 b=Kw8OwmhFy8izkEJpWHt7VneuIap4XSbbVckmIyNs8re0GSWwre/QE6hicVAxZOFQ1g
 lXrOMkPB68uum4VTSveEQOU/XkWR081wMDtRs0/jzp9PWMFWJigMomRKj/mg3AMSt7Xd
 3D8z8KLlNOKN0sDr269VXxG9z45xTMESWd3nb5Ne+2zBRoZ/Na19CT1yh+60axFWi9eo
 qkgXh2GE9y3JjXdnWgp1QQZr7YU6SKdz6aWmJ0sQuV35zLJEZp4dTc9U7Exr/EGNKPTu
 ixGZFZcdRnoZO2Ksg00sDLiM45X3kFq1Dc6se5N8lM2CBMdTkEPSD6aZQJO4t8zHzz6O
 TuIg==
X-Gm-Message-State: AOAM530BEZ2l8PM9WlT0i8Gu2d7Lr4IGKALj6QxsxmK09B5nGi2Af7MA
 zoqrWhfr27Q9efPM4zGvYJauOcPNHlqA/xq/4OvzxA==
X-Google-Smtp-Source: ABdhPJzS4SrpdU3lyJOuW4fF7NAcJ35tbraXqHEEDAxXFvvXhu4hQpkL7oQ4MD3oq1Zx/Dh0BkNBDAlP+mhy74GdqWY=
X-Received: by 2002:a05:6402:4c6:: with SMTP id
 n6mr16033878edw.204.1604310655376; 
 Mon, 02 Nov 2020 01:50:55 -0800 (PST)
MIME-Version: 1.0
References: <5F9D449A.900@huawei.com>
 <CAFEAcA9w_JZ5m2Cj9Cuc4GMka8vp-AabtmqNLwe0q7ObN7QKyA@mail.gmail.com>
 <5F9F953A.4060603@huawei.com>
In-Reply-To: <5F9F953A.4060603@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Nov 2020 09:50:43 +0000
Message-ID: <CAFEAcA9JN00jcP0ss2wjm7QkR3OFZAksVLuTYNv_tjSG8v2esA@mail.gmail.com>
Subject: Re: [PATCH] util: Remove redundant checks in the openpty()
To: AlexChen <alex.chen@huawei.com>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>, 
 QEMU <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-List-Received-Date: Mon, 02 Nov 2020 09:51:00 -0000

On Mon, 2 Nov 2020 at 05:12, AlexChen <alex.chen@huawei.com> wrote:
> Thanks for your review, I will add this description to my commit message in my patch V2.
> In addition, since the amaster and the aslave are not allow to be NULL,
> do we need to check that the amaster and the aslave are NULL in the beginning of the openpty()?

No, we can just assume it. Our coding style doesn't
mandate that level of defensive-coding against caller
errors.

thanks
-- PMM

