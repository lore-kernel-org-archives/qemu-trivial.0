Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WnwZa-0007QX-AT
	for mharc-qemu-trivial@gnu.org; Fri, 23 May 2014 17:00:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49351)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WnwZU-0007Fo-Pg
	for qemu-trivial@nongnu.org; Fri, 23 May 2014 17:00:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WnwZP-0007qu-Sc
	for qemu-trivial@nongnu.org; Fri, 23 May 2014 17:00:08 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:60101)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WnwZE-0007ai-8U; Fri, 23 May 2014 16:59:52 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 3072042B94;
	Sat, 24 May 2014 00:59:51 +0400 (MSK)
Message-ID: <537FB6C7.5000900@msgid.tls.msk.ru>
Date: Sat, 24 May 2014 00:59:51 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.5.0
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>
References: <1399569594-31678-1-git-send-email-mjt@msgid.tls.msk.ru>	<536F2DC0.9080809@redhat.com>
	<536F6180.1010905@msgid.tls.msk.ru>
	<87mwenz734.fsf@blackfin.pond.sub.org>
In-Reply-To: <87mwenz734.fsf@blackfin.pond.sub.org>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Alon Levy <alevy@redhat.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] libcacard: remove useless
 initializers
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
X-List-Received-Date: Fri, 23 May 2014 21:00:13 -0000

So, should we apply this or not?  It's been waiting for quite some time,
and during this time we've found a very good example of why it should
be applied (I think anyway).

Thanks,

/mjt


12.05.2014 13:20, Markus Armbruster wrote:
> Michael Tokarev <mjt@tls.msk.ru> writes:
> 
>> 11.05.2014 11:58, Alon Levy wrote:
>>> On 05/08/2014 08:19 PM, Michael Tokarev wrote:
>>>> libcacard has many functions which initializes local variables
>>>> at declaration time, which are always assigned some values later
>>>> (often right after declaration).  Clean up these initializers.
>>>
>>> How is this an improvement? Doesn't the compiler ignore this anyhow?
>>
>> Just less code.
>>
>> To me, when I see something like
>>
>>   Type *var = NULL;
>>
>> in a function, it somehow "translates" to a construct like
>>
>>   Type *found = NULL;
>>
>> That is -- so this variable will be used either as an accumulator
>> or a search result, so that initial value is really important.
>>
>> So when I see the same variable receives its initial value in
>> the next line, I start wondering what's missed in the code which
>> should be there.  Or why I don't read the code correctly.  Or
>> something like this.
>>
>> So, basically, this is a cleanup patch just to avoid confusion,
>> it most likely not needed for current compiler who can figure
>> it out by its own.  And for consistency - why not initialize
>> other variables too?
> 
> I hate redundant initializers for yet another reason: when I change the
> code, and accidentally add a path bypassing the *real* initialization, I
> don't get a "may be used uninitialized" warning, I get the stupid
> redundant initialization and quite possibly a crash to debug some time
> later.
> 
>> Maybe that's just my old-scool mind works this way.
>>
>> At any rate you can just ignore this patch.
> 
> Please consider it.
> 


