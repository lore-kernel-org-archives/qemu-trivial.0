Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dVw5L-0004l3-IL
	for mharc-qemu-trivial@gnu.org; Fri, 14 Jul 2017 04:36:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46033)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dVw5J-0004jI-BR
	for qemu-trivial@nongnu.org; Fri, 14 Jul 2017 04:36:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dVw5G-0000Q1-95
	for qemu-trivial@nongnu.org; Fri, 14 Jul 2017 04:36:25 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:34074)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1dVw5G-0000Pf-4e; Fri, 14 Jul 2017 04:36:22 -0400
Received: by mail-qt0-x243.google.com with SMTP id m54so9150326qtb.1;
	Fri, 14 Jul 2017 01:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=3gne69AHmux/puepKdKfIHxm6Ut/oTy9gXsBP08j9kQ=;
	b=rXVkWVUwXFzlwfExEc7HjNBCKIYVSa5BiNh2xgJUP77Psdvq6I09HH99t71+QdPWOO
	wMqHWbNTGlidlTretziwwEu4NAUkW51PqsJS/mBwdablQV31XhBDi/jGDcMUOTSnkujD
	5uxK2xWfB6Vfl8EDFNaDPfCU84zf8lC0IegRdjZbcqRu4uRtYPSJbsJTWbfWC50CM6O5
	vKg1C+zzMZw5MyKknmSzXQMH79dzJJ8pop8FxvUOaiYb1L00nixD996aWaf6iRkeZoOH
	jsF8+2XRRYCvvyTGthR2C7/RpUoJCA/Byt+XxbHTbA4gUh7GR9FngPnRSmeDC+eLJ8eC
	3k/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=3gne69AHmux/puepKdKfIHxm6Ut/oTy9gXsBP08j9kQ=;
	b=GaDfg8NU365MhF+zRzegh4W5HmNiVkqHe6MBzt0Zq2oymSXQiizCXkQKcin6WzuURk
	IoBrkykB6zoAiHPpaFpNlf+EA8ouPyhw42JfHcq7IMXVcMgKPjneEF3gN1RaLXULOMnU
	o/gX1fVWCQxnuOKBsz2ixjdL8OMUAqrv2j2KZrBdVHMBV9NzTjPWb8AUmBeHqPQqNFA5
	kqhSW9CFz3wXSSRRFXQlGABCNU1PDx90roUh4IMyUGIYBapqrUBBTq4LgEIYrFFCNqbz
	BfHpYkJdJwZcH8LH/aa/6MkdJylSmn9o9L5Ykdfj/wzraZ4KCHxLKGTuF0TohPFREJI+
	NQHA==
X-Gm-Message-State: AIVw113/NttXPRQSTWpI9aviQqWRWlJtOxbk9HhcLpis0LqIrJFKo8Og
	gd7XuTrFErmC0w==
X-Received: by 10.237.50.4 with SMTP id y4mr9957652qtd.225.1500021381596;
	Fri, 14 Jul 2017 01:36:21 -0700 (PDT)
Received: from bigtime.twiddle.net (rrcs-173-197-98-123.west.biz.rr.com.
	[173.197.98.123]) by smtp.googlemail.com with ESMTPSA id
	11sm6455526qtx.6.2017.07.14.01.36.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Jul 2017 01:36:20 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org,
	Gerd Hoffmann <kraxel@redhat.com>
References: <20170713163219.9024-1-marcandre.lureau@redhat.com>
	<20170713163219.9024-12-marcandre.lureau@redhat.com>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <04a1f1d3-a6a5-4a67-3ea9-542f346ea58a@twiddle.net>
Date: Thu, 13 Jul 2017 22:36:15 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170713163219.9024-12-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 11/29] vnc: use
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
X-List-Received-Date: Fri, 14 Jul 2017 08:36:26 -0000

On 07/13/2017 06:32 AM, Marc-André Lureau wrote:
> I used the clang-tidy qemu-round check to generate the fix:
> https://github.com/elmarco/clang-tools-extra
> 
> Signed-off-by: Marc-André Lureau<marcandre.lureau@redhat.com>
> ---
>   ui/vnc-enc-tight.c | 2 +-
>   ui/vnc.c           | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <rth@twiddle.net>


r~

