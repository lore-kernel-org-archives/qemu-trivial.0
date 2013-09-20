Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VN5I4-0006iw-TV
	for mharc-qemu-trivial@gnu.org; Fri, 20 Sep 2013 14:18:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41222)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.millescamps@6wind.com>) id 1VN5Hw-0006dC-0B
	for qemu-trivial@nongnu.org; Fri, 20 Sep 2013 14:18:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <damien.millescamps@6wind.com>) id 1VN5Hi-0007cU-BR
	for qemu-trivial@nongnu.org; Fri, 20 Sep 2013 14:18:43 -0400
Received: from mail-wi0-f174.google.com ([209.85.212.174]:60096)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.millescamps@6wind.com>) id 1VN5Hi-0007cD-5M
	for qemu-trivial@nongnu.org; Fri, 20 Sep 2013 14:18:30 -0400
Received: by mail-wi0-f174.google.com with SMTP id hj3so9885647wib.1
	for <qemu-trivial@nongnu.org>; Fri, 20 Sep 2013 11:18:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:organization:user-agent
	:mime-version:to:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=ZOzDoXGIsHc6Q9d29FqVkGhkD/0Jtn5vBb73zQLR+Ag=;
	b=PmIl1+oJ4IdyzAYYi80KZlZzYmTW7r7iqB6uCl7215jFfDMxBDH03PDHRbGTi535Lr
	+oYsdL9S9+hL0LY1Ez1SohgbMd7v0x32H+28DTeGpevBXIJNqbW3or2cXXJ5vMCOJef1
	RwWCI17Clh4GHMG+5sNsFhfBa4VRre3JLakZ5K5atF0frCnzcRiFcXi6BZSGukpdGS1a
	S1mLnsETs7jaXFd/xttuVOws+pqIHEainVife9KV6MOo+iB86j7vZQsKaIhsez9TTCfX
	quxBvxWzbNqq0cWmOF8ahnGZSPZCykUBU1KZOhTsNCtoE7x6J5ujmY0VYCQRrhJhTclB
	G18g==
X-Gm-Message-State: ALoCoQkTykMd4oE886TcO27d/2f32xCGvclts+eqdltQ/0EwFtC2arPjngnxCjY5l/2ERqW5pYSx
X-Received: by 10.194.89.233 with SMTP id br9mr7016126wjb.15.1379701108958;
	Fri, 20 Sep 2013 11:18:28 -0700 (PDT)
Received: from [192.168.0.11] ([81.56.67.82])
	by mx.google.com with ESMTPSA id ey4sm6734846wic.11.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 20 Sep 2013 11:18:28 -0700 (PDT)
Message-ID: <523C90EB.5050005@6wind.com>
Date: Fri, 20 Sep 2013 20:16:11 +0200
From: Damien Millescamps <damien.millescamps@6wind.com>
Organization: 6WIND S.A.
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1379339167-1428-1-git-send-email-damien.millescamps@6wind.com>
	<523C7C91.4040501@msgid.tls.msk.ru>
In-Reply-To: <523C7C91.4040501@msgid.tls.msk.ru>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.212.174
Cc: qemu-trivial@nongnu.org, berrange@redhat.com, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH v3] ivshmem: allow the sharing of
	hugepages
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
X-List-Received-Date: Fri, 20 Sep 2013 18:18:51 -0000

On 09/20/2013 06:49 PM, Michael Tokarev wrote:
> Can you please send a v4 with the above changes?  Hopefully you agree
> with them.  Overall, I like this new version too.

Ok, I'll do that ASAP. I'll try to find a better wording for the error
messages.
At first I tried to modify the code as little as possible to be eligible
for qemu-trivial, but clearly I am in favor of adding %m or perror when
a syscall fails.

BTW, there are some other issues in the ivshmem code, like the maximum
size is not enforced (256M in 32b and 4G in 64b) but I am currently
investigating a bug in the linux kernel when the size is > 256M (this
leads to really weird behavior when coupled with VT-d), so I'll wait to
be sure it is really in the kernel and not QEMU related before
submitting this part.

Thanks,
-- 
Damien

