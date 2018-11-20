Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gPE5X-0007a9-6p
	for mharc-qemu-trivial@gnu.org; Tue, 20 Nov 2018 17:01:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54517)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1gPE5S-0007Xn-3k
	for qemu-trivial@nongnu.org; Tue, 20 Nov 2018 17:01:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1gPE5P-0003wt-Ow
	for qemu-trivial@nongnu.org; Tue, 20 Nov 2018 17:01:37 -0500
Received: from mx1.redhat.com ([209.132.183.28]:44543)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1gPE53-0003MI-Qd; Tue, 20 Nov 2018 17:01:15 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0836F81DE9;
	Tue, 20 Nov 2018 22:01:06 +0000 (UTC)
Received: from [10.10.121.142] (ovpn-121-142.rdu2.redhat.com [10.10.121.142])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CBBDD7D2E2;
	Tue, 20 Nov 2018 22:01:01 +0000 (UTC)
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>
References: <20181120203628.2367003-1-eblake@redhat.com>
	<cb5fbd50-0629-8afb-e1d4-cc3d1a94e057@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <1671d82c-da21-de1e-58c4-dd22696f9a62@redhat.com>
Date: Tue, 20 Nov 2018 16:01:00 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <cb5fbd50-0629-8afb-e1d4-cc3d1a94e057@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Tue, 20 Nov 2018 22:01:06 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] misc: Avoid UTF-8 in error
 messages
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
X-List-Received-Date: Tue, 20 Nov 2018 22:01:41 -0000

[adding Markus in CC, since git didn't do it automatically from the 
'Reported-by']

On 11/20/18 3:28 PM, John Snow wrote:
> 
> 
> On 11/20/18 3:36 PM, Eric Blake wrote:
>> While most developers are now using UTF-8 environments, it's
>> harder to guarantee that error messages will be output to
>> a multibyte locale. Rather than risking error messages that
>> get corrupted into mojibake when the user runs qemu in a
>> non-multibyte locale, let's stick to straight ASCII error
>> messages, rather than assuming that our use of UTF-8 in source
>> code string constants will work unchanged in other locales.
>>
>> Reported-by: Markus Armbruster <armbru@redhat.com>
>> Signed-off-by: Eric Blake <eblake@redhat.com>
>> ---
>>   hw/misc/tmp105.c | 2 +-
>>   hw/misc/tmp421.c | 2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)

> 
> Do we have any policy in place to prohibit this in the future?
> (Presumably a policy that is automatic and won't interfere with QEMU
> localization efforts which may rightly attempt to use UTF-8 for those
> locales.)

Not that I know of.

> 
> Do you have a script or trick to find utf-8 containing strings in our
> source?

Markus found these two, probably by reading over a list resulting from 
his claim of finding 217 out of 6455 files (53 of them binary, which 
don't count):
https://lists.gnu.org/archive/html/qemu-devel/2018-11/msg04017.html

My quick and dirty attempt, which does not quite reproduce his numbers:

$ LC_ALL=C git grep -l $'[\x80-\xff]' | wc
     279     279    7490

Thus, by forcing a unibyte locale (where encoding errors are impossible) 
with sane range expressions (POSIX says only the C locale is required to 
interpret regex ranges according to byte value - all bets are off in 
other locales) and using $'' to type non-UTF-8 bytes into my search, I 
found 279 files with at least one byte outside of ASCII.  But the use of 
-l has no easy way to filter which of those files are binary; while 
dropping -l claims 2138 "lines" with non-ASCII, which gets tedious to 
scroll through, especially considering there ARE binary files in the mix.

Narrowing the search to a more specific pattern:

$ LC_ALL=C git grep $'".*[\x80-\xff].*"' | grep -v 'Binary file' | wc
     129     685    8808

is a bit more manageable, with MOST of the hits in pc-bios/qemu.rsrc 
(false positive hits, due to interesting? comments), in po/ (which 
doesn't count), or in scripts/ for python.  And the proof for THIS patch:

$ LC_ALL=C git grep -l $'".*[\x80-\xff].*"' origin -- '**/*.[ch]' | cat
origin:hw/misc/tmp105.c
origin:hw/misc/tmp421.c

> 
> Only curious, don't hold this patch up on my account. I'm not raising a
> challenge.

Maybe checkpatch.pl could be taught to do a similar check?

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

