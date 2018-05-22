Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fLCww-0005d0-T2
	for mharc-qemu-trivial@gnu.org; Tue, 22 May 2018 15:27:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32838)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fLCwu-0005bj-5X
	for qemu-trivial@nongnu.org; Tue, 22 May 2018 15:27:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fLCwt-00073u-Ha
	for qemu-trivial@nongnu.org; Tue, 22 May 2018 15:27:56 -0400
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:41118)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fLCwt-00073Q-Cr
	for qemu-trivial@nongnu.org; Tue, 22 May 2018 15:27:55 -0400
Received: by mail-oi0-x243.google.com with SMTP id 11-v6so17280072ois.8
	for <qemu-trivial@nongnu.org>; Tue, 22 May 2018 12:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9a+6Ub2cJPKqyiancLJvrbq0eLk49TTILi0fZwLnWv0=;
	b=ZYREkv2TQ7OEoYNtMp5xZwIgHEnbs+h1vLpvscvo6aubifYe51ygcG2MAQcdCQN612
	lsfXpk+QZ5B2ICFtEJhhXAznmibICyK5XzDjN+scXpxU4TbPm6UOiyAJx3mswxXXzVIu
	F5QFSgr5Bu6LSRz8gznzehjHgOnb1j1+jczNY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9a+6Ub2cJPKqyiancLJvrbq0eLk49TTILi0fZwLnWv0=;
	b=uOTpu6ODkoJhOjqa8Tqfztta24Sqwx20MuQLv6WDE9/i45dJsEBD8rrbMbR+tPhn/M
	s45bb0JTLHbnoySUpqN/tBeY0WU3EDOyKEpNBl4Hef3OauptVltszpNd7eWnppeRPoBQ
	yAJkjdOsMqJS4mLEf+pSGqsQXQ8RcvXdhvixrNR9pYPsTSnxizLUDIskjg+x+7BdWsDW
	P3/ztvtONM+KRUqIajokOyc9aJkJbili6peh4y/I1hLwih1PDHb+yGkOm7dowbvEC/CW
	lLrbUwTIEMbEzJpFL7WHo+QETeCLBMwirFwU9IUVzcD9IQXsxl4zDZrRtr6IjxFrqGb6
	c4Gg==
X-Gm-Message-State: ALKqPwc4H5a3OHxHHXhh1zpDTk/Yln8zNOfUZOyShk++ZQOd2L5QKjIZ
	W7sJYDkS8D9YsjEvRu7MW6/rCbXCvpbS0YD5tTdV9w==
X-Google-Smtp-Source: AB8JxZoB2opaUx+uEIBrV4uSo9vaZ7fzwWPJpSI2plZOem+qwEEgsaVrxi0ZVQ6tnBKcR3V4fkJhZ3DtSRhi+P/+vLo=
X-Received: by 2002:aca:b855:: with SMTP id
	i82-v6mr15010818oif.12.1527017274789; 
	Tue, 22 May 2018 12:27:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP; Tue, 22 May 2018 12:27:34
	-0700 (PDT)
In-Reply-To: <20180522192034.13318-1-pbonzini@redhat.com>
References: <20180522192034.13318-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 May 2018 20:27:34 +0100
Message-ID: <CAFEAcA_mU6wvzGCvhv_OvX37QqyNkMdwfM8Kc6swNQK=tCZMYA@mail.gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] tcg: remove softfloat from
 --disable-tcg builds
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
X-List-Received-Date: Tue, 22 May 2018 19:27:57 -0000

On 22 May 2018 at 20:20, Paolo Bonzini <pbonzini@redhat.com> wrote:
> Even though the presence of softfloat does not cause --disable-tcg builds to fail,
> it is the single largest .o file in them.  Remove it, since TCG is the only client.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  Makefile.target          |   2 +-
>  hw/i386/x86-iommu-stub.c | 132 +++++++++++++++++++++++++++++++++++++++
>  2 files changed, 133 insertions(+), 1 deletion(-)
>  create mode 100644 hw/i386/x86-iommu-stub.c

Is this new x86-iommu-stub.c file intended to be in this patch?

thanks
-- PMM

