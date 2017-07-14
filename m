Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dVwE6-000607-6L
	for mharc-qemu-trivial@gnu.org; Fri, 14 Jul 2017 04:45:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49123)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dVwE3-0005xr-KO
	for qemu-trivial@nongnu.org; Fri, 14 Jul 2017 04:45:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dVwE2-0005At-Lv
	for qemu-trivial@nongnu.org; Fri, 14 Jul 2017 04:45:27 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:33799)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1dVwE2-0005Ab-I3; Fri, 14 Jul 2017 04:45:26 -0400
Received: by mail-qk0-x244.google.com with SMTP id q66so11297786qki.1;
	Fri, 14 Jul 2017 01:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=x+HWB0smZ76rEl44iMb2LXDzlr8PhZg/JXoSgAduEUs=;
	b=jLsI5ePryWnsJ4mm9/M3knG3F+JUydMOZiJcSopr5Yw7SSXfDVaOUBHD+M4BQy1/iI
	gq7SMSPQ58HoBoplq/OFNrHYuSLvvCaJGXc3G18NECSeaoctJu/RvbwgkxSKpOJBwy1E
	kGdWlxudiH5SlE/7sczl1ZVBSr+v970N+rH7jIKAnKhkgb7KHg0YPb4SOJII5ElaIrGt
	c9j55ShM2pBrr5Ij5S0QLMZgXdHZeRU5P3bvgQzpmb6MRXY7OO2TZxXWUiKic6rgdpnP
	XkbBDMbU/OOAD+fui6PKymRoZDf+jt9yI1LbgBSTfkFmr/rhECt1srgjUB+HChOSiEed
	qfXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=x+HWB0smZ76rEl44iMb2LXDzlr8PhZg/JXoSgAduEUs=;
	b=ixwlUQB17K4nxE4PTNfCBqhy5nitqIkAlx0eGKvOnNwS3n7CaF4FxuMDUJTPwZCZA+
	zlhd5cg4Kk7WuCHGaTs/IZ/xlSXNCAbH0p38Uu7Bi9B9ZBe3YH//K8d4DEGK7JpSme85
	0EdsN0B4Ep0S9kH2moVUTIKWgaCBgT9Se0Z3uQ0JgDMJzeOpesH1aPGfP+XS9l4GScZO
	D30mHqcN7dS3xsctK9qrfb3Ci1xG/sosPI/TxFUDv5jUxIp+b6NtaEzOnZJuLHqB2FGl
	07KErFY0ddrGGe7bE+G0ERH3QVs84l2eBdDLEtpmpB1HtCbFCsvSusWZNRvJyI8S7u1r
	S2gQ==
X-Gm-Message-State: AIVw113/Mbmrtvdxz8RCGRz4SLDRK7p8xX3LPmoM2bifR+x1OWWooSNS
	ZhvHcBD/HPS3Ow==
X-Received: by 10.55.55.138 with SMTP id e132mr9081308qka.207.1500021926029;
	Fri, 14 Jul 2017 01:45:26 -0700 (PDT)
Received: from bigtime.twiddle.net (rrcs-173-197-98-123.west.biz.rr.com.
	[173.197.98.123]) by smtp.googlemail.com with ESMTPSA id
	w28sm6563639qth.8.2017.07.14.01.45.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Jul 2017 01:45:25 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org,
	Jason Wang <jasowang@redhat.com>
References: <20170713163219.9024-1-marcandre.lureau@redhat.com>
	<20170713163219.9024-30-marcandre.lureau@redhat.com>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <075cac00-9a83-4ad3-2e1e-0278ecf36a69@twiddle.net>
Date: Thu, 13 Jul 2017 22:45:21 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170713163219.9024-30-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 29/29] eepro100: replace
 g_malloc()+memcpy() with g_memdup()
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
X-List-Received-Date: Fri, 14 Jul 2017 08:45:28 -0000

On 07/13/2017 06:32 AM, Marc-André Lureau wrote:
> I found these pattern via grepping the source tree. I don't have a
> coccinelle script for it!
> 
> Signed-off-by: Marc-André Lureau<marcandre.lureau@redhat.com>
> Reviewed-by: Stefan Weil<sw@weilnetz.de>
> Reviewed-by: Jason Wang<jasowang@redhat.com>
> ---
>   hw/net/eepro100.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Richard Henderson <rth@twiddle.net>


r~

