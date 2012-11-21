Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TbDWt-0003Y6-I5
	for mharc-qemu-trivial@gnu.org; Wed, 21 Nov 2012 11:52:03 -0500
Received: from eggs.gnu.org ([208.118.235.92]:54270)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1TbDWn-0003Jl-G2
	for qemu-trivial@nongnu.org; Wed, 21 Nov 2012 11:52:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1TbDWh-0000UT-7w
	for qemu-trivial@nongnu.org; Wed, 21 Nov 2012 11:51:57 -0500
Received: from mail-ie0-f173.google.com ([209.85.223.173]:38045)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>)
	id 1TbDWb-0000Sa-N9; Wed, 21 Nov 2012 11:51:45 -0500
Received: by mail-ie0-f173.google.com with SMTP id e13so512814iej.4
	for <multiple recipients>; Wed, 21 Nov 2012 08:51:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=02AB3A5HdzE9g5kal/NrcfF24EEwMR8zs3z9gkj2Wxs=;
	b=AKTHIoS/cuNaP8UPfMPF9g2Noar19zgRoDeROW6Ql0wjlaSj24Bm+874Ea9fwA2gQ9
	7B0m3U7vOzWlJ7uuEN0j3TChTXl4/Ykj7YqJfCjRn6ZLlpC8CWCcFvbljyh6NfRrdYRS
	xMnq3IDN9dZNk+dgutybZcFXBE3lfzaowZ+h+sfIJbXTMaxdXPdjYHfKz7wx07bcBDkf
	07YvQjlG/4+AHQliUbVmOb8l9Z0l9s+FIRNa95e+1N73dphcIGV60gGnWcpCdsLAZ7U4
	iLOisSUAvtu1k3Xe3NsSiITYjkK0v88Tma5pEzJlI0Q1Ansv8LqUC72MTXeJ7Dw+CI5N
	pQ9Q==
Received: by 10.50.36.200 with SMTP id s8mr165938igj.23.1353516704057;
	Wed, 21 Nov 2012 08:51:44 -0800 (PST)
Received: from pebble.twiddle.home (mb12036d0.tmodns.net. [208.54.32.177])
	by mx.google.com with ESMTPS id as6sm46980igc.8.2012.11.21.08.51.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Nov 2012 08:51:43 -0800 (PST)
Sender: Richard Henderson <rth7680@gmail.com>
Message-ID: <50AD06A6.3000602@twiddle.net>
Date: Wed, 21 Nov 2012 08:51:50 -0800
From: Richard Henderson <rth@twiddle.net>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:16.0) Gecko/20121029 Thunderbird/16.0.2
MIME-Version: 1.0
To: qemu-devel@nongnu.org
References: <1351805797-31899-1-git-send-email-rth@twiddle.net>
In-Reply-To: <1351805797-31899-1-git-send-email-rth@twiddle.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.223.173
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 0/3] trivial: Remove some
 pre-TCG CPUArchState members
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
X-List-Received-Date: Wed, 21 Nov 2012 16:52:01 -0000

Ping.

On 2012-11-01 14:36, Richard Henderson wrote:
> Best I can figure, these temporaries were used by the dyngen
> code generator, last seen in qemu 0.9.0.  Certainly there are
> no references to these members remaining.
> 
> Built x86_64 and i686 hosts.
> 
> 
> r~
> 
> 
> Richard Henderson (3):
>   target-alpha: Remove t0, t1 from CPUAlphaState
>   target-m68k: Remove t1 from CPUM68KState
>   target-sparc: Remove t0, t1 from CPUSPARCState
> 
>  target-alpha/cpu.h | 7 -------
>  target-m68k/cpu.h  | 3 ---
>  target-sparc/cpu.h | 1 -
>  3 files changed, 11 deletions(-)
> 


