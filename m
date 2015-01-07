Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Y8jhb-0006hC-Ut
	for mharc-qemu-trivial@gnu.org; Wed, 07 Jan 2015 01:02:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60785)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1Y8jhZ-0006ep-H8
	for qemu-trivial@nongnu.org; Wed, 07 Jan 2015 01:02:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1Y8jhY-0006Rp-JU
	for qemu-trivial@nongnu.org; Wed, 07 Jan 2015 01:02:41 -0500
Received: from mail-we0-x232.google.com ([2a00:1450:400c:c03::232]:43141)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1Y8jhT-0006RM-SU; Wed, 07 Jan 2015 01:02:36 -0500
Received: by mail-we0-f178.google.com with SMTP id p10so542128wes.23;
	Tue, 06 Jan 2015 22:02:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:newsgroups:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=IiIlooOPqNaeF3YTRmhtz0OxtJw5E13KVDpJ7tqFres=;
	b=DDO+e22gA+/488iknMxrrgvVLSvtYsiT3zluXXODy+4CW3E7HWffEQObwzh9069FQP
	7kgU2pta+sjIzAvXQJr0t4a+onMVCQBv1au/DpwhBF55zdCRfB4GdV53qpqF9jle04ue
	4ZORKGIcevRkjD0HNYiHnZFkCic2rIwUtlhFf/yCEOSkpkfjkJuN+ESM+q4gdWDPTuXY
	x4hswAE3NOCy0t/0kN1VEZupX2gvJ6gI/X/1zW4nbNFa5Y57SPs8IBSeYiwiQ4shMmsF
	e4E3Xh/uKFT9vqCxpyMKNRUHyLd/j4Z/nJwLM4VvEAcCqUz0zJyEPr2zCpGWR3DAYyqg
	1wug==
X-Received: by 10.180.73.108 with SMTP id k12mr3834233wiv.24.1420610554568;
	Tue, 06 Jan 2015 22:02:34 -0800 (PST)
Received: from [192.168.10.150] (net-37-117-147-67.cust.vodafonedsl.it.
	[37.117.147.67])
	by mx.google.com with ESMTPSA id u3sm1195617wiw.24.2015.01.06.22.02.32
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Jan 2015 22:02:33 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <54ACCBF6.6060408@redhat.com>
Date: Wed, 07 Jan 2015 07:02:30 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
Newsgroups: gmane.comp.emulators.qemu
To: Peter Maydell <peter.maydell@linaro.org>, Don Slutz <dslutz@verizon.com>
References: <1419260640-2922-1-git-send-email-dslutz@verizon.com>	<54A125E6.4050807@msgid.tls.msk.ru>
	<54A1B945.20509@terremark.com>
	<CAFEAcA-GjRku9rRZr04itDx-bB40=DpdLNf9_V8QfHANiit4GA@mail.gmail.com>
In-Reply-To: <CAFEAcA-GjRku9rRZr04itDx-bB40=DpdLNf9_V8QfHANiit4GA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c03::232
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Anthony Liguori <aliguori@amazon.com>
Subject: Re: [Qemu-trivial] [PATCH 1/1] Do not hang on full PTY
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
X-List-Received-Date: Wed, 07 Jan 2015 06:02:42 -0000



On 30/12/2014 00:41, Peter Maydell wrote:
> On 29 December 2014 at 20:27, Don Slutz <dslutz@verizon.com> wrote:
>> I was not sure on this being trivial also, but it looked like it could
>> be to me.  The uses of this FD all looked that they handle non-blocking.
> 
> Does g_io_channel_read_chars() definitely return G_IO_STATUS_NORMAL
> (and not, say, G_IO_STATUS_AGAIN) for an attempted read on a non-blocking
> fd with no data?

It should return G_IO_STATUS_AGAIN.  However, pty_chr_read() won't be
called in the first place because the fd won't be readable and thus the
chr->fd_in_tag GSource won't fire.

I think things more or less work right now just because PTYs are
buffered in the kernel and there's no network involved, but Don's patch
is good.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

Michael, let me know if you're applying it yourself.

Paolo

> Otherwise pty_chr_read() is going to call
> pty_chr_state(chr, 0) which I think means "the other end has hung up"
> and will take the fd out of the main loop's poll set.
> 
> thanks
> -- PMM
> 
> 

