Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dVw85-0007lh-DJ
	for mharc-qemu-trivial@gnu.org; Fri, 14 Jul 2017 04:39:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47174)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dVw83-0007jy-FG
	for qemu-trivial@nongnu.org; Fri, 14 Jul 2017 04:39:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dVw80-0002Gv-Cr
	for qemu-trivial@nongnu.org; Fri, 14 Jul 2017 04:39:15 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:36197)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1dVw80-0002Gm-8V; Fri, 14 Jul 2017 04:39:12 -0400
Received: by mail-qt0-x241.google.com with SMTP id v31so9138129qtb.3;
	Fri, 14 Jul 2017 01:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=qMfCfe2QSOifwLUN+40+NgYae4FOhWj/0ffDld3yCfA=;
	b=Ml/xZ9C8XxbmEZliJsBIEbuosnMrd8RqJuYpss5rw2IbzKCX/EHQMDCM1l+xSeO7Cy
	r3FKEI2DU1KZxbkRwJ7CJrZF54j6keEqh0kYzSgvuaDvrI0jXOyOcDwJhkhIM2iH0NPn
	j8Ba3TJx1eG5X8h0taKHVxsx7ngzAYHi0su5wv7BmfsI/kbcMecgtiZT81JUTwuCuCve
	R6mguNGfdv2WgiAvN19kj8aj4oAMbc7Ru/C5CEGD7q42xEaUK2guDh4nW9i7mfe+Ea0C
	fvHtY7APdGKVesVPr/yMHCMOZdZoYkS0BubBagqB7VK9Pwa6wmckVXgv0y0PID2v3M8C
	ELbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=qMfCfe2QSOifwLUN+40+NgYae4FOhWj/0ffDld3yCfA=;
	b=e1j0H5uhf1YxgUzgcFm8DpLb3lGgYeP1Q4/U1XHc/ysrGRLCMIzzAb01is0ZDE9Kp/
	PQug+IGR8Yzu8TaXvSSY0ogjCI1clhUPj8sVa0FqH+la1gEcrDI6a/cpvg+AGUO5MCSN
	yZovlVvvtPtkzz7ZiwO4qern/9vtkb6hFAWxWf15rxMzffxsJ5Ud+xpV7g7j0A41wi1/
	oUXUEiphYtrAcDr35t1BAzxWFvLKGSwjiGxvRFsWimCtLCQy7QW3xm8RzTgT0CqGpXfm
	F38bYu5DuJWWVYWwTLSnGMdQEEezNFYPlzIK3lqqEZ17QI7DwHMOsMlKTwX9akNAHj0O
	CKTw==
X-Gm-Message-State: AIVw112+zAl0a0VxhgsYGFgv+xhlUKW86NMZRgXSudM6meEZde8avV+m
	t6apqa8wWVr941Z4B4M=
X-Received: by 10.200.53.151 with SMTP id k23mr9978682qtb.104.1500021551740;
	Fri, 14 Jul 2017 01:39:11 -0700 (PDT)
Received: from bigtime.twiddle.net (rrcs-173-197-98-123.west.biz.rr.com.
	[173.197.98.123]) by smtp.googlemail.com with ESMTPSA id
	n2sm5553134qkc.59.2017.07.14.01.39.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Jul 2017 01:39:11 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Amit Shah <amit@kernel.org>,
	qemu-trivial@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>
References: <20170713163219.9024-1-marcandre.lureau@redhat.com>
	<20170713163219.9024-18-marcandre.lureau@redhat.com>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <9b7b026f-d5ad-7784-2c47-2207313320e6@twiddle.net>
Date: Thu, 13 Jul 2017 22:39:06 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170713163219.9024-18-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 17/29] virtio-serial: use
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
X-List-Received-Date: Fri, 14 Jul 2017 08:39:16 -0000

On 07/13/2017 06:32 AM, Marc-André Lureau wrote:
> I used the clang-tidy qemu-round check to generate the fix:
> https://github.com/elmarco/clang-tools-extra
> 
> Signed-off-by: Marc-André Lureau<marcandre.lureau@redhat.com>
> ---
>   hw/char/virtio-serial-bus.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <rth@twiddle.net>


r~

