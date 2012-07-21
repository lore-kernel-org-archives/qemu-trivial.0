Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SsW8J-0004bj-Ci
	for mharc-qemu-trivial@gnu.org; Sat, 21 Jul 2012 05:37:55 -0400
Received: from eggs.gnu.org ([208.118.235.92]:44513)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SsW8G-0004aJ-D9
	for qemu-trivial@nongnu.org; Sat, 21 Jul 2012 05:37:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SsW8E-0004us-6v
	for qemu-trivial@nongnu.org; Sat, 21 Jul 2012 05:37:51 -0400
Received: from mail-we0-f173.google.com ([74.125.82.173]:55059)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1SsW8E-0004sq-0A; Sat, 21 Jul 2012 05:37:50 -0400
Received: by weyz53 with SMTP id z53so3216478wey.4
	for <multiple recipients>; Sat, 21 Jul 2012 02:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=t3PnU72e3gJJXr8lmlbOwPMZap2FTD9M106w5iOBoLM=;
	b=WYJ27vLnykT6TFIsm/DM/EuOGXZk5ECLC174z2QrtnYrS7OeLKQNkoGBg9aKFzIhdB
	4p2Yw5fRjSOBfU7pRtJVVb+dMQt2cOGXeTFwzD1Ql2irXS1FuGeBv4VD5lBs9SQl0zuR
	qj9diKFayLD/YZHuH7Fw58PZdj9OHnU7Kb8mf4RjYeUorJulO10O+m7z9ACP1VZc1O+O
	aoI2qUjHj2gQEseS/l8zxKJtaa1DQTVODnfGZUh2LFM7upRc+VFzhbXTKi/udk2JiA++
	yP9UB6JcH87TUm2Y5aDy8687KakRhqr0kk5kUDN0dBwyF4a+gLV1DAvESGO+ElB4ZRgj
	2knQ==
Received: by 10.180.81.138 with SMTP id a10mr21088920wiy.7.1342863468516;
	Sat, 21 Jul 2012 02:37:48 -0700 (PDT)
Received: from localhost ([109.224.133.37])
	by mx.google.com with ESMTPS id t7sm4759391wix.6.2012.07.21.02.37.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 21 Jul 2012 02:37:47 -0700 (PDT)
Date: Sat, 21 Jul 2012 10:37:46 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20120721093746.GA13805@stefanha-thinkpad.localdomain>
References: <1342546459-21993-1-git-send-email-i.mitsyanko@samsung.com>
	<5005A904.5000006@samsung.com> <5005AFA5.6080101@weilnetz.de>
	<CAFEAcA9t5qDGvOBTL0eb+nRZGdiNBBwqd020Gz+80ovGm3t+hA@mail.gmail.com>
	<5005BBD7.1000905@weilnetz.de>
	<CAFEAcA9n7+UVp9W20x8zs71cPxZWBu8o1FQxVSwq8o6TdGZ0BQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA9n7+UVp9W20x8zs71cPxZWBu8o1FQxVSwq8o6TdGZ0BQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.173
Cc: Igor Mitsyanko <i.mitsyanko@samsung.com>,
	qemu-trivial <qemu-trivial@nongnu.org>, Stefan Weil <sw@weilnetz.de>,
	QEMU Developers <qemu-devel@nongnu.org>, Blue Swirl <blauwirbel@gmail.com>,
	Anthony Liguori <anthony@codemonkey.ws>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configure: fix ALSA
 configure test
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
X-List-Received-Date: Sat, 21 Jul 2012 09:37:53 -0000

On Tue, Jul 17, 2012 at 08:28:40PM +0100, Peter Maydell wrote:
> On 17 July 2012 20:24, Stefan Weil <sw@weilnetz.de> wrote:
> > The arguments why -Werror is a bad idea for some configure tests
> > are reasonable.
> >
> > Nevertheless the QEMU community was able to produce thousands of
> > lines of code which compile without a warning, so we should be able
> > to create warning and error free code for a handful of configure
> > tests.
> 
> The trouble is that the warnings and errors here don't cause the
> build to fail noisily; that's a big distinction IMHO.
> I suppose we could make compile_prog do something like:
>  * run the compile test
>  * if it fails => test failure as now
>  * if it succeeds (and we're doing a Werror build at all),
>    rerun the same test with -Werror
>  * if that fails, abort configure with an error message
> Then we would have the same "make the problem obvious" effect
> that plain -Werror provides for our main compilation.
> 
> > The 4 patches above are valid and can be applied with or without
> > -Werror, therefore qemu-trivial or whoever does not have to wait for
> > Peter's patch.
> 
> Yes, I agree we might as well fix these errors since we've now
> noticed them, regardless of whether or not we apply my patch
> (which I've just sent).

Build/configure fixes should go straight into qemu.git.

Stefan

