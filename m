Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RJh3A-0006ep-U4
	for mharc-qemu-trivial@gnu.org; Fri, 28 Oct 2011 03:40:24 -0400
Received: from eggs.gnu.org ([140.186.70.92]:52325)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1RJh38-0006XC-JM
	for qemu-trivial@nongnu.org; Fri, 28 Oct 2011 03:40:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1RJh37-0007U3-Hf
	for qemu-trivial@nongnu.org; Fri, 28 Oct 2011 03:40:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:61773)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1RJh35-0007Tf-1G; Fri, 28 Oct 2011 03:40:19 -0400
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p9S7e8q8012080
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 28 Oct 2011 03:40:15 -0400
Received: from blackfin.pond.sub.org (ovpn-116-20.ams2.redhat.com
	[10.36.116.20])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p9S7e6r3026805; Fri, 28 Oct 2011 03:40:07 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 500)
	id 61A936006D; Fri, 28 Oct 2011 09:40:06 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
References: <1319487523-19978-1-git-send-email-sw@weilnetz.de>
	<20111026125431.GC27267@stefanha-thinkpad.localdomain>
Date: Fri, 28 Oct 2011 09:40:06 +0200
In-Reply-To: <20111026125431.GC27267@stefanha-thinkpad.localdomain> (Stefan
	Hajnoczi's message of "Wed, 26 Oct 2011 13:54:31 +0100")
Message-ID: <m3obx1y36x.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Fix compiler warning
	(always return a value)
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
X-List-Received-Date: Fri, 28 Oct 2011 07:40:23 -0000

Stefan Hajnoczi <stefanha@gmail.com> writes:

> On Mon, Oct 24, 2011 at 10:18:43PM +0200, Stefan Weil wrote:
>> For compilations with -DNDEBUG, the default case did not return
>> a value which caused a compiler warning.
>> 
>> Signed-off-by: Stefan Weil <sw@weilnetz.de>
>> ---
>>  hw/ppce500_spin.c |   11 ++++++++---
>>  1 files changed, 8 insertions(+), 3 deletions(-)
>> 
>> diff --git a/hw/ppce500_spin.c b/hw/ppce500_spin.c
>> index cccd940..5b5ffe0 100644
>> --- a/hw/ppce500_spin.c
>> +++ b/hw/ppce500_spin.c
>> @@ -168,17 +168,22 @@ static uint64_t spin_read(void *opaque, target_phys_addr_t addr, unsigned len)
>>  {
>>      SpinState *s = opaque;
>>      uint8_t *spin_p = &((uint8_t*)s->spin)[addr];
>> +    uint64_t result = 0;
>>  
>>      switch (len) {
>>      case 1:
>> -        return ldub_p(spin_p);
>> +        result = ldub_p(spin_p);
>> +        break;
>>      case 2:
>> -        return lduw_p(spin_p);
>> +        result = lduw_p(spin_p);
>> +        break;
>>      case 4:
>> -        return ldl_p(spin_p);
>> +        result = ldl_p(spin_p);
>> +        break;
>>      default:
>>          assert(0);
>
> I would replace assert(3) with abort(3).  If this ever happens the
> program is broken - returning 0 instead of an undefined value doesn't
> help.

Why is it useful to make failed assertions stop the program regardless
of NDEBUG only when the assertion happens to be "can't reach"?

If you worry about assertions failing, don't compile with -DNDEBUG.

"Doctor, it hurts when I disable assertions!"
"Don't disable them, then."
;-P

