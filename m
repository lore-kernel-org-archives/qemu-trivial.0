Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hZALA-0002BJ-88
	for mharc-qemu-trivial@gnu.org; Fri, 07 Jun 2019 04:35:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59013)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hZAL3-0002A2-Tl
 for qemu-trivial@nongnu.org; Fri, 07 Jun 2019 04:35:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hZAL2-0003aT-VE
 for qemu-trivial@nongnu.org; Fri, 07 Jun 2019 04:35:05 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:44200)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hZAL2-0003Wn-R7
 for qemu-trivial@nongnu.org; Fri, 07 Jun 2019 04:35:04 -0400
Received: by mail-oi1-x244.google.com with SMTP id e189so866767oib.11
 for <qemu-trivial@nongnu.org>; Fri, 07 Jun 2019 01:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QZh27MDwtQigSsjLoe7eOsRvP+b2kWgdCrVQwK5LlzQ=;
 b=SsIbBF15EIfFTm1NyJAnd0Y9i1k47tkzGXmYiPgSyCGsbqeJeneUj2nCtUbenpaW5S
 8Qo1nfVpFu2nYgHVKBeg2PlXBifSFew5XTR9H3xnMFhkWX/5m962NLOtvb6Jhu9WKBXU
 cfCYsR1X6pfFSdqjhLSZPMQYZG7vRxtLvvL0A11J/DkNYaVcGpgQTL2jIKp3829I/5Wo
 frtHfPmgbdG4G3MLHgd/5UcRd/SlcDahO0tF0VfMehtzNEKCE7mcgYXAi8UwShS9N/Qa
 FPJKJApkPrHybHbQ7V6ADfOoyi795FaR7OjyBWKzrIBT5VFbpLC+pmfnK5V8A42d0jnb
 KwQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QZh27MDwtQigSsjLoe7eOsRvP+b2kWgdCrVQwK5LlzQ=;
 b=Jm0KNFnGW63RZRubuOpwsBEdH1Hu1dRSjQ43RvOYVwgqLfGrNCzXR6EntYzABGHvq8
 oxdCYOJVWJnRiDUzWILRDHq5rZtEibdW3F1PsLKZDA6/n97qSUa3e5uB1ojPygrx0SLP
 s3ah5YSCzkDti36zg5fHaSVf9Vfor/mYxhugxon1aLhI4XRYeAaEQRQ2e8ihaho3AEJK
 4eyoHACC0UbqdR0Q/noVXMamFU/3ihflia5MES/Cl1e2lXLEChHLxd4er0Rwnalf6voa
 Jpv1c5Cv22YRjIGTzvfQvWMDFX9suEWi2JpqDZSdT1oPZViRXX8os4OQ8EQ4e+uDDKki
 92eA==
X-Gm-Message-State: APjAAAV2jK4LFiQ3yLp5UvUK37YVZlZq6PNv4n6duYn67Mfzjlq97BT1
 7n2XNFyk5w250Ds6KXHAQZD+fKESsWzwhDbHrmg2eg==
X-Google-Smtp-Source: APXvYqwjWi+nGoqDE04LndxzdFup7v4ugd5UJrQgQouyM1BgRelkfJXm7VBHWRgeOuG/WvO9uV96rOzCsQbVXnUPAp8=
X-Received: by 2002:aca:ac48:: with SMTP id v69mr2917517oie.48.1559896503713; 
 Fri, 07 Jun 2019 01:35:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190606234125.GA4830@localhost.localdomain>
 <CAL1e-=i7WfrHq7k266grEs1xyf_FKVG_4JcvCbrrSZt66c4ftQ@mail.gmail.com>
 <20190607032825.GA5123@localhost.localdomain>
In-Reply-To: <20190607032825.GA5123@localhost.localdomain>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Jun 2019 09:34:52 +0100
Message-ID: <CAFEAcA-40HYo3RhTPd-U6_iuYR-0ncn6SSgq2W4k1usfaX_0Tg@mail.gmail.com>
To: Lucien Murray-Pitts <lucienmp.qemu@gmail.com>
Cc: Aleksandar Markovic <aleksandar.m.mail@gmail.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>, 
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] m68k comments break
 patch submission due to being incorrectly formatted
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
X-List-Received-Date: Fri, 07 Jun 2019 08:35:07 -0000

On Fri, 7 Jun 2019 at 04:30, Lucien Murray-Pitts
<lucienmp.qemu@gmail.com> wrote:
> checkpatch is correctly identifying the wrong style in the changed code.
> This changed code contains the original comments with ADDITIONAL edits
> resulting in pachew/checkpatch complaining.
>
> The m68k is, by my guess, older code and nearly all the comments are different
> from the style guide.  Some are "/**" or "/*commment here...." and so on.

Yeah. We have a fair bit of old-style code in the codebase. There
are two different approaches we take to this:
 (1) the most common is "fix the parts your patch is touching anyway"
(ie in a new-feature patch you make the minimum fixes to the surrounding
old code needed to keep checkpatch happy with it)
 (2) mass fix-up of old style stuff as a separate patch

Mostly we use (1) but this does have the downside that old style
can lurk in not-often-touched files for a long time. So if the
maintainer (in this case Laurent) is happy with a type (2) fix-up
that's good too. (Personally I used to be much more in favour
of sticking with approach 1 but my opinion has changed over
time as I've seen the downsides of it.)

thanks
-- PMM

