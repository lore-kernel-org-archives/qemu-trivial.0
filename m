Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TbVzG-0007if-D1
	for mharc-qemu-trivial@gnu.org; Thu, 22 Nov 2012 07:34:34 -0500
Received: from eggs.gnu.org ([208.118.235.92]:47492)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1TbVzD-0007ak-Il
	for qemu-trivial@nongnu.org; Thu, 22 Nov 2012 07:34:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1TbVzC-0006Tl-K6
	for qemu-trivial@nongnu.org; Thu, 22 Nov 2012 07:34:31 -0500
Received: from mx1.redhat.com ([209.132.183.28]:35992)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>)
	id 1TbVyw-00066d-TC; Thu, 22 Nov 2012 07:34:15 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id qAMCYClx030522
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Thu, 22 Nov 2012 07:34:13 -0500
Received: from doriath.home (ovpn-113-66.phx2.redhat.com [10.3.113.66])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id qAMCYAQh008464; Thu, 22 Nov 2012 07:34:11 -0500
Date: Thu, 22 Nov 2012 10:34:11 -0200
From: Luiz Capitulino <lcapitulino@redhat.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <20121122103411.0eefef6a@doriath.home>
In-Reply-To: <50ACC545.7000002@siemens.com>
References: <1353420681-8870-1-git-send-email-brogers@suse.com>
	<87lidwux0q.fsf@blackfin.pond.sub.org>
	<50ACC545.7000002@siemens.com>
Organization: Red Hat
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Bruce Rogers <brogers@suse.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Legacy qemu-kvm options
	have no argument
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
X-List-Received-Date: Thu, 22 Nov 2012 12:34:32 -0000

On Wed, 21 Nov 2012 13:12:53 +0100
Jan Kiszka <jan.kiszka@siemens.com> wrote:

> On 2012-11-20 16:14, Markus Armbruster wrote:
> > Cc'ing Marcelo & Jan to speed up patch application.
> > 
> > Bruce Rogers <brogers@suse.com> writes:
> > 
> >> The options no-kvm, no-kvm-pit, no-kvm-pit-reinjection, and no-kvm-irqchip
> >> should be marked as having no argument.
> >>
> >> Signed-off-by: Bruce Rogers <brogers@suse.com>
> >> ---
> >>  qemu-options.hx |    8 ++++----
> >>  1 files changed, 4 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/qemu-options.hx b/qemu-options.hx
> >> index 9bb29d3..fbcf079 100644
> >> --- a/qemu-options.hx
> >> +++ b/qemu-options.hx
> >> @@ -2918,17 +2918,17 @@ Enable FIPS 140-2 compliance mode.
> >>  ETEXI
> >>  
> >>  HXCOMM Deprecated by -machine accel=tcg property
> >> -DEF("no-kvm", HAS_ARG, QEMU_OPTION_no_kvm, "", QEMU_ARCH_I386)
> >> +DEF("no-kvm", 0, QEMU_OPTION_no_kvm, "", QEMU_ARCH_I386)
> >>  
> >>  HXCOMM Deprecated by kvm-pit driver properties
> >> -DEF("no-kvm-pit-reinjection", HAS_ARG, QEMU_OPTION_no_kvm_pit_reinjection,
> >> +DEF("no-kvm-pit-reinjection", 0, QEMU_OPTION_no_kvm_pit_reinjection,
> >>      "", QEMU_ARCH_I386)
> >>  
> >>  HXCOMM Deprecated (ignored)
> >> -DEF("no-kvm-pit", HAS_ARG, QEMU_OPTION_no_kvm_pit, "", QEMU_ARCH_I386)
> >> +DEF("no-kvm-pit", 0, QEMU_OPTION_no_kvm_pit, "", QEMU_ARCH_I386)
> >>  
> >>  HXCOMM Deprecated by -machine kernel_irqchip=on|off property
> >> -DEF("no-kvm-irqchip", HAS_ARG, QEMU_OPTION_no_kvm_irqchip, "", QEMU_ARCH_I386)
> >> +DEF("no-kvm-irqchip", 0, QEMU_OPTION_no_kvm_irqchip, "", QEMU_ARCH_I386)
> >>  
> >>  HXCOMM Deprecated (ignored)
> >>  DEF("tdf", 0, QEMU_OPTION_tdf,"", QEMU_ARCH_ALL)
> 
> Reviewed-by: Jan Kiszka <jan.kiszka@siemens.com>

Candidate for -trivial.

