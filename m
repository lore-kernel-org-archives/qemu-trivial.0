Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WQMS2-0002L6-TO
	for mharc-qemu-trivial@gnu.org; Wed, 19 Mar 2014 15:46:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50105)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1WQMRs-0001vn-GS
	for qemu-trivial@nongnu.org; Wed, 19 Mar 2014 15:46:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1WQMRk-0004pg-2J
	for qemu-trivial@nongnu.org; Wed, 19 Mar 2014 15:46:48 -0400
Received: from mail-ee0-x235.google.com ([2a00:1450:4013:c00::235]:34932)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1WQMRP-0004kK-Aj; Wed, 19 Mar 2014 15:46:19 -0400
Received: by mail-ee0-f53.google.com with SMTP id b57so6326784eek.40
	for <multiple recipients>; Wed, 19 Mar 2014 12:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=Xev/TrbTWk6vaFl6gofJNdDPXe9NDj+qepECbGJpGm8=;
	b=tMJd0o8JXciY/XQ5FvYjeOsPAgBykBr3Uj7piaw9Qf7VntVHwk2h6zI4yhyl8uJRsC
	f2qLo7ryuOcKXAX3/0Sh5UcrjXOQQcDgk+3VDSYkrTYVM0bH2177Wrm7VNv1g1PuZPgc
	L7YJV88UMAhzIa2H9rjikLPpz42vU8VElIuSWNtX44eo3s6gjnv4yB7f6/+FK6OwebYR
	HpzNHZqmfwHVoYQwrvmTKOtUn9PYxvFL03A3gqN2Tf/4iU3Nnnph2GpTCr+o/HMUDXYl
	t+ONT1gWaV995ClubbSzDKDj9ffqnvKPEbDdw9CdsRa1Ye4kbJw5cWGX6T7Vsc0mXYT6
	g7dQ==
X-Received: by 10.15.64.75 with SMTP id n51mr29197787eex.33.1395258378091;
	Wed, 19 Mar 2014 12:46:18 -0700 (PDT)
Received: from yakj.usersys.redhat.com
	(net-37-117-154-249.cust.vodafonedsl.it. [37.117.154.249])
	by mx.google.com with ESMTPSA id
	t50sm44483064eev.28.2014.03.19.12.46.15 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 19 Mar 2014 12:46:16 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <5329F406.7040606@redhat.com>
Date: Wed, 19 Mar 2014 20:46:14 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
References: <1395247965-13889-1-git-send-email-pbonzini@redhat.com>
	<5329D4B7.4090602@redhat.com>
In-Reply-To: <5329D4B7.4090602@redhat.com>
X-Enigmail-Version: 1.6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4013:c00::235
Cc: qemu-trivial@nongnu.org, armbru@redhat.com
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
X-List-Received-Date: Wed, 19 Mar 2014 19:46:57 -0000

Il 19/03/2014 18:32, Eric Blake ha scritto:
>> + *
>> + * Copyright (C) 2014 Red Hat, Inc.
>> + *
>> + * Authors:
>> + *  Markus Armbruster <armbru@redhat.com>
>> + *  Paolo Bonzini <pbonzini@redhat.com>
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2 or, at your
>> + * option, any later version.  See the COPYING file in the top-level directory.
>
> Aren't the license and authors blurbs usually in the other order?

Not in the sample I copied from (migration.c).

>
>> +#define assert(x) if (!(x)) __coverity_panic__();
>
> Will this break any 'if () assert(); else {}' blocks?  Obviously, such
> blocks already violate coding convention, but you might as well make
> this definition safe to use for older code.

Ok.

>> +
>> +static void __write(uint8_t *buf, int len)
>
> Will the fact that you used 'int len' instead of 'size_t' bite us on 32-
> vs. 64-bit?  Same for __read.

Yeah, I copied this from address_space_rw.  I'll change to ssize_t to 
catch negative values.

>
>> +void *
>> +g_malloc0 (size_t n_bytes)
>> +{
>> +    void *mem;
>> +    __coverity_negative_sink__((ssize_t) n_bytes);
>> +    mem = calloc(1, n_bytes == 0 ? 1 : n_bytes);
>> +    if (!mem) __coverity_panic__ ();
>
> Is it worth being consistent on spacing before (?

Yes.

>> +void g_free (void *mem)
>> +{
>> +    if (mem) {
>> +        free(mem);
>> +    }
>
> Doesn't coverity already know that free(NULL) is a no-op, without you
> having to repeat it?

This part came from Markus. :)

Paolo


