Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D8A3CDB46B
	for <qemu-trivial@archiver.kernel.org>; Mon, 22 Jun 2026 10:23:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wbboB-00027b-P9; Mon, 22 Jun 2026 06:23:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wbbny-00025T-NU
 for qemu-trivial@nongnu.org; Mon, 22 Jun 2026 06:23:04 -0400
Received: from mail-yx1-xb12a.google.com ([2607:f8b0:4864:20::b12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wbbnu-0008Os-Tw
 for qemu-trivial@nongnu.org; Mon, 22 Jun 2026 06:23:00 -0400
Received: by mail-yx1-xb12a.google.com with SMTP id
 956f58d0204a3-662ccb916c5so4272493d50.1
 for <qemu-trivial@nongnu.org>; Mon, 22 Jun 2026 03:22:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782123777; cv=none;
 d=google.com; s=arc-20240605;
 b=fnJcYxDW+SfkIVsCMolQIiEobLaXUcAeCBHkyIjzxqxKCdCs78BNzoDlDUkG11MPeQ
 HAWda+O74368H/kvJQK/9xpBkSLByrSEXO/bkR12FBzbpO38S3KBPEc5Nb57py4htFRH
 z2nIQ+GR0DCmrGcDvnUpbyoiIZwy6qy9TTvyJLWGd5cPNeBPnkIel5YwYj3ug3pOfGIz
 qSqI4D+G+SHt1p3sTYpCLqc3MJKED1VNPPKZJoiA49iAENzQ7JLfe88rnkznqw7k3q6b
 3Ee201p20WQj1OfApBvDOPNlLItaS/qZviDq7uJGD88qrH28wYjA6TnVknS3+zOsDhUK
 6X5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=k/HUmJlLMvc0aM+WDK4IfrdimbTRflTejHffYN89N5U=;
 fh=cMrR8dTWFhszXZv3w5sFlkKze2z/+2jfLQgiSMGYfhg=;
 b=Ogf/pkWIas04khrube8f1trT9Kh429n5MWEUmdFpPW/T8Rm3sOLqa0/ch3KxO4mWNc
 efDnHGngc9bnASsoRaXbStK1AcVpdEkFmQ8fGz0HpvXMEUqZ1JudWp3q9//WmZjHZvP1
 n9nIdqShaQF2GUv/QseQBXC+5JvodQ4JOas1IRO8ZmB+5Ac9ncaQmUYA18NGebIYKXXA
 5qZx8+pGE8ph3GB3N4pAWEzjkK8Ac2n0qhGRawCHvaf/7zWZFxDVkG5QvwYqjI0dzVzp
 r0Ne+RZEsw8Jz780iRZ0xGOXVvqKhslacfFbXtfEC/DkHQzvi8CEwiLs8KWnhahm7K+6
 IW9w==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782123777; x=1782728577; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=k/HUmJlLMvc0aM+WDK4IfrdimbTRflTejHffYN89N5U=;
 b=Ob0HU2KnArMCDDoQRJ768ArwMSjVahBTkZohQgQMTU9WPpJpm38/f83Sly5IFuc4wT
 3SXVaUEQOZeDSb6eYDDXsQAOBVbMbg9Hnvc88WCLC7Gf4afrd7fGJTmhbIByI9yH5DC/
 NFVvFYynUWegBc36rN6aHI4yCUNW5CwKf79xGs64cw5ou/DJymciOSMvmV3HPJdtxyxD
 J9Imit4mJCsGviVPcLKsjUXSv6NTGVqomK1c7w3hGmQFw8A9fqsJG7X95jfY/bxDx+E8
 4jS9Nuzy1LhLbjTw1gQ33+UteT9anSpvfqsfbZYd2WHlcxkFV/LeE/TyaRiQ5UjmZqb2
 AG6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782123777; x=1782728577;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k/HUmJlLMvc0aM+WDK4IfrdimbTRflTejHffYN89N5U=;
 b=o9KxtOT8t8wZjZNvrSS6cGxcN673iHutYtMG4N6DFJN7xuPo73zweNFwFyuWXP9Zh2
 mPnmw4bbPl8Oe/PnzJUkZV3lvyBfwxQMFZWmIgc1iPqx4gfAm4gUEwenzhKn4zkc/VJe
 M4vBqAz3mC3mCFae6dexzOlHfA+dax3A+F/OseyOGApoPgouyG66qHDXwxjVN44TXzb6
 7n+h3XBAidzBkjoO8VELGdFoS6LR1hZWYIAktb7pH5XNcQo2XhEx0ICy9HUHmhJlRIA1
 v/6mUXYbC+70Uq6z07SNpvhfZ1NsCy7xNvvy4owl0CPNlvGSco7m/fc16bEJ7/fx22VP
 uusQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp91kssnkYpZNFuWc0aJkdZKcCQ3BnG2DBZ5WkEbeC66VLxf/pdRZgKGDvmLjtsW0F6rKHV2+znTPv70a0=@nongnu.org
X-Gm-Message-State: AOJu0YzwXOGWMLikyryQYU93EEKmy1ktuxFX2SSB5JXQazUbMOGTqTuX
 dPLzJ7BoublzVsCURs4Z9DK7YqdhpZRblyxAEwoiPZpBY19IEvrGbHKFmqgaZbBzeWc9ji7DssQ
 TEeaDwnrdaghXNUbzQh3xVRBk4ZtO3zuzDDQEQV4vbQ==
X-Gm-Gg: AfdE7ckvSI/oRCSOoAOh7o2HnRzlCcsD28HgGhGXw5ETH4CedpIXo4hdqbE3BLiUlXG
 0BoW24U4K6AI1IvzIhsHB3AtFWzaYWaP1rc8rYQlnmgXGGHFY50W5IOfZYacAeV0WKcFlqTFAC0
 DwaHqL6XNv3oeAjXcSqFhMoC72SQe5ubdkK7gCFN/jQrYlQWSTyr89j50UGVl9hZGPI/V4MFses
 kfDFshxDmowyfoxu8AaQpBs45iTGjyDSjva5fwmKGsOUS8W4NdI99Fr8rjoNkvlymur+/XFlws2
 4Wrw+tCcObAR0Fs+wTTjdSzEIN8KtW6FiE8+ZP7s4gLDXjjR0fSxlDp6FyKgUzbNc0E=
X-Received: by 2002:a05:690e:3cd:b0:660:ffe0:2dfe with SMTP id
 956f58d0204a3-662fc9fcfbbmr9475639d50.37.1782123776661; Mon, 22 Jun 2026
 03:22:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260609105626.1038690-1-thuth@redhat.com>
 <CAFEAcA9O6b02VMuto8VzaEsVi3zTqNtQKG_RcMaPnNdPXGUBhw@mail.gmail.com>
 <CAMvPwGpvpHD+Sx-HZR4FFMJB+W8Rk8LoU0256Q=vwKAdC96HSQ@mail.gmail.com>
 <CAFEAcA9N_O7RZRU+SPTfB_ePasjVZvUsFPhndfQDuHgQ+4Q-5A@mail.gmail.com>
 <CAMvPwGpzAcDxeqSvQmOjzkQn6T91CAmTO31bNs0wmSMqQKG=Qg@mail.gmail.com>
 <CAMvPwGrnh9-UMv5919bLXLF8oLcyTa=coTdqh+1ALNvCKLmOJQ@mail.gmail.com>
In-Reply-To: <CAMvPwGrnh9-UMv5919bLXLF8oLcyTa=coTdqh+1ALNvCKLmOJQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 22 Jun 2026 11:22:45 +0100
X-Gm-Features: AVVi8CeuH3mh7XJlmeOdZH_8nSVPI7iYi8piPpYAqU995iKkIwQkqo8n5iqgam8
Message-ID: <CAFEAcA-Te1aK8J-FPdpudm-3tQW9+kDdYgAa69tYXj2_TyLgVQ@mail.gmail.com>
Subject: Re: [PATCH] hw/i2c/pmbus_device: Fix a possible crash when requesting
 too many bytes
To: Titus Rwantare <titusr@google.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org
Sender: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org

On Tue, 9 Jun 2026 at 17:00, Titus Rwantare <titusr@google.com> wrote:
>
> oops, the patch series that fixes this needs to be upstreamed.

I see we have a patch that's been submitted:
https://patchew.org/QEMU/20260614222131.5795-1-imaginos32@gmail.com/
that fixes what the #3388 test case is actually running into
(guest writes a 32 byte string to a device register, and so
we lose the NUL terminator and strlen() returns a too-large
value when the guest reads the string value back).

But looking at the code it does also feel to me that there
might be a bug in what the issue report description claimed
it was testing, where the guest triggers multiple
pmbus_send_string() calls without reading back the data,
and the data piles up in the buffer and causes the assertion.

Is the patch series you want to upstream a fix to the "no NUL
terminator" problem, or to the "multiple send_string calls
fill the buffer" problem?

thanks
-- PMM

