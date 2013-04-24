Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UUwVN-0000q6-9Q
	for mharc-qemu-trivial@gnu.org; Wed, 24 Apr 2013 06:00:49 -0400
Received: from eggs.gnu.org ([208.118.235.92]:36675)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1UUwVI-0000n2-TB
	for qemu-trivial@nongnu.org; Wed, 24 Apr 2013 06:00:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1UUwVH-0001fq-20
	for qemu-trivial@nongnu.org; Wed, 24 Apr 2013 06:00:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:16324)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1UUwVA-0001dw-Df; Wed, 24 Apr 2013 06:00:36 -0400
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r3OA0Rib009599
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 24 Apr 2013 06:00:29 -0400
Received: from blackfin.pond.sub.org (ovpn-116-26.ams2.redhat.com
	[10.36.116.26])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r3OA07QN013562; Wed, 24 Apr 2013 06:00:07 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 5CE6F200B3; Wed, 24 Apr 2013 12:00:06 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Michal Privoznik <mprivozn@redhat.com>
References: <9021f2f9e51e4c7a253d1993ea05f87d0718752f.1359627279.git.mprivozn@redhat.com>
	<510B90C9.8000309@suse.de> <510BDCBF.5040108@redhat.com>
	<20130206144956.GA22233@stefanha-thinkpad.redhat.com>
	<51127222.1040904@redhat.com> <5176C26D.9050508@redhat.com>
Date: Wed, 24 Apr 2013 12:00:06 +0200
In-Reply-To: <5176C26D.9050508@redhat.com> (Michal Privoznik's message of
	"Tue, 23 Apr 2013 19:18:37 +0200")
Message-ID: <8738ugw8nt.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
	Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configure: Undefine
	_FORTIFY_SOURCE prior using it
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
X-List-Received-Date: Wed, 24 Apr 2013 10:00:46 -0000

Michal Privoznik <mprivozn@redhat.com> writes:

> On 06.02.2013 16:09, Paolo Bonzini wrote:
>> Il 06/02/2013 15:49, Stefan Hajnoczi ha scritto:
>>>>> I don't think that's necessary. The 2nd level is the highest one
>>>>> [1] or [2].
>>>>> It seems like in my case it's compiler who's defining the macro:
>>>>>
>>>>> $ echo "int main() {return 0;}" | gcc -D_FORTIFY_SOURCE=2 -x c -
>>>>> <command-line>:0:0: warning: "_FORTIFY_SOURCE" redefined [enabled
>>>>> by default]
>>>>> <stdin>:1:0: note: this is the location of the previous definition
>>>>>
>>>>> in which case we must undefine it. However, if the _FORTIFY_SOURCE is
>>>>> defined by environment, I think we should not override it. So maybe need
>>>>> a different approach. Anyway, with current state I cannot
>>>>> compile. I am using
>>>>> gcc version 4.7.2 (Gentoo 4.7.2 p1.3, pie-0.5.5)
>>> It would be nice to fix this for QEMU 1.4 but my gcc FORTIFY_SOURCE foo
>>> is not strong enough to know what the best approach is here.
>>>
>>> Reviews from anyone else?
>> 
>> I would prefer to avoid having _FORTIFY_SOURCE completely, and let
>> distros do it.  Alternatively, tie it to a new --enable switch which
>> would do -U -D.
>> 
>> But if there is a real problem for 1.4 the patch looks good.
>> 
>> Paolo
>> 
>
> Sorry for resurrecting such old thread, but what's the conclusion then?

Thread petered out without a conclusion?

> I keep hitting this problem and I am tired of having one single patch on
> the top of HEAD. And I bet others ran into this as well.

Few things focus discussions as well as a patch does.  Suggest to post
one to get things going again.

