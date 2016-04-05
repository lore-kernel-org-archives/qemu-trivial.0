Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1anSNA-0003jr-3x
	for mharc-qemu-trivial@gnu.org; Tue, 05 Apr 2016 10:54:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40301)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1anSN6-0003gb-Fo
	for qemu-trivial@nongnu.org; Tue, 05 Apr 2016 10:54:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1anSN2-0003KK-8U
	for qemu-trivial@nongnu.org; Tue, 05 Apr 2016 10:54:24 -0400
Received: from mail-vk0-x229.google.com ([2607:f8b0:400c:c05::229]:34643)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1anSN2-0003K5-4P
	for qemu-trivial@nongnu.org; Tue, 05 Apr 2016 10:54:20 -0400
Received: by mail-vk0-x229.google.com with SMTP id e185so20840748vkb.1
	for <qemu-trivial@nongnu.org>; Tue, 05 Apr 2016 07:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=uA8DXLZWFszBCY8IE6trK1jqQdIKn8cIxImbGmn2XJ8=;
	b=bvmz1kCfSyALCmSQwvVRbgGTcYufK9U5ebT1xhVXR8HGzd+/3z07gX8gYh+s4cSZvx
	gWNcuxtDMvV5Z8eQVPQuaXdfWwIXPrQWhLriW3Gbu4ycq/FEAhcL2ZKS+eYKXdw4FTo0
	uXsL1EXZVut21SEsJi/8NCIc9MFDDtU++xamM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=uA8DXLZWFszBCY8IE6trK1jqQdIKn8cIxImbGmn2XJ8=;
	b=LGkfqYrbUqcp/8S96GBTwDaCDhZ3lskvvw/qImzeHF8cbKx3dxiB3rApjUkjwGB3nA
	qYhV7hKwToy75evaC1LuIKPBaQqx0qbDO8NQcZDOG9fc5mlkWZcVNDhYcNe4zYOBAqRH
	t1PbfQ0Ld+EdS030dFvVVE5gvjL57u98uhbRJzPQNz8QE7baNSv61hQOAEaBPGkkxQIZ
	KNCEJUvgIPodPQOWqU0tXN49YYYOiA3txbgRe+TmHdHng+n8BOh9Cyn48r4NboJurLeS
	J3ZmUGuESlbcZxulNkejtztVVtKiVGSe0TfsNPx9r7yn01aRpmtd2fbq6jlvhYczx/ue
	9/6Q==
X-Gm-Message-State: AD7BkJJcixcx4AbwRqnZ1g7EKi5P+WbsZA21KmXPoPjfEkfrLbggnmYCc1OUrYATmDG3BGdPFeSfJZAXgHzL7AZD
X-Received: by 10.31.7.138 with SMTP id 132mr9897506vkh.92.1459868059573; Tue,
	05 Apr 2016 07:54:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Tue, 5 Apr 2016 07:54:00 -0700 (PDT)
In-Reply-To: <1459867593-72017-1-git-send-email-emaste@freebsd.org>
References: <1459867593-72017-1-git-send-email-emaste@freebsd.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 5 Apr 2016 15:54:00 +0100
Message-ID: <CAFEAcA8QuRvsuaG6Vx=baLZ6A=H2hZK3gR67tOHNOZw77dq=iA@mail.gmail.com>
To: Ed Maste <emaste@freebsd.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::229
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] bsd-user: Suppress gcc 4.x
 -Wpointer-sign (included in -Wall) warning
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
X-List-Received-Date: Tue, 05 Apr 2016 14:54:26 -0000

On 5 April 2016 at 15:46, Ed Maste <emaste@freebsd.org> wrote:
> This is the same change as b55266b5 in linux-user.
>
> Signed-off-by: Ed Maste <emaste@freebsd.org>

Do you have many more of these bsd related patches to come?
It might be easier to deal with them all in one patchseries...

thanks
-- PMM

