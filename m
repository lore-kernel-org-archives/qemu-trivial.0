Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QZz8i-0001bv-5N
	for mharc-qemu-trivial@gnu.org; Fri, 24 Jun 2011 01:41:12 -0400
Received: from eggs.gnu.org ([140.186.70.92]:45265)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QZz8e-0001b3-8A
	for qemu-trivial@nongnu.org; Fri, 24 Jun 2011 01:41:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QZz8c-0003j9-OO
	for qemu-trivial@nongnu.org; Fri, 24 Jun 2011 01:41:08 -0400
Received: from mail-gx0-f173.google.com ([209.85.161.173]:39263)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1QZz8Y-0003it-Un; Fri, 24 Jun 2011 01:41:03 -0400
Received: by gxk26 with SMTP id 26so1319345gxk.4
	for <multiple recipients>; Thu, 23 Jun 2011 22:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=OltWIWTf6eHYwrxflrDGz8lPeg+Q4Z2OvQh71xIuFAs=;
	b=RxGrWFxx6LIAQ9BpTsUzBlIYpACCHOrHmfQGuGPEdwmM7KPFsRssiUrYHrKBIVeoPM
	/uzpu6KC+sN0aLmvJl+UKOUFPVcTpD3m9CQOl19RgZ92sjUDLwWvwhevWVUu8Xw4umEE
	tw3cqEYJm8IVsk4X+KZxn4uy/JAKCCAs4DflQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	b=OAiin8Eb7mwLtGy0cogEYPwhUr/JFceHaZFHgsgT9jm8cd4PiejT9f+CkWHl/oYIfp
	2GBjESusjAhz+t+YHyhek4ZjMr6DfzEMUzSbMjkAp/je5y7B9ipb8F6VsTo2VyT3NAmS
	uAHgxJEZ7Z7qrt9eUUFdfxFrWnPGHrfAONQ5I=
MIME-Version: 1.0
Received: by 10.236.180.68 with SMTP id i44mr4428630yhm.86.1308894061703; Thu,
	23 Jun 2011 22:41:01 -0700 (PDT)
Received: by 10.147.136.16 with HTTP; Thu, 23 Jun 2011 22:41:01 -0700 (PDT)
In-Reply-To: <4E034E79.5050901@mail.berlios.de>
References: <4E02F63E.3010908@web.de>
	<20110623133508.GF12698@stefanha-thinkpad.localdomain>
	<4E034E79.5050901@mail.berlios.de>
Date: Fri, 24 Jun 2011 06:41:01 +0100
Message-ID: <BANLkTikpwAVCpEdQzpBWLx=2CmkxXxEMAA@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <weil@mail.berlios.de>
Content-Type: text/plain; charset=ISO-8859-1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.161.173
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Jan Kiszka <jan.kiszka@web.de>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] Avoid double definitions of PRI*64
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
X-List-Received-Date: Fri, 24 Jun 2011 05:41:09 -0000

On Thu, Jun 23, 2011 at 3:32 PM, Stefan Weil <weil@mail.berlios.de> wrote:
> Am 23.06.2011 15:35, schrieb Stefan Hajnoczi:
>>
>> On Thu, Jun 23, 2011 at 10:15:58AM +0200, Jan Kiszka wrote:
>>>
>>> From: Jan Kiszka <jan.kiszka@siemens.com>
>>>
>>> Recent mingw32 provide those defines.
>
> ... and all of those defines are wrong, because QEMU does not use
> MS format specifiers. http://patchwork.ozlabs.org/patch/74276/
> tried to fix this. My preferred solution is removing those PRI*64 from
> qemu-common.h, because not only recent mingw32 versions provide
> the (wrong) definitions, but even the Debian version provides them
> (which is really old, but I use it for my regression tests).
>
> The wrong definitions do not allow using -Wformat for mingw32
> builds, but they work because (most?) relevant mingw32 functions
> accept both MS and standard format specifiers.
>
> Adding the correct definitions (to qemu-os-win32.h, not to qemu-common.h)
> would be another solution as long as mingw32 does not handle
> __USE_MINGW_ANSI_STDIO correctly.
>
>>>
>>> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
>>> ---
>>> qemu-common.h | 3 +++
>>> 1 files changed, 3 insertions(+), 0 deletions(-)
>>
>> It's never too late to implement C99!
>>
>> Thanks, applied to the trivial patches tree:
>> http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches
>>
>> Stefan
>
> Stefan, the patch won't harm, but it's also unnecessary.
> So it's up to you whether you remove it from your queue,
> modify it as I suggested above or apply it as it is.

Keeping those #defines unconditional prevents new mingw builds from
working, according to the commit description.  So we have to either
remove them entirely or do them correctly.  Dropping this patch will
keep the build from working.

I suggest we keep this patch.  A follow-up patch can us MS format
specifiers or do any other adjustments that make this work better.
Stefan, would you be able to send that patch?

Stefan

