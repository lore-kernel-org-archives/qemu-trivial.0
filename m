Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U4uph-0006jw-Jl
	for mharc-qemu-trivial@gnu.org; Mon, 11 Feb 2013 09:58:13 -0500
Received: from eggs.gnu.org ([208.118.235.92]:55681)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1U4upd-0006VY-1J
	for qemu-trivial@nongnu.org; Mon, 11 Feb 2013 09:58:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1U4upb-00028y-Qm
	for qemu-trivial@nongnu.org; Mon, 11 Feb 2013 09:58:08 -0500
Received: from mail-qa0-f45.google.com ([209.85.216.45]:47171)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1U4upT-00027U-LB; Mon, 11 Feb 2013 09:57:59 -0500
Received: by mail-qa0-f45.google.com with SMTP id g10so1203003qah.11
	for <multiple recipients>; Mon, 11 Feb 2013 06:57:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type:content-transfer-encoding;
	bh=X4dJeBmlTPUh4hdrss16MIW8YwWOswPm0AMOVIjPLDs=;
	b=iduW16NjuOjsO0UgyhK9epLofisImL/ESi6Jf1S0tqDgA9Jgdt812mCmbiNbuTK3zE
	7As+MVmecKFNlQgAWrLVXQ5fzo0wmIS58n7/wcfng0o5KexzmlkafFTsMXinMpldu/uh
	EPfy+6MiUyEyPhVw5uaRRpYwxTDU7E5OE3MkHY5BdY/Sf7l/Pw6Z8mK7kdS4qi880zpp
	pmWofPSs6l1WyrP44fDTRhAlIpTLxMS1cjIfxEOJzQbpDPFhFqmoYatmQsU7HnFxdwao
	khjvaS2sZDBiLnEd9S2fGqwcj8MHhQGO1o8yE3z4PuKW9umnHo1A/0jP+qBS8tp6QDDV
	Pq6g==
MIME-Version: 1.0
X-Received: by 10.224.60.13 with SMTP id n13mr5827151qah.47.1360594678812;
	Mon, 11 Feb 2013 06:57:58 -0800 (PST)
Received: by 10.49.119.168 with HTTP; Mon, 11 Feb 2013 06:57:58 -0800 (PST)
In-Reply-To: <CAFEAcA8FvkzDE2uV8bkStiFHzmhq+ERfa_ogXU7-HF8Wh90dhQ@mail.gmail.com>
References: <1360534332-6549-1-git-send-email-hpoussin@reactos.org>
	<20130211132727.GC6491@stefanha-thinkpad.redhat.com>
	<5118F322.709@redhat.com> <87k3qf9cg8.fsf@blackfin.pond.sub.org>
	<5118FDE9.2000101@suse.de>
	<CAFEAcA8FvkzDE2uV8bkStiFHzmhq+ERfa_ogXU7-HF8Wh90dhQ@mail.gmail.com>
Date: Mon, 11 Feb 2013 15:57:58 +0100
Message-ID: <CAJSP0QWpPAJ9kcfK9fwhDm0g1Zaf=5g7NH3jRcsaGUv3prAOCA@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.216.45
Cc: Kevin Wolf <kwolf@redhat.com>, Anthony Liguori <aliguori@us.ibm.com>,
	qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>, Blue Swirl <blauwirbel@gmail.com>,
	=?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
	=?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] ide: log error when trying
 to use ATAPI overlapping features
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
X-List-Received-Date: Mon, 11 Feb 2013 14:58:11 -0000

On Mon, Feb 11, 2013 at 3:34 PM, Peter Maydell <peter.maydell@linaro.org> w=
rote:
> On 11 February 2013 14:19, Andreas F=E4rber <afaerber@suse.de> wrote:
>> Am 11.02.2013 15:01, schrieb Markus Armbruster:
>>> Kevin Wolf <kwolf@redhat.com> writes:
>>>
>>>> Am 11.02.2013 14:27, schrieb Stefan Hajnoczi:
>>>>> I think we need to side-track this patch email to figure out what to
>>>>> use:
>>>>>
>>>>> fprintf(stderr) - some warnings/errors use this
>>>>> error_report() - goes to the monitor, if possible, otherwise stderr
>>>>
>>>> These look wrong to me.
>>>
>>> "Wrong" is a bit strong, in particular since there's ample precedence
>>> for these uses.
>
> Certainly for fprintf() I would say "deprecated" wherever
> we have a better API available.
>
>>>>> qemu_log_*() - goes to the qemu log, seems a little TCG-centric
>>>>
>>>> I would suggest either this or just trace points. (And by the way, it'=
s
>>>> a pity that -d is so TCG-centric, it's been more than once the reason
>>>> why I disabled KVM when debugging a guest... Having at least -d int
>>>> would be so useful.)
>>>
>>> Tracepoints don't really fit when we want to report the guest does
>>> something we don't handle.  Users deserve fair warning then, don't they=
?
>>>
>>> Could qemu_log() & friends be made fit for general use?  What's missing=
?
>>
>> Blue already did some work to make it more usable, and I believe Peter
>> adopted LOG_UNIMPL for ARM devices in place of hw_error()
>
> Yes; in particular where we have classes of error message which the
> user may wish to enable or disable (of which "QEMU doesn't implement
> this" and "the guest just did something that's probably a guest bug"
> are two common ones) qemu_log_mask(LOG_*, ...) is the preferred
> API for devices IMHO. So I think Herve's patch is entirely the
> right thing.

qemu_log_mask() can replace fprintf() but it needs to default to
stderr and a reasonable default mask.  It should be used for
non-monitor command errors and warnings.

Having said that, I think we should use hw_error() or fprintf() in
this patch until qemu_log_mask() replaces them.

Stefan

