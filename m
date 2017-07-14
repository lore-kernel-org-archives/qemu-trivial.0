Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dVw8X-0008Bp-9D
	for mharc-qemu-trivial@gnu.org; Fri, 14 Jul 2017 04:39:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47297)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dVw8U-00089Z-PB
	for qemu-trivial@nongnu.org; Fri, 14 Jul 2017 04:39:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dVw8R-0002QY-Mf
	for qemu-trivial@nongnu.org; Fri, 14 Jul 2017 04:39:42 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:34249)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1dVw8R-0002QS-IK; Fri, 14 Jul 2017 04:39:39 -0400
Received: by mail-qt0-x244.google.com with SMTP id m54so9156976qtb.1;
	Fri, 14 Jul 2017 01:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=z4/7TI3476VHr1x7Amlb9y0g2Hgt31gz8/GumtMibw8=;
	b=vaQTK+80ozvfabammOCE1wWJhgJA2m63lxAOiwUdcJtSi3BRkBdaRaUIpxr86gCwR7
	VMcYKc2pDwXvQqN9OTBJYqm7GP5VThKjNcnLPJz+qnmkIashmCzDJ4zDkShjCIseoScZ
	Cat0SDourEusjl0Xqoy1hYR2ry6D83CQoUtjQc/A5rZ/Oag0uMJUCvZmn7ba0jeK5HKx
	b/SVKR5STF7muy8bmsL/XhgrffKx1GpoH4oolz0DfouIxA0p7Hh91TKwE6PVDWxfvw+r
	/wCMOq4Xbe5dxb0ZFjyZpdR4oMPx7K7mEsxx6dWgmxa7i/wjNMnquTNQMPXjO298gVQA
	uQFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=z4/7TI3476VHr1x7Amlb9y0g2Hgt31gz8/GumtMibw8=;
	b=Uv774VokX9qu6K0jtEQYlaoV4rt6NesWPl+5T5/Y/rjR6Hm2+7UJHMPxn3z2FZz27U
	9FIdo6ZqaZdj0ROxwE7DwpKGJaWkGBYVbtoCzUbi0SkgTISqE05n4i8s6kGo4adVR7TO
	8fhdH5y1+3Q+sAwuwLg1cdRb6cEhnkCr9SExsOWAEMllyxktnYs5Gw194vF+/F0QBmOm
	H5Muwtgy7dhddP+Lf3Yyl+h3x1H6XncEcTQ8qRc4zD35n1F5QY2aUZotHvP9fwuhxt2o
	g7ve4DBFuPtIG77CG6QNnYkhAzUsiaPoxknCux3dMVM5l7bgEvJgOWcR3WGJRoSrzfa4
	/k3w==
X-Gm-Message-State: AIVw1136ynha0zQURubDeLO+Sj2S2HRPqZD8J1RIi5B2v8q9MeS0AqEM
	DSGX1OnxBvUzfg==
X-Received: by 10.237.48.65 with SMTP id 59mr10756604qte.10.1500021579113;
	Fri, 14 Jul 2017 01:39:39 -0700 (PDT)
Received: from bigtime.twiddle.net (rrcs-173-197-98-123.west.biz.rr.com.
	[173.197.98.123]) by smtp.googlemail.com with ESMTPSA id
	n11sm6553665qtf.45.2017.07.14.01.39.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Jul 2017 01:39:38 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org,
	"Michael S. Tsirkin" <mst@redhat.com>
References: <20170713163219.9024-1-marcandre.lureau@redhat.com>
	<20170713163219.9024-20-marcandre.lureau@redhat.com>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <240318dd-183f-d43b-befb-45a7c6dcd2b6@twiddle.net>
Date: Thu, 13 Jul 2017 22:39:35 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170713163219.9024-20-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 19/29] q35: use
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
X-List-Received-Date: Fri, 14 Jul 2017 08:39:43 -0000

On 07/13/2017 06:32 AM, Marc-André Lureau wrote:
> I used the clang-tidy qemu-round check to generate the fix:
> https://github.com/elmarco/clang-tools-extra
> 
> Signed-off-by: Marc-André Lureau<marcandre.lureau@redhat.com>
> ---
>   hw/pci-host/q35.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <rth@twiddle.net>


r~

