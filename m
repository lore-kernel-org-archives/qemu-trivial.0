Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WQcbY-0002Yx-Q6
	for mharc-qemu-trivial@gnu.org; Thu, 20 Mar 2014 09:01:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49822)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1WQcbR-0002Mt-8R
	for qemu-trivial@nongnu.org; Thu, 20 Mar 2014 09:01:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1WQcbK-0000d8-Vu
	for qemu-trivial@nongnu.org; Thu, 20 Mar 2014 09:01:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:61196)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1WQcb6-0000ZA-Od; Thu, 20 Mar 2014 09:01:24 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s2KD1Mtv009209
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Thu, 20 Mar 2014 09:01:22 -0400
Received: from yakj.usersys.redhat.com (ovpn-112-49.ams2.redhat.com
	[10.36.112.49])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s2KD1Iht014442; Thu, 20 Mar 2014 09:01:19 -0400
Message-ID: <532AE69E.4070502@redhat.com>
Date: Thu, 20 Mar 2014 14:01:18 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>
References: <1395247965-13889-1-git-send-email-pbonzini@redhat.com>	<5329D4B7.4090602@redhat.com>
	<5329F406.7040606@redhat.com>
	<874n2tgw9h.fsf@blackfin.pond.sub.org>
In-Reply-To: <874n2tgw9h.fsf@blackfin.pond.sub.org>
X-Enigmail-Version: 1.6
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Eric Blake <eblake@redhat.com>,
	qemu-devel@nongnu.org
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
X-List-Received-Date: Thu, 20 Mar 2014 13:01:51 -0000

Il 20/03/2014 08:32, Markus Armbruster ha scritto:
>>>> +static void __write(uint8_t *buf, int len)
>>>
>>> Will the fact that you used 'int len' instead of 'size_t' bite us on 32-
>>> vs. 64-bit?  Same for __read.
>>
>> Yeah, I copied this from address_space_rw.  I'll change to ssize_t to
>> catch negative values.
>
> Change the real address_space_rw(), or the model's __write()?

__read and __write for now (hard freeze etc. etc.).

>> +    if (is_write) __write(buf, len); else __read(buf, len);
>> +
>> +    return result;
>> +}
>
> I'm curious: could you give me a rough idea on how modelling
> address_space_rw() affects results?

Sure!  The problematic code is this one:

             if (!memory_access_is_direct(mr, is_write)) {
                 l = memory_access_size(mr, l, addr1);
                 /* XXX: could force current_cpu to NULL to avoid
                    potential bugs */
                 switch (l) {
                 case 8:
                     /* 64 bit write access */
                     val = ldq_p(buf);
                     error |= io_mem_write(mr, addr1, val, 8);
                     break;

Coverity doesn't understand that memory_access_size return a value that 
is less than l, and thus thinks that address_space_rw can do an 8-byte 
access.  So it flags cases where we use it to read into an int or a 
similarly small char[].

It's actually fairly common, it occurs ~20 times.

>> +static int get_keysym(const name2keysym_t *table,
>> +                      const char *name)
>
> Curious again: is this just insurance, or did you observe scanning
> improvements?

It fixes exactly one error.  All of the "tainted value" can be 
considered false positives, but I wanted to have an example on how to 
shut them up.

> This claims g_malloc(0) returns a non-null pointer to a block of size 1.
> Could we say it returns a non-null pointer to a block of size 0?

Not sure of the semantics of __coverity_alloc__(0).  Leave it to further 
future improvements?

>     if (success) {
>         void* tmp = __coverity_alloc__(size);
>         if (tmp) __coverity_mark_as_uninitialized_buffer__(tmp);
>         __coverity_mark_as_afm_allocated__(tmp, AFM_free);
>         return tmp;
>     } else {
>         __coverity_panic__ ();
>     }

Is the "if" needed at all?  The "else" path is killed altogether by 
__coverity_panic__().

Paolo

