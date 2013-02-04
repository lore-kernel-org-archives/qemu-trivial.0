Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U2KCv-0008R6-2W
	for mharc-qemu-trivial@gnu.org; Mon, 04 Feb 2013 06:27:29 -0500
Received: from eggs.gnu.org ([208.118.235.92]:32873)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chouteau@adacore.com>) id 1U2KCm-00083W-Ml
	for qemu-trivial@nongnu.org; Mon, 04 Feb 2013 06:27:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chouteau@adacore.com>) id 1U2KCi-0005pr-0V
	for qemu-trivial@nongnu.org; Mon, 04 Feb 2013 06:27:20 -0500
Received: from mel.act-europe.fr ([194.98.77.210]:48972)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chouteau@adacore.com>)
	id 1U2KCe-0005pK-PW; Mon, 04 Feb 2013 06:27:13 -0500
Received: from localhost (localhost [127.0.0.1])
	by filtered-smtp.eu.adacore.com (Postfix) with ESMTP id 1270D29003B;
	Mon,  4 Feb 2013 12:27:22 +0100 (CET)
X-Virus-Scanned: amavisd-new at eu.adacore.com
Received: from mel.act-europe.fr ([127.0.0.1])
	by localhost (smtp.eu.adacore.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lw780KmS2dtb; Mon,  4 Feb 2013 12:27:22 +0100 (CET)
Received: from [10.10.1.88] (pompomgalli.act-europe.fr [10.10.1.88])
	(using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
	(No client certificate requested)
	by mel.act-europe.fr (Postfix) with ESMTP id EFEB5290007;
	Mon,  4 Feb 2013 12:27:21 +0100 (CET)
Message-ID: <510F9B09.7030804@adacore.com>
Date: Mon, 04 Feb 2013 12:27:05 +0100
From: Fabien Chouteau <chouteau@adacore.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>
References: <1359738831-7232-1-git-send-email-chouteau@adacore.com>
	<20130204083900.GB5216@stefanha-thinkpad.redhat.com>
	<87k3qov047.fsf@blackfin.pond.sub.org>
In-Reply-To: <87k3qov047.fsf@blackfin.pond.sub.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 194.98.77.210
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
X-List-Received-Date: Mon, 04 Feb 2013 11:27:26 -0000

On 02/04/2013 11:34 AM, Markus Armbruster wrote:
> Stefan Hajnoczi <stefanha@redhat.com> writes:
> 
>> On Fri, Feb 01, 2013 at 06:13:51PM +0100, Fabien Chouteau wrote:
>>>
>>> Signed-off-by: Fabien Chouteau <chouteau@adacore.com>
>>> ---
>>>  block.c |   13 ++++++++++---
>>>  1 file changed, 10 insertions(+), 3 deletions(-)
>>
>> Hi Fabien,
>> Please always CC qemu-devel@nongnu.org.  All patches must be on
>> qemu-devel so that the community can review them - not everyone
>> subscribes to qemu-trivial.
>>
>> Thanks,
>> Stefan
>>
>>> diff --git a/block.c b/block.c
>>> index ba67c0d..3bf8eda 100644
>>> --- a/block.c
>>> +++ b/block.c
>>> @@ -428,9 +428,16 @@ int get_tmp_filename(char *filename, int size)
>>>      /* GetTempFileName requires that its output buffer (4th param)
>>>         have length MAX_PATH or greater.  */
>>>      assert(size >= MAX_PATH);
>>> -    return (GetTempPath(MAX_PATH, temp_dir)
>>> -            && GetTempFileName(temp_dir, "qem", 0, filename)
>>> -            ? 0 : -GetLastError());
>>> +    if (GetTempPath(MAX_PATH, temp_dir) == 0) {
>>> +        fprintf(stderr, "GetTempPath() error: %d\n", GetLastError());
>>> +        return -GetLastError();
>>> +    }
>>> +    if (GetTempFileName(temp_dir, "qem", 0, filename) == 0) {
>>> +        fprintf(stderr, "GetTempFileName(%s) error: %d\n", temp_dir,
>>> +                GetLastError());
>>> +        return -GetLastError();
>>> +    }
>>> +    return 0;
>>>  #else
>>>      int fd;
>>>      const char *tmpdir;
>
> get_tmp_filename() is not supposed to print to stderr, that's the
> caller's job.
>

Why? The caller doesn't know the difference between Windows/Linux
implementation. And the error handling would have to be duplicated.

It's not the first time I add error output in Windows code. Specially in
block/, when there's an error, the only thing you get is: "operation not
permitted". It's not very helpful and you have to dig in the code to
find which function failed.

-- 
Fabien Chouteau

