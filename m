Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U7lu2-0006OJ-OV
	for mharc-qemu-trivial@gnu.org; Tue, 19 Feb 2013 07:02:30 -0500
Received: from eggs.gnu.org ([208.118.235.92]:34675)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1U7lu0-0006HW-Ae
	for qemu-trivial@nongnu.org; Tue, 19 Feb 2013 07:02:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1U7ltv-0006Bd-Hp
	for qemu-trivial@nongnu.org; Tue, 19 Feb 2013 07:02:28 -0500
Received: from mx1.redhat.com ([209.132.183.28]:48477)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1U7ltk-00068V-Ju; Tue, 19 Feb 2013 07:02:12 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r1JC27WT008409
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 19 Feb 2013 07:02:07 -0500
Received: from blackfin.pond.sub.org (ovpn-116-35.ams2.redhat.com
	[10.36.116.35])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r1JC25td028154; Tue, 19 Feb 2013 07:02:06 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 0515A200AF; Tue, 19 Feb 2013 13:01:09 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Fabien Chouteau <chouteau@adacore.com>
References: <1360160243-31611-1-git-send-email-chouteau@adacore.com>
	<87hal98to6.fsf@blackfin.pond.sub.org> <512353C9.9070108@adacore.com>
Date: Tue, 19 Feb 2013 13:01:09 +0100
In-Reply-To: <512353C9.9070108@adacore.com> (Fabien Chouteau's message of
	"Tue, 19 Feb 2013 11:28:25 +0100")
Message-ID: <87fw0sikca.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
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
X-List-Received-Date: Tue, 19 Feb 2013 12:02:29 -0000

Fabien Chouteau <chouteau@adacore.com> writes:

> On 02/18/2013 05:37 PM, Markus Armbruster wrote:
>> I agree with you that the existing error reporting is too unspecific in
>> many cases, and I applaud your attempt to do something about it, but I'm
>> afraid this patch creates as many problems as it solves.  Details below.
>>
>>
>> In my review of v1, I wrote "The function's (implied) contract is to
>> return an error code without printing anything.  If you want to change
>> the contract to include reporting the error, you [...] have to
>> demonstrate that all callers are happy with the change of contract."  So
>> let's check the two callers of get_tmp_filename():
>>
>> 1. bdrv_open()
>>
>>    Complex function, can fail in many ways.  Returns an error code.
>>    Does not report errors; that's left to its callers.
>>
>>    Your patch effectively changes bdrv_open() to report the error in one
>>    of its failure modes.
>>
>>    For callers that report bdrv_open() failure to the user, we then get
>>    two error messages: the one you add, followed by a less specific one
>>    from further up the call chain.  Reporting the same error multiple
>>    times is not nice.
>
> It seems that your point of view is very Linux centric, on Windows we
> didn't get any error message, just "Operation not permitted" for every
> error in bdrv_open.

Sounds like a bug, namely bdrv_open() returning bogus error codes on
Windows at least for some failures.

>                     I've spent 15 mins trying to find the exact location
> of the error, going into the complex call tree of bdrv, and it's not the
> first time.

Yes, the error reporting is really unhelpful in many cases, and not just
under Windows.

> Maybe I should just put the error message in the Windows code. So it
> doesn't duplicate on Linux.
>
>>
>>    For callers that neglect to report bdrv_open() failure to the user
>>    even though they should (if such buggy callers exist), you fix the
>>    problem for one failure mode only.
>
> One could say that it's already something. I'd like to have the time to
> add error messages for all possible failures, but unfortunately I don't.
>
> BTW, it looks likes a common rule in Qemu, we never check the error code
> from Win32 API (maybe because there's no way to efficiently report those
> errors).

I doubt there are fundamental difficulties with the Windows API.  No,
the root problem with QEMU under Windows is lack of maintainers.  Until
somebody cares enough to take on Windows maintenance, it'll continue to
languish.

>> Apart from these fundamental gaps, the new error message needs polish.
>> Say mkstemp() fails ENOSPC.  Gets reported roughly like this:
>>
>>     qemu-system-x86_64: -drive file=f16.img: get_tmp_filename:
>> mkstemp() error: No space left on device
>>     qemu-system-x86_64: -drive file=f16.img: could not open disk
>> image f16.img: No space left on device
>>
>> The second message talks to the user in user terms.  That's proper.  The
>> first one talks source code instead.  From a user's point of view,
>> "get_tmp_filename" and "mkstemp() error" are gobbledygook.  At best,
>> they can help him guessing what the problem might be.
>>
>
> I know this error message is not user friendly, but (again) it's still
> better than 15 mins of digging in the code...

No argument :)

> I don't want to spend much time on this small issue. If you consider
> that it creates more problems than is solves, that's fine. I understand
> your concerns and wanted to expose mine. Anyway the patch will remain in
> our branch until a better solution is found.

Fair enough & thanks for doing as much as you did.

