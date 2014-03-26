Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WSptx-0004Iy-Jl
	for mharc-qemu-trivial@gnu.org; Wed, 26 Mar 2014 11:38:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44410)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1WSptp-00046A-LW
	for qemu-trivial@nongnu.org; Wed, 26 Mar 2014 11:37:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1WSptj-0008J6-I7
	for qemu-trivial@nongnu.org; Wed, 26 Mar 2014 11:37:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:24783)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1WSptV-0007ve-FY; Wed, 26 Mar 2014 11:37:33 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s2QFbWYH029218
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 26 Mar 2014 11:37:32 -0400
Received: from blackfin.pond.sub.org (ovpn-116-44.ams2.redhat.com
	[10.36.116.44])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s2QFbULY025180
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 26 Mar 2014 11:37:31 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 9F4E1200D1; Wed, 26 Mar 2014 16:37:29 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
References: <1395247965-13889-1-git-send-email-pbonzini@redhat.com>
	<5329D4B7.4090602@redhat.com> <5329F406.7040606@redhat.com>
	<874n2tgw9h.fsf@blackfin.pond.sub.org> <532AE69E.4070502@redhat.com>
Date: Wed, 26 Mar 2014 16:37:29 +0100
In-Reply-To: <532AE69E.4070502@redhat.com> (Paolo Bonzini's message of "Thu,
	20 Mar 2014 14:01:18 +0100")
Message-ID: <87a9cd3r9i.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] scripts: add sample
	model file for Coverity Scan
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
X-List-Received-Date: Wed, 26 Mar 2014 15:37:59 -0000

Paolo Bonzini <pbonzini@redhat.com> writes:

> Il 20/03/2014 08:32, Markus Armbruster ha scritto:
>>>>> +static void __write(uint8_t *buf, int len)
>>>>
>>>> Will the fact that you used 'int len' instead of 'size_t' bite us on 32-
>>>> vs. 64-bit?  Same for __read.
>>>
>>> Yeah, I copied this from address_space_rw.  I'll change to ssize_t to
>>> catch negative values.
>>
>> Change the real address_space_rw(), or the model's __write()?
>
> __read and __write for now (hard freeze etc. etc.).

Okay.  But let's use size_t instead of ssize_t.  You can catch negative
values with __coverity_negative_sink__() all the same.

>>> +    if (is_write) __write(buf, len); else __read(buf, len);
>>> +
>>> +    return result;
>>> +}
>>
>> I'm curious: could you give me a rough idea on how modelling
>> address_space_rw() affects results?
>
> Sure!  The problematic code is this one:
>
>             if (!memory_access_is_direct(mr, is_write)) {
>                 l = memory_access_size(mr, l, addr1);
>                 /* XXX: could force current_cpu to NULL to avoid
>                    potential bugs */
>                 switch (l) {
>                 case 8:
>                     /* 64 bit write access */
>                     val = ldq_p(buf);
>                     error |= io_mem_write(mr, addr1, val, 8);
>                     break;
>
> Coverity doesn't understand that memory_access_size return a value
> that is less than l, and thus thinks that address_space_rw can do an
> 8-byte access.  So it flags cases where we use it to read into an int
> or a similarly small char[].
>
> It's actually fairly common, it occurs ~20 times.

I see.  Addressing the false positives' root cause with a model feels
worthwhile, in particular since more such uses of address_space_rw() can
pop up any time.

>>> +static int get_keysym(const name2keysym_t *table,
>>> +                      const char *name)
>>
>> Curious again: is this just insurance, or did you observe scanning
>> improvements?
>
> It fixes exactly one error.  All of the "tainted value" can be
> considered false positives, but I wanted to have an example on how to
> shut them up.

After a bit of digging, I think I now understand what your model
asserts: get_keysym() returns either zero or a positive value, and the
positive value is "safe" in a sense that isn't specified further.  This
shuts up the TAINTED_SCALAR defects when the value is used as subscript
in add_keysym().  Correct?

>> This claims g_malloc(0) returns a non-null pointer to a block of size 1.
>> Could we say it returns a non-null pointer to a block of size 0?
>
> Not sure of the semantics of __coverity_alloc__(0).  Leave it to
> further future improvements?

Yes, but with a comment explaining the model's inaccuracy.  Perhaps
something like this:

void *
g_malloc (size_t n_bytes)
{
    void *mem;
    __coverity_negative_sink__((ssize_t) n_bytes);
    /*
     * Mapping size 0 to 1 to ensure result isn't null.  This is a
     * bald-faced lie.  In reality, size 0 returns null, but modelling
     * that correctly produces too many annoying false positives.
     * Would be nice to improve the lie from "size 0 returns a pointer
     * to a block of size 1" to "... of size 0".
     */
    mem = malloc(n_bytes == 0 ? 1 : n_bytes);
    if (!mem) __coverity_panic__ ();
    return mem;
}

Hmm, I wonder whether this less elaborate lie would do, too:

void *
g_malloc (size_t n_bytes)
{
    void *mem;
    __coverity_negative_sink__((ssize_t) n_bytes);
    mem = malloc(n_bytes);
    if (!mem) {
        /*
         * This is a bald-faced lie.  In reality, size 0 returns null,
         * but modelling that correctly produces too many annoying false
         * positives.
         */
        __coverity_panic__ ();
    }
    return mem;
}

>>     if (success) {
>>         void* tmp = __coverity_alloc__(size);
>>         if (tmp) __coverity_mark_as_uninitialized_buffer__(tmp);
>>         __coverity_mark_as_afm_allocated__(tmp, AFM_free);
>>         return tmp;
>>     } else {
>>         __coverity_panic__ ();
>>     }
>
> Is the "if" needed at all?  The "else" path is killed altogether by
> __coverity_panic__().

It tells Coverity that g_malloc() can terminate the process.  Whether
that's useful information I can't say.

