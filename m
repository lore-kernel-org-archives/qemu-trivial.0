Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1X6yDP-00054W-8T
	for mharc-qemu-trivial@gnu.org; Tue, 15 Jul 2014 04:35:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51845)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1X6yDI-00053g-Ni
	for qemu-trivial@nongnu.org; Tue, 15 Jul 2014 04:35:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1X6yDD-0002eC-Er
	for qemu-trivial@nongnu.org; Tue, 15 Jul 2014 04:35:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:20409)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1X6yDD-0002dp-6Q; Tue, 15 Jul 2014 04:35:47 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s6F8ZjFY021105
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Tue, 15 Jul 2014 04:35:46 -0400
Received: from [10.36.116.46] (ovpn-116-46.ams2.redhat.com [10.36.116.46])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s6F8ZfeG032729; Tue, 15 Jul 2014 04:35:42 -0400
Message-ID: <1405413340.23139.7.camel@nilsson.home.kraxel.org>
From: Gerd Hoffmann <kraxel@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Date: Tue, 15 Jul 2014 10:35:40 +0200
In-Reply-To: <87fvi46jyc.fsf@blackfin.pond.sub.org>
References: <1403720497-5318-1-git-send-email-pbonzini@redhat.com>
	<877g442kie.fsf@blackfin.pond.sub.org>
	<CAEgOgz77aLSt_vww3LwhT5-kUaJhDnmgdDVVdBfQXQvm-DzSUg@mail.gmail.com>
	<87fvi46jyc.fsf@blackfin.pond.sub.org>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
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
X-List-Received-Date: Tue, 15 Jul 2014 08:35:57 -0000

On Mo, 2014-07-14 at 17:25 +0200, Markus Armbruster wrote:
> Peter Crosthwaite <peter.crosthwaite@xilinx.com> writes:
> 
> > On Thu, Jun 26, 2014 at 5:32 PM, Markus Armbruster <armbru@redhat.com> wrote:
> >> Paolo Bonzini <pbonzini@redhat.com> writes:
> >>
> >>> Otherwise, hot-unplug of pci-serial-2x trips the assertion
> >>> in memory_region_destroy:
> >>>
> >>>     (qemu) device_del gg
> >>>     (qemu) qemu-system-x86_64: /work/armbru/tmp/qemu/memory.c:1021:
> >>> memory_region_destroy: Assertion `((&mr->subregions)->tqh_first ==
> >>> ((void *)0))' failed.
> >>>     Aborted (core dumped)
> >>>
> >>> Reported-by: Markus Armbruster <armbru@redhat.com>
> >>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> >>
> >> Reviewed-by: Markus Armbruster <armbru@redhat.com>
> >>
> >
> > Reviewed-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
> 
> Nominating for 2.1, just to be explicit.
> 
> [...]

Hmm, is trivial out of service?  I remember thinking "Ok, trivial patch,
qemu-trivial is cc'ed, that'll pick it up, nothing to do for me."

cheers,
  Gerd

PS: Saw paolo sticked the patch into one of his pull requests meanwhile.


