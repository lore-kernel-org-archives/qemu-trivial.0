Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Uf9SJ-0003ZO-PP
	for mharc-qemu-trivial@gnu.org; Wed, 22 May 2013 09:51:51 -0400
Received: from eggs.gnu.org ([208.118.235.92]:58112)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Uf9SD-0003ZC-Ny
	for qemu-trivial@nongnu.org; Wed, 22 May 2013 09:51:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Uf9S8-0002gJ-At
	for qemu-trivial@nongnu.org; Wed, 22 May 2013 09:51:45 -0400
Received: from mail-la0-x22f.google.com ([2a00:1450:4010:c03::22f]:50420)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Uf9S8-0002fz-3w
	for qemu-trivial@nongnu.org; Wed, 22 May 2013 09:51:40 -0400
Received: by mail-la0-f47.google.com with SMTP id fq12so1963519lab.6
	for <qemu-trivial@nongnu.org>; Wed, 22 May 2013 06:51:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=DAT7eJUSvePfrbB4yfnxWtpXWlkUzutra6Zf1qEPH98=;
	b=R9TbxsHkpuYvEy7ow0hwo64xrOlrkpSZZf1DCyjjXizTuj+YZCtzpC45pHWjMKpmms
	GCjgfNbu4fzTyjcq9kFjfHeDlJBBjOx4kQReuAjyeA/FOGybiVjO2LFXwf6JJr0wi3fa
	NmsC+1ROHAzMFGILMzZ/Qst6slY3XEsBqg+J/es2aN3wwyOnvVU//R48k0x7XeNgbNI8
	KLC6b15O2mdB2BtsSMoEEGywkH4n17YFPP9+n0FcFaVcHC+W3vN+1xvG9rgl3rlbDtnz
	QdJsHJxXw4Q9CGskJHXN3rEq2t4CffWNLKzJ0dffoXzXnQqyRc2+nt77FvGFZgVo7SQ4
	llfQ==
X-Received: by 10.152.5.37 with SMTP id p5mr4058119lap.13.1369230698863; Wed,
	22 May 2013 06:51:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.188.130 with HTTP; Wed, 22 May 2013 06:51:17 -0700 (PDT)
In-Reply-To: <871u8zp34w.fsf@codemonkey.ws>
References: <1369066884-431-1-git-send-email-peter.maydell@linaro.org>
	<519A50EE.8040804@redhat.com> <871u8zp34w.fsf@codemonkey.ws>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 22 May 2013 14:51:17 +0100
Message-ID: <CAFEAcA90AJyBNtNxRa45y3zfWCj8tAq5jsqoDLmDTAZT0DK=2g@mail.gmail.com>
To: Anthony Liguori <aliguori@us.ibm.com>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQnkBHPP4mvwrIpFNQ0cF9SsIah4caYUZ0M37J3vLVbR/dedV1Vi9NQdeS2B2kpoKZUNT5f1
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4010:c03::22f
Cc: John Rigby <john.rigby@linaro.org>, patches@linaro.org,
	qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qapi-schema.json: Reformat
 TargetType enum to one-per-line
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
X-List-Received-Date: Wed, 22 May 2013 13:51:50 -0000

On 22 May 2013 14:15, Anthony Liguori <aliguori@us.ibm.com> wrote:
> Paolo Bonzini <pbonzini@redhat.com> writes:
>> You
>> don't need to know what targets were supported in the version that you
>> compiled from.  Only one target is supported in this executable
>> anyway.
>
> It seems useful to me.  One day we may support multiple targets per
> executable.

Why would you care about which architectures the executable supports?
What you actually want to know is which machine models are supported;
whether board foo happens to be ARM or PPC isn't really very interesting
IMHO.

-- PMM

