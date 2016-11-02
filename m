Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c22NY-0006pq-5c
	for mharc-qemu-trivial@gnu.org; Wed, 02 Nov 2016 16:43:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59029)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1c22NW-0006pO-7k
	for qemu-trivial@nongnu.org; Wed, 02 Nov 2016 16:43:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1c22NV-00033n-DC
	for qemu-trivial@nongnu.org; Wed, 02 Nov 2016 16:43:22 -0400
Received: from mail-vk0-x235.google.com ([2607:f8b0:400c:c05::235]:35227)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1c22NV-00033a-8F
	for qemu-trivial@nongnu.org; Wed, 02 Nov 2016 16:43:21 -0400
Received: by mail-vk0-x235.google.com with SMTP id w194so23200721vkw.2
	for <qemu-trivial@nongnu.org>; Wed, 02 Nov 2016 13:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=MOQk8lJzBfMxwWehHL+WY0JtYGHcZWiwqXyBs/bqOgc=;
	b=KVQoY6UZw94ngPpfNzX9oaPwMrdD6FQjcH0oQqqicF9vwaT0pJ7Vm8mqJ3wkH+M+Nr
	ta4Vs65+QHXk5WWEZTsLcqCUts6b/N1G5JUpaPVBdMk6Da1FQbugZWxWDxhpM7XTcKOZ
	hlHzqMpnUIwiQn4QnpmPJ88joA2Gh38V93yp4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=MOQk8lJzBfMxwWehHL+WY0JtYGHcZWiwqXyBs/bqOgc=;
	b=GZmQbGEav5O2c1hDz7FgT1OpHpgDr4ti84W/vY+Sl6sNOCkXCyuScnVcV2v+T/VwQP
	STqhkpjzjNUdZMhSSkFJh5EW3BXG6AlE2sb0FayKFa2Yv/giXMHEUumIh1H4wLOMBnR6
	4NE93tcGqRJT0SlhNPth1RuQm2KImLISZ4awIVKVOo6mHk9Wg4QPH+fhIx5vn7XM6JjP
	mEgJz2M2Mlpe2Z+SbbE5q33XKbJ9SHJI/Qc4YXmnvv4+KnDyCBvuKL2PXtf2iOjE/w2u
	nCkXvEjRk3mAySfUKue6fqm3Cte8b/7DApOmvXqbvUw91zht3S7Jzjz7S3hGAkwJsAGw
	DmCg==
X-Gm-Message-State: ABUngvet/nbeXogz9wgZSNL+k2IrI/AWcAyMVKsuCnOh+FM9cYDlMcOepBfwneluMVKfqj1tqYSzS09BywuYuWIK
X-Received: by 10.31.165.8 with SMTP id o8mr4466021vke.95.1478119400540; Wed,
	02 Nov 2016 13:43:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.195.70 with HTTP; Wed, 2 Nov 2016 13:42:59 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.10.1611021022470.19454@sstabellini-ThinkPad-X260>
References: <1478081958-5803-1-git-send-email-thuth@redhat.com>
	<alpine.DEB.2.10.1611021022470.19454@sstabellini-ThinkPad-X260>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 2 Nov 2016 20:42:59 +0000
Message-ID: <CAFEAcA_u2+eeLFK-tzs8H+6MPms37q20Fqx=qrMwvgwAoMWvuQ@mail.gmail.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Thomas Huth <thuth@redhat.com>, Olaf Hering <olaf@aepfle.de>, 
	QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>, xuquan8@huawei.com, 
	"xen-devel@lists.xensource.com Devel" <xen-devel@lists.xensource.com>,
	Anthony Perard <anthony.perard@citrix.com>, 
	Emil Condrea <emilcondrea@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::235
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/xen/xen_pvdev: Include
 qemu/log.h for qemu_log_vprintf()
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
X-List-Received-Date: Wed, 02 Nov 2016 20:43:23 -0000

On 2 November 2016 at 17:34, Stefano Stabellini <sstabellini@kernel.org> wrote:
> On Wed, 2 Nov 2016, Thomas Huth wrote:
>> Olaf Hering reported a build failure due to an undefined reference
>> to 'qemu_log_vprintf'. Explicitely including qemu/log.h seems to
>> fix the issue.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>
> The fix makes sense:
>
> Acked-by: Stefano Stabellini <sstabellini@kernel.org>
>
> However I was unable to reproduce the build failure, so I would like a
> confirmation from Olaf that the fix is working.

If you configure with the (default) simple trace
backend then trace.h will pull in qemu/log.h
(and in this case trace.h comes in via xen_common.h).
But if you're using a different backend then it won't
bring in that header, and you'll get the build failure.

This is a fairly common "breaks but only with
some trace backends" compile failure, but I'm
not sure how best to try to make it more robust
(or at least into a 'fails-everywhere' bug).

thanks
-- PMM

