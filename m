Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cdIzH-0008LV-VI
	for mharc-qemu-trivial@gnu.org; Mon, 13 Feb 2017 10:56:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60175)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1cdIzG-0008KE-86
	for qemu-trivial@nongnu.org; Mon, 13 Feb 2017 10:56:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1cdIzF-0004LW-0J
	for qemu-trivial@nongnu.org; Mon, 13 Feb 2017 10:56:22 -0500
Received: from mx1.redhat.com ([209.132.183.28]:40838)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <jsnow@redhat.com>)
	id 1cdIzA-0004KV-NC; Mon, 13 Feb 2017 10:56:16 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 02B3FA89D;
	Mon, 13 Feb 2017 15:56:16 +0000 (UTC)
Received: from scv.usersys.redhat.com (dhcp-17-221.bos.redhat.com
	[10.18.17.221])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v1DFuFgW030377; Mon, 13 Feb 2017 10:56:15 -0500
To: Stefan Hajnoczi <stefanha@gmail.com>
References: <20170208170533.28822-1-jsnow@redhat.com>
	<20170213150003.GO10361@stefanha-x1.localdomain>
Cc: qemu-trivial@nongnu.org, kwolf@redhat.com, qemu-devel@nongnu.org
From: John Snow <jsnow@redhat.com>
Message-ID: <ae6284d9-6776-6ae4-a041-06819d69d413@redhat.com>
Date: Mon, 13 Feb 2017 10:56:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <20170213150003.GO10361@stefanha-x1.localdomain>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Mon, 13 Feb 2017 15:56:16 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] ide: remove undefined
 behavior in ide-test
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
X-List-Received-Date: Mon, 13 Feb 2017 15:56:23 -0000



On 02/13/2017 10:00 AM, Stefan Hajnoczi wrote:
> On Wed, Feb 08, 2017 at 12:05:33PM -0500, John Snow wrote:
>> trivial: initialize the dirty buffer with a random-ish byte.
>> Stops valgrind from whining about uninitialized buffers.
>>
>> Signed-off-by: John Snow <jsnow@redhat.com>
>> ---
>>  tests/ide-test.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/tests/ide-test.c b/tests/ide-test.c
>> index 2fa97bc..139ebc0 100644
>> --- a/tests/ide-test.c
>> +++ b/tests/ide-test.c
>> @@ -550,6 +550,7 @@ static void make_dirty(uint8_t device)
>>  
>>      guest_buf = guest_alloc(guest_malloc, len);
>>      buf = g_malloc(len);
>> +    memset(buf, rand() % 255 + 1, len);
> 
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> 

Thanks.

This can go in through the next TRIVIAL pull, as my queue is otherwise
empty right now.

>>      g_assert(guest_buf);
>>      g_assert(buf);
> 
> Pre-existing issue:
> g_assert(buf) is unnecessary since g_malloc() is guaranteed to return
> non-NULL.
> 

Yeah, I did see that ...

