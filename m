Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VEgnq-000197-6w
	for mharc-qemu-trivial@gnu.org; Wed, 28 Aug 2013 10:32:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55114)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1VEgnh-00017H-OS
	for qemu-trivial@nongnu.org; Wed, 28 Aug 2013 10:32:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1VEgnY-0004zY-Ew
	for qemu-trivial@nongnu.org; Wed, 28 Aug 2013 10:32:49 -0400
Received: from mail-yh0-f45.google.com ([209.85.213.45]:41145)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>)
	id 1VEgnY-0004zU-AV; Wed, 28 Aug 2013 10:32:40 -0400
Received: by mail-yh0-f45.google.com with SMTP id i72so1629711yha.4
	for <multiple recipients>; Wed, 28 Aug 2013 07:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=lHJUrkGD4d7aj5+wG5D3qEKORBysSIn6c5/pHNNms/s=;
	b=Dk1SCAzdMBmT+K0/d2GSDanWvKIMmZFNky2fHtmqzMOxz1oDsFLKQpfAJNwrz5PpD7
	udGAC8jUXAnBvGN42tcszFj5pbktYhYCBDJSre+aVIK2BPKpUlPEnzlIOB/oFbj+9lII
	g1vsORwvXZYvGs3UKqc0dHN2YiOHXeuxPyg/oksc99NBFix18TkuSUBdUqEcG3Gn8nnb
	2/Pd17ka2ZF+4I9FNIusOhIt69mZcU8IiNC7GIPsgJ7HZRbj4ZVDXpR1O5jczD0g+21p
	0T0Gvs5KJHn2/4JrrJ2P2ez+AjIw6jDg0gtruz4dhSQAj5/Y+kFEHMuwfIsSLcKPayuy
	XRkg==
X-Received: by 10.236.200.167 with SMTP id z27mr45944yhn.221.1377700324640;
	Wed, 28 Aug 2013 07:32:04 -0700 (PDT)
Received: from anchor.twiddle.net
	(50-194-63-110-static.hfc.comcastbusiness.net. [50.194.63.110])
	by mx.google.com with ESMTPSA id u52sm31875686yhg.5.1969.12.31.16.00.00
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Wed, 28 Aug 2013 07:32:03 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Message-ID: <521E09DF.20102@twiddle.net>
Date: Wed, 28 Aug 2013 07:31:59 -0700
From: Richard Henderson <rth@twiddle.net>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1377664796-11698-1-git-send-email-sw@weilnetz.de>
	<CAFEAcA8uJGphig_gzc2hrJCHejjq1qW-eq7NXScDHWVRRk7KeA@mail.gmail.com>
In-Reply-To: <CAFEAcA8uJGphig_gzc2hrJCHejjq1qW-eq7NXScDHWVRRk7KeA@mail.gmail.com>
X-Enigmail-Version: 1.5.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.213.45
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Stefan Weil <sw@weilnetz.de>,
	qemu-devel <qemu-devel@nongnu.org>, Paul Brook <paul@codesourcery.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] target-arm: Report
 unimplemented opcodes (LOG_UNIMP)
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
X-List-Received-Date: Wed, 28 Aug 2013 14:32:57 -0000

On 08/28/2013 01:15 AM, Peter Maydell wrote:
> [*] not impossible, we already do something on the ppc
> that's similar; however I'd really want to take the time to
> figure out how to do endianness swapping "properly"
> and what qemu does currently before messing with it.

I've got a loose plan in my head for how to clean up handling of
reverse-endian load/store instructions at both the translator and
tcg backend levels.

Hopefully it make the ppc, sparc, and s390 targets cleaner.
I would think that would equally apply to the arm setend.


r~

