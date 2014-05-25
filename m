Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WoVSV-0003GV-KF
	for mharc-qemu-trivial@gnu.org; Sun, 25 May 2014 06:15:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49731)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alevy@redhat.com>) id 1WoVSO-0003F4-ID
	for qemu-trivial@nongnu.org; Sun, 25 May 2014 06:15:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alevy@redhat.com>) id 1WoVSJ-0003QZ-KU
	for qemu-trivial@nongnu.org; Sun, 25 May 2014 06:15:08 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33610)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alevy@redhat.com>)
	id 1WoVSJ-0003Ot-Bm; Sun, 25 May 2014 06:15:03 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s4PAF1bA020303
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Sun, 25 May 2014 06:15:01 -0400
Received: from blues.lan (vpn1-7-198.ams2.redhat.com [10.36.7.198])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s4PAEouO008115
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO);
	Sun, 25 May 2014 06:14:59 -0400
Message-ID: <5381C299.7080709@redhat.com>
Date: Sun, 25 May 2014 13:14:49 +0300
From: Alon Levy <alevy@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>, Markus Armbruster <armbru@redhat.com>
References: <1399569594-31678-1-git-send-email-mjt@msgid.tls.msk.ru>	<536F2DC0.9080809@redhat.com>	<536F6180.1010905@msgid.tls.msk.ru>	<87mwenz734.fsf@blackfin.pond.sub.org>
	<537FB6C7.5000900@msgid.tls.msk.ru>
In-Reply-To: <537FB6C7.5000900@msgid.tls.msk.ru>
X-Enigmail-Version: 1.6
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
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
X-List-Received-Date: Sun, 25 May 2014 10:15:13 -0000

On 05/23/2014 11:59 PM, Michael Tokarev wrote:
> So, should we apply this or not?  It's been waiting for quite some time,
> and during this time we've found a very good example of why it should
> be applied (I think anyway).

I'm fine with applying it, I changed my mind.

> 
> Thanks,
> 
> /mjt
> 
> 
> 12.05.2014 13:20, Markus Armbruster wrote:
>> Michael Tokarev <mjt@tls.msk.ru> writes:
>>
>>> 11.05.2014 11:58, Alon Levy wrote:
>>>> On 05/08/2014 08:19 PM, Michael Tokarev wrote:
>>>>> libcacard has many functions which initializes local variables
>>>>> at declaration time, which are always assigned some values later
>>>>> (often right after declaration).  Clean up these initializers.
>>>>
>>>> How is this an improvement? Doesn't the compiler ignore this anyhow?
>>>
>>> Just less code.
>>>
>>> To me, when I see something like
>>>
>>>   Type *var = NULL;
>>>
>>> in a function, it somehow "translates" to a construct like
>>>
>>>   Type *found = NULL;
>>>
>>> That is -- so this variable will be used either as an accumulator
>>> or a search result, so that initial value is really important.
>>>
>>> So when I see the same variable receives its initial value in
>>> the next line, I start wondering what's missed in the code which
>>> should be there.  Or why I don't read the code correctly.  Or
>>> something like this.
>>>
>>> So, basically, this is a cleanup patch just to avoid confusion,
>>> it most likely not needed for current compiler who can figure
>>> it out by its own.  And for consistency - why not initialize
>>> other variables too?
>>
>> I hate redundant initializers for yet another reason: when I change the
>> code, and accidentally add a path bypassing the *real* initialization, I
>> don't get a "may be used uninitialized" warning, I get the stupid
>> redundant initialization and quite possibly a crash to debug some time
>> later.
>>
>>> Maybe that's just my old-scool mind works this way.
>>>
>>> At any rate you can just ignore this patch.
>>
>> Please consider it.
>>
> 
> 


