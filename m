Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jrM86-0006N0-Fr
	for mharc-qemu-trivial@gnu.org; Fri, 03 Jul 2020 09:53:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jrM85-0006La-N6
 for qemu-trivial@nongnu.org; Fri, 03 Jul 2020 09:53:25 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:33580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jrM84-0000yb-3F
 for qemu-trivial@nongnu.org; Fri, 03 Jul 2020 09:53:25 -0400
Received: by mail-oi1-x242.google.com with SMTP id k22so15222522oib.0
 for <qemu-trivial@nongnu.org>; Fri, 03 Jul 2020 06:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6n/DStbs/HviDJef2CMucQhuRQbYKDJCyHYaau13jGk=;
 b=tZTBT0SlxB2wTmDU9Y/cOvPFvrnByRlEVrkgHXTeLH5JQ50nDLH1CVmeeEGl/gtmw4
 itKeNYi9siFOsWlLzfFMazFo2A4IbuN1ES2Ej1WC5xewGd9nMVcfafnndhNwvcB/WxHT
 Vk6YQmcKKzSxjnqSrP2EXrKietbD8wog+LxH0sCBPzadlCViJHbyodMQvD6U71gNvIx5
 03Wgex0euekm1Kc2eyHf9bHfjZ+KnHJNidxb54SSNHrJqQDwgBh2bjy3xks4joojSFTg
 ESb6vZMkDYVmERK7OjDs0OiGXnW3wZ9WtCVhdA4Mjf93N4Y+R7znfY97gej9beZnnWCE
 j3cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6n/DStbs/HviDJef2CMucQhuRQbYKDJCyHYaau13jGk=;
 b=MuGuR8AZ92ubDTTIwTUsRARSA1/iJR8GqwV8fa8RLFHE2/2nPBAQf8nDG9u3ZY1Jv4
 h8SNX4mjXjLi1ljxYSuTshd8iRKzd3a0KC4YhcNM+T53KkYuv89NJSph9ZVw9LgRSj4y
 0C/4NsZ6QY0Lby2dSXQqvbp2pLyI/qDsbr+qsShQFWczvuv7tMDSjHXbuliTphsgFPqd
 weQX5nQ3xtSXj7iRenFy8R+c1UpJuICukKzm7rMrc8/qjOsvnVq9h8ZxXuNPguKranAV
 3CKOuJeTsqEveAzNJrQlDqKDK5Kwb3ZDiQRGDGkJWt/F2B/RdftMuM0P9sKZ0HsCJXWq
 UscA==
X-Gm-Message-State: AOAM532FMwK9Rk2FpnKCFs2v3Ty3EQEQC+fBqJmB4hVFsz4kXT/fZAi1
 RXRI7lGeUvOUM4jZuVKu4rplVAsSg63vVA4U4BDyrw==
X-Google-Smtp-Source: ABdhPJw6ZbajBPQc/43SNCgSI0eBJfJU2cjJZgAUwUPOMze6x07JLwkGDUT2wT5aLNx45ir2AfyglEP/6A6WQpBTcQA=
X-Received: by 2002:aca:2819:: with SMTP id 25mr21203626oix.48.1593784403074; 
 Fri, 03 Jul 2020 06:53:23 -0700 (PDT)
MIME-Version: 1.0
References: <CA+XhMqxuYwkJLbCRZpAM7pM14CbLzx3BZ=n6FW14cg344xsFJA@mail.gmail.com>
In-Reply-To: <CA+XhMqxuYwkJLbCRZpAM7pM14CbLzx3BZ=n6FW14cg344xsFJA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Jul 2020 14:53:12 +0100
Message-ID: <CAFEAcA8M6Cu=Fk7emJGwEqPpkqNKh8nfyncvAFLbW9hfM8srPA@mail.gmail.com>
Subject: Re: [PATCH 1/9] Enabling BSD symbols
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
X-List-Received-Date: Fri, 03 Jul 2020 13:53:26 -0000

On Tue, 30 Jun 2020 at 01:44, David CARLIER <devnexen@gmail.com> wrote:
>
> From 5c6022f21289eb6e78e93d584c766db82165dced Mon Sep 17 00:00:00 2001
> From: David Carlier <devnexen@gmail.com>
> Date: Mon, 29 Jun 2020 22:13:35 +0000
> Subject: [PATCH 1/9] Enabling BSD symbols.
>
> Signed-off-by: David Carlier <devnexen@gmail.com>
> ---
>  configure | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

