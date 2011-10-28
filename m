Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RJpTi-0004OR-RN
	for mharc-qemu-trivial@gnu.org; Fri, 28 Oct 2011 12:40:22 -0400
Received: from eggs.gnu.org ([140.186.70.92]:41612)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1RJpTf-0004Ns-MA
	for qemu-trivial@nongnu.org; Fri, 28 Oct 2011 12:40:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1RJpTe-0006hZ-G8
	for qemu-trivial@nongnu.org; Fri, 28 Oct 2011 12:40:19 -0400
Received: from mail-qw0-f45.google.com ([209.85.216.45]:56393)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1RJpTe-0006hT-Dw; Fri, 28 Oct 2011 12:40:18 -0400
Received: by qadc12 with SMTP id c12so4708300qad.4
	for <multiple recipients>; Fri, 28 Oct 2011 09:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:message-id:date:from:user-agent:mime-version:newsgroups:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=hYTU3vZeVm01mzr9K84y0yrHOu8l9qNFdWHfcOMupU8=;
	b=Rl8aSaUvoMnuG3jPEJ0EGPPZM+LoSm13P16P6eUAUBWUaWUCP8YH+0fF/5F/j9clQ1
	7POTsMXN/rfGTh77THJaibOvwr4wPbz+2oOOQjREivOgHt169JZn2N4eWTQ0W4gdaRWY
	saDjc5XIh4sNJiOdlnk3WRSGTwNxLGuFIndIk=
Received: by 10.224.96.69 with SMTP id g5mr3458532qan.32.1319820017782;
	Fri, 28 Oct 2011 09:40:17 -0700 (PDT)
Received: from yakj.usersys.redhat.com (93-34-199-98.ip51.fastwebnet.it.
	[93.34.199.98])
	by mx.google.com with ESMTPS id ed2sm471099qab.15.2011.10.28.09.40.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 28 Oct 2011 09:40:16 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <4EAADAEA.5070608@redhat.com>
Date: Fri, 28 Oct 2011 18:40:10 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0.1) Gecko/20110930 Thunderbird/7.0.1
MIME-Version: 1.0
Newsgroups: gmane.comp.emulators.qemu
To: Markus Armbruster <armbru@redhat.com>
References: <1319487523-19978-1-git-send-email-sw@weilnetz.de>
	<20111026125431.GC27267@stefanha-thinkpad.localdomain>
	<m3obx1y36x.fsf@blackfin.pond.sub.org>
	<CAJSP0QVpEpB-_hAWJr1mNKzoEjGGPwVBkMu+S-BcOFe_fK7Nhw@mail.gmail.com>
	<m34nytsd99.fsf@blackfin.pond.sub.org>
	<CAJSP0QUX0TtQtrwsotPuGtMXnq=pH8srk-Bbyn6B2gu2YMt9hQ@mail.gmail.com>
	<m3y5w5nzma.fsf@blackfin.pond.sub.org>
	<CAJSP0QWd-aT6Hyj=dut+a_Va75zYMORzdjGit3pzU-PFzYWD+Q@mail.gmail.com>
	<m3ehxxfae3.fsf@blackfin.pond.sub.org>
In-Reply-To: <m3ehxxfae3.fsf@blackfin.pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.216.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Stefan Weil <sw@weilnetz.de>
Subject: Re: [Qemu-trivial] [PATCH] Fix compiler warning (always return a
	value)
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
X-List-Received-Date: Fri, 28 Oct 2011 16:40:20 -0000

On 10/28/2011 04:39 PM, Markus Armbruster wrote:
>> >
>> >  I'm tempted to continue the thread but at the end of the day we just
>> >  need to make the function compile with -NDEBUG.  Using abort(3) or
> Do we?
>
> Anyone crazy^Wadventurous enough to compile with -DNDEBUG should be
> capable of configure --disable-werror.

Also, I'm not really sure of the benefit of NDEBUG.  For something like 
QEMU, hardware emulation is not going to be your bottleneck and for KVM 
you badly want those asserts to protect against guest-to-host 
escalation.  If you have a really expensive check, you should wrap it 
inside #ifdef DEBUG.

And if you use NDEBUG because you want to live on the edge and ignore 
possible problems, remember there's an "assert (p != NULL)" hidden 
before any pointer dereference, and you cannot disable that with NDEBUG. :)

Paolo

