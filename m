Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WooQA-0005Mh-PG
	for mharc-qemu-trivial@gnu.org; Mon, 26 May 2014 02:30:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37064)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WooQ5-00058F-5a
	for qemu-trivial@nongnu.org; Mon, 26 May 2014 02:30:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WooQ0-0000xW-7a
	for qemu-trivial@nongnu.org; Mon, 26 May 2014 02:30:01 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:43557)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WooPq-0000rr-2J; Mon, 26 May 2014 02:29:46 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id D1CEC42F3F;
	Mon, 26 May 2014 10:29:44 +0400 (MSK)
Message-ID: <5382DF58.2030107@msgid.tls.msk.ru>
Date: Mon, 26 May 2014 10:29:44 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.5.0
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>
References: <1400878647-22176-1-git-send-email-mjt@msgid.tls.msk.ru>
	<87vbstawff.fsf@blackfin.pond.sub.org>
In-Reply-To: <87vbstawff.fsf@blackfin.pond.sub.org>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, alevy@redhat.com, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] libcacard: fix wrong array
	expansion logic
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
X-List-Received-Date: Mon, 26 May 2014 06:30:06 -0000

26.05.2014 10:25, Markus Armbruster wrote:
> Michael Tokarev <mjt@tls.msk.ru> writes:
> 
>> The currrent code in libcacard/vcard_emul_nss.c:vcard_emul_options()
>> has a weird bug in variable usage around expanding opts->vreader
>> array.
>>
>> There's a helper variable, vreaderOpt, which is first needlessly
>> initialized to NULL, next, conditionally, only we have to expand
>> opts->vreader, receives array expansion from g_renew() (initially
>> realloc), and next, even if we don't actually perform expansion,
> 
> I don't get the "(initially realloc)" part.  The sentence makes sense to
> me just fine without it, though.

I was in context of your patch which changes realloc() to g_renew().
And I failed to mention that this my patch is on top of yuors,
too - think of this comment as such a mention ;)

>> the value of this variable is assigned to the actual array,
>> opts->vreader, which was supposed to be expanded.
>>
>> So, since we expand the array by READER_STEP increments, only
>> once in READER_STEP (=4) the code will work, in other 3/4 times
>> it will fail badly.
>>
>> Fix this by not using this temp variable when expanding the
>> array, and by dropping the useless =NULL initializer too -
>> if it wasn't in place initially, compiler warned us about
> 
> "would have warned us"?

Oh yeah.  I tried to remember the right English construct, but
failed.  This tense always escpapes my mind for some reason :)


> Much more straightforward now.  Thanks!
> 
> Reviewed-by: Markus Armbruster <armbru@redhat.com>

Thank you.  I'll fix the comment.  And I'm now ready to push
whole -trivial.

/mjt


