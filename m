Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jGJ8i-0005wd-9l
	for mharc-qemu-trivial@gnu.org; Mon, 23 Mar 2020 05:12:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51533)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jGJ8f-0005vR-3x
 for qemu-trivial@nongnu.org; Mon, 23 Mar 2020 05:12:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jGJ8d-0004Km-VW
 for qemu-trivial@nongnu.org; Mon, 23 Mar 2020 05:12:52 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:39753)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jGJ8d-0004KZ-Qb
 for qemu-trivial@nongnu.org; Mon, 23 Mar 2020 05:12:51 -0400
Received: by mail-ot1-x344.google.com with SMTP id x11so549378otp.6
 for <qemu-trivial@nongnu.org>; Mon, 23 Mar 2020 02:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=StYhV2lHqDdL8GVjx4Q/ZJ8fCC3CSz1lNcbb9k1iBQQ=;
 b=XS3ABJFPZiIbEtLJAt7sZ9CTqXOF7rsQ8Aha/qKZNVg8GZiz3Ufi8YXwDwUgL2UiI8
 iWzNepWlfYlMl49LMa9ecNHJpB5ifEgsONDOd9CoEbN0uES94MDGtpGP0LDgtfne3qWm
 C56jQf1uqo9j/qT1bOdsTJcdgmlB3sP7ORi7oO+TiIjZ///AqHUupXH1Pz+QcS6UxECM
 7S6jnOoCDsH2JDgF75lP9mRgkKCMqhrjMvdMISkn16glSqYdA86Yl0mZKucwf7iAUJgX
 ZURuA2H25NLq96MjWv6zhnkimJAPlDquQaYnCGr+yDREt21+Tytf+KBM2Fh4Bf/aDEvP
 kWQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=StYhV2lHqDdL8GVjx4Q/ZJ8fCC3CSz1lNcbb9k1iBQQ=;
 b=mX2JunAZ3LWBrZn+EK4sQVJbw3dsmDd8AmRL4eVNYTic6CBgm6T2YDnbmfsAusUf6i
 LYgmDmYKURHSzYKWpMrc2TugyJcYljcn/ZKAVxKWQJy4YgA/qLqQuxcXCf6oWv02eQxU
 4ggSbqKOYmAI1jBNqbJXOKJJHLwfZHtRjUtT9cEcYQXA7HIpbS6fu4cEr+sWjsnmRqP7
 HeS15E5dlL1Jb9sZfwtoXj5oxaJ6+hMok4aXOP9jl6V/9amaDcGnFog3VJXMXBDpf5xD
 9zsOt6apllyysLGM7YiqJZlHGZuKB73HuuoLL9SlE2/q+CnD7QzNYi8uekPZfOJLSgKk
 yjwQ==
X-Gm-Message-State: ANhLgQ2WKaGrP8uUDqkC/p0fYNuG/8KvaFycC20zNxrplIh/vhmvLbsx
 WJRwRSk+/KdJAG4OLam74GqGQd9Ke+WkHtM5ohb/nw==
X-Google-Smtp-Source: ADFU+vtVmJQfNIBjmB/LPEitJoL8dvERBpgzyEIKt0+gb62TYc56oHZo/BwkM+TcodKlmzJ918911USOCQgMct1jDbk=
X-Received: by 2002:a9d:1d43:: with SMTP id m61mr17260836otm.91.1584954770862; 
 Mon, 23 Mar 2020 02:12:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200312213455.15854-1-philmd@redhat.com>
In-Reply-To: <20200312213455.15854-1-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 Mar 2020 09:12:39 +0000
Message-ID: <CAFEAcA-i5L1Xz_r28xs1waDcoz5ChnzUcoTb51s31oXBqeO_RQ@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/bcm283x: Correct the license text
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, 
 Thomas Huth <thuth@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>, 
 qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
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
X-List-Received-Date: Mon, 23 Mar 2020 09:12:54 -0000

On Thu, 12 Mar 2020 at 21:35, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> The license is the 'GNU General Public License v2.0 or later',
> not 'and':
>
>   This program is free software; you can redistribute it and/ori
>   modify it under the terms of the GNU General Public License as
>   published by the Free Software Foundation; either version 2 of
>   the License, or (at your option) any later version.
>
> Fix the license comment.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

I was hoping for an ack from Andrew, but in any case I think
the original licensing intention was clear and this is just
a fixup on the wording.

Applied to target-arm.next, thanks.

-- PMM

