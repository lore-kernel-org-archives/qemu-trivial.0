Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mKlAY-0001q1-H9
	for mharc-qemu-trivial@gnu.org; Mon, 30 Aug 2021 13:34:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mKlAX-0001nY-67
 for qemu-trivial@nongnu.org; Mon, 30 Aug 2021 13:34:01 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:33560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mKlAU-0004Yd-2B
 for qemu-trivial@nongnu.org; Mon, 30 Aug 2021 13:34:00 -0400
Received: by mail-ej1-x62b.google.com with SMTP id x11so32946935ejv.0
 for <qemu-trivial@nongnu.org>; Mon, 30 Aug 2021 10:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UT8lSzlGl/B8N1X79Ob2xv+78u86UKZFIM+1gk+DwE4=;
 b=gEugG4B1wnj4mX2S+tgJAvladbxo4BAln/IooMH8Gac38xZU8+bIqttPA2rE86beBj
 MDwVzlfmpjSbBCovsqAwf5FBZWyJdrPrs95ME5nPAaPRhaKtgG0W/q03va/vUMtZKQF2
 b+QbNytHXEXlDsRA9TENFGX1aPbSmACHXl81+1dbOqKwRN2Mt72wv8dRN5IfQ0dfWMhi
 bXKixqRWFftk274N1YWV65xytQ1nOF+4rZFzs1f9lZQE9kvI8eSqiCNNlzjDzzhTnTAC
 OijBVik/nHq58x1gjKr0IOJhP2fo+PnQsgSulV59IkEp0Dz2Nj5O7+Uw9uRFrxkidWBx
 UXyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UT8lSzlGl/B8N1X79Ob2xv+78u86UKZFIM+1gk+DwE4=;
 b=m61NnhrUhc6jK2YFY7+qwXAmtsXG6pzu2klDqX9gGaECr+BL5TlAHqL1/5uXD3/oXR
 fcN5B5Fy7XHmQNe9Tj0H/+GhSTbtcc19Djj2Z5N70j8exsB2fpVSBkqj6KfmrfWcsNLT
 g0a9d9Xk/H0VrMAAlrdrcdndRqG80jT5UHot7IXZe5dSYrfmnTPB0/sop1sEVidQyE/J
 YDw7r082/tzqqsjmdhITkjdccPjHXdK3KYOUOJbJFYEdfYN3d/y0pJRcwvB8cywWkkGI
 cZbV39M5XxHWj1WswWAMb3LV98gBLVprd/K8Q+pvN+vtIUvL06/GfIPqf0eTWgWYQrKd
 LC8A==
X-Gm-Message-State: AOAM532dS0VhDPGJVLkRSyG4aJkRgeVgZe9Jo3AxjtOO/YAgsjvW6K2/
 E6C0sO9irEJQrvRBuFxtkhhN/C6cYzNPHsacSTTh1g==
X-Google-Smtp-Source: ABdhPJzb7GiO289gCafJuOl2S6goAz2cp8C1U74dauKHYyGhyt3CZwH6lHjww0WoMkdfVK1YUvDPR/js9wgTbBdWMko=
X-Received: by 2002:a17:907:75d9:: with SMTP id
 jl25mr26162641ejc.4.1630344836074; 
 Mon, 30 Aug 2021 10:33:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210805193950.514357-1-johannes.stoelp@gmail.com>
 <CAFEAcA8TRQdj33Ycm=XzmuUUNApaXVgeDexfS+3Ycg6kLnpmyg@mail.gmail.com>
 <20210830154708.ah27fh34q5dgg3le@redhat.com>
In-Reply-To: <20210830154708.ah27fh34q5dgg3le@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 30 Aug 2021 18:33:07 +0100
Message-ID: <CAFEAcA-QW1_sLEArKY1jBJkmGdKQukgwe=O36p7gDpH2mFceqw@mail.gmail.com>
Subject: Re: [PATCH v0] kvm: unsigned datatype in ioctl wrapper
To: Eric Blake <eblake@redhat.com>
Cc: johannst <johannes.stoelp@googlemail.com>,
 QEMU Developers <qemu-devel@nongnu.org>, 
 QEMU Trivial <qemu-trivial@nongnu.org>, johannst <johannes.stoelp@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 30 Aug 2021 17:34:01 -0000

On Mon, 30 Aug 2021 at 16:47, Eric Blake <eblake@redhat.com> wrote:
>
> On Sun, Aug 29, 2021 at 10:09:19PM +0100, Peter Maydell wrote:
> > Of the various KVM_* ioctls we use via these functions, do
> > any actually have values that would result in invalid sign
> > extension here ? That is, is this fixing an existing bug, or is
> > it merely avoiding a potential future bug?
>
> My question as well.  If there is such a bug, calling it out in the
> commit message is essential; if the bug is just theoretical,
> mentioning that is still useful.

I found this glibc bug from 2012, filed by some random guy named
Linus Torvalds, and still open:
https://sourceware.org/bugzilla/show_bug.cgi?id=14362
where among other things he claims
# As noted, this does not actually cause problems on Linux, because
# unlike FreeBSD, Linux knows what the f*ck it is doing, and just
# ignores the upper bits exactly because of possible sign confusion.

Whether that's still true a decade later I have no idea :-)

-- PMM

