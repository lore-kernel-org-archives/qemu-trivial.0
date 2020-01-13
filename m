Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iqy5z-0004Jn-Ve
	for mharc-qemu-trivial@gnu.org; Mon, 13 Jan 2020 06:41:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48192)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iqy5x-0004JP-R8
 for qemu-trivial@nongnu.org; Mon, 13 Jan 2020 06:41:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iqy5w-0004cs-IN
 for qemu-trivial@nongnu.org; Mon, 13 Jan 2020 06:41:21 -0500
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236]:37295)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iqy5w-0004bh-Am
 for qemu-trivial@nongnu.org; Mon, 13 Jan 2020 06:41:20 -0500
Received: by mail-oi1-x236.google.com with SMTP id z64so7941515oia.4
 for <qemu-trivial@nongnu.org>; Mon, 13 Jan 2020 03:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jXuAmEqcarzf+a78FkUZCIwn83+tXkGCweIcG3ngEx8=;
 b=jnl608Qh+6bv5qSQKmcZSZvX66xxJaHhAaUWItOB0GWDamsBFlbI+mUb2gB3V1jPJ3
 srdIsfmJ5kL70sQJKArKM45nc8Eof9dU/o+WpnaJOkpC3EZooig5u047Jd+a6LutkTYW
 Y0YWri1z0b7sI9OdYYgmvTLmT+F+0ZFYcS532oGMZf7JPv5+a2ArN7Am0Z7rSX1b8hGD
 TE6B6cwK/M6dimmA0nNWAeQm1b9SpLkD7Z006sh7/3/+USDLhGOZRc6LAjstXoMeJj/4
 5o0yMHMRhJvg3t9GhZJcORFQ+mzLEjm0n/NsSySVfUl9IrTpL2tY54IQhRMjDZcfSzML
 gv6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jXuAmEqcarzf+a78FkUZCIwn83+tXkGCweIcG3ngEx8=;
 b=cO4Zp0L8x/K9gZ+g+4/x0BrQPNxDbSqc1PTKPLtTzjeX3Q/LM7IqyOkqZTYhCheyoa
 uWc1+Bq67S9joT8P02w1XUshyV1o836DsTaHjgrYycN4p+WSFm140K/eeu50VU9lY9Ak
 DJAs3ZKH5WBVukLzvvYNL/VxVFMnZXdja8RZJqRDlP6yi4uFPNpciFcKsZS4ExjP0vjp
 p3jvCztlXh+7SWLvvRPM99bAWvx0Pg1pXEbIM9pNaR5+r27Gi0zmlvOUCLe+wr5PtuOj
 3ZnBvb3K1PO1oJco/SHwe9VGG3loFqtmKcZ9Dqfp9DEwusJVK19WYcShHnglNrcwyzDP
 oGTw==
X-Gm-Message-State: APjAAAXRFhADBfwSAmpG8OkNbSuH6gSjh1VV6sNzYN3EaBqLdKM//zpd
 CEWuRzD2+cW9l5ZDOb8kJlVosYegjmBXSYsvVVq2Zg==
X-Google-Smtp-Source: APXvYqzPHYRiEM0VJR2S12axuqQ5ZQDsYSphGu7QieRWSkvCRE/T8PEMNUxRIPbk1LUnhuBCpRRtRIp74sHwTVU0toU=
X-Received: by 2002:aca:3d7:: with SMTP id 206mr12514660oid.98.1578915679351; 
 Mon, 13 Jan 2020 03:41:19 -0800 (PST)
MIME-Version: 1.0
References: <20200108160233.991134-1-laurent@vivier.eu>
In-Reply-To: <20200108160233.991134-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Jan 2020 11:41:08 +0000
Message-ID: <CAFEAcA8feV07E7Fwq77EaBRyUao5HYVUNCrkp2mn4OU4rSLvkA@mail.gmail.com>
Subject: Re: [PULL 0/5] Trivial branch patches
To: Laurent Vivier <laurent@vivier.eu>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Eric Blake <eblake@redhat.com>, 
 Qemu-block <qemu-block@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>,
 qemu-arm <qemu-arm@nongnu.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::236
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
X-List-Received-Date: Mon, 13 Jan 2020 11:41:23 -0000

On Wed, 8 Jan 2020 at 16:02, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit 035eed4c0d257c905a556fa0f4865a0c077b4e7f:
>
>   Merge remote-tracking branch 'remotes/vivier/tags/q800-for-5.0-pull-request' into staging (2020-01-07 17:08:21 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu.git tags/trivial-branch-pull-request
>
> for you to fetch changes up to adb464ff671d124010953aad48dd9194cedc6ff6:
>
>   vl: fix memory leak in configure_accelerators (2020-01-08 16:12:39 +0100)
>
> ----------------------------------------------------------------
> Fix some uninitialized variable warnings,
> some memory leak warnings and update MAINTAINERS file.
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.0
for any user-visible changes.

-- PMM

