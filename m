Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1an5uI-00007f-J3
	for mharc-qemu-trivial@gnu.org; Mon, 04 Apr 2016 10:55:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47959)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1an5uG-000057-Qa
	for qemu-trivial@nongnu.org; Mon, 04 Apr 2016 10:55:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1an5uB-0008DX-50
	for qemu-trivial@nongnu.org; Mon, 04 Apr 2016 10:55:08 -0400
Received: from mail-vk0-x22e.google.com ([2607:f8b0:400c:c05::22e]:33117)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1an5uA-0008DQ-Nq
	for qemu-trivial@nongnu.org; Mon, 04 Apr 2016 10:55:03 -0400
Received: by mail-vk0-x22e.google.com with SMTP id k1so182958110vkb.0
	for <qemu-trivial@nongnu.org>; Mon, 04 Apr 2016 07:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=W+IRItaIQaKTm6S5ayiRd0+2RAZSIagKOpZ718NzTT8=;
	b=Wp0lfa6J40RhQjB2BPi/fw0HWwCGfaSLep7nZ6wI4VSRfYMB0phjrXHiSwyGsR1yS9
	4V6fDToPbikYtc648jKzuXI1Abj0XiAy4NXlvWnsIeN6Myw0i8zVK9iHDCEvi2oCdcbT
	1mytV2F0Ub68bgPq/3WiSj10sAeIQxYPPABig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=W+IRItaIQaKTm6S5ayiRd0+2RAZSIagKOpZ718NzTT8=;
	b=CZmLcgwHmPf9slfYUpM1iljQVU6FJyw2rUVrNY7/5JYKtjR2fcLiAWWfNnMRdO2lv2
	aacnN5aBdPJj7ekccZHYax+93PQdE2bDo107TZsRfOnQNCYv2D4hGYHy3O+956+/wIBS
	D/Xc6mzqUlbkNekVz8RjqmILyJrTNOIVyiHghmaKdvjX4g3+sK8F4KThOkfzZ/QpFNxF
	nu5uE2oeizpaf/hHlieROApSexh+a7psloAqTo5YNUxLpp/9RmCtEB1trfXsfHIbtg68
	HkHdO1xVGGFGBAVSNKQNKEcEH7xhc19WEtgGttKpePxOPH+cGiQMFzq4SynIGJIl7sQU
	71RQ==
X-Gm-Message-State: AD7BkJIriMwqOX3GVdh4zDIjYXc4ZUU6DySz0YsNng5LZVoQP8dvD1i3cFUAbVL2DYShkD+JtJ/PF2KY9WNHz3bs
X-Received: by 10.159.35.109 with SMTP id 100mr5359222uae.119.1459781701851;
	Mon, 04 Apr 2016 07:55:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Mon, 4 Apr 2016 07:54:42 -0700 (PDT)
In-Reply-To: <1459429690-6144-1-git-send-email-berrange@redhat.com>
References: <1459429690-6144-1-git-send-email-berrange@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Apr 2016 15:54:42 +0100
Message-ID: <CAFEAcA-TaRPyDscVoeUgqXY95pZkmsBjuy8kSEjJg35-iU8g5w@mail.gmail.com>
To: "Daniel P. Berrange" <berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22e
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v1] net: fix missing include
 of qapi/error.h in netmap.c
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
X-List-Received-Date: Mon, 04 Apr 2016 14:55:09 -0000

On 31 March 2016 at 14:08, Daniel P. Berrange <berrange@redhat.com> wrote:
> The netmap.c file fails to build on FreeBSD with
>
> net/netmap.c:95:9: warning: implicit declaration of function 'error_setg_errno' is invalid in C99 [-Wimplicit-function-declaration]
>      error_setg_errno(errp, errno, "Failed to nm_open() %s",
>      ^
> net/netmap.c:432:9: warning: implicit declaration of function 'error_propagate' is invalid in C99 [-Wimplicit-function-declaration]
>      error_propagate(errp, err);
>      ^
>
> Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
> ---
>  net/netmap.c | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

-- PMM

