Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jrM45-00087F-MR
	for mharc-qemu-trivial@gnu.org; Fri, 03 Jul 2020 09:49:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jrM43-00084r-N0
 for qemu-trivial@nongnu.org; Fri, 03 Jul 2020 09:49:15 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:43275)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jrM41-0006vn-L1
 for qemu-trivial@nongnu.org; Fri, 03 Jul 2020 09:49:15 -0400
Received: by mail-ot1-x341.google.com with SMTP id 95so16093964otw.10
 for <qemu-trivial@nongnu.org>; Fri, 03 Jul 2020 06:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eXmdn0F3Q/Cawionph7MsrK/iM3uSTrOvCdn0qlvQxU=;
 b=x5dqCgvIl71coNCGrFxgcRs9Uyz80EEjyeRzQ1ZYE4rARd/VGGq+OtqjllEjKHbWFD
 GaSFvIQvBec4i2Z06jNs+8/7152WVoHqmRzx9YMgzxSU8KnBvhcyNp2DO1G3Hm3/MASL
 xB6pI5d6ABnq+oxkFpc573Rsulr3ghXuxOS0nrw7k/RHbkHzTWM/PU12hC02SDtSBgt4
 VRM0b5UZJ1vYJzqiKzahImQ1N3VdxZa9RnhVIi9SubNHRgfRnPoyEqEb4wXhOR3H7RFz
 twSXe3ELoJ/oz0xYw4yyk0z47cFiEymtcyC+lw0TtW+22rvfLQa4XjoYPj2xD9oupCIu
 Gk+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eXmdn0F3Q/Cawionph7MsrK/iM3uSTrOvCdn0qlvQxU=;
 b=Llq7wNyam0WzUZ46lQffi4B9X5CSp78pZdyYJx44HjMOaw/Ez7J1xIYLGvhUl7I5rB
 KCox0qCcsg2kUaA7VxwWU7Lp2qgs9jJrnvp8v5Lfm08OM6hLAjKCnfMPyw4kcnflauYg
 iWMIHnX7SXNaN33avxh160OEzBkAfHb2UN8h/rnwGJ3OBbG/RmtB0y7sfTkfKJ0iaxVK
 nBLT2N1qfK1NA1NODIIQRKNWYXujKn6DKWDr6sbEuI7RZG0ZI1s9equ7KUB65DTS4AmM
 6AnFgp8FkoBX7HX9UU69jou2cABjd/JbDNWYfh/Nu5IM7OvNaaR9/B3VknJG9HFeKvcC
 vgag==
X-Gm-Message-State: AOAM533R02K7CSnOXMD0Tt+hD6jaGQZ9sirZnDW6W6he92C74aOEQ9A4
 yij/alUKqZY+bzF2JwjBpEB04wCl5IVFHq7Tkemz2A==
X-Google-Smtp-Source: ABdhPJz6xSeVuW7My1WlKQSV6e3zVeg0nkTxT2nRCtaeJPf8VzxiyhUlHTumS8UOniPWWJwEztp8i5I/rfsKCxKo/9Y=
X-Received: by 2002:a9d:7303:: with SMTP id e3mr24560002otk.221.1593784152455; 
 Fri, 03 Jul 2020 06:49:12 -0700 (PDT)
MIME-Version: 1.0
References: <CA+XhMqxOuWKDangdOwhe3PbKa=411_BRC7WS6dvfJ+HMPw7j0w@mail.gmail.com>
In-Reply-To: <CA+XhMqxOuWKDangdOwhe3PbKa=411_BRC7WS6dvfJ+HMPw7j0w@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Jul 2020 14:49:00 +0100
Message-ID: <CAFEAcA9CSh56kb9wc8-5uv6jrp-FrSkqwtShLHBhKp5FMHJaOA@mail.gmail.com>
Subject: Re: [PATCH 3/9] Checking mlockall symbol presence
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
X-List-Received-Date: Fri, 03 Jul 2020 13:49:15 -0000

On Tue, 30 Jun 2020 at 01:44, David CARLIER <devnexen@gmail.com> wrote:
>
> From ac450c4abe03e0e461fede18727500e616d9f7e2 Mon Sep 17 00:00:00 2001
> From: David Carlier <devnexen@gmail.com>
> Date: Mon, 29 Jun 2020 22:15:21 +0000
> Subject: [PATCH 3/9] Checking mlockall symbol presence.
>
> Signed-off-by: David Carlier <devnexen@gmail.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

