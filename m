Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jrM6T-0002Xe-AV
	for mharc-qemu-trivial@gnu.org; Fri, 03 Jul 2020 09:51:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jrM6S-0002Vm-7y
 for qemu-trivial@nongnu.org; Fri, 03 Jul 2020 09:51:44 -0400
Received: from mail-oo1-xc42.google.com ([2607:f8b0:4864:20::c42]:45185)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jrM6Q-0000Bn-OL
 for qemu-trivial@nongnu.org; Fri, 03 Jul 2020 09:51:43 -0400
Received: by mail-oo1-xc42.google.com with SMTP id v188so894051ooa.12
 for <qemu-trivial@nongnu.org>; Fri, 03 Jul 2020 06:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MepMru1D/YzxkLb8PygMuGCrjLYZWIayt5cr0f568H8=;
 b=Eiag0zTBE7cpOlvQwPP1wlqH/nJvE860KgI7Qvwy3oOSwmCnv0g/jHFHNIfCotvG02
 oo40uCwywc1u23IvObbezda7CqxlRfesRRrV80Fc5cyvjUWVCX733dZcwLzscPgH9HQ3
 m7ZYk17+3a8IIAAGV0kcYXEBa1kMBwmXJMRPLX5EOpDAWansDbqL0DOp70DxoZ4+nVcU
 4QxmggfY3YbBZ47+vWrcCv8VKi+xOchADhIYGhUC1cMCV9lgR0g79sgo17MZhjXd4gJP
 M6aHz6G/1WwXndqCX/vqNuwl7SwpA5p4+rjCMfYKPL/okHt01RvtX3/0Ppvci1erUM04
 U6ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MepMru1D/YzxkLb8PygMuGCrjLYZWIayt5cr0f568H8=;
 b=D80f9h4FWbacnwoO4ugE8Uy4gjv/uny5nn4NszStIpfhSZynE6GC3psjL5oE1pg0Y3
 md9Azr6QDHKK8rVF1UFZauGJzK21hJ+r42fyyRlCOj1mAceTvL28nAFdn0fJNIHsbKsA
 Sgcg+ik6w7piVwfMfV7f+N9PrWqsK2uQXqyJ3f0pMZOdJ4yTRQcMvqMZagvh4tgSCfil
 CGBOlXahmktW7XYnefjPi2m+2y8tCVsYdIuzreycvh7Xc6h7g8EBppyG8wKcAIVhy49P
 iIwlGMvt09NAXFkSqaDWUt2s/7XcMTKXLoSQO/oE+Ukk5MfXWTXi0reXBoc4IGJzOJot
 u6ug==
X-Gm-Message-State: AOAM531TdLJy0X5efEflGqB9NsFh7tA2LYphsSDcaRipr8GYAglbWAty
 6vCCJDzwuxfKZYG64bmrrCTK1ZelBLDcH+28gRU9sw==
X-Google-Smtp-Source: ABdhPJz6P3hDD/Jv0VznMIYmst/45TfzXqmMJVCvH5SfRtuWzNifw3TYD+S03wq+ekS47qi3e8rQTX7OlLO3s51xpY8=
X-Received: by 2002:a4a:9653:: with SMTP id r19mr9262711ooi.85.1593784301704; 
 Fri, 03 Jul 2020 06:51:41 -0700 (PDT)
MIME-Version: 1.0
References: <CA+XhMqztrEOU5KQQ91qkNMrXZOxfnKQDFhC_UiJP8MkoyVoquw@mail.gmail.com>
In-Reply-To: <CA+XhMqztrEOU5KQQ91qkNMrXZOxfnKQDFhC_UiJP8MkoyVoquw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Jul 2020 14:51:30 +0100
Message-ID: <CAFEAcA9X12n5XE1Jx9rgHLUt_hE6Tgc2QcsyDxAcow4zSjxZJw@mail.gmail.com>
Subject: Re: [PATCH 4/9] Checking sys/signal.h presence.
To: David CARLIER <devnexen@gmail.com>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::c42;
 envelope-from=peter.maydell@linaro.org; helo=mail-oo1-xc42.google.com
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
X-List-Received-Date: Fri, 03 Jul 2020 13:51:44 -0000

On Tue, 30 Jun 2020 at 01:46, David CARLIER <devnexen@gmail.com> wrote:
>
> From 9d43c8cd1611d0347db9066b1df1dc34431b2028 Mon Sep 17 00:00:00 2001
> From: David Carlier <devnexen@gmail.com>
> Date: Mon, 29 Jun 2020 22:17:53 +0000
> Subject: [PATCH 4/9] Checking sys/signal.h presence.
>
> Signed-off-by: David Carlier <devnexen@gmail.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

