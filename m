Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dVvhj-0005sI-Ge
	for mharc-qemu-trivial@gnu.org; Fri, 14 Jul 2017 04:12:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40065)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dVvhh-0005qh-8T
	for qemu-trivial@nongnu.org; Fri, 14 Jul 2017 04:12:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dVvhe-0004ov-3r
	for qemu-trivial@nongnu.org; Fri, 14 Jul 2017 04:12:01 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:33005)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1dVvhd-0004ok-Vz; Fri, 14 Jul 2017 04:11:58 -0400
Received: by mail-qk0-x243.google.com with SMTP id a66so10216738qkb.0;
	Fri, 14 Jul 2017 01:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=EfMB1qt1WXkjVDkuT20ejnRCXahvgODvltiuPSDoZa4=;
	b=KuXGOd1Vf4qTqXDosrBY8s/NhmNYGj6hnN3XM1khLOMzmivYJYFCjS0tiBm2sn9Q0N
	DuTtRP7pG9zGLJtn7RKul+7ZcOkqa56cbyoeLhfnXPR6c3eyhhdo6D/PKQWH5zSAEdxh
	GQCSZGqXcyP7394Ej1KY4ZcZDSWgJEdohVHvoDY3vSvgcfG442s/wTBAR9FBxn6bRLFp
	eDj1ouEJ7uuy3eL6zWZbDRvGpnIRF+X2rcWA+m/h6f2X/bZm3Vmt6eIGqgwpsy4Fmxma
	xSpDieLIpo4VHMwrxk89bDtUhLjCsRLuIrPhnQ08n6vby8aaQ/2VLTlaNF8i05h/Iiv6
	gVmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=EfMB1qt1WXkjVDkuT20ejnRCXahvgODvltiuPSDoZa4=;
	b=U7fkNrGBdvcZ26eQLKVP0/e5eO2PUyWG1nsCexC6oPAdadrGsFY7ICPJn2YFxj4bYm
	kVeE/Q6oYdMHLjVlVqsw0PGZCUBx+4qw6VxlzttuKBrrcc2F4Q+Aui7Jcf5GD8XWJRDY
	HvH5LaUrD26JlAC/IZNw3qMIpgVoEAdeUyqq2UvR4igzg/zl8WaWt0vbMX3GSy5K5dbJ
	cxWUKnU1+GE74G24qWGPNZVzWi0DSqZXHKOnOtmSf30F9LpYnDk5CyBOE2AOcQ18SJDW
	Y1At8EcoStLn+NidDbSm0IoyR/Y0Emx3a6i6AaN1HyEoyW4l0UeFyrB+I2PqOX2YfEGT
	IvOQ==
X-Gm-Message-State: AIVw111ZOtxMlPLfsBc489A8oqyeMgsZvoRU24mJ6C5rNVe+Er4jQJLV
	GmJc0H0CIeCgyQ==
X-Received: by 10.55.16.148 with SMTP id 20mr9522618qkq.45.1500019917491;
	Fri, 14 Jul 2017 01:11:57 -0700 (PDT)
Received: from bigtime.twiddle.net (rrcs-173-197-98-123.west.biz.rr.com.
	[173.197.98.123]) by smtp.googlemail.com with ESMTPSA id
	h5sm5732866qkc.6.2017.07.14.01.11.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Jul 2017 01:11:56 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, peter.maydell@linaro.org,
	"open list:VHDX" <qemu-block@nongnu.org>, qemu-trivial@nongnu.org,
	Jeff Cody <jcody@redhat.com>, Max Reitz <mreitz@redhat.com>
References: <20170713163219.9024-1-marcandre.lureau@redhat.com>
	<20170713163219.9024-4-marcandre.lureau@redhat.com>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <dd7b0ca5-753b-172e-6d7f-320ce25853a7@twiddle.net>
Date: Thu, 13 Jul 2017 22:11:52 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170713163219.9024-4-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 03/29] vhdx: use
 QEMU_ALIGN_DOWN
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
X-List-Received-Date: Fri, 14 Jul 2017 08:12:02 -0000

On 07/13/2017 06:31 AM, Marc-André Lureau wrote:
> I used the clang-tidy qemu-round check to generate the fix:
> https://github.com/elmarco/clang-tools-extra
> 
> Signed-off-by: Marc-André Lureau<marcandre.lureau@redhat.com>
> ---
>   block/vhdx-log.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <rth@twiddle.net>


r~


