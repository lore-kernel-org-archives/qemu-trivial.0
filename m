Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YVxMu-0004Cw-Fc
	for mharc-qemu-trivial@gnu.org; Thu, 12 Mar 2015 03:17:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50054)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YVxMs-0004Ci-Ge
	for qemu-trivial@nongnu.org; Thu, 12 Mar 2015 03:17:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YVxMp-0004xK-Br
	for qemu-trivial@nongnu.org; Thu, 12 Mar 2015 03:17:18 -0400
Received: from mail-lb0-f175.google.com ([209.85.217.175]:45233)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YVxMp-0004x5-4e
	for qemu-trivial@nongnu.org; Thu, 12 Mar 2015 03:17:15 -0400
Received: by lbiz12 with SMTP id z12so13916146lbi.12
	for <qemu-trivial@nongnu.org>; Thu, 12 Mar 2015 00:17:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=4yDpeBRpOT0KLANPVKEsSjvbAgpCCvcBSBlsk2T0NYg=;
	b=dOYe9Z4c6h0aAZw6r8By5X5OHB8a4y1oP+V67gP6mNFJUUruSA7R9IC6i0pvFmV2UY
	hGAhLmFkc4Aakv74raecAeLiElUOYEpmdIXVWyGmzdPXVGnG9PWzTsJexpA+aJ/wnRi4
	dRmynac0l22y+aFoXRINfnIxUi4VqJkr6SvT9dW6H+ShJiYam0Poj/0F83JthtSo3D/c
	8wPW10dr+JjAMSoARWze0+PoZzwO9ZXMKvR70pLIuwW6dCywLBYMN8kSTMDqVJgKFB1o
	grtCkD5gVYUkt2zVBQ/uYhfrBwbv9ltYCS+vo3Sh1CilNtxXooLFHRmS4uHzo8US3BSf
	7d8A==
X-Gm-Message-State: ALoCoQk2qp+BcS4GQbIENNNCdw16knvZ4R2dxLVxxj08prLeOte9eW/VwJG95c/eyenk2RWj9XcW
X-Received: by 10.112.64.2 with SMTP id k2mr38457777lbs.54.1426144633962; Thu,
	12 Mar 2015 00:17:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.145.193 with HTTP; Thu, 12 Mar 2015 00:16:53 -0700 (PDT)
In-Reply-To: <55012E99.3030408@msgid.tls.msk.ru>
References: <55012E99.3030408@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Mar 2015 07:16:53 +0000
Message-ID: <CAFEAcA9sksApiTRo_0RQ588xLYq+Jy26CQ02nKPp4zoFzyV3_Q@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.175
Cc: qemu-trivial <qemu-trivial@nongnu.org>, 778737@bugs.debian.org,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] configure: enable kvm on x32
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
X-List-Received-Date: Thu, 12 Mar 2015 07:17:19 -0000

On 12 March 2015 at 06:13, Michael Tokarev <mjt@tls.msk.ru> wrote:
> Here's a trivial change to enable kvm on x32 architecture.
> I'm not 100% sure the result works correctly in all cases,
> but this is a good start and in theory everything should
> work.

Given the pessimism expressed in this comment, perhaps
we should delay this to 2.4 and when it's had more
testing?

-- PMM

