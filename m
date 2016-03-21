Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ahvx9-0008MT-7Y
	for mharc-qemu-trivial@gnu.org; Mon, 21 Mar 2016 05:16:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55264)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1ahvx6-0008MH-V4
	for qemu-trivial@nongnu.org; Mon, 21 Mar 2016 05:16:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1ahvx2-000404-VU
	for qemu-trivial@nongnu.org; Mon, 21 Mar 2016 05:16:44 -0400
Received: from mail-wm0-x22a.google.com ([2a00:1450:400c:c09::22a]:37863)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1ahvx2-0003zs-M7
	for qemu-trivial@nongnu.org; Mon, 21 Mar 2016 05:16:40 -0400
Received: by mail-wm0-x22a.google.com with SMTP id p65so113431824wmp.0
	for <qemu-trivial@nongnu.org>; Mon, 21 Mar 2016 02:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=references:user-agent:from:to:cc:subject:in-reply-to:date
	:message-id:mime-version:content-transfer-encoding;
	bh=YHG8SeoyAW1ifra/bgP6YGuLhS9ApeyruiaIL6fRPCw=;
	b=aPSl3287P5aQZgL0kGvmrpjY+31UsAq/WRLI89m2Ahrz1JIEeQJBASJEzWinRT3Jsy
	S2nzmqM4YMH/V4Nc5LtlzFmX8visLoEoKvRbb/WCPE343RsznEpsRcvkDOKXQqlfxtIH
	A+tnyjG2VMDZpJVSQNJBrYyweOClk2oB76/Ag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:references:user-agent:from:to:cc:subject
	:in-reply-to:date:message-id:mime-version:content-transfer-encoding;
	bh=YHG8SeoyAW1ifra/bgP6YGuLhS9ApeyruiaIL6fRPCw=;
	b=j0/EAv+TZSjy+MQW7CH9hDKeoGVE9JoDSqEQGa2WmIr5gqh8AIQBH8RSAsw9WsXIF4
	6mjcS9kURbpTSkq/RYE+uhxPA7FykvoSNRUqPJIlLg2nN/2pHyiuQr4u0VUGMbFs5NzQ
	nbDqXjTih1Vg2SFMcL+sxQqMrt6+EtLy45P2ASQfVNlRdEKSi1XjNuUFSwVgCop0WCdi
	GcrixCKqhEM9I2URpWxmIwkDyzAjPoX4qRl7TSE5ziIv8qOFM9O8WLqDZKtrtjlDB+NJ
	SOFGWjUgduqfuMxRaTJa9Fm4Bg1YN3gyNd7CUKVB6n7gPJ/NEAZZHfSOwWg4xD8uPXyj
	nYQg==
X-Gm-Message-State: AD7BkJLe8Qqe9/+nbkKY+lULM7/uABF4EVP6C2z/ipWFl6gHirqkTDfRe0WvHSVxJln2LC7y
X-Received: by 10.28.128.83 with SMTP id b80mr12996244wmd.6.1458551799808;
	Mon, 21 Mar 2016 02:16:39 -0700 (PDT)
Received: from zen.linaro.local ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id
	o128sm11413721wmb.19.2016.03.21.02.16.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Mar 2016 02:16:38 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 5226B3E0116;
	Mon, 21 Mar 2016 09:16:38 +0000 (GMT)
References: <1458507614-32470-1-git-send-email-rjones@redhat.com>
User-agent: mu4e 0.9.17; emacs 25.0.92.7
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Richard W.M. Jones" <rjones@redhat.com>
In-reply-to: <1458507614-32470-1-git-send-email-rjones@redhat.com>
Date: Mon, 21 Mar 2016 09:16:38 +0000
Message-ID: <87twk0ry15.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22a
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] docs: Update documentation
	for stderr (now log) tracing backend.
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
X-List-Received-Date: Mon, 21 Mar 2016 09:16:45 -0000


Richard W.M. Jones <rjones@redhat.com> writes:

> This fixes commit ed7f5f1d8db06fc31352a5ef4f54985e630c575a.
>
> Signed-off-by: Richard W.M. Jones.
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Stefan Hajnoczi <stefanha@redhat.com>

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

> ---
>  docs/tracing.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/docs/tracing.txt b/docs/tracing.txt
> index 3182ee8..0bd6b9c 100644
> --- a/docs/tracing.txt
> +++ b/docs/tracing.txt
> @@ -157,9 +157,9 @@ performance penalty.
>  Note that regardless of the selected trace backend, events with the "disable"
>  property will be generated with the "nop" backend.
>
> -=== Stderr ===
> +=== Log ===
>
> -The "stderr" backend sends trace events directly to standard error.  This
> +The "log" backend sends trace events directly to standard error.  This
>  effectively turns trace events into debug printfs.
>
>  This is the simplest backend and can be used together with existing code that


--
Alex Bennée

