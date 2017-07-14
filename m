Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dVwBo-00033V-AQ
	for mharc-qemu-trivial@gnu.org; Fri, 14 Jul 2017 04:43:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48422)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dVwBm-00031j-Cv
	for qemu-trivial@nongnu.org; Fri, 14 Jul 2017 04:43:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dVwBj-0004GH-91
	for qemu-trivial@nongnu.org; Fri, 14 Jul 2017 04:43:06 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:34691)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1dVwBj-0004G6-4i; Fri, 14 Jul 2017 04:43:03 -0400
Received: by mail-qk0-x243.google.com with SMTP id q66so11292803qki.1;
	Fri, 14 Jul 2017 01:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=YJQ3hKSkj1YMzEADdK3bWFV+Tf9lxzRIGB77JoAXKMI=;
	b=eSif2KMTOzoS1Lh7AVXTJe/BerGK/cEg1GCcxjzOQ7L3Be02wb0bZrVxZji33YVT/p
	2tCjGsai7ca/LW50PeGOT3lDonBvnU3YGxp6z7fHIZVGTGNOsqfMxSQQjJUgUX+StFst
	AAE34be2KUknzGego6ME8501lpIcRZiy5X0OkjV4Pyf38WAhFalqo9Lz6+KZOuEfr7i/
	6nnf6ATFj9vBsq9RNHrFarWB102jUfFmqupZaX96cSzDeB67epeaEUlaEpd8SUYk0QAJ
	B+nhQTGZphIkIa6WsF4QohIcLAoTnCQ+8teFiPUcKF5Xlnf3m3tPg7LKZNlDunhSDKJG
	m+qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=YJQ3hKSkj1YMzEADdK3bWFV+Tf9lxzRIGB77JoAXKMI=;
	b=afIiUnON2bbKja5dFoE8EJKHDYCiensnYLjPovR/HpflhXVyaYtjExkf/TwbSf5NjL
	BEpTpq9we9y3DPthcXl1u/Jd2P4BlPr2m8z56bW3jAndp69lNFU7wBLVF8MEUYlor/ov
	9gPn6JmGcZYNMkwvuEAFs6sv4ATgJX268hC0jIIQrnjHYeuAYsIefupJ8th5KyqDc8Tm
	kkYvfvJk3lJNi3yAJlYAZQGLGyu9Dug5K6YjVZ7rn6QtuKcpGWcVZI/UJch9dbquBREq
	Q2ZSW/lLac7e9MHTHpRVhOltCk/ir0MdYzMI1Cd/1TJlOZeAX1peBHu6uLCDRVirpJRT
	kGpw==
X-Gm-Message-State: AIVw111RznANjbNoBKuHDU6uucTp4H39B/faiJ/Y8NXcVCN79uiY3++c
	qd6J1jVyw0DwVw==
X-Received: by 10.55.41.153 with SMTP id p25mr10522910qkp.211.1500021782619;
	Fri, 14 Jul 2017 01:43:02 -0700 (PDT)
Received: from bigtime.twiddle.net (rrcs-173-197-98-123.west.biz.rr.com.
	[173.197.98.123]) by smtp.googlemail.com with ESMTPSA id
	l15sm6225230qtb.51.2017.07.14.01.43.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Jul 2017 01:43:02 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org
References: <20170713163219.9024-1-marcandre.lureau@redhat.com>
	<20170713163219.9024-26-marcandre.lureau@redhat.com>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <fc3967b7-3efe-6ebc-74a6-2a86faa77942@twiddle.net>
Date: Thu, 13 Jul 2017 22:42:58 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170713163219.9024-26-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 25/29] decnumber: use
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
X-List-Received-Date: Fri, 14 Jul 2017 08:43:07 -0000

On 07/13/2017 06:32 AM, Marc-André Lureau wrote:
> I used the clang-tidy qemu-round check to generate the fix:
> https://github.com/elmarco/clang-tools-extra
> 
> Signed-off-by: Marc-André Lureau<marcandre.lureau@redhat.com>
> ---
>   libdecnumber/decNumber.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <rth@twiddle.net>


r~

