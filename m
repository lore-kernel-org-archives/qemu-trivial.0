Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dVvgp-0005Kc-NW
	for mharc-qemu-trivial@gnu.org; Fri, 14 Jul 2017 04:11:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39877)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dVvgn-0005K7-LS
	for qemu-trivial@nongnu.org; Fri, 14 Jul 2017 04:11:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dVvgk-0004RV-G7
	for qemu-trivial@nongnu.org; Fri, 14 Jul 2017 04:11:05 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:33821)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1dVvgk-0004RL-Bj; Fri, 14 Jul 2017 04:11:02 -0400
Received: by mail-qt0-x241.google.com with SMTP id m54so9101093qtb.1;
	Fri, 14 Jul 2017 01:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=ULCruixteg4ONOypYlNLRvBztkR+S/GUQf/OwF2gz3U=;
	b=KqPzRWS9e48IDXn/L+IE2dOEbgHcvvjS9A8WTGv+8Q5nsB94wQzVuNPt3ALu8rH+yD
	C3NWPnWn0PNtbSJqE5Yk2yUKWg6OuwrTpMkIThxA1iElcnzE2fXagb3iL9aBGf1GYENt
	3bZMB08gB7FrFbX46SPmV8/ymjmUv6CStiEhMZZ3kGk163Ox8vJt9ZOabsRrG09j5IPr
	QxdGZLX6G5N8ksJSoRQp51w3+A+0FrDfQ2fNfczHLeCy4SQkOOJAxRhr/6x9QFrQEC+e
	gxU2R7A9Srrj9ie3sobtecd8pNYN06xeFKPLwL2XiyvH4MlE0+SSxorjAng8X3tr+mXj
	MJ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ULCruixteg4ONOypYlNLRvBztkR+S/GUQf/OwF2gz3U=;
	b=quMmPqKH5xOxIS9a+evEBJDWV+l8Rvr+HM5+SjrwJyHz83z0hF4pYvz+QWGzLf8aRv
	VYmwW3IhYvmlS5CzNcyg0mr4hfqEhYyfjYyGGhwlXXJ+Kz44SpEQZITFzFUVuPL0zUwR
	v3f7mu87n8wjgq2/7Q09+XJPDLSRGF02bxvOz0CrWJ1ietQq8kJJ1IqlEP1w5i5UMXup
	N3MPtlLKvcHC9wqvCMNFsjHnYbTrxyTXkm5DpwOm4R3C7YZ4c+RVsjmxzqCwPzsy0e4A
	1gQlMo6t1gGr1RKYgQDjYz/RX/TJWzt8aa/Qm/VEO1D2/qHjJpuYIF17BhOmL44JJYUY
	dYPA==
X-Gm-Message-State: AIVw1122CyqvcsXoh7pWr9BJdQ7sOPJpUkHRyDCsljvqYnOIuR/tej2d
	f+AYD2AkQ5R3VQ==
X-Received: by 10.200.48.38 with SMTP id f35mr10565618qte.88.1500019861380;
	Fri, 14 Jul 2017 01:11:01 -0700 (PDT)
Received: from bigtime.twiddle.net (rrcs-173-197-98-123.west.biz.rr.com.
	[173.197.98.123]) by smtp.googlemail.com with ESMTPSA id
	t43sm6471779qth.30.2017.07.14.01.10.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Jul 2017 01:11:00 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Eduardo Habkost <ehabkost@redhat.com>,
	qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20170713163219.9024-1-marcandre.lureau@redhat.com>
	<20170713163219.9024-2-marcandre.lureau@redhat.com>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <3194d27e-b81f-8000-fdf5-24509efa170f@twiddle.net>
Date: Thu, 13 Jul 2017 22:10:55 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170713163219.9024-2-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 01/29] i386: use ROUND_UP
 macro
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
X-List-Received-Date: Fri, 14 Jul 2017 08:11:06 -0000

On 07/13/2017 06:31 AM, Marc-André Lureau wrote:
> I used the clang-tidy qemu-round check (with the option OnlyAlignUp)
> to generate the fix:
> https://github.com/elmarco/clang-tools-extra
> 
> Signed-off-by: Marc-André Lureau<marcandre.lureau@redhat.com>
> Reviewed-by: Juan Quintela<quintela@redhat.com>
> ---
>   target/i386/arch_dump.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <rth@twiddle.net>


r~

