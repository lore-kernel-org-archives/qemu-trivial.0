Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U2JNj-0003yP-Ce
	for mharc-qemu-trivial@gnu.org; Mon, 04 Feb 2013 05:34:35 -0500
Received: from eggs.gnu.org ([208.118.235.92]:49750)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1U2JNc-0003kP-P6
	for qemu-trivial@nongnu.org; Mon, 04 Feb 2013 05:34:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1U2JNX-0007Jl-TB
	for qemu-trivial@nongnu.org; Mon, 04 Feb 2013 05:34:28 -0500
Received: from mx1.redhat.com ([209.132.183.28]:61984)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1U2JNU-0007JG-KZ; Mon, 04 Feb 2013 05:34:20 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r14AYIjc003249
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 4 Feb 2013 05:34:18 -0500
Received: from blackfin.pond.sub.org (ovpn-116-40.ams2.redhat.com
	[10.36.116.40])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r14AYGp1013283; Mon, 4 Feb 2013 05:34:17 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 49633200AA; Mon,  4 Feb 2013 11:34:16 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <1359738831-7232-1-git-send-email-chouteau@adacore.com>
	<20130204083900.GB5216@stefanha-thinkpad.redhat.com>
Date: Mon, 04 Feb 2013 11:34:16 +0100
In-Reply-To: <20130204083900.GB5216@stefanha-thinkpad.redhat.com> (Stefan
	Hajnoczi's message of "Mon, 4 Feb 2013 09:39:00 +0100")
Message-ID: <87k3qov047.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, kwolf@redhat.com, qemu-devel@nongnu.org
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
X-List-Received-Date: Mon, 04 Feb 2013 10:34:32 -0000

Stefan Hajnoczi <stefanha@redhat.com> writes:

> On Fri, Feb 01, 2013 at 06:13:51PM +0100, Fabien Chouteau wrote:
>> 
>> Signed-off-by: Fabien Chouteau <chouteau@adacore.com>
>> ---
>>  block.c |   13 ++++++++++---
>>  1 file changed, 10 insertions(+), 3 deletions(-)
>
> Hi Fabien,
> Please always CC qemu-devel@nongnu.org.  All patches must be on
> qemu-devel so that the community can review them - not everyone
> subscribes to qemu-trivial.
>
> Thanks,
> Stefan
>
>> diff --git a/block.c b/block.c
>> index ba67c0d..3bf8eda 100644
>> --- a/block.c
>> +++ b/block.c
>> @@ -428,9 +428,16 @@ int get_tmp_filename(char *filename, int size)
>>      /* GetTempFileName requires that its output buffer (4th param)
>>         have length MAX_PATH or greater.  */
>>      assert(size >= MAX_PATH);
>> -    return (GetTempPath(MAX_PATH, temp_dir)
>> -            && GetTempFileName(temp_dir, "qem", 0, filename)
>> -            ? 0 : -GetLastError());
>> +    if (GetTempPath(MAX_PATH, temp_dir) == 0) {
>> +        fprintf(stderr, "GetTempPath() error: %d\n", GetLastError());
>> +        return -GetLastError();
>> +    }
>> +    if (GetTempFileName(temp_dir, "qem", 0, filename) == 0) {
>> +        fprintf(stderr, "GetTempFileName(%s) error: %d\n", temp_dir,
>> +                GetLastError());
>> +        return -GetLastError();
>> +    }
>> +    return 0;
>>  #else
>>      int fd;
>>      const char *tmpdir;

get_tmp_filename() is not supposed to print to stderr, that's the
caller's job.

