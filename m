Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jrM7Q-0004vX-Il
	for mharc-qemu-trivial@gnu.org; Fri, 03 Jul 2020 09:52:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jrM7O-0004pS-AU
 for qemu-trivial@nongnu.org; Fri, 03 Jul 2020 09:52:42 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:38849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jrM7L-0000tb-R5
 for qemu-trivial@nongnu.org; Fri, 03 Jul 2020 09:52:41 -0400
Received: by mail-ot1-x341.google.com with SMTP id t18so13928929otq.5
 for <qemu-trivial@nongnu.org>; Fri, 03 Jul 2020 06:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QrnTEd+QEvPrsXhOfKMJN36kN5dABOeyqo4GoYHhfog=;
 b=PL2jWyzBT0zYogzk15TB9sjj+IZCLD2ZgbzefED4yt/SFgFlTYSsAN+yiX15/7PRCQ
 3d1iSxLoVJfVxtqfw5S3c0nrVmwBcdgVC2hh6svVbjl/QUAFnu4Tyrbgx87jASVDf0Nu
 ED7ikGKRuWiFI5iPM9xc3LGNqjCd0sWQ8+0k5Mp8cSPQKpmSlYiI+tSublXwAaHFUgIc
 +bh1IXrvo08XQhglqQAVGYUQOnXUcWA+4CWzOc1lHSxQHtef7tZ2qtErArchZo2oeIzk
 ZtAXEJe0kREoVd++KQd7aH3LPfUn0MfdUNx98Zu1ceAzZ4HY6A0WPqGnucuWWwmRdtXT
 K8hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QrnTEd+QEvPrsXhOfKMJN36kN5dABOeyqo4GoYHhfog=;
 b=DxDDrLQ3UsTE0qm1riAal7QTM3YwRX15F5XMBnOuDFzJLGZMKSSL1AAEMK+KWdKkrt
 eatVE0FveKj8C7fKRjRIacX3qL024Z+gtoA2QUlDyAxEheXCsxFHeFQk7Mrt2CoOHlO5
 e3VFOZPOu5fKP2bmmpLeXzRZID6QJnW0S5uB8ytX3atSD5MLV2DGqEGhKI+R0QrVsfCj
 HbdtcTvoUde6dNLKHFN6GK+8TLgLguW55wxoL2WMTdZNGr5GQquVDG02JpcNU4gOn60f
 xI+BCN5Be85T3hdZr15NjKSpXF7I81PUc+kosaheIf5EyGWdAF46hCdrPcI5r3E3eTVS
 cGNw==
X-Gm-Message-State: AOAM5314gk+CCsh0hiPR3ojuW9j/6YatbnV8S/SVwo8nWPnbEpr68CQQ
 7exISq+zzv9QcRLy8Rz3Odrg0SKKY6NXHAHllCJIQknd9wA=
X-Google-Smtp-Source: ABdhPJxKv8zYmfFwXf8EJkVGU0PJLDe/BfhqZfozllUQiXiobusUmeJJhiowynu0MZNu8UTya9GkBouqvthTK6c3BNY=
X-Received: by 2002:a05:6830:10ce:: with SMTP id
 z14mr23290967oto.135.1593784358577; 
 Fri, 03 Jul 2020 06:52:38 -0700 (PDT)
MIME-Version: 1.0
References: <CA+XhMqzZaXorKXQKXRNue9bhbrE3iawtM6EHNUVjGOuSayuvAw@mail.gmail.com>
In-Reply-To: <CA+XhMqzZaXorKXQKXRNue9bhbrE3iawtM6EHNUVjGOuSayuvAw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Jul 2020 14:52:26 +0100
Message-ID: <CAFEAcA-xqdBJS+yd5AYbhqzZEd7ZxfqpDQpXAcXE3pdZrMDVyA@mail.gmail.com>
Subject: Re: [PATCH 8/9] Skipping sys/syscall.h inclusion as only used in
 qemu_signalfd anyway
To: David CARLIER <devnexen@gmail.com>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x341.google.com
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
X-List-Received-Date: Fri, 03 Jul 2020 13:52:42 -0000

On Tue, 30 Jun 2020 at 01:49, David CARLIER <devnexen@gmail.com> wrote:
>
> From b821b7e9bbf1f327058ee858a92c7a7ee6740e63 Mon Sep 17 00:00:00 2001
> From: David Carlier <devnexen@gmail.com>
> Date: Mon, 29 Jun 2020 22:20:39 +0000
> Subject: [PATCH 8/9] Skipping sys/syscall.h inclusion as only used in
>  qemu_signalfd anyway.
>
> Signed-off-by: David Carlier <devnexen@gmail.com>
> ---
>  util/compatfd.c | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

