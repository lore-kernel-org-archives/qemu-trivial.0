Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dVw4U-00046J-9w
	for mharc-qemu-trivial@gnu.org; Fri, 14 Jul 2017 04:35:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45819)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dVw4S-00044z-KN
	for qemu-trivial@nongnu.org; Fri, 14 Jul 2017 04:35:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dVw4P-0008MV-Hd
	for qemu-trivial@nongnu.org; Fri, 14 Jul 2017 04:35:32 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:33304)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1dVw4P-0008MJ-Cx; Fri, 14 Jul 2017 04:35:29 -0400
Received: by mail-qk0-x241.google.com with SMTP id a66so10266056qkb.0;
	Fri, 14 Jul 2017 01:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=gyd7HHEjR+IHcBCEd7ycFMzkddteHlKYfVHVPU9KHGU=;
	b=dD0GG5/Ulqn3Fo07KU39z9fOPpGtngQI97OxFjp9snOOp5WK330PDq4Npo23C+y5Yo
	5+vM0quyxY6xTiX99kj0IYiGjePWbDyQKYUN9xyfLj8a20AuhqNgB6O8NRDhSuff5BVp
	ggfUodRFuZ8kq3Q1H15grfXtnCY5tG5X7sXnjn7iM5PF63FYdsIk59lARG0PfrUG8Ls3
	IYrvO/E9scTOj3ut1Arm2H73uTgD9pLePaLtuUL9C3PsVEaOvQcIo2OZq5V/d/pkurJN
	bkaP+kuTNR6oXjf3WcfaYjnHtvYgsbl18BxqgSA0nA5yJiPdq7uSLFtZ5FDR+oHbUxgb
	yW6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=gyd7HHEjR+IHcBCEd7ycFMzkddteHlKYfVHVPU9KHGU=;
	b=fkMLwxsQRwJ6vFnRxZy6ZYV8gKqAVb1xtRPU3YeAB64fdpXU6ETSpITVG66UDVxbXr
	t2Evibsu/HhG0fN/jT1h0HvJcZwII9kNpnn2LiDNLFMucvIWY2ob9bK4Jpf4p9M2GHvb
	FfKRcv6EsZW0gnnQJupSudWDGM+LhbHPH5VAxuMMvZzFMBzThf3AqgVCw4l9q2ifbiip
	g1yWiWw16JGsuAWn7ickuPd9BVjNomMW4tw6dUn6ZxZpEm/2pBoPmjNd50/+Iy3JBfes
	lg1QJ+9lJXN7xzKp1TTj4wNPyKalAWkWS9TyuCOXHOj20yZiCyH0QN52fM9PxJ4nuEWA
	QSNA==
X-Gm-Message-State: AIVw1102IM+v0LNclBEn5Fun/jo6r7dgt2tTLk2flR3I6TO76BgP8Y9W
	UarP2Vy7mqdFXw==
X-Received: by 10.55.164.150 with SMTP id n144mr9183048qke.260.1500021328861; 
	Fri, 14 Jul 2017 01:35:28 -0700 (PDT)
Received: from bigtime.twiddle.net (rrcs-173-197-98-123.west.biz.rr.com.
	[173.197.98.123]) by smtp.googlemail.com with ESMTPSA id
	n21sm5929025qkl.51.2017.07.14.01.35.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Jul 2017 01:35:28 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, peter.maydell@linaro.org,
	"open list:vvfat" <qemu-block@nongnu.org>, qemu-trivial@nongnu.org,
	Max Reitz <mreitz@redhat.com>
References: <20170713163219.9024-1-marcandre.lureau@redhat.com>
	<20170713163219.9024-11-marcandre.lureau@redhat.com>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <f2013a35-090d-c9b8-085f-ea00c46f7837@twiddle.net>
Date: Thu, 13 Jul 2017 22:35:23 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170713163219.9024-11-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 10/29] vvfat: use
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
X-List-Received-Date: Fri, 14 Jul 2017 08:35:33 -0000

On 07/13/2017 06:32 AM, Marc-André Lureau wrote:
> I used the clang-tidy qemu-round check to generate the fix:
> https://github.com/elmarco/clang-tools-extra
> 
> Signed-off-by: Marc-André Lureau<marcandre.lureau@redhat.com>
> ---
>   block/vvfat.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <rth@twiddle.net>


r~

