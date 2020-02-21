Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j55Na-0005z6-On
	for mharc-qemu-trivial@gnu.org; Fri, 21 Feb 2020 05:17:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43817)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j55NW-0005ua-FH
 for qemu-trivial@nongnu.org; Fri, 21 Feb 2020 05:17:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j55NV-0006SO-AT
 for qemu-trivial@nongnu.org; Fri, 21 Feb 2020 05:17:50 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:34019)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j55NV-0006Rs-3Q
 for qemu-trivial@nongnu.org; Fri, 21 Feb 2020 05:17:49 -0500
Received: by mail-oi1-x243.google.com with SMTP id l136so1100948oig.1
 for <qemu-trivial@nongnu.org>; Fri, 21 Feb 2020 02:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=u7wavj6OThSCoxCraTdF4zstIocPhDT1vEefuSemLQM=;
 b=IMCjdzOaRVvTNxJlhbJ+PJFDY/VqCRs3VD9KJzroBG8tMZUY/YhQbX1zJ2ZmLmzCpJ
 KWxLNY0qJLNp4ftTVe/oVFURZ95nFqDKoraWjorCQqIcYA68UgUyftSbre/UQf55jBVC
 VY+EHvurwE2GSLw9crQ+9E5zHMdYKcc8O8OzkiWbR1OOalJgqlU3d8T7IK+SIydk5ksh
 T8+EatJnPID4mARinMxQxD9iTnsviR/RHpDHPd+7fcmiM0+S3BNDDawor3nj4qQftEcI
 /ssORGJsooxHQCGbE/j/3eh3oXxL1liTzPx+5QeREwJgormoqjuwRWtmreTWvGDb1YI3
 PUTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u7wavj6OThSCoxCraTdF4zstIocPhDT1vEefuSemLQM=;
 b=UHw5Dou+UxV264SmrkFkAx79rJjDRPoi/tNnvfmHyefiSc337VIP8RdpbhW4NMUMLn
 /vkHyu/YYNHqIHB/MsZWDEagu44xSkO5T2memRruhuRXW1qL8Yz86uBuS/mui2RblO32
 rq6h3fad32NfOA0dsb9FJUAj3EsWwAvMwrrOHI1iUvDYwZcJKUy4voTMsB5LYDp93xvg
 xBojcEZEUCLHoOM7oMAC1nCLMwb03mAJldwsF/9Kwy6Djgc6JahkBwmhoXjfj4g/oSGX
 1Ni0xu/vZPwOAnGi0MTWI2MIjazr5t6G9J3HscZvMVnwbqaS/ZUr+Ol/D/QCCDXeBQ3S
 qo6w==
X-Gm-Message-State: APjAAAV6rV5up59tMdERcGdXdwAy/gVAVhFRr7M1eawr5D+L7XAxFxdw
 3HrIRRxJU6TLuIp6sKZuHLdpK7D1cY7tSzs4awwalg==
X-Google-Smtp-Source: APXvYqyj09GbiRvPOtWk+5gZhF/astt9hYzAc+AVr9Uusy5ZsHYGNqLSIciLfGRfb7vv4qSF5K+1e+c+q1OQqKz6okE=
X-Received: by 2002:a54:4f16:: with SMTP id e22mr1398024oiy.170.1582280267863; 
 Fri, 21 Feb 2020 02:17:47 -0800 (PST)
MIME-Version: 1.0
References: <20200220162214.3474280-1-eblake@redhat.com>
In-Reply-To: <20200220162214.3474280-1-eblake@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 21 Feb 2020 10:17:36 +0000
Message-ID: <CAFEAcA8p7D_XFZ9e66wWHNSD6fh2yUvFyAM3QVrwBP7oonoCjQ@mail.gmail.com>
Subject: Re: [PATCH] maint: Include top-level *.rst files early in git diff
To: Eric Blake <eblake@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
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
X-List-Received-Date: Fri, 21 Feb 2020 10:17:51 -0000

On Thu, 20 Feb 2020 at 16:22, Eric Blake <eblake@redhat.com> wrote:
>
> We are converting more doc files to *.rst rather than *.texi.  Most
> doc files are already listed early in diffs due to our catchall
> docs/*, but a few top-level files get missed by that glob.
>
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>
> Both *.texi and *.rst entries make sense while we are still converting
> things, but we'll need a followup to drop *.texi when the conversion
> is complete...

I was wondering what rst files we had outside docs, and
the answer is "README.rst, CODING_STYLE.rst and
tests/acceptance/README.rst".

(There's a reasonable argument for moving CODING_STYLE.rst to
docs/devel now; depends how highly you rate having it more
"discoverable" to new contributors.)

thanks
-- PMM

