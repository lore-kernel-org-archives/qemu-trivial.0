Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jopPf-0006NB-Te
	for mharc-qemu-trivial@gnu.org; Fri, 26 Jun 2020 10:33:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jopPe-0006LO-4T
 for qemu-trivial@nongnu.org; Fri, 26 Jun 2020 10:33:06 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:39282)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jopPb-0004oI-TF
 for qemu-trivial@nongnu.org; Fri, 26 Jun 2020 10:33:05 -0400
Received: by mail-ot1-x342.google.com with SMTP id 18so8796325otv.6
 for <qemu-trivial@nongnu.org>; Fri, 26 Jun 2020 07:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nX6X95UqvlMI7EQX5jPP5U8M/5fPDmbMAURaJJ6lOLc=;
 b=jECW8HyGK5owBpVJAvP64CR7uOKXbeVQ4xwt9Btohk7lH0d1VYnRYdKjqO01FtL5vl
 LitWMyifixj9l3YniwkMj/5QOOiB9wh2zEB9rYIAcZRzK6kJBi3hRsbZbPkIrzLd8x4x
 xJYCwoItua43uDzjVqKQNi1KlqugiwnyeqnMR6poc8jLy34Wt5dA9J6yDPaJ6BSOIQdh
 EgSv3twfOUHlRLP/PewG342ktLthCCjAMZmWDYCI5INOp5DYjg+PNHbIVN4jvNnQm3vN
 j6b8Jh0mWLFmRoWi7L85y2zHD7EkZ1uIcw5K52EVK7hhEd7DM2czKCG8EaVeDWfDuoY6
 C3Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nX6X95UqvlMI7EQX5jPP5U8M/5fPDmbMAURaJJ6lOLc=;
 b=kqCVSTMhixrHkaEQlYeZp1PpbFr42N/IHD4ibQxoODgcqcnNKYXE0UcHSQhPOYFsW/
 ARhnmJ5RWSQhMYeBsNl43dIEkTRKWA5y7/WfvqxuOMPVGDd/NMamgliNbgayJXDCEu+f
 WgwK5QizdXHqIdqhvricYIJP9c58J+qZ6atENvGOCDti8Tvfoalw3vwY0GvfLBY/itEH
 5RU6qbLqrTr5I0TaE5UzryP0Gvp2elkDnQyMgHdF6hNdPayUwo7DgQrR5mQP04fdYqcL
 PDrg0Gh0hHQJLbmxKilKseZIOf+fZ7rF8ZSkgQ4Zv/KfVKPr7DPeUY9J7Jdz4WQOK+Lh
 TraA==
X-Gm-Message-State: AOAM5307NFxdEKM76IDnx1ocHh+P82Z86SI2CpwoepCbrDXOHiX7M64G
 f2F7pZ+i/jzUQppr2x2kjGONk/a2UjKf4ZESM+A+bg==
X-Google-Smtp-Source: ABdhPJyzxen1/ysk6PxS3uaywQeWXbYvd5IEKaIrKO3y1qHH6nNOz0v/LXRjqF5T6Pp1JEksicenxSCyEJSZ0FYAPRs=
X-Received: by 2002:a05:6830:1bd3:: with SMTP id
 v19mr31007ota.91.1593181982365; 
 Fri, 26 Jun 2020 07:33:02 -0700 (PDT)
MIME-Version: 1.0
References: <CA+XhMqwDLw2BJ9Cf0kEyUW+J+rTPOOvebRPPkBSiWdD50wct5Q@mail.gmail.com>
 <CAFEAcA8mpiPcwgz9-7c0GgSWz2hujzegOBvHn5qasCBtuyG8ww@mail.gmail.com>
 <CA+XhMqwyRmQ7Dtawm4tMEMRJ9EEfxep8WC6qSRCEC_WyUptG-g@mail.gmail.com>
In-Reply-To: <CA+XhMqwyRmQ7Dtawm4tMEMRJ9EEfxep8WC6qSRCEC_WyUptG-g@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Jun 2020 15:32:51 +0100
Message-ID: <CAFEAcA-fj++yDKCbvfXWduVxTPsAhSkFKpEHcvcCvpdO8H0Cdg@mail.gmail.com>
Subject: Re: [PATCH 1/3] haiku build fix second batch
To: David CARLIER <devnexen@gmail.com>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x342.google.com
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
X-List-Received-Date: Fri, 26 Jun 2020 14:33:06 -0000

On Fri, 26 Jun 2020 at 15:10, David CARLIER <devnexen@gmail.com> wrote:
>
> I sent again minux the ones already approved.

Sorry, I intended that you should send the whole
series, including the ones which I've reviewed.
(Where I gave a reviewed-by tag, include that
tag in the commit message when you resend the patch.)

thanks
-- PMM

