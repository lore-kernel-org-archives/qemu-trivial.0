Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dVwDb-0005WD-Up
	for mharc-qemu-trivial@gnu.org; Fri, 14 Jul 2017 04:45:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48972)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dVwDZ-0005U6-KI
	for qemu-trivial@nongnu.org; Fri, 14 Jul 2017 04:44:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dVwDU-0004u7-Ji
	for qemu-trivial@nongnu.org; Fri, 14 Jul 2017 04:44:57 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:35185)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1dVwDU-0004tv-F5; Fri, 14 Jul 2017 04:44:52 -0400
Received: by mail-qk0-x241.google.com with SMTP id c18so1157200qkb.2;
	Fri, 14 Jul 2017 01:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=sFjdjWMxN1jFXqyQJPtaJWjeBey9LHTrdyf/hkqjyHw=;
	b=liUrPk8MgshCwYxacoTOjQeAnZiZD40LTWli+bMXod4ZATU2XD7EvfpFV6HLPHhbz4
	sT+E394j2YhuEsyy5jW6d3axQJ3Q7iJCmkaHyvqBQau5cNGSx+Y3w+j1INcrdZUxIBZM
	CypuHnQJSeIfxsCo+NXuqU8sqWcuKe9DyolyLK36TVDliD/nE6JTR5p93tvfFwlwbvKe
	U7rT1n8Cz5B2TK9LWepgQ1MBjPJp2ywdHk6WFkyo8yEKz0Obxk34K3yQ0u0B+ZC2/oAP
	8ekyImvK6q2Mm/aM5NBv3Qg7WqxqKBy1Hn91IdtLbjyg5uWdGGpROuHir/0m3MuQycHG
	RDVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=sFjdjWMxN1jFXqyQJPtaJWjeBey9LHTrdyf/hkqjyHw=;
	b=O/DzLto/XU+94CbGqa0zWtx9pZ0TEll1A+rlDCdVCdqwO2aLvG8Hw+RqkXM7nQVqgy
	HQ5joARfsceK53TvY3/VzrnQrfvH4HO1iGbVWCibPHYRWBmWHzmdHi63AE1FnVc++96z
	xEJVBL5b89Qz/eg69stnYkMsmBdvsVnp0i1gKFZMk75tI9JKNakBspxG7QxNe7q/7t4L
	AYToMxuMJQqOTdSjHi7rimTebnqEu68u/CrZucbnl1B7eE9f8fA46rVuMVGOlieS3jhn
	F7e7HKIy3khb3x22Z3WGTJYWvbotANyjowRXyMRISb/ZJPUJ2+LH5+/Im03QCxZCO5hb
	VQrQ==
X-Gm-Message-State: AIVw1110OLkWWL/JOV95kSU3GOHC8uRzrr7ndX80fQ1drLK4C/dck2F2
	AeHCNP6yzLbGWw==
X-Received: by 10.55.214.209 with SMTP id p78mr9356577qkl.173.1500021891948;
	Fri, 14 Jul 2017 01:44:51 -0700 (PDT)
Received: from bigtime.twiddle.net (rrcs-173-197-98-123.west.biz.rr.com.
	[173.197.98.123]) by smtp.googlemail.com with ESMTPSA id
	p13sm5789891qkl.58.2017.07.14.01.44.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Jul 2017 01:44:51 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org
References: <20170713163219.9024-1-marcandre.lureau@redhat.com>
	<20170713163219.9024-29-marcandre.lureau@redhat.com>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <3e476b3f-bd66-4790-f025-4141c8b6f913@twiddle.net>
Date: Thu, 13 Jul 2017 22:44:47 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170713163219.9024-29-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 28/29] test-iov: replace
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
X-List-Received-Date: Fri, 14 Jul 2017 08:44:58 -0000

On 07/13/2017 06:32 AM, Marc-André Lureau wrote:
> I found these pattern via grepping the source tree. I don't have a
> coccinelle script for it!
> 
> Signed-off-by: Marc-André Lureau<marcandre.lureau@redhat.com>
> ---
>   tests/test-iov.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Richard Henderson <rth@twiddle.net>


r~

