Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YKZgI-0006fr-9o
	for mharc-qemu-trivial@gnu.org; Sun, 08 Feb 2015 16:46:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54852)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1YKZgG-0006dW-Lr
	for qemu-trivial@nongnu.org; Sun, 08 Feb 2015 16:46:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1YKZgF-0005fi-Ld
	for qemu-trivial@nongnu.org; Sun, 08 Feb 2015 16:46:16 -0500
Received: from mail-wg0-x235.google.com ([2a00:1450:400c:c00::235]:40200)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1YKZgB-0005ej-9i; Sun, 08 Feb 2015 16:46:11 -0500
Received: by mail-wg0-f53.google.com with SMTP id x13so3346643wgg.12;
	Sun, 08 Feb 2015 13:46:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=Bbu5VVmjnYz8ONJMH7M6/t4DfHsUhBzf6k5oeaggYoI=;
	b=kjsHPEytXb+nj5nRBoXMLmisN0WxLLE7YhTon746GC09VNwWaviJv80F6Ot+Kzfqn0
	Hy/JVpey9bxGw5MWToNkLvNpRjq3mVRO4O6mTvD5Nwqc/cYSciKMKTR2v3ZQWE4oq2EM
	BowPnwiBaFqGylsmJKWp34Kvge9e/UxLm+9ivyvKFIY97Qhr0OMj5+Kt8oa5vIhYGHI4
	aD/GO+wbWTDoPwBPBC4KCjTtlHcatnfugVuhyKbsGpO27fcban2te51tR6edao42QNfL
	5jF/on2K0ae7G1eAFjUrDx3o3T+nRJWuzklKDkuYJpoocrdHen5Q6GhTpMQNg7g8L9ez
	GLJA==
X-Received: by 10.180.189.179 with SMTP id gj19mr290088wic.55.1423431970537;
	Sun, 08 Feb 2015 13:46:10 -0800 (PST)
Received: from [192.168.10.150] (net-93-66-105-136.cust.vodafonedsl.it.
	[93.66.105.136])
	by mx.google.com with ESMTPSA id l6sm13553030wjx.33.2015.02.08.13.46.07
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 08 Feb 2015 13:46:09 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <54D7D91D.2040505@redhat.com>
Date: Sun, 08 Feb 2015 22:46:05 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Borislav Petkov <bp@alien8.de>
References: <1423340992-3156-1-git-send-email-bp@alien8.de>	<54D735D4.8000105@redhat.com>
	<20150208121438.GA6290@pd.tnic>
In-Reply-To: <20150208121438.GA6290@pd.tnic>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c00::235
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org,
	Anthony Liguori <aliguori@amazon.com>
Subject: Re: [Qemu-trivial] [PATCH] memsave: Improve and disambiguate error
	message
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
X-List-Received-Date: Sun, 08 Feb 2015 21:46:17 -0000



On 08/02/2015 13:14, Borislav Petkov wrote:
> On Sun, Feb 08, 2015 at 11:09:24AM +0100, Paolo Bonzini wrote:
>> Cc: qemu-trivial@nongnu.org
> 
> Thanks.
> 
> But, there's more b0rked with this error message so you might wanna take
> the patch below instead.
> 
> Btw, what are the vim settings when doing patches for qemu, this must be
> documented somewhere as coding style differs significantly from that of
> the kernel?

I use ":set shiftwidth=4 expandtab" and c-indent mode.

Quick googling for "vim four spaces" suggests the following alternatives:

* ":set tabstop=8 expandtab shiftwidth=4 softtabstop=4"

* "set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab".

Paolo

