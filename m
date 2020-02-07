Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j03oL-0003ef-UA
	for mharc-qemu-trivial@gnu.org; Fri, 07 Feb 2020 08:36:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33891)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j03oJ-0003dX-R6
 for qemu-trivial@nongnu.org; Fri, 07 Feb 2020 08:36:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j03oI-0000wC-Kg
 for qemu-trivial@nongnu.org; Fri, 07 Feb 2020 08:36:43 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:33356)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j03oI-0000td-DP
 for qemu-trivial@nongnu.org; Fri, 07 Feb 2020 08:36:42 -0500
Received: by mail-ot1-x344.google.com with SMTP id b18so2177036otp.0
 for <qemu-trivial@nongnu.org>; Fri, 07 Feb 2020 05:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=mFKOQXnbjPCOHC53DmP31TRPNZG4/glAvd2SjGayMKQ=;
 b=Ne83/KJUTxzMZeVvAeY1MQdKNafUoc354vYjf+6GvKHmOObKHGVh/UbNaRXhsA9Ffx
 wxC99Rmhe+2PFbT+O4evSXYQgVPMIeqSOck0ewEgWmOuJh8iu05pMyN0tQVTLz4IVXmv
 P3Z5xSySKsApeVYIm7wDCyed+ZNSM77TjI5EX/JyZNFVSCmDn/ES5gSg3f2ofG4pnzNC
 cqCnj0dX6Pleh+jNj9JemLVu4qF8H1bKtmVTWkPENlj0jyR+hbMSeI0Vlf9QtD+SX1sA
 nIvQjWBcvlNzVa0n94ZCWkc1Fyl5c3ABn9YkyzbhW6mL+rYt7F9nl26/OwuYvHbhQIqy
 VH0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=mFKOQXnbjPCOHC53DmP31TRPNZG4/glAvd2SjGayMKQ=;
 b=ecwAsI628RoUbEHzd5HopL6kvIp1gNxXRfZVMZtq7MUjxMoEieG9WolMG8ThsZjVkc
 M52QycZ6VkDNmBTlqVxwkcHmZEP9LpWBUQLySKgr6Iw2ls7DGenScha7ZXbCFmpeiwSW
 DrYcvg0SPXhbTF9m0qpVXv9HgvN7712sY74K0BR6i/z0JOkIvKSSel1+y6RI5Cnphnyv
 QMBXf9Jn4+d/xW+bSV4v3Gn4mLhKhY9XjneDfOMcLiS5xrA1DYPAn77hvLAF9kWXLOYA
 d4x7eocC9rw7WduiL/ost6oDUyswJyo9unTBRcmgqTmaNsHcdwXmewzj50qVLfoogOBG
 nsJg==
X-Gm-Message-State: APjAAAX9CR841tgs+envnJM4kTuAyTrgOC2sWcocxGMdIBlKrecprrKV
 u0ZpeuocJ9Ro90bFaChiTiM5WilMQ9yOUfkgCR4s0Q==
X-Google-Smtp-Source: APXvYqx9NUOLcLAfbtehD1A3zkAZTRwB9DkoJZM4BB7PIadya3BxoP5k8UWCfohLhpOt/PkQbKW/EmKztwAlYBOOkk8=
X-Received: by 2002:a05:6830:13da:: with SMTP id
 e26mr2543438otq.97.1581082600069; 
 Fri, 07 Feb 2020 05:36:40 -0800 (PST)
MIME-Version: 1.0
References: <20200206225148.23923-1-philmd@redhat.com>
 <20200207082643.m7pkyjbx5h2o4zh7@kamzik.brq.redhat.com>
In-Reply-To: <20200207082643.m7pkyjbx5h2o4zh7@kamzik.brq.redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Feb 2020 13:36:29 +0000
Message-ID: <CAFEAcA_yEgCtTR3MJ6-co0uHbckUkvduHFi3yiqYV-N-M-ZUUw@mail.gmail.com>
Subject: Re: [PATCH v2] docs/arm-cpu-features: Make kvm-no-adjvtime comment
 clearer
To: Andrew Jones <drjones@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
 QEMU Developers <qemu-devel@nongnu.org>, QEMU Trivial <qemu-trivial@nongnu.org>,
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
X-List-Received-Date: Fri, 07 Feb 2020 13:36:44 -0000

On Fri, 7 Feb 2020 at 08:26, Andrew Jones <drjones@redhat.com> wrote:
>
> On Thu, Feb 06, 2020 at 11:51:48PM +0100, Philippe Mathieu-Daud=C3=A9 wro=
te:
> > The bold text sounds like 'knock knock'. Only bolding the
>
> Who's there?
>
> > second 'not' makes it easier to read.
> >
> > Fixes: dea101a1ae
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> > ---
> > v2: Removed unrelated hunk
> > ---
> >  docs/arm-cpu-features.rst | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/docs/arm-cpu-features.rst b/docs/arm-cpu-features.rst
> > index dbf3b7cf42..fc1623aeca 100644
> > --- a/docs/arm-cpu-features.rst
> > +++ b/docs/arm-cpu-features.rst
> > @@ -185,7 +185,7 @@ the list of KVM VCPU features and their description=
s.
> >
> >    kvm-no-adjvtime          By default kvm-no-adjvtime is disabled.  Th=
is
> >                             means that by default the virtual time
> > -                           adjustment is enabled (vtime is *not not*
> > +                           adjustment is enabled (vtime is not *not*
> >                             adjusted).
> >
> >                             When virtual time adjustment is enabled eac=
h
> > --
> > 2.21.1
> >

Applied to target-arm.next.

> Not-Not-Reviewed-by: Andrew Jones <drjones@redhat.com>

:-)  but for the purpose of the commit message I've dropped
the 'Not-Not-' prefix, since we want to have a standard set
of tags in commit message rather than a random accumulation.
(We really should make checkpatch warn about nonstandard tags.)

thanks
-- PMM

