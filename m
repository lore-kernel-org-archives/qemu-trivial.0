Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UWkLG-0004uQ-Bi
	for mharc-qemu-trivial@gnu.org; Mon, 29 Apr 2013 05:25:50 -0400
Received: from eggs.gnu.org ([208.118.235.92]:40393)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1UWkL8-0004u5-Qp
	for qemu-trivial@nongnu.org; Mon, 29 Apr 2013 05:25:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1UWkL7-0007ip-Jc
	for qemu-trivial@nongnu.org; Mon, 29 Apr 2013 05:25:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:62013)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1UWkL7-0007iY-CH; Mon, 29 Apr 2013 05:25:41 -0400
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r3T9PXIN009813
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 29 Apr 2013 05:25:33 -0400
Received: from yakj.usersys.redhat.com (ovpn-112-21.ams2.redhat.com
	[10.36.112.21])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r3T9PRlg025897; Mon, 29 Apr 2013 05:25:29 -0400
Message-ID: <517E3C7C.3080604@redhat.com>
Date: Mon, 29 Apr 2013 11:25:16 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130311 Thunderbird/17.0.4
MIME-Version: 1.0
To: Alexey Kardashevskiy <aik@ozlabs.ru>
References: <517BC1F2.70405@redhat.com>
	<1367201460-28594-1-git-send-email-aik@ozlabs.ru>
	<517E2C5C.8000700@redhat.com> <517E2D74.3070804@ozlabs.ru>
In-Reply-To: <517E2D74.3070804@ozlabs.ru>
X-Enigmail-Version: 1.5.1
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [Qemu-trivial] [PATCH] memory: give name every AddressSpace
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
X-List-Received-Date: Mon, 29 Apr 2013 09:25:48 -0000

Il 29/04/2013 10:21, Alexey Kardashevskiy ha scritto:
>>> >> +    g_free((void *)as->name);
>> > 
>> > No cast here.
> ?
> 
>   CC    ppc64-softmmu/memory.o
> /home/alexey/pcipassthru/qemu-impreza/memory.c: In function
> 'address_space_destroy':
> /home/alexey/pcipassthru/qemu-impreza/memory.c:1626:5: warning: passing
> argument 1 of 'g_free' discards 'const' qualifier from pointer target type
> [enabled by default]
>      g_free(/*(void *)*/as->name);
>      ^

Please remove the const from as->name instead.  Since you are strdup-ing
it, and the field is meant to be private to memory.c anyway, you do not
need protection against changing it.

Paolo

