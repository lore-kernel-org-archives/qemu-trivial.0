Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dO4Ro-0001ZA-E4
	for mharc-qemu-trivial@gnu.org; Thu, 22 Jun 2017 11:55:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38741)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dO4Rh-0001UI-Lc
	for qemu-trivial@nongnu.org; Thu, 22 Jun 2017 11:55:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dO4Rg-0007LM-JU
	for qemu-trivial@nongnu.org; Thu, 22 Jun 2017 11:55:01 -0400
Received: from mail-wr0-x22d.google.com ([2a00:1450:400c:c0c::22d]:36749)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dO4Rg-0007JZ-Bw
	for qemu-trivial@nongnu.org; Thu, 22 Jun 2017 11:55:00 -0400
Received: by mail-wr0-x22d.google.com with SMTP id c11so29016962wrc.3
	for <qemu-trivial@nongnu.org>; Thu, 22 Jun 2017 08:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Q6Y6jXcax59qK+aXcHphT8aiI6oW4iJraG5a2nork0o=;
	b=QNnTiHqdAaDWaoN6IAGt8GMGqIhcvcLmUr7K5Et5E5hW2OIdQrZ1ncHZ8dnGWR3fEx
	JY1YS6SFjZD9XVgAI3OTagoxmb4bKkRjgVfp4KNWFbirqiU1AsqGc+uAViTAMwIu6m+2
	mYkjYtOc5VuJXhjvsicNL6hfFRzyN87REngDs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Q6Y6jXcax59qK+aXcHphT8aiI6oW4iJraG5a2nork0o=;
	b=jf+om7YKJZAJ5xEFiLxetFfMTe+I6Oa+JsAUMi8iLYcqzgCP7wQPSYFfbNANHMNSqg
	MFEHmgQj662hazGf0r+YtXQXZUSXLRuGSfZYZYCyX7GpM6CakjI69yFWLOzm3C6uYqVB
	UoDKa3e+SrEDO9Uka9QVT9b6uTE0ltogp84/hoSlE5i5JWj9iTHapYvlo0bAkFVZSeLx
	zQiKZetzwoiSDUL1WiGxWC/PbvdKggpqRCqYjxFBieFPIyObTOoX/eUhCIEV7T46j+6j
	zwBNoOOnrSEqOYoEvD1V9srXPUO+px3vAc1J1fBbwIbNCEobx4AHt/8iKKRpMd141s1y
	VLvw==
X-Gm-Message-State: AKS2vOylXONDj6B4vg2JaLaPHU8NB+ovvt7KondlJxe9zt2uHOG7UNx2
	vQ4IDbSrhJKzYdR/6wFWtM+lwJrGfqgb
X-Received: by 10.28.137.206 with SMTP id l197mr2188519wmd.41.1498146897185;
	Thu, 22 Jun 2017 08:54:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.2 with HTTP; Thu, 22 Jun 2017 08:54:36 -0700 (PDT)
In-Reply-To: <26b48c35-b6cc-708d-c4d2-b26a9382e10a@msgid.tls.msk.ru>
References: <20170531120049.14111-1-n54@gmx.com>
	<26b48c35-b6cc-708d-c4d2-b26a9382e10a@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Jun 2017 16:54:36 +0100
Message-ID: <CAFEAcA_kp1tVEd3km1+S7yCLtnVsRko6TQwPZL8xjqV3PVBu5w@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: Kamil Rytarowski <n54@gmx.com>, QEMU Trivial <qemu-trivial@nongnu.org>, 
	Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>,
	peter.maydell@redhat.com
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22d
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3] ivshmem-server:
 ivshmem-client: Build when eventfd() is available
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
X-List-Received-Date: Thu, 22 Jun 2017 15:55:07 -0000

On 5 June 2017 at 15:29, Michael Tokarev <mjt@tls.msk.ru> wrote:
> 31.05.2017 15:00, Kamil Rytarowski wrote:
>> Currently ivshmem requires eventfd() which is Linux specific.
>> Do not and build it unconditionally on every Linux/BSD/Solaris.
>>
>> This patch indirectly fixes build failure on NetBSD, where these tools
>> additionally require -lrt for shm_open(3). In future there should be
>> added support for NetBSD and the linking addressed appropriately.
>
> Unfortunately this breaks static build.
>
> $ ../configure --disable-system --disable-linux-user --static
> $ make V=1
> ...

Why are you trying to build with both system emulation QEMU
and linux-user QEMU disabled anyway? That doesn't leave very
much left to build...

thanks
-- PMM

