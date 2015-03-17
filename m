Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YXojF-0005ec-Bi
	for mharc-qemu-trivial@gnu.org; Tue, 17 Mar 2015 06:28:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57694)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YXojD-0005bj-28
	for qemu-trivial@nongnu.org; Tue, 17 Mar 2015 06:28:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YXojC-0004EE-4W
	for qemu-trivial@nongnu.org; Tue, 17 Mar 2015 06:28:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53931)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1YXoj7-0004D4-Jl; Tue, 17 Mar 2015 06:27:57 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t2HARvbT001720
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Tue, 17 Mar 2015 06:27:57 -0400
Received: from blackfin.pond.sub.org (ovpn-116-36.ams2.redhat.com
	[10.36.116.36])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t2HARt8F026966
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 17 Mar 2015 06:27:56 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id B5D363042B6D; Tue, 17 Mar 2015 11:27:54 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
References: <5501776A.20202@siemens.com>
	<87d248t424.fsf@blackfin.pond.sub.org> <5507EA65.6010407@redhat.com>
Date: Tue, 17 Mar 2015 11:27:54 +0100
In-Reply-To: <5507EA65.6010407@redhat.com> (Paolo Bonzini's message of "Tue,
	17 Mar 2015 09:48:37 +0100")
Message-ID: <87k2yfrk9h.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] coverity: Fix
	g_malloc_n-like models
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
X-List-Received-Date: Tue, 17 Mar 2015 10:28:04 -0000

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 17/03/2015 09:34, Markus Armbruster wrote:
>> Jan Kiszka <jan.kiszka@siemens.com> writes:
>> 
>>> Allocate the calculated overall size, not only the size of a single
>>> element.
>>>
>>> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
>> 
>> I'm feeding this to Coverity locally to gauge its impact.
>
> I got no changes.

Yep, same here.  Applied, thanks!

