Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dVviV-0006VP-Nc
	for mharc-qemu-trivial@gnu.org; Fri, 14 Jul 2017 04:12:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40371)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dVviT-0006Ta-Om
	for qemu-trivial@nongnu.org; Fri, 14 Jul 2017 04:12:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dVviQ-0005Gs-Kc
	for qemu-trivial@nongnu.org; Fri, 14 Jul 2017 04:12:49 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:34044)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1dVviQ-0005Gn-G6; Fri, 14 Jul 2017 04:12:46 -0400
Received: by mail-qk0-x242.google.com with SMTP id q66so11230279qki.1;
	Fri, 14 Jul 2017 01:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=Mjf8h82B0mDYQb9+3Vyx+xJTHRD3FdZVJVXJQ8z3PRM=;
	b=SE8enLtcRPmuveTdE137A6cM/OBQNou/cThX5kI1zSLSvQL2JW7n8AXcNvzfAWv9rL
	izSmekkTDwHxt8Pb2jwBfOFaEyvTtHxA900XsDVi29N9nJMO/XYHMtoKCaeMlKS+Uw18
	+ne2p2ZPZS2UKpbfGtUkqxGE7ynmGam5nkIKjiHdF9PdpjxN410hDqDY6njLgRmQ7s4L
	G/BTjMt4ctMbiuV3MVTNRpIe+DuSpFmYt2cB+efNBFN+z9oMhO6lnVe5I3N9x8RIdfYe
	rYlD+c4/5G34ofQ8mXCUihDJGDGgD4m7PdjvfGSmVhdbmd8Hfpd0CcsqvzXjr0TPR/g4
	CDYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Mjf8h82B0mDYQb9+3Vyx+xJTHRD3FdZVJVXJQ8z3PRM=;
	b=IngnA5swCimeFe308wUWjvFtqmMPSnWzIYEpXqSxY+l4zII4cKyrG2mXu1wQH90AOn
	CE7o61K2hIh/nRTBp/znB+t0LROgjtpyAZ0Cn+tD/i0pMfNK/vHlbifQZLkXFauhyiJL
	hy0v2VzY8ThAYKFwQAPHO3X6nB9CJ2BpqXN1ii5bOcWG6Ik4g+qMUpgBQHs+7nInRJTy
	TBP+tNNPhVpBJKnLmilV50gS++s6l4Pd7NnZHLzlClVXniRLK9MaT0jMwNhMyTcWUsMz
	EMsx771i77J4FKMeUwmZ0tx4sKYi4RyIPfKnglvsm5hI+biovhOXashVpoKEdVv0rO0p
	UW2g==
X-Gm-Message-State: AIVw110obzoBT8J3crEutH8tVsXBOzWw8Q0PEmg0Jf+vYOzUqc2zqgDj
	3gobvID6gmq23w==
X-Received: by 10.55.38.149 with SMTP id m21mr10490344qkm.39.1500019966101;
	Fri, 14 Jul 2017 01:12:46 -0700 (PDT)
Received: from bigtime.twiddle.net (rrcs-173-197-98-123.west.biz.rr.com.
	[173.197.98.123]) by smtp.googlemail.com with ESMTPSA id
	a15sm6445364qta.16.2017.07.14.01.12.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Jul 2017 01:12:45 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org,
	"Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20170713163219.9024-1-marcandre.lureau@redhat.com>
	<20170713163219.9024-6-marcandre.lureau@redhat.com>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <f0455484-7d0b-ba68-8eb6-709c0e384b88@twiddle.net>
Date: Thu, 13 Jul 2017 22:12:40 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170713163219.9024-6-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 05/29] i8254: use
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
X-List-Received-Date: Fri, 14 Jul 2017 08:12:50 -0000

On 07/13/2017 06:31 AM, Marc-André Lureau wrote:
> I used the clang-tidy qemu-round check to generate the fix:
> https://github.com/elmarco/clang-tools-extra
> 
> Signed-off-by: Marc-André Lureau<marcandre.lureau@redhat.com>
> ---
>   hw/timer/i8254_common.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <rth@twiddle.net>


r~


