Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UiOXY-0000vz-72
	for mharc-qemu-trivial@gnu.org; Fri, 31 May 2013 08:34:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60618)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UiOXT-0000sX-W2
	for qemu-trivial@nongnu.org; Fri, 31 May 2013 08:34:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UiOXS-0000Q9-L0
	for qemu-trivial@nongnu.org; Fri, 31 May 2013 08:34:35 -0400
Received: from mail-lb0-f172.google.com ([209.85.217.172]:53892)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UiOXS-0000Pq-E5
	for qemu-trivial@nongnu.org; Fri, 31 May 2013 08:34:34 -0400
Received: by mail-lb0-f172.google.com with SMTP id p10so1634434lbi.3
	for <qemu-trivial@nongnu.org>; Fri, 31 May 2013 05:34:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=9342uBKlVla65w1MAXhFKckD3YHoKDnQHl2bZkQFf4g=;
	b=mfXHeYdVWZUCbyzcAOl2FvHIcOBs31w2MYb7zJjHxVF4X84TcX3kaZVNY8Bqvus8lY
	f6+e3kd5UNWCoo9bxFkGn6Mq+8lMIajfQVu7gIMzmHSOyGP8wSYTc5F8JyPDuzJuFRxH
	b5s92wfFf8Gcxu/VPZ1W9+zXsvpW5+sWeMW4SRAxlWBvuW2NF5bhsJ6ra/iDOeUY4AIn
	sS6qCgPTutmw4yk9UfodNBC0IweEdn9woBEl3++lvlFu4zExl4HhJfoW/shRq9v2lXyb
	i7mdbgLZlWiGCBs5YIQTiY5OiQRJA+czPj3zixqFoDMes78lYrBDhYHIfWXMvcnx7gyy
	gjKA==
X-Received: by 10.112.157.129 with SMTP id wm1mr5849773lbb.69.1370003672902;
	Fri, 31 May 2013 05:34:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.2.39 with HTTP; Fri, 31 May 2013 05:34:12 -0700 (PDT)
In-Reply-To: <51A89273.8010400@msgid.tls.msk.ru>
References: <1369993154-17690-1-git-send-email-thomas@codesourcery.com>
	<51A89273.8010400@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 31 May 2013 13:34:12 +0100
Message-ID: <CAFEAcA9LomV1rkJPPctUgxG0aJzCHiGr6VYSsSmaGytvQv9hUQ@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQn4SISF+Q2G+xDvjlNscheMydJ3bAYGaqVLBmlK+fULx5k0Rky9buPx8+Jgj6OvS+b0gOts
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.172
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>,
	Thomas Schwinge <thomas@codesourcery.com>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] fpu: Simplify
 floatx80ToCommonNaN function.
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 31 May 2013 12:34:38 -0000

On 31 May 2013 13:07, Michael Tokarev <mjt@tls.msk.ru> wrote:
> Hmm. And where's the simplification?  Here's context diff for the same:
>
> *** fpu/softfloat-specialize.h.orig     2013-05-31 16:02:51.614710351 +0400
> --- fpu/softfloat-specialize.h  2013-05-31 16:02:59.838820308 +0400
> ***************
> *** 936,946 ****
>       if ( floatx80_is_signaling_nan( a ) ) float_raise( float_flag_invalid STATUS_VAR);
> !     if ( a.low >> 63 ) {
> !         z.sign = a.high >> 15;
> !         z.low = 0;
> !         z.high = a.low << 1;
> !     } else {
> !         z.sign = floatx80_default_nan_high >> 15;
> !         z.low = 0;
> !         z.high = floatx80_default_nan_low << 1;
>       }
>       return z;
> --- 936,945 ----
>       if ( floatx80_is_signaling_nan( a ) ) float_raise( float_flag_invalid STATUS_VAR);
> !     /* Replace a Pseudo NaN with a default NaN.  */
> !     if (!(a.low >> 63)) {
> !         a.low = floatx80_default_nan_low;
> !         a.high = floatx80_default_nan_high;
>       }
> +     z.sign = a.high >> 15;
> +     z.low = 0;
> +     z.high = a.low << 1;
>       return z;
>
>
> Yes, your version is 3 lines shorter, because it
> does not have extra else{} (2 lines) and the
> remaining if() construct is one line shorter too,
> due to moving z.low=0 construct into common place.
>
> But I don't think your version is more readable, --
> before it was easy to understand what is going on,
> we had two easy case with all right stuff done for
> each case.  Now we do some preparation before, so
> the common case works.

I think you could make a reasonable argument for this
change being an improvement, because it makes it clear
what we're doing: if what we have is an x86 pseudo-NaN,
we replace it with the 80-bit default NaN, and then
proceed to do 80-bit-to-canonical conversion in the
usual way. The comment also explains why this if()
exists for the 80 bit case when it doesn't for the
equivalent 32 bit and 64 bit functions. As a code
change I actually quite like it.

> Generated code should be about the same anyway

NaN handling is well out of the fast path, so this
isn't particularly important.

That said, I think any new patches to fpu/ need to
come with an explicit statement that they can be
licensed under the softfloat-2a license or GPLv2
or BSD (etc etc) so they aren't an obstacle to
the softfloat-2a-to-2b conversion that is in the works.
[cc'd Anthony so he can correct me if I'm wrong.]

thanks
-- PMM

