Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dVw3L-0002zw-Ti
	for mharc-qemu-trivial@gnu.org; Fri, 14 Jul 2017 04:34:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45220)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dVw3J-0002xs-Ib
	for qemu-trivial@nongnu.org; Fri, 14 Jul 2017 04:34:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dVw3G-0007lO-G5
	for qemu-trivial@nongnu.org; Fri, 14 Jul 2017 04:34:21 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:33993)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1dVw3G-0007lB-9Z; Fri, 14 Jul 2017 04:34:18 -0400
Received: by mail-qt0-x241.google.com with SMTP id m54so9146542qtb.1;
	Fri, 14 Jul 2017 01:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=TRdA23Ar9gUR9ffLhoQD3T/xAaZ2clRLljkrmMOjotY=;
	b=DpWQ6e+0uHE8q1A9RWdfIHjpqow50CeUJpe8Szd3A0X+eORoAY5XRVSK7faJ9UHz9n
	NICp2yEgD/XmymJJFHlHpV2KClRF8GQXr6LmBYEbJ1EGnAd9jbNAoG+D/RY8+7u9E3VL
	FoeMMMoAJx/Uff482QGgVoWBf6w5zit2VdOMENNsV9rWX2Qijfb9mKVwhGL/hctKqklA
	Fsx23BcjvQrEWL7AHy+piSuzcOJVdCoXa8z27zJK1KArbKtIqk3DIcxMftL2SEREuEfX
	FtEufi2j0ELnYCicYehTQut17/EeIUfmmCnNxX2lP3uEwDVref91hbWvOEr0gxk4ZfTC
	/kRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=TRdA23Ar9gUR9ffLhoQD3T/xAaZ2clRLljkrmMOjotY=;
	b=NZhc3OtUOKiv3FLn+ZfMiVBYNF1B6p4LL6GxYVHKukezRjHQaYTs9ODHWwoWIKFWi4
	IF4ZbbiUaktsmt1j2d3E2xzclIZ0ChrZDXgA/S75dfyybtelj2CDnTP4aPg7Xrw+OWLx
	JOTxVdTWtlpknccltE518wFdIqL0MdmSvJy+2wSl5MYOxbRWTw0OuX4PsF4gDpO8JJto
	Ox4pacXzq2vwvgqqAfhKhvogbhDbnat7WYIE9PFNGaqKOqwYHyqIeBnXAPM+sRtmD3qg
	pgqvULOHb8UJyiw9HUWSvWLPnmzFtcybmgoe+zDqyti6iBVyaDST1GU25QLdbSl6YtdF
	Cd3A==
X-Gm-Message-State: AIVw113IuY0+8+kpuuE4KJTWY2JUmUd7/z+c2Y/y0SJBysl99QjyvwQp
	YaEaAQCugmlCpA==
X-Received: by 10.200.0.213 with SMTP id d21mr9729192qtg.28.1500021257706;
	Fri, 14 Jul 2017 01:34:17 -0700 (PDT)
Received: from bigtime.twiddle.net (rrcs-173-197-98-123.west.biz.rr.com.
	[173.197.98.123]) by smtp.googlemail.com with ESMTPSA id
	y66sm5667595qkb.35.2017.07.14.01.34.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Jul 2017 01:34:17 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, peter.maydell@linaro.org,
	"open list:vpc" <qemu-block@nongnu.org>, qemu-trivial@nongnu.org,
	Max Reitz <mreitz@redhat.com>
References: <20170713163219.9024-1-marcandre.lureau@redhat.com>
	<20170713163219.9024-10-marcandre.lureau@redhat.com>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <23346499-5cbf-f357-98d1-c9920efa7c78@twiddle.net>
Date: Thu, 13 Jul 2017 22:34:11 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170713163219.9024-10-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 09/29] vpc: use
 DIV_ROUND_UP
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
X-List-Received-Date: Fri, 14 Jul 2017 08:34:22 -0000

On 07/13/2017 06:31 AM, Marc-André Lureau wrote:
> I used the clang-tidy qemu-round check to generate the fix:
> https://github.com/elmarco/clang-tools-extra
> 
> Signed-off-by: Marc-André Lureau<marcandre.lureau@redhat.com>
> ---
>   block/vpc.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <rth@twiddle.net>


r~

