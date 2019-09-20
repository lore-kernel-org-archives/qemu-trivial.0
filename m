Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iBLlx-0003Ft-UJ
	for mharc-qemu-trivial@gnu.org; Fri, 20 Sep 2019 12:28:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54385)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iBLls-00039V-J8
 for qemu-trivial@nongnu.org; Fri, 20 Sep 2019 12:28:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iBLlr-0003CX-7b
 for qemu-trivial@nongnu.org; Fri, 20 Sep 2019 12:28:36 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:35384)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iBLlr-0003CC-2X
 for qemu-trivial@nongnu.org; Fri, 20 Sep 2019 12:28:35 -0400
Received: by mail-ot1-x342.google.com with SMTP id z6so6714792otb.2
 for <qemu-trivial@nongnu.org>; Fri, 20 Sep 2019 09:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=W+RrZzCeCmMgB4WeC6Z58QwhwbPLh+zvqQ+h5E+YFy0=;
 b=lQhsFyP7EGi0zd3IzccMmfFH7f5n9CHwoml1LUu95Nq3ujSvQSH3qgI9DLxIY9dKJ0
 liqrsHzilv8BflyTp038QYlN7/7HCADpoVmOb8t4NDgJ4cMFnWTr7AfHeElMtaPIvJco
 QJQz74iIccY8x2+xt9aFaW6IY2xpAf+2IJYdFfcua9TofSukEi8tVTNMYx0He8mJ5oIv
 ketaB7bBMxvljaziGilD+rw7yruXS5rRe9fAB9JE9o+uxDu22Uiyk3hwN6uKgSZWO0tt
 5IwYV3nZrQ0bM0S6GzaVrjLBDBbm9X3ynypeJ5Ftn9cPyP8vX7neySWL0RIxATbyjd3q
 jjQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W+RrZzCeCmMgB4WeC6Z58QwhwbPLh+zvqQ+h5E+YFy0=;
 b=Nslfl6GPLkHgpksHUg4KHx51WXDuXPpG6r+jD5FiYqIZMCoXYlbElHHk7ZSf3YdevE
 kFllbpxjRVCtYVzuB2IhvObI1MdpkO0hs8S8Wm55sFN+fzcefV1NvDDF1DgLcsnIoTcF
 loyrTvQW4jhFTWYTfVZoTIpiHE7AKx/yC1GqZ2mz8xn+nV5dxpMj/YteHwSn87FrNFAU
 rr8XDd3eSUg+Sj6RTt7ufCvQ3wehZLydxwVO7lVNXVTjsOZ5AriKTE7XwcuJnWfrKdbO
 PTgShCli0PJxyqPIMSmMNSVyRjvYceEEpqkC+5ypNgFctbKwLjLKOZXm3vgAHInbTAns
 KHAQ==
X-Gm-Message-State: APjAAAUM383YBPhABMnQzCM3Bed1+qID2P3wmYH7EZDc8DHRTqaCl+Mw
 I1PswuGPqs/nUkCDerE0ZNObtG3R14GrpIWq0A2Hw37Wc14=
X-Google-Smtp-Source: APXvYqyDdOKfkN5Qe3LvQ/BCDyQ0kpsTQYGlNQa8WCnsch5DrsihvG28xH16N9DYlxP5FflbJzgU2JZof58qtK0LusQ=
X-Received: by 2002:a9d:4615:: with SMTP id y21mr4921025ote.97.1568996913411; 
 Fri, 20 Sep 2019 09:28:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190919135443.15164-1-laurent@vivier.eu>
In-Reply-To: <20190919135443.15164-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Sep 2019 17:28:22 +0100
Message-ID: <CAFEAcA8QkkKQ_kMZ2x0xsW1Sp3sK+=i+QRGcDQ+rzq9emustSg@mail.gmail.com>
Subject: Re: [Qemu-devel] [PULL 0/8] Trivial branch patches
To: Laurent Vivier <laurent@vivier.eu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
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
X-List-Received-Date: Fri, 20 Sep 2019 16:28:40 -0000

On Thu, 19 Sep 2019 at 15:02, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit f8c3db33a5e863291182f8862ddf81618a7c6194:
>
>   target/sparc: Switch to do_transaction_failed() hook (2019-09-17 12:01:00 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu.git tags/trivial-branch-pull-request
>
> for you to fetch changes up to 754119198de633683d7af79bc08e73c2de9df011:
>
>   configure: Add xkbcommon configure options (2019-09-19 14:42:31 +0200)
>
> ----------------------------------------------------------------
> Trivial patches 20190919
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/4.2
for any user-visible changes.

-- PMM

