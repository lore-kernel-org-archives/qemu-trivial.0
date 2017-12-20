Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eRgto-0001iv-LX
	for mharc-qemu-trivial@gnu.org; Wed, 20 Dec 2017 11:07:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60824)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <th.huth@gmail.com>) id 1eRgtQ-0001W1-VB
	for qemu-trivial@nongnu.org; Wed, 20 Dec 2017 11:07:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <th.huth@gmail.com>) id 1eRgt8-0003nD-Iw
	for qemu-trivial@nongnu.org; Wed, 20 Dec 2017 11:06:52 -0500
Received: from mail-wm0-f67.google.com ([74.125.82.67]:44510)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <th.huth@gmail.com>)
	id 1eRgt8-0003m6-DC; Wed, 20 Dec 2017 11:06:34 -0500
Received: by mail-wm0-f67.google.com with SMTP id t8so10820840wmc.3;
	Wed, 20 Dec 2017 08:06:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Z9EAN/mSzlVKbVtoTTpemnozijPI+l+a2i3SKd1NR7Q=;
	b=aSE3gJKKjsKabei2JgChvA44mDpXRFVcmBklA0oHqdCEFTgD1P3nGrsgJQkhrP6Hq0
	lSjuF2zoQ+3y2bkplcBY9QzjsniV/iCJnojTDqr4e9KcIACV7+jfYkXMSAnn5srB6yBW
	xS15GYJwBOrjkfR+DBuc27PaQaVXzDTvFN9z0sCndJqAq4pGdL6vuuzwnNYM7poD2ntT
	Jw7WPOBS++qBJcFi+ffmKAZpP4PyTY05bqyvjxjONPl9w9QYFjltdkiOqzon0Q+FKi0p
	0Q6SjP9Jfe/Inr1+aiGmSji9JjcHOymuWpblLxX4yBjnfwUJ1JgFBAd5Ns305LEHoIdr
	dPng==
X-Gm-Message-State: AKGB3mJ8lP3pqWHGelVNxaud/4BdvrGF7WTD9GC+nZOLduXTmBNZ+/k5
	EFksl+j2kqaUP+/pcfPVOC1A/h/K
X-Google-Smtp-Source: ACJfBosc+479CMzABcZeY0/OcFfAqJaT6jIm5qcG7HtKg5Ez/umHdjNDYhiegVWPCMkHETf6a8x+2Q==
X-Received: by 10.80.207.143 with SMTP id h15mr6088084edk.189.1513785992498;
	Wed, 20 Dec 2017 08:06:32 -0800 (PST)
Received: from [10.200.209.8] (nat-pool-str-u.redhat.com. [149.14.88.107])
	by smtp.gmail.com with ESMTPSA id
	b2sm16693111edd.26.2017.12.20.08.06.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Dec 2017 08:06:31 -0800 (PST)
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20171220130815.20708-1-laurent@vivier.eu>
From: Thomas Huth <huth@tuxfamily.org>
Message-ID: <b99e47fa-458f-9e62-4074-ac689464c4e6@tuxfamily.org>
Date: Wed, 20 Dec 2017 17:06:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <20171220130815.20708-1-laurent@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 74.125.82.67
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] target/m68k: remove unused
 variable gen_throws_exception
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
X-List-Received-Date: Wed, 20 Dec 2017 16:07:15 -0000

On 20.12.2017 14:08, Laurent Vivier wrote:
> It has been introduced by e6e5906b6e ("ColdFire target."),
> but the content is never used.
> 
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
>  target/m68k/translate.c | 10 ----------
>  1 file changed, 10 deletions(-)

Reviewed-by: Thomas Huth <huth@tuxfamily.org>



