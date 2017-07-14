Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dVw7i-00078i-HZ
	for mharc-qemu-trivial@gnu.org; Fri, 14 Jul 2017 04:38:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47025)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dVw7g-00075R-MV
	for qemu-trivial@nongnu.org; Fri, 14 Jul 2017 04:38:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dVw7d-0001zr-JM
	for qemu-trivial@nongnu.org; Fri, 14 Jul 2017 04:38:52 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:33332)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1dVw7d-0001zf-Fa; Fri, 14 Jul 2017 04:38:49 -0400
Received: by mail-qt0-x244.google.com with SMTP id c20so9142227qte.0;
	Fri, 14 Jul 2017 01:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=FLdJsB0ky5xFqwtp+hUTzLWeprMMUvqphj7pRuatOIk=;
	b=E9SbNr/aPzmHN+HlXUyu7WAHsGpCnbiLOGqOk+kGXzPHyxg5jhQIGAWTXS8c0Sripc
	UAIPP1BgmfQ6IATlU6x5qs5S7vnuD/kM6dye3lZhymDmQUV9rW5M4+MwVadxLRmGxASo
	iGA1opdwV1OuZYHpsuOjhLzFWJhrbRYudyjsDTypMxXfKUQ0dABlQ7gwX9+Na+WoStEh
	prWaCGgCpPfqS0kmDZV/5ZIWLPWwYhNEXfAHaU9duYGQ/SADmOgW+SneKhSTbwIRHN/Y
	5joBTeluPHvQeSIJoiiZyhA3e/q/kzGF5t6CbqCLl+HS9i/ULUrQ0dMqu1k7fqvZXmRO
	z9uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=FLdJsB0ky5xFqwtp+hUTzLWeprMMUvqphj7pRuatOIk=;
	b=ir/aNQ3QW3E5FllDd/C32Tr+u6ZMwPjbGIaYBXxBSywrBJAJns0VE70zWl7F10AARC
	hFll/Qhdn5+a7llsETlqIlRJZn5vLZF93l/KPmKj7kYkyn1tUKj+Yf+pJA8PFza3dtor
	Ad8h1pmtPVPk7datKc085z8H0wolAoQ1jDtSheBWGy/2KUqKeqS0KTKQM4AI79Pvd0fy
	13IJvH5B9LK54X7Xz09sWeGP/yCTIPpi+RHuJfrIB7pPTck9uswSJwjQxmsUdKuHtvu6
	uALsHcuDjUz08y6DP25/qqdIMfKeOmbXm6pfju76tXYZo/3RZ6HMr4/Y2pCG1wTtt+cE
	PUUA==
X-Gm-Message-State: AIVw112OqpxxVyHpMbjmTFmkcEf6Q3S7XYtSlL/83qFYowTpvOnB/gN3
	S3nixJNhD+DgTQ==
X-Received: by 10.237.49.133 with SMTP id 5mr9873058qth.53.1500021528990;
	Fri, 14 Jul 2017 01:38:48 -0700 (PDT)
Received: from bigtime.twiddle.net (rrcs-173-197-98-123.west.biz.rr.com.
	[173.197.98.123]) by smtp.googlemail.com with ESMTPSA id
	q52sm6281500qtb.56.2017.07.14.01.38.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Jul 2017 01:38:48 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org,
	Gerd Hoffmann <kraxel@redhat.com>
References: <20170713163219.9024-1-marcandre.lureau@redhat.com>
	<20170713163219.9024-17-marcandre.lureau@redhat.com>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <ed9f8536-3bf1-a16f-eb0a-030a38d730ee@twiddle.net>
Date: Thu, 13 Jul 2017 22:38:44 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170713163219.9024-17-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 16/29] console: use
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
X-List-Received-Date: Fri, 14 Jul 2017 08:38:53 -0000

On 07/13/2017 06:32 AM, Marc-André Lureau wrote:
> I used the clang-tidy qemu-round check to generate the fix:
> https://github.com/elmarco/clang-tools-extra
> 
> Signed-off-by: Marc-André Lureau<marcandre.lureau@redhat.com>
> ---
>   include/ui/console.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <rth@twiddle.net>


r~

