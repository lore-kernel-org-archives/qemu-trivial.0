Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WQCUb-0000Jj-28
	for mharc-qemu-trivial@gnu.org; Wed, 19 Mar 2014 05:08:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35058)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1WQCUT-00007L-6T
	for qemu-trivial@nongnu.org; Wed, 19 Mar 2014 05:08:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1WQCUN-0005hS-75
	for qemu-trivial@nongnu.org; Wed, 19 Mar 2014 05:08:49 -0400
Received: from mx1.redhat.com ([209.132.183.28]:15289)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1WQCUA-0005dx-I5; Wed, 19 Mar 2014 05:08:30 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s2J98ROs004944
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 19 Mar 2014 05:08:28 -0400
Received: from blackfin.pond.sub.org (ovpn-116-31.ams2.redhat.com
	[10.36.116.31])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s2J98PkI011106
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 19 Mar 2014 05:08:26 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id CE585200D1; Wed, 19 Mar 2014 10:08:24 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
References: <1395162223-28733-1-git-send-email-pbonzini@redhat.com>
	<874n2vcpu9.fsf@blackfin.pond.sub.org> <53294155.8040403@redhat.com>
Date: Wed, 19 Mar 2014 10:08:24 +0100
In-Reply-To: <53294155.8040403@redhat.com> (Paolo Bonzini's message of "Wed,
	19 Mar 2014 08:03:49 +0100")
Message-ID: <87d2hi4ktz.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
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
X-List-Received-Date: Wed, 19 Mar 2014 09:08:55 -0000

Paolo Bonzini <pbonzini@redhat.com> writes:

> Il 18/03/2014 19:40, Markus Armbruster ha scritto:
>> > +void *
>> > +g_malloc (size_t n_bytes)
>> > +{
>> > +    void *mem;
>> > +    __coverity_negative_sink__((ssize_t) n_bytes);
>> > +    mem = malloc(n_bytes == 0 ? 1 : n_bytes);
>> > +    if (!mem) __coverity_panic__ ();
>> > +    return mem;
>> > +}
>>
>> This isn't quite honest: g_malloc(0) yields NULL.  Same for the other
>> allocation functions.
>
> Oh, I didn't know that.
>
> It probably would make static analysis a bit less powerful or will
> return more false positives.  The NULL return for realloc (in the
> "free" case) already causes some.  So I'm undecided between a more
> correct model and a more selective one (with a fat comment).

I can't see how lying to the analyzer could make it more powerful :)
It can, however, suppress false positives.  Scan and find out how many?

