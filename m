Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UOBJd-0007S9-FE
	for mharc-qemu-trivial@gnu.org; Fri, 05 Apr 2013 14:24:45 -0400
Received: from eggs.gnu.org ([208.118.235.92]:46544)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.aring@gmail.com>) id 1UOBJX-0007Ku-ME
	for qemu-trivial@nongnu.org; Fri, 05 Apr 2013 14:24:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.aring@gmail.com>) id 1UOBJT-00040O-Qc
	for qemu-trivial@nongnu.org; Fri, 05 Apr 2013 14:24:39 -0400
Received: from mail-ee0-f42.google.com ([74.125.83.42]:44003)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.aring@gmail.com>) id 1UOBJT-000405-K1
	for qemu-trivial@nongnu.org; Fri, 05 Apr 2013 14:24:35 -0400
Received: by mail-ee0-f42.google.com with SMTP id d4so763389eek.29
	for <qemu-trivial@nongnu.org>; Fri, 05 Apr 2013 11:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=aBBF8xjPLoX58Idwo4ZVLwWxMBwoC0MwY0cdmKAUB4M=;
	b=yWikvc2k1UK0msBYLwzzFlEXwpSFCgPUFTVvPJt0EZXjubssQoQmmic30GMxIY0vDu
	6EfzleqhXMA8e5uPPUFeNzeMMxUJsQd2HatIN8P5NV9k7A8hLXDtNN+/6ocBj/GbdN6E
	epJ/SENtNg7YvyUJbAq9fwfiNuhMGYtist+wglt4/DLC6w6/Y++ahq/NfTLR7I6hT1QN
	QVF+VoNPJ3niuBJk0r3Wa9DU0zL06buBaUbR8qXYbAokejvFkdIX30zAyaWMZk7sn070
	noq+4aHI1CbvN+peL90ihDCeVx5qrmgRDaTmQyChMqJ62tX1uYhotyfcaNEoD7R5ryFl
	YPLQ==
X-Received: by 10.15.107.205 with SMTP id cb53mr21929668eeb.14.1365186274411; 
	Fri, 05 Apr 2013 11:24:34 -0700 (PDT)
Received: from x61s.Speedport_W_921V_1_21_000
	(p20030064AA0A6E0102133BFFFE0C3286.dip.t-dialin.net.
	[2003:64:aa0a:6e01:213:3bff:fe0c:3286])
	by mx.google.com with ESMTPS id cd3sm7084715eeb.6.2013.04.05.11.24.33
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 05 Apr 2013 11:24:33 -0700 (PDT)
Date: Fri, 5 Apr 2013 20:26:18 +0200
From: Alexander Aring <alex.aring@gmail.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Message-ID: <20130405182617.GA14373@x61s.Speedport_W_921V_1_21_000>
References: <1364558442-11392-1-git-send-email-alex.aring@gmail.com>
	<20130405125223.GB15818@stefanha-thinkpad.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20130405125223.GB15818@stefanha-thinkpad.redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 74.125.83.42
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] softfloat: fix mask in extractFloat32Exp
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
X-List-Received-Date: Fri, 05 Apr 2013 18:24:44 -0000

Hi,

On Fri, Apr 05, 2013 at 02:52:23PM +0200, Stefan Hajnoczi wrote:
> 
> This patch seems wrong because the fraction is 23 bits, exponent is 8
> bits, and sign is 1 bit.
> 
> IEEE 754 Binary32 representation:
> SEEEEEEEEFFFFFFFFFFFFFFFFFFFFFFF
>  3      2                      0
>  0      3
> 
> http://en.wikipedia.org/wiki/Binary32
> 
> Since the exponent is *8* bits, 0xFF is correct.  The sign bit is 0x100
> after >>23.
>

ahh, I see it! Sorry for the noise :)

Alex

