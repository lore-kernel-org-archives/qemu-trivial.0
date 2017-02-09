Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cbzns-0004fP-DE
	for mharc-qemu-trivial@gnu.org; Thu, 09 Feb 2017 20:15:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38855)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cbx04-0006ap-R8
	for qemu-trivial@nongnu.org; Thu, 09 Feb 2017 17:15:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cbx01-0000SM-8J
	for qemu-trivial@nongnu.org; Thu, 09 Feb 2017 17:15:36 -0500
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:33140)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cbx01-0000SH-3w; Thu, 09 Feb 2017 17:15:33 -0500
Received: by mail-qt0-x242.google.com with SMTP id n13so2414700qtc.0;
	Thu, 09 Feb 2017 14:15:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=L7g9zyJNrMQTB9+UUU5Fe1lMEUzmIEkTR0PZ1lpWZxg=;
	b=oXcNLCIiyVs5f150EWPBkCXCOslDgM9EWz9c2zmeBZa8Vol2ax/ndU6UEve+0wcvZQ
	KFTi2UpuRU4BOPBtm0GgJ2Xn/l8XyR5VsLjBb0pTdmFjXbJDg0aymRDk6Ikbv7p+AIUW
	4ybGLKcajQqE0bF6N+9jiRUiJ5uk4IYPb7AtHFhkDoRo7/NSKkXzLACeHjWhl1LLiJ05
	pfu4vQLCpmj9I8il3xZHJ8cS7QBlXnqJnokVKM67yTLF+D+uj8mGSe6A33pAqzx9/ubU
	vnGc8KFjVGw7H0A5wrMRKYTmhjmdUcvWJbx6mMJAubwcjZZJDqHmD1DqfB9xS4D2zVFo
	sAfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=L7g9zyJNrMQTB9+UUU5Fe1lMEUzmIEkTR0PZ1lpWZxg=;
	b=onKpMiax0eqXop68pHkQSWnRyNG3lbvyK0zWcx9KjyfvbHC2AoBuyMKe5qdeUGWrNg
	x9h8MVR6GyODKtpKhD90wEQIHh+Q3W88m8pKoA20OtxiQGWGJJf1nQqE3J1bePUyKmnu
	nMOIJPNQ/zenJt4maNLeAj7kppcfua6pSfs+pItBnha83VuRbo0ysWQdWGiG1JXQlzLQ
	Ropi45fXr0tilYTfKxAHDSJ9SX28d3HpIa6Q1YF5W1zd6Yvf4wwHeMumgNHzDvcCWEMn
	nO8LWe49EUBPFBtUN1iQoaESzye796EE5ESYWaRWt/tVCCpkrfz8rxl5DtXgdFLZjrbq
	Vatw==
X-Gm-Message-State: AMke39n/D6ML5EuRjtiMzNrugKDULPntOQKxG2TTFDP3z6S4S6blbk2QMOh5bVZF4Qaj9g==
X-Received: by 10.200.44.83 with SMTP id e19mr4903676qta.260.1486678532616;
	Thu, 09 Feb 2017 14:15:32 -0800 (PST)
Received: from [192.168.1.10] ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id
	x40sm10373038qtx.23.2017.02.09.14.15.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 Feb 2017 14:15:32 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
References: <1486148371-11692-1-git-send-email-peter.maydell@linaro.org>
Cc: patches@linaro.org
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <cb35aa71-69ca-71cc-c988-24174809ec51@amsat.org>
Date: Thu, 9 Feb 2017 19:15:29 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <1486148371-11692-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c0d::242
X-Mailman-Approved-At: Thu, 09 Feb 2017 20:15:10 -0500
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] softfloat: Use correct type
 in float64_to_uint64_round_to_zero()
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
X-List-Received-Date: Thu, 09 Feb 2017 22:15:38 -0000

On 02/03/2017 03:59 PM, Peter Maydell wrote:
> In float64_to_uint64_round_to_zero() a typo meant that we were
> taking the uint64_t return value from float64_to_uint64() and
> putting it into an int64_t variable before returning it as
> uint64_t again. Use uint64_t instead of pointlessly casting it
> back and forth to int64_t.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
> Spotted while reading the code...
>
>  fpu/softfloat.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fpu/softfloat.c b/fpu/softfloat.c
> index c295f31..218b375 100644
> --- a/fpu/softfloat.c
> +++ b/fpu/softfloat.c
> @@ -7386,7 +7386,7 @@ uint64_t float64_to_uint64_round_to_zero(float64 a, float_status *status)
>  {
>      signed char current_rounding_mode = status->float_rounding_mode;
>      set_float_rounding_mode(float_round_to_zero, status);
> -    int64_t v = float64_to_uint64(a, status);
> +    uint64_t v = float64_to_uint64(a, status);
>      set_float_rounding_mode(current_rounding_mode, status);
>      return v;
>  }
>

