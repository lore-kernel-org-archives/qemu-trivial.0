Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1X6h7J-00051O-Aj
	for mharc-qemu-trivial@gnu.org; Mon, 14 Jul 2014 10:20:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59354)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1X6h7B-00050b-7f
	for qemu-trivial@nongnu.org; Mon, 14 Jul 2014 10:20:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1X6h75-0007wQ-9N
	for qemu-trivial@nongnu.org; Mon, 14 Jul 2014 10:20:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55933)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1X6h75-0007vp-11; Mon, 14 Jul 2014 10:20:19 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s6EEKHlH014274
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Mon, 14 Jul 2014 10:20:18 -0400
Received: from yakj.usersys.redhat.com (ovpn-112-63.ams2.redhat.com
	[10.36.112.63])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s6EEKEPT008681; Mon, 14 Jul 2014 10:20:15 -0400
Message-ID: <53C3E71E.6080909@redhat.com>
Date: Mon, 14 Jul 2014 16:20:14 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	Markus Armbruster <armbru@redhat.com>
References: <1403720497-5318-1-git-send-email-pbonzini@redhat.com>	<877g442kie.fsf@blackfin.pond.sub.org>
	<CAEgOgz77aLSt_vww3LwhT5-kUaJhDnmgdDVVdBfQXQvm-DzSUg@mail.gmail.com>
In-Reply-To: <CAEgOgz77aLSt_vww3LwhT5-kUaJhDnmgdDVVdBfQXQvm-DzSUg@mail.gmail.com>
X-Enigmail-Version: 1.6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] serial-pci: remove memory
 regions from BAR before destroying them
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
X-List-Received-Date: Mon, 14 Jul 2014 14:20:31 -0000

Il 14/07/2014 14:36, Peter Crosthwaite ha scritto:
> On Thu, Jun 26, 2014 at 5:32 PM, Markus Armbruster <armbru@redhat.com> wrote:
>> Paolo Bonzini <pbonzini@redhat.com> writes:
>>
>>> Otherwise, hot-unplug of pci-serial-2x trips the assertion
>>> in memory_region_destroy:
>>>
>>>     (qemu) device_del gg
>>>     (qemu) qemu-system-x86_64: /work/armbru/tmp/qemu/memory.c:1021: memory_region_destroy: Assertion `((&mr->subregions)->tqh_first == ((void *)0))' failed.
>>>     Aborted (core dumped)
>>>
>>> Reported-by: Markus Armbruster <armbru@redhat.com>
>>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>>
>> Reviewed-by: Markus Armbruster <armbru@redhat.com>
>>
>
> Reviewed-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
>
>> Would it make sense to add a "must not contain subregions" to
>> memory_region_destroy()'s function comment?
>>
>
> Any reason to just not patch the memory region finaliser to unparent

Note that unparent for memory regions is _not_ 
memory_region_del_subregion.  It is memory_region_destroy.

The parent object of a memory region is a device; the _container_ of a 
memory region is another memory region.

> all contained subregions automatically rather than assert? Destroying
> a container should imply removing the subregion relationship and
> simply orphan the subregion.

This makes sense since we will soon make memory_region_destroy optional 
(devices will automatically destroy their memory regions).  Before 
QOMification, however, I think the assert was a useful debugging tool, 
guaranteeing that owners of memory regions were destroyed in the right 
order.  So we could indeed revisit this in 2.2 and make 
memory_region_del_subregion also optional.

Paolo

