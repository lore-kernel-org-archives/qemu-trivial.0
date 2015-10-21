Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Zp2cA-0007Qs-Sj
	for mharc-qemu-trivial@gnu.org; Wed, 21 Oct 2015 19:16:15 -0400
Received: from eggs.gnu.org ([208.118.235.92]:49556)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1Zp2c6-0007NE-VJ
	for qemu-trivial@nongnu.org; Wed, 21 Oct 2015 19:16:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1Zp2c1-0000md-W8
	for qemu-trivial@nongnu.org; Wed, 21 Oct 2015 19:16:10 -0400
Received: from mail-qg0-x22b.google.com ([2607:f8b0:400d:c04::22b]:35902)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>)
	id 1Zp2c1-0000mU-Rw; Wed, 21 Oct 2015 19:16:05 -0400
Received: by qgad10 with SMTP id d10so41948527qga.3;
	Wed, 21 Oct 2015 16:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=REu+YlA0n+YrFXbtUqY5++2VlAtuARUuCUm20HcL6tI=;
	b=I0BGT5mUOHWHmziaFuhn72xyfhozp7pAEgOmLlPJYsxLElip/WWeSjgAg3cN38z3P+
	jh0dOdhf9WSYSB87t07T0eqwFAX3/kAHqGj+4m+7xGGd0y0EOsuWCFRSEluoBs77cr5b
	Kt5TOFCldtmqwKiTzomCvqmEclkSjhhMKC1AQZKIMgqgY6uH8d4ggmy2vVvvaQDwEHCi
	nPilDwYNbk9RVg1FJ4+feYp7bYPKbSZKEWL8OxcM4lZ6MFIsOz0lV5zSSP8YmybrzRpm
	GNdDd3B30kWTvu1HrcaL3g6bu3ZjOCiEz8nRycbEBZ1t/sH6rB0hTqBxSMYv4N7ItWIi
	VgKQ==
X-Received: by 10.140.237.72 with SMTP id i69mr15686791qhc.56.1445469365341;
	Wed, 21 Oct 2015 16:16:05 -0700 (PDT)
Received: from bigtime.twiddle.net (cpe-50-113-10-46.hawaii.res.rr.com.
	[50.113.10.46]) by smtp.googlemail.com with ESMTPSA id
	n14sm4242793qkl.13.2015.10.21.16.16.02
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Oct 2015 16:16:04 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <1445263720-6765-1-git-send-email-pbonzini@redhat.com>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <56281CAE.1060505@twiddle.net>
Date: Wed, 21 Oct 2015 13:15:58 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1445263720-6765-1-git-send-email-pbonzini@redhat.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c04::22b
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] target-alpha: fix
	uninitialized variable
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Oct 2015 23:16:12 -0000

On 10/19/2015 04:08 AM, Paolo Bonzini wrote:
> I am not sure why the compiler does not catch it.  There is no
> semantic change since gen_excp returns EXIT_NORETURN, but the
> old code is wrong.
>
> Reported by Coverity.
>
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   target-alpha/translate.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <rth@twiddle.net>

I assume this will go in via trivial.


r~

