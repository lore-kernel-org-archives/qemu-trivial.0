Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U2L5v-0003w6-F1
	for mharc-qemu-trivial@gnu.org; Mon, 04 Feb 2013 07:24:19 -0500
Received: from eggs.gnu.org ([208.118.235.92]:44662)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1U2L5n-0003aV-Bp
	for qemu-trivial@nongnu.org; Mon, 04 Feb 2013 07:24:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1U2L5m-0003rj-99
	for qemu-trivial@nongnu.org; Mon, 04 Feb 2013 07:24:11 -0500
Received: from mx1.redhat.com ([209.132.183.28]:20214)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1U2L5h-0003q1-2Y; Mon, 04 Feb 2013 07:24:05 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r14CO3KG017213
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 4 Feb 2013 07:24:03 -0500
Received: from blackfin.pond.sub.org (ovpn-116-80.ams2.redhat.com
	[10.36.116.80])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r14CO10X003937; Mon, 4 Feb 2013 07:24:02 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 04CC4200AA; Mon,  4 Feb 2013 13:24:00 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Fabien Chouteau <chouteau@adacore.com>
References: <1359738831-7232-1-git-send-email-chouteau@adacore.com>
	<20130204083900.GB5216@stefanha-thinkpad.redhat.com>
	<87k3qov047.fsf@blackfin.pond.sub.org> <510F9B09.7030804@adacore.com>
Date: Mon, 04 Feb 2013 13:24:00 +0100
In-Reply-To: <510F9B09.7030804@adacore.com> (Fabien Chouteau's message of
	"Mon, 04 Feb 2013 12:27:05 +0100")
Message-ID: <87obg0s1wf.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, kwolf@redhat.com, qemu-devel@nongnu.org,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] get_tmp_filename: add
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
X-List-Received-Date: Mon, 04 Feb 2013 12:24:17 -0000

Fabien Chouteau <chouteau@adacore.com> writes:

> On 02/04/2013 11:34 AM, Markus Armbruster wrote:
>> Stefan Hajnoczi <stefanha@redhat.com> writes:
>> 
>>> On Fri, Feb 01, 2013 at 06:13:51PM +0100, Fabien Chouteau wrote:
>>>>
>>>> Signed-off-by: Fabien Chouteau <chouteau@adacore.com>
>>>> ---
>>>>  block.c |   13 ++++++++++---
>>>>  1 file changed, 10 insertions(+), 3 deletions(-)
>>>
>>> Hi Fabien,
>>> Please always CC qemu-devel@nongnu.org.  All patches must be on
>>> qemu-devel so that the community can review them - not everyone
>>> subscribes to qemu-trivial.
>>>
>>> Thanks,
>>> Stefan
>>>
>>>> diff --git a/block.c b/block.c
>>>> index ba67c0d..3bf8eda 100644
>>>> --- a/block.c
>>>> +++ b/block.c
>>>> @@ -428,9 +428,16 @@ int get_tmp_filename(char *filename, int size)
>>>>      /* GetTempFileName requires that its output buffer (4th param)
>>>>         have length MAX_PATH or greater.  */
>>>>      assert(size >= MAX_PATH);
>>>> -    return (GetTempPath(MAX_PATH, temp_dir)
>>>> -            && GetTempFileName(temp_dir, "qem", 0, filename)
>>>> -            ? 0 : -GetLastError());
>>>> +    if (GetTempPath(MAX_PATH, temp_dir) == 0) {
>>>> +        fprintf(stderr, "GetTempPath() error: %d\n", GetLastError());
>>>> +        return -GetLastError();
>>>> +    }
>>>> +    if (GetTempFileName(temp_dir, "qem", 0, filename) == 0) {
>>>> +        fprintf(stderr, "GetTempFileName(%s) error: %d\n", temp_dir,
>>>> +                GetLastError());
>>>> +        return -GetLastError();
>>>> +    }
>>>> +    return 0;
>>>>  #else
>>>>      int fd;
>>>>      const char *tmpdir;
>>
>> get_tmp_filename() is not supposed to print to stderr, that's the
>> caller's job.
>>
>
> Why? The caller doesn't know the difference between Windows/Linux
> implementation. And the error handling would have to be duplicated.

The function's (implied) contract is to return an error code without
printing anything.  If you want to change the contract to include
reporting the error, you need to implement it both for both arms of the
#ifdef.  You also have to demonstrate that all callers are happy with
the change of contract.

Regardless, printing to stderr is wrong.  The function can be called on
behalf of a monitor command, and then the error needs to be printed to
the correct monitor.  error_report() can do that for you, and more.

> It's not the first time I add error output in Windows code. Specially in
> block/, when there's an error, the only thing you get is: "operation not
> permitted". It's not very helpful and you have to dig in the code to
> find which function failed.

Good error reporting is hard.  Knowledge about the error and its context
gets lost as you move up the call chain.  Knowledge about how to report
errors gets lost as you move down.

