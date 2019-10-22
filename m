Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iMtX0-0007T1-8y
	for mharc-qemu-trivial@gnu.org; Tue, 22 Oct 2019 08:44:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55536)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iMtWx-0007SK-Ah
 for qemu-trivial@nongnu.org; Tue, 22 Oct 2019 08:44:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iMtWv-0000bU-N5
 for qemu-trivial@nongnu.org; Tue, 22 Oct 2019 08:44:54 -0400
Received: from mail-yb1-xb42.google.com ([2607:f8b0:4864:20::b42]:39149)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iMtWv-0000bE-J1
 for qemu-trivial@nongnu.org; Tue, 22 Oct 2019 08:44:53 -0400
Received: by mail-yb1-xb42.google.com with SMTP id z2so5089710ybn.6
 for <qemu-trivial@nongnu.org>; Tue, 22 Oct 2019 05:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MQMQS9X8FxXUakL8jBDxQ5LiW7Ue2emV11Dz8Ypfc5E=;
 b=laaLpwQiHvtQa1wZOicEwrzJf9XiQTTPE6hfl8iT6tnzAC0RlpaAFhKPY4aWeOo3uJ
 k72qOQ/RzY1swhpJ5TqSR64MY63mhdoFvprHdYbRA2di+AZYDdOA2SAzkI3zO78DRt9Y
 WcxnlFhS4KyBdeuvhr83wbXGPvVzT48BVAFUgHefO+Yw3lqqCaIjxp5pEdEilYEyqOB6
 di6CSRd/GMqRnfYrG+LZlO0KXWVYsGgZCuAxmmtD/Daoj/oxPp9wScEhz4g14vEs+WGh
 U/EcdLLVljEXxAHL45HFOHSZomuM3Ga0F/tnXjSqT16a45AQNgdKQvZyWNXQhq+ICGJs
 +KoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MQMQS9X8FxXUakL8jBDxQ5LiW7Ue2emV11Dz8Ypfc5E=;
 b=f5tYOgKAqSvgYvzpIlyvTuoSitBbXbhqlX0+uXQyJ9alhF3xgq0T1SqHzUySJfoc+J
 EYyDBl47Vl4c3c8er2jGhASA8rUMFASg77d7qlwMEnn0CWVGW1+9gSqEuRrfkhQknJAx
 CTaEV82erejPj3rzDahdbaPABgzihiE3tJJTAphCZPp2uvDr6OlhFXnHpV7R3Do9V6bs
 /zOUe7/EGwXN4NkAbeHrvMGLRZDlm7kZcsxMxRHgzv7Xbvq+TXmmY2ojEfaKwI+qoBfJ
 0MqGQzTK+g+llevz8QtElFvnN/wS6TbaOrsaNoqleRPWDiNcBMQGUSL2EwXZ0lXEbg7e
 Fqyw==
X-Gm-Message-State: APjAAAXn8760gQMfDJuWJLtyGqDAd4DN4CEIPin79ggGQjkYKnO512q7
 LzKYuNVzqzKixBJOu8lmC2edaS+aXdt2f7MVnnckcQPt+/U=
X-Google-Smtp-Source: APXvYqwqKdJt+UjX3zBntFKUDBA2bJ1iRmCGTuwDiaOD8SCYfwHJ7mucLXRrA8mkLDizhtmd31cDH3abrQN1SPdiW6g=
X-Received: by 2002:a9d:708e:: with SMTP id l14mr2558424otj.135.1571748292171; 
 Tue, 22 Oct 2019 05:44:52 -0700 (PDT)
MIME-Version: 1.0
References: <20191022082553.10204-1-laurent@vivier.eu>
In-Reply-To: <20191022082553.10204-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 Oct 2019 13:44:40 +0100
Message-ID: <CAFEAcA8HQ=MeU=gayhsrCrO4EZgkP-Frd4HvZvcz+FuVV=wiqg@mail.gmail.com>
Subject: Re: [PULL 0/2] Trivial branch patches
To: Laurent Vivier <laurent@vivier.eu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::b42
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
X-List-Received-Date: Tue, 22 Oct 2019 12:44:56 -0000

On Tue, 22 Oct 2019 at 09:27, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit e9d42461920f6f40f4d847a5ba18e90d095ed0b9:
>
>   Merge remote-tracking branch 'remotes/kraxel/tags/audio-20191018-pull-request' into staging (2019-10-18 14:13:11 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu.git tags/trivial-branch-pull-request
>
> for you to fetch changes up to 81864c2e6166c015d30b8d8ae998a5a1238a68e9:
>
>   tests/migration: fix a typo in comment (2019-10-21 18:14:43 +0200)
>
> ----------------------------------------------------------------
> Documentation update and a typo fix
>
> ----------------------------------------------------------------
>
> Mao Zhongyi (1):
>   tests/migration: fix a typo in comment
>
> Thomas Huth (1):
>   qemu-doc: Remove paragraph about requiring a HD image with -kernel
>
>  qemu-doc.texi            | 4 ----
>  tests/migration/stress.c | 2 +-
>  2 files changed, 1 insertion(+), 5 deletions(-)
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/4.2
for any user-visible changes.

-- PMM

