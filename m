Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Tbn6N-0005xS-Ir
	for mharc-qemu-trivial@gnu.org; Fri, 23 Nov 2012 01:51:03 -0500
Received: from eggs.gnu.org ([208.118.235.92]:39702)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Tbn6H-0005qY-KF
	for qemu-trivial@nongnu.org; Fri, 23 Nov 2012 01:51:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Tbn6D-0001DP-7l
	for qemu-trivial@nongnu.org; Fri, 23 Nov 2012 01:50:57 -0500
Received: from mail-bk0-f45.google.com ([209.85.214.45]:52586)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1Tbn6D-0001D8-0X; Fri, 23 Nov 2012 01:50:53 -0500
Received: by mail-bk0-f45.google.com with SMTP id jk13so2586838bkc.4
	for <multiple recipients>; Thu, 22 Nov 2012 22:50:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=/IMeix7XyXgHQ6IHtJpgOe3Sj5tnlhPHTIRa4MYkYEU=;
	b=SfiHT/pYgyKw5SgB01+HPcpLguDw2iP2sr6yDYzb/VKL35mH9B7Bv/oJLfY2BwdcmY
	LZ0GPHYQfX2asjkMHkFcIdOEbvtrM9HwfZtxf3OVtR8UBdv9bQx68ytafEnY+ye+trCd
	9+TTCMSsCTWVOWwNeGjJRRU6kYjiyLXlNIwHOh5Wd6JuHLLojRbGlQzYEv+Y9o2g7yWS
	WSBgyNotlbop7RXPLpY9nuJQm5OB7q5V4eVJgXbUHzPkQ7p59BfIx1rg0+N4y2qg+J5h
	kVg+dK9d9IHaDj0jqQxuVPWTtPW7EHLfhVxacNOozNfJZJdq49FZtqQbtA2WBZ2a5gqO
	QMAw==
Received: by 10.204.150.137 with SMTP id y9mr389119bkv.103.1353653451895;
	Thu, 22 Nov 2012 22:50:51 -0800 (PST)
Received: from localhost (178-26-141-215-dynip.superkabel.de. [178.26.141.215])
	by mx.google.com with ESMTPS id k3sm3656608bku.13.2012.11.22.22.50.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Nov 2012 22:50:50 -0800 (PST)
Date: Fri, 23 Nov 2012 07:50:49 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Luiz Capitulino <lcapitulino@redhat.com>
Message-ID: <20121123065049.GB22787@stefanha-thinkpad.hitronhub.home>
References: <1353420681-8870-1-git-send-email-brogers@suse.com>
	<87lidwux0q.fsf@blackfin.pond.sub.org>
	<50ACC545.7000002@siemens.com>
	<20121122103411.0eefef6a@doriath.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20121122103411.0eefef6a@doriath.home>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.214.45
Cc: qemu-trivial@nongnu.org, Jan Kiszka <jan.kiszka@siemens.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>, Bruce Rogers <brogers@suse.com>
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
X-List-Received-Date: Fri, 23 Nov 2012 06:51:01 -0000

On Thu, Nov 22, 2012 at 10:34:11AM -0200, Luiz Capitulino wrote:
> On Wed, 21 Nov 2012 13:12:53 +0100
> Jan Kiszka <jan.kiszka@siemens.com> wrote:
> 
> > On 2012-11-20 16:14, Markus Armbruster wrote:
> > > Cc'ing Marcelo & Jan to speed up patch application.
> > > 
> > > Bruce Rogers <brogers@suse.com> writes:
> > > 
> > >> The options no-kvm, no-kvm-pit, no-kvm-pit-reinjection, and no-kvm-irqchip
> > >> should be marked as having no argument.
> > >>
> > >> Signed-off-by: Bruce Rogers <brogers@suse.com>
> > >> ---
> > >>  qemu-options.hx |    8 ++++----
> > >>  1 files changed, 4 insertions(+), 4 deletions(-)
> > >>
> > >> diff --git a/qemu-options.hx b/qemu-options.hx
> > >> index 9bb29d3..fbcf079 100644
> > >> --- a/qemu-options.hx
> > >> +++ b/qemu-options.hx
> > >> @@ -2918,17 +2918,17 @@ Enable FIPS 140-2 compliance mode.
> > >>  ETEXI
> > >>  
> > >>  HXCOMM Deprecated by -machine accel=tcg property
> > >> -DEF("no-kvm", HAS_ARG, QEMU_OPTION_no_kvm, "", QEMU_ARCH_I386)
> > >> +DEF("no-kvm", 0, QEMU_OPTION_no_kvm, "", QEMU_ARCH_I386)
> > >>  
> > >>  HXCOMM Deprecated by kvm-pit driver properties
> > >> -DEF("no-kvm-pit-reinjection", HAS_ARG, QEMU_OPTION_no_kvm_pit_reinjection,
> > >> +DEF("no-kvm-pit-reinjection", 0, QEMU_OPTION_no_kvm_pit_reinjection,
> > >>      "", QEMU_ARCH_I386)
> > >>  
> > >>  HXCOMM Deprecated (ignored)
> > >> -DEF("no-kvm-pit", HAS_ARG, QEMU_OPTION_no_kvm_pit, "", QEMU_ARCH_I386)
> > >> +DEF("no-kvm-pit", 0, QEMU_OPTION_no_kvm_pit, "", QEMU_ARCH_I386)
> > >>  
> > >>  HXCOMM Deprecated by -machine kernel_irqchip=on|off property
> > >> -DEF("no-kvm-irqchip", HAS_ARG, QEMU_OPTION_no_kvm_irqchip, "", QEMU_ARCH_I386)
> > >> +DEF("no-kvm-irqchip", 0, QEMU_OPTION_no_kvm_irqchip, "", QEMU_ARCH_I386)
> > >>  
> > >>  HXCOMM Deprecated (ignored)
> > >>  DEF("tdf", 0, QEMU_OPTION_tdf,"", QEMU_ARCH_ALL)
> > 
> > Reviewed-by: Jan Kiszka <jan.kiszka@siemens.com>
> 
> Candidate for -trivial.

This is more urgent than trivial.  It is necessary for qemu-kvm
compatibility and I think should go into QEMU 1.3.  Otherwise we have to
wait until QEMU 1.4 to complete the qemu-kvm -> qemu transition.

Stefan

