Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WQIrw-0002Yy-G3
	for mharc-qemu-trivial@gnu.org; Wed, 19 Mar 2014 11:57:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47126)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1WQIro-0002PW-Up
	for qemu-trivial@nongnu.org; Wed, 19 Mar 2014 11:57:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1WQIri-0004ng-MO
	for qemu-trivial@nongnu.org; Wed, 19 Mar 2014 11:57:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35388)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1WQIrW-0004m8-69; Wed, 19 Mar 2014 11:57:02 -0400
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s2JFv1rH027366
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 19 Mar 2014 11:57:01 -0400
Received: from blackfin.pond.sub.org (ovpn-116-31.ams2.redhat.com
	[10.36.116.31])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s2JFux8g031426
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 19 Mar 2014 11:57:00 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id E09EC200D1; Wed, 19 Mar 2014 16:56:58 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
References: <1395162223-28733-1-git-send-email-pbonzini@redhat.com>
	<874n2vcpu9.fsf@blackfin.pond.sub.org> <53294155.8040403@redhat.com>
	<87d2hi4ktz.fsf@blackfin.pond.sub.org> <5329918C.8090403@redhat.com>
	<5329A209.5000308@redhat.com> <5329B073.9030907@redhat.com>
Date: Wed, 19 Mar 2014 16:56:58 +0100
In-Reply-To: <5329B073.9030907@redhat.com> (Paolo Bonzini's message of "Wed,
	19 Mar 2014 15:57:55 +0100")
Message-ID: <87siqerxkl.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] scripts: add sample model
	file for Coverity Scan
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
X-List-Received-Date: Wed, 19 Mar 2014 15:57:27 -0000

Paolo Bonzini <pbonzini@redhat.com> writes:

> Il 19/03/2014 14:56, Paolo Bonzini ha scritto:
>> Il 19/03/2014 13:46, Paolo Bonzini ha scritto:
>>> Il 19/03/2014 10:08, Markus Armbruster ha scritto:
>>>>> It probably would make static analysis a bit less powerful or will
>>>>> return more false positives.  The NULL return for realloc (in the
>>>>> "free" case) already causes some.  So I'm undecided between a more
>>>>> correct model and a more selective one (with a fat comment).
>>>>
>>>> I can't see how lying to the analyzer could make it more powerful :)
>>>> It can, however, suppress false positives.  Scan and find out how many?
>>>
>>> Full model (g_malloc returns NULL for 0 argument) => 750 defects
>>>
>>> Posted model (g_malloc never returns NULL)        => 702 defects
>>>         -59 NULL_RETURNS defects
>>>          -1 REVERSE_INULL defects
>>>         +12 TAINTED_SCALAR defects
>>>
>>> Reduced model (g_realloc never frees)             => 690 defects
>>>         -12 NULL_RETURNS defects
>>>
>>> Of course, silly me, I threw away the results of the analysis for the
>>> full model.  I'll now rerun it and look for false negatives caused by
>>> the reduced model.
>>
>> For the REVERSE_INULL and TAINTED_SCALAR defects, I don't see why the
>> model should make any difference.  The missing REVERSE_INULL becomes a
>> false-negative.  The new TAINTED_SCALAR were false negatives.

REVERSE_INULL is a null check after a dereference.  Pretending
g_malloc() never returns a null pointer can conceivably create false
negatives: Coverity flags a null check as REVERSE_INULL even though it's
necessary.  This should be rare, because checking for null return value
instead of zero size argument is unnatural.

I can't explain offhand how the TAINTED_SCALAR get unmasked.

>> I checked ~10 of the NULL_RETURNS and they are all false positives.
>> Either the argument really cannot be zero, or it is asserted that it is
>> not zero before accessing the array, or the array access is within a for
>> loop that will never roll if the size was zero.

I've seen a few like these myself.  Coverity isn't quite smart enough to
prove non-zero size, and then non-null return value.

>>
>> Examples:
>>
>> 1) gencb_alloc (and a few others have the same idiom) gets a length,
>> allocates a block of the given length, and fills in the beginning of
>> that block.  It's arguably missing an assertion that the length is
>> good-enough.  No reason for this to be tied to NULL_RETURNS, but in
>> practice it is.
>>
>>
>> 2) This only gets zero if there is an overflow, since dma->memmap_size
>> is initialized to zero.  But Coverity flags it as a possible NULL return:
>>
>> 316          dma->memmap = g_realloc(dma->memmap, sizeof(*entry) *
>> 317                          (dma->memmap_size + 1));

g_renew(struct memmap_entry_s, dma->memmap, dma->memmap_size + 1)

One overflow less to worry about.  I'd give sich transformations a try
if getting tree-wide cleanups committed wasn't such an impossible pain.
Oh well, we can fix 'em one CVE at a time.

>> 3) vnc_dpy_cursor_define calls g_malloc0(vd->cursor_msize), which
>> returns NULL if the array has size 0.  Coverity complains because
>> cursor_get_mono_mask calls memset on the result, but we already rely
>> elsewhere on that not happening for len == 0.
>>
>>
>> I think we're well into diminishing returns, which justifies using the
>> less-precise model.
>>
>> I'm now adding new models for memset/memcpy/memmove/memcmp that check
>> for non-zero argument, and see what that improves with respect to the
>> full and reduced models.
>
> Doing this only fixes one false positive.

Coverity comes with models for all four (see its
library/generic/libc/all/all.c).  I'm surprised you adding your own
models has any positive effect.

>                                            Given the results, okay to
> use the limited model where realloc never frees and malloc(0) returns
> non-NULL?

I'd describe realloc() as "always frees the old block, returns a new
block, which is never null".  We might mean the same.

Go ahead with the lying^Wlimited model, with a big, fat comment
explaining our reasons.

