Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WQcB1-0003c5-DP
	for mharc-qemu-trivial@gnu.org; Thu, 20 Mar 2014 08:34:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43462)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1WQcAt-0003VS-9z
	for qemu-trivial@nongnu.org; Thu, 20 Mar 2014 08:34:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1WQcAm-0008Fj-Vy
	for qemu-trivial@nongnu.org; Thu, 20 Mar 2014 08:34:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:32417)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1WQcAZ-00088J-FK; Thu, 20 Mar 2014 08:33:59 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s2KCXupd015828
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Thu, 20 Mar 2014 08:33:58 -0400
Received: from blackfin.pond.sub.org (ovpn-116-35.ams2.redhat.com
	[10.36.116.35])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s2K7WxeI013567
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 20 Mar 2014 03:33:04 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id A399A200D1; Thu, 20 Mar 2014 08:32:58 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
References: <1395247965-13889-1-git-send-email-pbonzini@redhat.com>
	<5329D4B7.4090602@redhat.com> <5329F406.7040606@redhat.com>
Date: Thu, 20 Mar 2014 08:32:58 +0100
In-Reply-To: <5329F406.7040606@redhat.com> (Paolo Bonzini's message of "Wed,
	19 Mar 2014 20:46:14 +0100")
Message-ID: <874n2tgw9h.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
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
X-List-Received-Date: Thu, 20 Mar 2014 12:34:25 -0000

Paolo Bonzini <pbonzini@redhat.com> writes:

> Il 19/03/2014 18:32, Eric Blake ha scritto:
>>> + *
>>> + * Copyright (C) 2014 Red Hat, Inc.
>>> + *
>>> + * Authors:
>>> + *  Markus Armbruster <armbru@redhat.com>
>>> + *  Paolo Bonzini <pbonzini@redhat.com>
>>> + *
>>> + * This work is licensed under the terms of the GNU GPL, version 2
>>> or, at your
>>> + * option, any later version.  See the COPYING file in the
>>> top-level directory.
>>
>> Aren't the license and authors blurbs usually in the other order?
>
> Not in the sample I copied from (migration.c).
>
>>
>>> +#define assert(x) if (!(x)) __coverity_panic__();
>>
>> Will this break any 'if () assert(); else {}' blocks?  Obviously, such
>> blocks already violate coding convention, but you might as well make
>> this definition safe to use for older code.
>
> Ok.

Coverity's builtin model models assert already, see
library/generic/libc/all/all.c.  We shouldn't override it without a good
reason.

>>> +
>>> +static void __write(uint8_t *buf, int len)
>>
>> Will the fact that you used 'int len' instead of 'size_t' bite us on 32-
>> vs. 64-bit?  Same for __read.
>
> Yeah, I copied this from address_space_rw.  I'll change to ssize_t to
> catch negative values.

Change the real address_space_rw(), or the model's __write()?

>>> +void *
>>> +g_malloc0 (size_t n_bytes)
>>> +{
>>> +    void *mem;
>>> +    __coverity_negative_sink__((ssize_t) n_bytes);
>>> +    mem = calloc(1, n_bytes == 0 ? 1 : n_bytes);
>>> +    if (!mem) __coverity_panic__ ();
>>
>> Is it worth being consistent on spacing before (?
>
> Yes.
>
>>> +void g_free (void *mem)
>>> +{
>>> +    if (mem) {
>>> +        free(mem);
>>> +    }
>>
>> Doesn't coverity already know that free(NULL) is a no-op, without you
>> having to repeat it?
>
> This part came from Markus. :)

I don't know what possessed me when I wrote (or copied?) the silly
conditional.  Let's drop it before someone else copies it.

