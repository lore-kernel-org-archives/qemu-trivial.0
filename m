Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dVwAI-0001id-FZ
	for mharc-qemu-trivial@gnu.org; Fri, 14 Jul 2017 04:41:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47948)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dVwAF-0001gh-NI
	for qemu-trivial@nongnu.org; Fri, 14 Jul 2017 04:41:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dVwAE-0003Kn-PR
	for qemu-trivial@nongnu.org; Fri, 14 Jul 2017 04:41:31 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:34380)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1dVwAA-0003Ge-8N; Fri, 14 Jul 2017 04:41:26 -0400
Received: by mail-qt0-x244.google.com with SMTP id m54so9160964qtb.1;
	Fri, 14 Jul 2017 01:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=ira4jhNEGtI4oDjAbT3vPbfndlTe+bqQt9H/oGfZJKo=;
	b=M/C/CgZcojhmy0Desdk3HsFnaly7e5Q0NSKC94elUjMCtatbz0eezNYkgf3MhKAq52
	U/c0e3GVrGTWtVC3SdPERMd+Rd5U5UJC5hihW7GwZEXJV27hBSnh1IrMYSNVH4tNHlDj
	uftPoqS4M5K7NcsLrhavNlYkfq8SyOfq8qWQSkF6xW3KyKhSOTZBNCx760g+qiJUd7lq
	qgK2uXSh8Pbln/8GvqSKDN7aktFEx89AzWjMyXBVqtJzQwI55+UACANjpW4Hx8zs89oD
	r3PfNZ/70bCHdFK96Me2GX4cGF6rfkH/xFYDgDAo+I5RrC2qX9zhS3Mz31+3AxXDzmd1
	cJRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ira4jhNEGtI4oDjAbT3vPbfndlTe+bqQt9H/oGfZJKo=;
	b=TpdhO6wESMov1V6qxLF0/RSsbeEC1s0XwuJ4f100JsA4yi7YJxYAasIHHw0HJi6xV7
	wiR5MsDGN6L9P8AL7Caz+h/Dcwy3+ELfyad3iUnxpu9p7ooKH+Ibp69rtoSk+W1Zp/8V
	sQ2xGNAnt6l7wolO2uuy55A3TH2LcjXQNQPJQydEisZbF59qw5s9s+z264hNEWuSvSWN
	ku4usKvkwqhbQEeUXxa+fe/KcIx3Z5rVGaOR+CX3dlmAEexaHiRnzUFWY8XwOdM4DkvH
	pkxR5ftarOSsoHqMiVLztMkC8Ahi/5DAs53dks7DrdAW3V/QxOu0ERKguWMxYTZQZczh
	23JQ==
X-Gm-Message-State: AIVw111gnM4wM9ANUZrV8RLH6zQ6wQrQubovwyRYK/aboeh46gFdGptJ
	OD0iDeI4EiK9pfVXEVY=
X-Received: by 10.200.56.98 with SMTP id r31mr10751703qtb.174.1500021685716;
	Fri, 14 Jul 2017 01:41:25 -0700 (PDT)
Received: from bigtime.twiddle.net (rrcs-173-197-98-123.west.biz.rr.com.
	[173.197.98.123]) by smtp.googlemail.com with ESMTPSA id
	p36sm6465460qtf.21.2017.07.14.01.41.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Jul 2017 01:41:25 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, qemu-trivial@nongnu.org,
	Alexander Graf <agraf@suse.de>, "open list:PowerPC" <qemu-ppc@nongnu.org>, 
	David Gibson <david@gibson.dropbear.id.au>
References: <20170713163219.9024-1-marcandre.lureau@redhat.com>
	<20170713163219.9024-23-marcandre.lureau@redhat.com>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <99dfbf07-83b6-5b31-2933-83831a5635b6@twiddle.net>
Date: Thu, 13 Jul 2017 22:41:20 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170713163219.9024-23-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 22/29] ppc: use
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
X-List-Received-Date: Fri, 14 Jul 2017 08:41:32 -0000

On 07/13/2017 06:32 AM, Marc-André Lureau wrote:
> I used the clang-tidy qemu-round check to generate the fix:
> https://github.com/elmarco/clang-tools-extra
> 
> Signed-off-by: Marc-André Lureau<marcandre.lureau@redhat.com>
> Acked-by: David Gibson<david@gibson.dropbear.id.au>
> ---
>   target/ppc/mem_helper.c | 2 +-
>   target/ppc/translate.c  | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <rth@twiddle.net>


r~

