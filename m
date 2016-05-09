Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1azmOo-0003ty-5p
	for mharc-qemu-trivial@gnu.org; Mon, 09 May 2016 10:43:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44522)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcmvbkbc@gmail.com>) id 1azmOl-0003qU-V4
	for qemu-trivial@nongnu.org; Mon, 09 May 2016 10:43:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jcmvbkbc@gmail.com>) id 1azmOj-0003XX-W9
	for qemu-trivial@nongnu.org; Mon, 09 May 2016 10:43:02 -0400
Received: from mail-ig0-x229.google.com ([2607:f8b0:4001:c05::229]:37454)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcmvbkbc@gmail.com>)
	id 1azmOj-0003XN-Pw; Mon, 09 May 2016 10:43:01 -0400
Received: by mail-ig0-x229.google.com with SMTP id s8so93462152ign.0;
	Mon, 09 May 2016 07:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=UTvvkzatogdU05G3Kaf6SoHO7BQMW1nBhmMlv/5VC1E=;
	b=ZFkn+DIm3RNLiUzR1tJMw6cZOTHvTVKDUbPFnaMx1KuwgcviXuJw1bD4I0SSlYHlox
	TfguEc6jk0Gy30Sv/9m2YCaP0/SgfpFunn5I0ISDekaWZ8Kjz4HZQHgQ78Bokf9/qqs/
	5QWHWRBOQ8iAhh3kxTWJQ+zIHX5stJ7f6TTnMAOHl4TBVkv4Z0yKcUEN+uXb401U6XZI
	ZpXmkGSTpnZOjCRnrJgaSuGnHJWhpXYeHWSMq1aMmGAUBLvTnoF36TcRBxDU7Qq30xeI
	IWQuZbO0OsdaXt+IxPYE89GZ12rTeZb+odjgFNwQtD4hq5cQ17CZDYyS0sCgd3EEaJUg
	2xlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=UTvvkzatogdU05G3Kaf6SoHO7BQMW1nBhmMlv/5VC1E=;
	b=Ff7CC4pZ8IkXK3z0gRNePhI5U8SSBVd1JTlMHwV/xhYQyO9fFPRSZVkMEoGM7sSrK8
	VV03WAH11zxlNPHucprtBttK9QTka8D6ngL7pd5IkWqxu0PP4VkbvEZM+XSJzRFgAQqK
	Wz+Nd9/WMxvdxris6jx52B8L0z8CqEr9oGeGah1MNLgk0VOsSFwTUwDCrBy9cXzoxeCZ
	HsNB8ewitLCa1lzbGFlnK1czo5O9aBzN8aprOYSvpM8vDGpvx949IxSQ9gSJ3DPPhdmp
	SOs+0yyfpMpKC0sZ9H/t3bEFRv0PNtyil4KWcNRO2paRXmMdevcSe8i9uAiWoRQeIgIC
	h8AQ==
X-Gm-Message-State: AOPr4FXVLxRYf6JJe4d1BJvdjc8qB3leSeoBWzOfy8fXai4vhnvLwh8l4WTDWD+ZD11ubcV7HJxxGAOdfBgm1Q==
MIME-Version: 1.0
X-Received: by 10.50.186.163 with SMTP id fl3mr11153837igc.27.1462804981025;
	Mon, 09 May 2016 07:43:01 -0700 (PDT)
Received: by 10.50.103.225 with HTTP; Mon, 9 May 2016 07:43:00 -0700 (PDT)
In-Reply-To: <1462800299-12641-5-git-send-email-lvivier@redhat.com>
References: <1462800299-12641-1-git-send-email-lvivier@redhat.com>
	<1462800299-12641-5-git-send-email-lvivier@redhat.com>
Date: Mon, 9 May 2016 17:43:00 +0300
Message-ID: <CAMo8BfJ23utOufizvtbBvxoQ6Gnmtz=OtWxUTWEW1pa1Y1jCFw@mail.gmail.com>
From: Max Filippov <jcmvbkbc@gmail.com>
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, QEMU Trivial <qemu-trivial@nongnu.org>,
	Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4001:c05::229
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 4/5] replace muldiv64(a, b,
 c) by (uint64_t)a * b / c
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 09 May 2016 14:43:05 -0000

On Mon, May 9, 2016 at 4:24 PM, Laurent Vivier <lvivier@redhat.com> wrote:
> When "a" and "b" are 32bit values, we don't have to cast
> them to 128bit, 64bit is enough.
>
> This patch is the result of coccinelle script
> scripts/coccinelle/simplify_muldiv64.cocci
>
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>  hw/audio/gus.c      | 2 +-
>  hw/xtensa/pic_cpu.c | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

For xtensa PIC:
Acked-by: Max Filippov <jcmvbkbc@gmail.com>

-- 
Thanks.
-- Max

