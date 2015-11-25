Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1a1bpo-0005NB-63
	for mharc-qemu-trivial@gnu.org; Wed, 25 Nov 2015 10:18:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36002)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1a1bpl-0005JN-3h
	for qemu-trivial@nongnu.org; Wed, 25 Nov 2015 10:18:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1a1bpg-000680-SS
	for qemu-trivial@nongnu.org; Wed, 25 Nov 2015 10:18:12 -0500
Received: from mx1.redhat.com ([209.132.183.28]:43668)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>)
	id 1a1bpU-00063q-Lp; Wed, 25 Nov 2015 10:17:56 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 13A88157730;
	Wed, 25 Nov 2015 15:17:56 +0000 (UTC)
Received: from scv.usersys.redhat.com (vpn-60-227.rdu2.redhat.com
	[10.10.60.227])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tAPFHtOb015349; Wed, 25 Nov 2015 10:17:55 -0500
To: Markus Armbruster <armbru@redhat.com>
References: <1448407631-9405-1-git-send-email-jsnow@redhat.com>
	<871tbeijay.fsf@blackfin.pond.sub.org>
From: John Snow <jsnow@redhat.com>
X-Enigmail-Draft-Status: N1110
Message-ID: <5655D122.8010601@redhat.com>
Date: Wed, 25 Nov 2015 10:17:54 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <871tbeijay.fsf@blackfin.pond.sub.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, jcody@redhat.com, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [trivial for-2.6] util/id: fully
 allocate names table
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
X-List-Received-Date: Wed, 25 Nov 2015 15:18:14 -0000



On 11/25/2015 03:18 AM, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
> 
>> Trivial: this array should be allocated to have ID_MAX entries always.
>> Otherwise if someone were to forget to expand this table, the assertion
>> in the id generator won't actually trigger; it will read junk data.
> 
> You mean this one:
> 
>     assert(id < ID_MAX);
> 

Well, sort of. I meant 'assert(id_subsys_str[id])' itself. If you forget
to expand the list (It happened to a friend of mine) this assert will
pass because it reads garbage.

If you just always expand the full table, though, it will catch you
(Err, my friend) being a dummy a little more nicely.

My thought is we need both the range and presence checks.
I'll v2 it, thanks.

--js

> The assertion is crap, because it fails to protect array access
> id_subsys_str[id].  Here's one that does:
> 
>     assert(0 <= id && id < ARRAY_SIZE(id_subsys_str));
> 
>> Signed-off-by: John Snow <jsnow@redhat.com>
>> ---
>>  util/id.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/util/id.c b/util/id.c
>> index bcc64d8..b7ca4d2 100644
>> --- a/util/id.c
>> +++ b/util/id.c
>> @@ -29,7 +29,7 @@ bool id_wellformed(const char *id)
>>  
>>  #define ID_SPECIAL_CHAR '#'
>>  
>> -static const char *const id_subsys_str[] = {
>> +static const char *const id_subsys_str[ID_MAX] = {
>>      [ID_QDEV]  = "qdev",
>>      [ID_BLOCK] = "block",
>>  };

