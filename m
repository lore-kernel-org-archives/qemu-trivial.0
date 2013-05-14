Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UcHga-00068c-BO
	for mharc-qemu-trivial@gnu.org; Tue, 14 May 2013 12:02:44 -0400
Received: from eggs.gnu.org ([208.118.235.92]:33559)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1UcHgW-00061J-56
	for qemu-trivial@nongnu.org; Tue, 14 May 2013 12:02:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1UcHgT-00079X-KE
	for qemu-trivial@nongnu.org; Tue, 14 May 2013 12:02:40 -0400
Received: from mail-gg0-x22b.google.com ([2607:f8b0:4002:c02::22b]:56373)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>)
	id 1UcHgT-00079T-6a; Tue, 14 May 2013 12:02:37 -0400
Received: by mail-gg0-f171.google.com with SMTP id h13so121393ggd.16
	for <multiple recipients>; Tue, 14 May 2013 09:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=gp9/+y88pDhYDMTmWkhvFrOYebNcelAitaPEsmKzCKQ=;
	b=C+11eWHDSf5oCMaI8rufNBAolWbQdl125A1crgAKEEiAPF42BGMtrnwLA6xlwVGp4E
	REk9M7sYIIinreeBcoh5D9Sqj6X+BCOE/YXiv0tMnsr79rPhiXJYqhQ2dIBeFkBecJb+
	iDRJX39ITuvobx3ffY3r4pOI1bJDnvvyoPmMJg0kg/aGFmAEvV4v/3Y+ifvroWnXprWr
	1ZcNCxrNKS3ywNZxVzJDsLcatjyEh+6v6M+Xz1NOqsoC4405Qcdy0VnkHtxIDTVrd609
	BEGzMrauduf5F6INXkrpVXoL83pvEZ1OSHZTAwv7nesrkdp8/bq/B0a4I+w0o+x33nJo
	3SaQ==
X-Received: by 10.236.92.196 with SMTP id j44mr18427095yhf.86.1368547356549;
	Tue, 14 May 2013 09:02:36 -0700 (PDT)
Received: from anchor.twiddle.net
	(50-194-63-110-static.hfc.comcastbusiness.net. [50.194.63.110])
	by mx.google.com with ESMTPSA id f71sm27325156yha.8.2013.05.14.09.02.34
	for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 14 May 2013 09:02:35 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Message-ID: <51926018.9000606@twiddle.net>
Date: Tue, 14 May 2013 09:02:32 -0700
From: Richard Henderson <rth@twiddle.net>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130402 Thunderbird/17.0.5
MIME-Version: 1.0
To: Max Filippov <jcmvbkbc@gmail.com>
References: <1368475464-3116-1-git-send-email-green@moxielogic.com>
	<CAMo8BfJiF3YkzxhRZXsSnh7BsGMMMLzis__OhDvfEEpH_fFPCQ@mail.gmail.com>
In-Reply-To: <CAMo8BfJiF3YkzxhRZXsSnh7BsGMMMLzis__OhDvfEEpH_fFPCQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4002:c02::22b
Cc: qemu-trivial@nongnu.org, Anthony Green <green@moxielogic.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH moxie] Fix bug in tlb_fill.
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
X-List-Received-Date: Tue, 14 May 2013 16:02:43 -0000

On 05/13/2013 01:33 PM, Max Filippov wrote:
> memory access at points (1) and (2) can abort the instruction (it did so
> b/o the bug, but it may do so legitimately when you add MMU support),
> but it has modified REG(1) at those points, which will not be restored.
> It's probably worth carrying register modifications in some temporary
> until after the point (2).

... Which you'll recall that I pointed out during initial review, AG.


r~

