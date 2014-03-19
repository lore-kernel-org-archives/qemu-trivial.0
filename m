Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WQJeM-00086b-Tp
	for mharc-qemu-trivial@gnu.org; Wed, 19 Mar 2014 12:47:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33260)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1WQJeE-00081H-Fu
	for qemu-trivial@nongnu.org; Wed, 19 Mar 2014 12:47:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1WQJe8-0007WT-HJ
	for qemu-trivial@nongnu.org; Wed, 19 Mar 2014 12:47:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:20546)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1WQJe8-0007W4-8G; Wed, 19 Mar 2014 12:47:16 -0400
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s2JGlEvP022831
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 19 Mar 2014 12:47:14 -0400
Received: from yakj.usersys.redhat.com (ovpn-112-55.ams2.redhat.com
	[10.36.112.55])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id s2JGlCer023467; Wed, 19 Mar 2014 12:47:13 -0400
Message-ID: <5329CA0F.4040900@redhat.com>
Date: Wed, 19 Mar 2014 17:47:11 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>
References: <1395162223-28733-1-git-send-email-pbonzini@redhat.com>	<874n2vcpu9.fsf@blackfin.pond.sub.org>
	<53294155.8040403@redhat.com>	<87d2hi4ktz.fsf@blackfin.pond.sub.org>
	<5329918C.8090403@redhat.com>	<5329A209.5000308@redhat.com>
	<5329B073.9030907@redhat.com>
	<87siqerxkl.fsf@blackfin.pond.sub.org>
In-Reply-To: <87siqerxkl.fsf@blackfin.pond.sub.org>
X-Enigmail-Version: 1.6
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
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
X-List-Received-Date: Wed, 19 Mar 2014 16:47:28 -0000

Il 19/03/2014 16:56, Markus Armbruster ha scritto:
>
>> >                                            Given the results, okay to
>> > use the limited model where realloc never frees and malloc(0) returns
>> > non-NULL?
> I'd describe realloc() as "always frees the old block, returns a new
> block, which is never null".  We might mean the same.

Yes, that's what I would do too, but it misses an important difference 
between malloc() and realloc().

"If size is 0, then malloc() returns either NULL, or a unique pointer 
value that can later be successfully passed to free()".  Instead, for 
realloc, "if size is equal to zero, and ptr is not NULL, then the call 
is equivalent to free(ptr)" and presumably must return NULL.

So I'm doubly cheating by giving realloc(foo, 0) free+malloc semantics 
instead of free.

BTW, this means that the handy "malloc(0) really means malloc(1)" 
semantics are inconsistent because you cannot implement realloc(foo, 0) 
that way.

Paolo

> Go ahead with the lying^Wlimited model, with a big, fat comment
> explaining our reasons.


