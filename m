Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eKneJ-0007lb-VW
	for mharc-qemu-trivial@gnu.org; Fri, 01 Dec 2017 10:54:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57789)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1eKndC-0006pQ-Hf
	for qemu-trivial@nongnu.org; Fri, 01 Dec 2017 10:54:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1eKncW-0007PX-Ib
	for qemu-trivial@nongnu.org; Fri, 01 Dec 2017 10:53:38 -0500
Received: from mx1.redhat.com ([209.132.183.28]:35978)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1eKnau-00057u-Vp; Fri, 01 Dec 2017 10:51:17 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1AF3580476;
	Fri,  1 Dec 2017 07:31:31 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-118.ams2.redhat.com
	[10.36.116.118])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E0622600CC;
	Fri,  1 Dec 2017 07:31:30 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 73C4211386A9; Fri,  1 Dec 2017 08:31:29 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org,  qemu-trivial@nongnu.org
References: <20171130134159.9697-1-eblake@redhat.com>
	<20171130140154.11161-1-eblake@redhat.com>
	<04c922b4-7287-61e7-1afc-4e64f39c52a5@redhat.com>
Date: Fri, 01 Dec 2017 08:31:29 +0100
In-Reply-To: <04c922b4-7287-61e7-1afc-4e64f39c52a5@redhat.com> (Eric Blake's
	message of "Thu, 30 Nov 2017 11:00:58 -0600")
Message-ID: <87o9ni52ge.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Fri, 01 Dec 2017 07:31:31 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 4/3] checkpatch: Enforce
 proper do/while (0) style
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Dec 2017 15:54:46 -0000

Eric Blake <eblake@redhat.com> writes:

> On 11/30/2017 08:01 AM, Eric Blake wrote:
>> while (0) is only idiomatic in a macro definition, where the caller
>> will be supplying the trailing ';'.  Warn if the macro has a duplicate.
>>
>> Signed-off-by: Eric Blake <eblake@redhat.com>
>> ---
>>   scripts/checkpatch.pl | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
>> index 34df753571..acb66bff34 100755
>> --- a/scripts/checkpatch.pl
>> +++ b/scripts/checkpatch.pl
>> @@ -1622,6 +1622,11 @@ sub process {
>>   			}
>>   		}
>>
>> +# 'while (0);' is odd; only macros should use while (0), without trailing ;
>> +		if ($line =~ /while\s*\(0\);/) {
>
> Should this also check for uses of 'while (false);' ?

Do we think it's likely to occur?

> Interestingly enough, we have an instance of 'do/while (false);' in
> tests/vhost-user-bridge.c that is NOT in a macro, but is used for the
> convenience of being able to 'break;' out early rather than using a
> goto.  Similarly for chardev/char-serial.c using 'while (0);' outside
> of a macro.

That "cure" merely adds gratuitous cleverness to the "disease".

>              Those may be worth rewriting to use goto as separate
> patches if we want to restrict ALL use of 'while \((0|false)\);'

I'd support that.

