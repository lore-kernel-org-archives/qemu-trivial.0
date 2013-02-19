Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U7kRI-0001fF-Sf
	for mharc-qemu-trivial@gnu.org; Tue, 19 Feb 2013 05:28:44 -0500
Received: from eggs.gnu.org ([208.118.235.92]:38337)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chouteau@adacore.com>) id 1U7kRF-0001Xq-O3
	for qemu-trivial@nongnu.org; Tue, 19 Feb 2013 05:28:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chouteau@adacore.com>) id 1U7kRE-0005F9-Kx
	for qemu-trivial@nongnu.org; Tue, 19 Feb 2013 05:28:41 -0500
Received: from mel.act-europe.fr ([194.98.77.210]:48132)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chouteau@adacore.com>)
	id 1U7kR3-0005C3-6B; Tue, 19 Feb 2013 05:28:29 -0500
Received: from localhost (localhost [127.0.0.1])
	by filtered-smtp.eu.adacore.com (Postfix) with ESMTP id 7B950290041;
	Tue, 19 Feb 2013 11:28:27 +0100 (CET)
X-Virus-Scanned: amavisd-new at eu.adacore.com
Received: from mel.act-europe.fr ([127.0.0.1])
	by localhost (smtp.eu.adacore.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xLGrLHSOuOQH; Tue, 19 Feb 2013 11:28:27 +0100 (CET)
Received: from [10.10.1.88] (pompomgalli.act-europe.fr [10.10.1.88])
	(using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
	(No client certificate requested)
	by mel.act-europe.fr (Postfix) with ESMTP id 20947290006;
	Tue, 19 Feb 2013 11:28:27 +0100 (CET)
Message-ID: <512353C9.9070108@adacore.com>
Date: Tue, 19 Feb 2013 11:28:25 +0100
From: Fabien Chouteau <chouteau@adacore.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>
References: <1360160243-31611-1-git-send-email-chouteau@adacore.com>
	<87hal98to6.fsf@blackfin.pond.sub.org>
In-Reply-To: <87hal98to6.fsf@blackfin.pond.sub.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 194.98.77.210
Cc: qemu-trivial@nongnu.org, kwolf@redhat.com, qemu-devel@nongnu.org,
	stefanha@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH V2] get_tmp_filename: add
 explicit error message
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
X-List-Received-Date: Tue, 19 Feb 2013 10:28:43 -0000

On 02/18/2013 05:37 PM, Markus Armbruster wrote:
> I agree with you that the existing error reporting is too unspecific in
> many cases, and I applaud your attempt to do something about it, but I'm
> afraid this patch creates as many problems as it solves.  Details below.
>
>
> In my review of v1, I wrote "The function's (implied) contract is to
> return an error code without printing anything.  If you want to change
> the contract to include reporting the error, you [...] have to
> demonstrate that all callers are happy with the change of contract."  So
> let's check the two callers of get_tmp_filename():
>
> 1. bdrv_open()
>
>    Complex function, can fail in many ways.  Returns an error code.
>    Does not report errors; that's left to its callers.
>
>    Your patch effectively changes bdrv_open() to report the error in one
>    of its failure modes.
>
>    For callers that report bdrv_open() failure to the user, we then get
>    two error messages: the one you add, followed by a less specific one
>    from further up the call chain.  Reporting the same error multiple
>    times is not nice.

It seems that your point of view is very Linux centric, on Windows we
didn't get any error message, just "Operation not permitted" for every
error in bdrv_open. I've spent 15 mins trying to find the exact location
of the error, going into the complex call tree of bdrv, and it's not the
first time.

Maybe I should just put the error message in the Windows code. So it
doesn't duplicate on Linux.

>
>    For callers that neglect to report bdrv_open() failure to the user
>    even though they should (if such buggy callers exist), you fix the
>    problem for one failure mode only.

One could say that it's already something. I'd like to have the time to
add error messages for all possible failures, but unfortunately I don't.

BTW, it looks likes a common rule in Qemu, we never check the error code
from Win32 API (maybe because there's no way to efficiently report those
errors).

> Apart from these fundamental gaps, the new error message needs polish.
> Say mkstemp() fails ENOSPC.  Gets reported roughly like this:
>
>     qemu-system-x86_64: -drive file=f16.img: get_tmp_filename: mkstemp() error: No space left on device
>     qemu-system-x86_64: -drive file=f16.img: could not open disk image f16.img: No space left on device
>
> The second message talks to the user in user terms.  That's proper.  The
> first one talks source code instead.  From a user's point of view,
> "get_tmp_filename" and "mkstemp() error" are gobbledygook.  At best,
> they can help him guessing what the problem might be.
>

I know this error message is not user friendly, but (again) it's still
better than 15 mins of digging in the code...

I don't want to spend much time on this small issue. If you consider
that it creates more problems than is solves, that's fine. I understand
your concerns and wanted to expose mine. Anyway the patch will remain in
our branch until a better solution is found.

Regards,

-- 
Fabien Chouteau

