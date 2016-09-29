Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bpep1-0002W5-Pj
	for mharc-qemu-trivial@gnu.org; Thu, 29 Sep 2016 13:08:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40223)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1bpeou-0002Sy-KB
	for qemu-trivial@nongnu.org; Thu, 29 Sep 2016 13:08:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1bpeop-0008CU-4x
	for qemu-trivial@nongnu.org; Thu, 29 Sep 2016 13:08:27 -0400
Received: from mail-wm0-x22b.google.com ([2a00:1450:400c:c09::22b]:35524)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1bpeoo-0008Br-J9
	for qemu-trivial@nongnu.org; Thu, 29 Sep 2016 13:08:23 -0400
Received: by mail-wm0-x22b.google.com with SMTP id b4so41431537wmb.0
	for <qemu-trivial@nongnu.org>; Thu, 29 Sep 2016 10:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=references:user-agent:from:to:cc:subject:in-reply-to:date
	:message-id:mime-version:content-transfer-encoding;
	bh=ynS6KTJOfhwfop71vAJHynw19PIvRGJ/QTZ5Z0PgB2g=;
	b=XA9YwbmRWTQwuKa024BdpuAdyv7exF1GEH2nv2FabjF3hqm6IRUaQ4++IkoZ5Dey7S
	ddrPHZnHIHMn4vqbPr8VaLk6sB2l6nStlMKQCYQ9q0cHz8n4ajQHyohl8Zh82UXBg71J
	cgrOpaNNtK94+SEvlZxS2is/I0Fu35SMw/zpM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:references:user-agent:from:to:cc:subject
	:in-reply-to:date:message-id:mime-version:content-transfer-encoding;
	bh=ynS6KTJOfhwfop71vAJHynw19PIvRGJ/QTZ5Z0PgB2g=;
	b=kCC1XWi3h6EPgziPR9DD/72w6Qsn2y+BRQyvDTYiN3U26wGVW25WZBc0Hp0OboRpf+
	LMokipBkFzc2pxp2LfALgfEqbQUxlITyEM8/LB15pecQa+6z26YILbVDDiy8rmYwUss4
	NfegfQiofnm3aQKx3OyCmGz8Ts5K5K+Zzsgmcv2XwS32qX4AJGvOCvDeb9SvmUj5/XCX
	6m/whleSVOZHip5SVibda53fvqCAxpwohdSmbxVkYikYQ1rogg2diRwvCkIgbnfILOJV
	pxQCRHNGGH4n8RqBDyWtRxvmWgy6opcHtdnCxCdCui6M6J03SwNOq1MOh9R+hUSlnz6S
	DfAg==
X-Gm-Message-State: AA6/9Rl0Qm1FEBL3leMeLxissNKjswm+30zdQ7jlP1dNnU5xc35JpWzA0JTJzVjKOzLkB4FE
X-Received: by 10.194.150.115 with SMTP id uh19mr2918641wjb.57.1475168901897; 
	Thu, 29 Sep 2016 10:08:21 -0700 (PDT)
Received: from zen.linaro.local ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id
	x135sm4979619wmd.0.2016.09.29.10.08.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 29 Sep 2016 10:08:21 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id A54203E00D9;
	Thu, 29 Sep 2016 18:08:20 +0100 (BST)
References: <1475107128-5101-1-git-send-email-david@gibson.dropbear.id.au>
User-agent: mu4e 0.9.17; emacs 25.1.50.2
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
In-reply-to: <1475107128-5101-1-git-send-email-david@gibson.dropbear.id.au>
Date: Thu, 29 Sep 2016 18:08:20 +0100
Message-ID: <87y42avdkr.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22b
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Update .gitignore
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
X-List-Received-Date: Thu, 29 Sep 2016 17:08:34 -0000


David Gibson <david@gibson.dropbear.id.au> writes:

> This adds one generated header, and a couple of testcase binaries to the
> .gitignore files, which haven't yet been included.
>
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

> ---
>  .gitignore       | 1 +
>  tests/.gitignore | 2 ++
>  2 files changed, 3 insertions(+)
>
> diff --git a/.gitignore b/.gitignore
> index c91d018..1babcc2 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -20,6 +20,7 @@
>  /trace/generated-ust.c
>  /ui/shader/texture-blit-frag.h
>  /ui/shader/texture-blit-vert.h
> +module_block.h
>  *-timestamp
>  /*-softmmu
>  /*-darwin-user
> diff --git a/tests/.gitignore b/tests/.gitignore
> index 0f0c79b..9f3d2ee 100644
> --- a/tests/.gitignore
> +++ b/tests/.gitignore
> @@ -12,7 +12,9 @@ rcutorture
>  test-aio
>  test-base64
>  test-bitops
> +test-blockjob
>  test-blockjob-txn
> +test-bufferiszero
>  test-clone-visitor
>  test-coroutine
>  test-crypto-afsplit


--
Alex Bennée

