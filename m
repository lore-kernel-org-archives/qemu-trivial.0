Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dVwBE-0002VX-OD
	for mharc-qemu-trivial@gnu.org; Fri, 14 Jul 2017 04:42:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48285)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dVwBB-0002UE-HY
	for qemu-trivial@nongnu.org; Fri, 14 Jul 2017 04:42:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dVwBA-00043s-OV
	for qemu-trivial@nongnu.org; Fri, 14 Jul 2017 04:42:29 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:34829)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1dVwBA-00043h-K9; Fri, 14 Jul 2017 04:42:28 -0400
Received: by mail-qt0-x244.google.com with SMTP id w12so9151458qta.2;
	Fri, 14 Jul 2017 01:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=QYXO27RbbMHXSaXvDbVa1H5ES5k/17lGuGNTYM13EAo=;
	b=YoaowhSEuWsKN5fbLuXcdMH/AKvmhVdSx98cC6POU7EvLeQmaqhEgk5EEC5Htcr94x
	PX3YqVt5e+brgV/bz1T9q70jdF9nQOzlS+R4AU/gt96nTbiKm/DszIGzCuGNQpGn1CQi
	UkDwpGw4s+BnJieC0sjujZWryYF2VR2+V6g0I/kAJZnxudhZTcTCxHMQBMEUmpOSbKXk
	7IHcWuIq4H6ZJc25SWEcM8mED2q4Wq3ziC8/F5kf42lg5YFCcAccnLoYTvUHe2nE6BeS
	JJ0/19R/V3K6+ZXDsLByNtZ9bB/SrFTEosh7kpP/8Z/sHZVYMcZxQVMZgGmsc9KhU7tP
	RDXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=QYXO27RbbMHXSaXvDbVa1H5ES5k/17lGuGNTYM13EAo=;
	b=L2IhW+gLZzpfj//43OnPK26r2tQVKoUzpqTMRmJSq0i5tm5insG33/hQaYNVC5GkwA
	b2qKgEezgOfcB8fcG0u40pCKDPMkW27PmMG96bsEO6Y6q9YkovICxMI7J2uhryvjE+/A
	wal0HDhpQWAFQjb4K+q7AE5aN7O0AX3zDdSsn7phMeSHdIKsE/GoNIkp+k8YzbNumYvF
	i+WArRRZxqP35FMpJ5AatVggTXlFmxV5+pX1ZCUscx/RwVKciIBWkTDjWZ5O+HYfEhAI
	wTD7+1YyFrl7NLnX6ecQwoZRIBpabR4zYmNJqodLNBLYqULvHKNgGkqnosyaIdypcMqQ
	Dp/Q==
X-Gm-Message-State: AIVw113gkRA4BwdY21itaJZ+PAWjBju8gdAkK3nPKzqYUaVr2DQo5RzP
	rx07FHu5Fwfzu1sXXWg=
X-Received: by 10.237.48.225 with SMTP id 88mr9782138qtf.17.1500021748128;
	Fri, 14 Jul 2017 01:42:28 -0700 (PDT)
Received: from bigtime.twiddle.net (rrcs-173-197-98-123.west.biz.rr.com.
	[173.197.98.123]) by smtp.googlemail.com with ESMTPSA id
	y66sm5677660qkb.35.2017.07.14.01.42.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Jul 2017 01:42:27 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org
References: <20170713163219.9024-1-marcandre.lureau@redhat.com>
	<20170713163219.9024-25-marcandre.lureau@redhat.com>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <6ebfc33d-8a4e-2bc6-f53a-3421db2c9936@twiddle.net>
Date: Thu, 13 Jul 2017 22:42:24 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170713163219.9024-25-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 24/29] kvm: use
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
X-List-Received-Date: Fri, 14 Jul 2017 08:42:31 -0000

On 07/13/2017 06:32 AM, Marc-André Lureau wrote:
> I used the clang-tidy qemu-round check to generate the fix:
> https://github.com/elmarco/clang-tools-extra
> 
> Signed-off-by: Marc-André Lureau<marcandre.lureau@redhat.com>
> ---
>   linux-headers/asm-x86/kvm.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <rth@twiddle.net>


r~

