Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U4v2B-0005Fp-Kr
	for mharc-qemu-trivial@gnu.org; Mon, 11 Feb 2013 10:11:07 -0500
Received: from eggs.gnu.org ([208.118.235.92]:59933)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1U4v28-00058d-Fp
	for qemu-trivial@nongnu.org; Mon, 11 Feb 2013 10:11:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1U4v23-0005VI-Bk
	for qemu-trivial@nongnu.org; Mon, 11 Feb 2013 10:11:04 -0500
Received: from cantor2.suse.de ([195.135.220.15]:35294 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1U4v1u-0005Tc-D8; Mon, 11 Feb 2013 10:10:50 -0500
Received: from relay1.suse.de (unknown [195.135.220.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id 939ECA4C0E;
	Mon, 11 Feb 2013 16:10:49 +0100 (CET)
Message-ID: <511909F6.7060002@suse.de>
Date: Mon, 11 Feb 2013 16:10:46 +0100
From: =?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130105 Thunderbird/17.0.2
MIME-Version: 1.0
To: Stefan Hajnoczi <stefanha@gmail.com>
References: <1360534332-6549-1-git-send-email-hpoussin@reactos.org>
	<20130211132727.GC6491@stefanha-thinkpad.redhat.com>
	<5118F322.709@redhat.com> <87k3qf9cg8.fsf@blackfin.pond.sub.org>
	<5118FDE9.2000101@suse.de>
	<CAFEAcA8FvkzDE2uV8bkStiFHzmhq+ERfa_ogXU7-HF8Wh90dhQ@mail.gmail.com>
	<CAJSP0QWpPAJ9kcfK9fwhDm0g1Zaf=5g7NH3jRcsaGUv3prAOCA@mail.gmail.com>
In-Reply-To: <CAJSP0QWpPAJ9kcfK9fwhDm0g1Zaf=5g7NH3jRcsaGUv3prAOCA@mail.gmail.com>
X-Enigmail-Version: 1.5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 195.135.220.15
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
	Anthony Liguori <aliguori@us.ibm.com>,
	qemu-trivial <qemu-trivial@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
	Blue Swirl <blauwirbel@gmail.com>,
	=?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>
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
X-List-Received-Date: Mon, 11 Feb 2013 15:11:06 -0000

Am 11.02.2013 15:57, schrieb Stefan Hajnoczi:
> On Mon, Feb 11, 2013 at 3:34 PM, Peter Maydell <peter.maydell@linaro.or=
g> wrote:
>> On 11 February 2013 14:19, Andreas F=E4rber <afaerber@suse.de> wrote:
>>> Am 11.02.2013 15:01, schrieb Markus Armbruster:
>>>> Kevin Wolf <kwolf@redhat.com> writes:
>>>>
>>>>> Am 11.02.2013 14:27, schrieb Stefan Hajnoczi:
>>>>>> I think we need to side-track this patch email to figure out what =
to
>>>>>> use:
>>>>>>
>>>>>> fprintf(stderr) - some warnings/errors use this
>>>>>> error_report() - goes to the monitor, if possible, otherwise stder=
r
>>>>>
>>>>> These look wrong to me.
>>>>
>>>> "Wrong" is a bit strong, in particular since there's ample precedenc=
e
>>>> for these uses.
>>
>> Certainly for fprintf() I would say "deprecated" wherever
>> we have a better API available.
>>
>>>>>> qemu_log_*() - goes to the qemu log, seems a little TCG-centric
>>>>>
>>>>> I would suggest either this or just trace points. (And by the way, =
it's
>>>>> a pity that -d is so TCG-centric, it's been more than once the reas=
on
>>>>> why I disabled KVM when debugging a guest... Having at least -d int
>>>>> would be so useful.)
>>>>
>>>> Tracepoints don't really fit when we want to report the guest does
>>>> something we don't handle.  Users deserve fair warning then, don't t=
hey?
>>>>
>>>> Could qemu_log() & friends be made fit for general use?  What's miss=
ing?
>>>
>>> Blue already did some work to make it more usable, and I believe Pete=
r
>>> adopted LOG_UNIMPL for ARM devices in place of hw_error()
>>
>> Yes; in particular where we have classes of error message which the
>> user may wish to enable or disable (of which "QEMU doesn't implement
>> this" and "the guest just did something that's probably a guest bug"
>> are two common ones) qemu_log_mask(LOG_*, ...) is the preferred
>> API for devices IMHO. So I think Herve's patch is entirely the
>> right thing.
>=20
> qemu_log_mask() can replace fprintf() but it needs to default to
> stderr and a reasonable default mask.  It should be used for
> non-monitor command errors and warnings.
>=20
> Having said that, I think we should use hw_error() or fprintf() in
> this patch until qemu_log_mask() replaces them.

Nack. Like I just pointed out, hw_error() is a fatal abort and not a
replacement for logging. I don't mind which of the non-fatal logging
methods you choose, but guest-triggerable aborting is a semantic change
that we should not choose just because someone doesn't like logging API
or defaults. Especially not for 1.4.

Regards,
Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

