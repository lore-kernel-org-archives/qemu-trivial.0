Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fuEMI-0006zf-6X
	for mharc-qemu-trivial@gnu.org; Mon, 27 Aug 2018 06:02:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46933)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fuEMA-0006wS-VK
	for qemu-trivial@nongnu.org; Mon, 27 Aug 2018 06:02:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fuEMA-0003Db-9D
	for qemu-trivial@nongnu.org; Mon, 27 Aug 2018 06:02:46 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:55516 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1fuEM2-00037b-C3; Mon, 27 Aug 2018 06:02:38 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E1DB020E19;
	Mon, 27 Aug 2018 10:02:37 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-138.ams2.redhat.com
	[10.36.117.138])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 833622026D6B;
	Mon, 27 Aug 2018 10:02:36 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id D9B42204AD; Mon, 27 Aug 2018 12:02:35 +0200 (CEST)
Date: Mon, 27 Aug 2018 12:02:35 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
	Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20180827100235.p3zggb2g5qf3floq@sirius.home.kraxel.org>
References: <20180419132026.5494-1-kraxel@redhat.com>
	<20180419132026.5494-2-kraxel@redhat.com>
	<87va92dv39.fsf@dusky.pond.sub.org>
	<87tvnk6zuo.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87tvnk6zuo.fsf@dusky.pond.sub.org>
User-Agent: NeoMutt/20180622
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Mon, 27 Aug 2018 10:02:37 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Mon, 27 Aug 2018 10:02:37 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'kraxel@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/4] ui: add qapi parser for
 -display
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 27 Aug 2018 10:02:52 -0000

On Fri, Aug 24, 2018 at 08:30:23AM +0200, Markus Armbruster wrote:
> Markus Armbruster <armbru@redhat.com> writes:
> 
> > Gerd Hoffmann <kraxel@redhat.com> writes:
> >
> >> Add parse_display_qapi() function which parses the -display command line
> >> using a qapi visitor for DisplayOptions.  Wire up as default catch in
> >> parse_display().
> >>
> >> Improves the error message for unknown display types.
> >>
> >> Also enables json as -display argument, i.e. -display "{ 'type': 'gtk' }"
> >
> > This new option argument syntax is undocumented.  Intentional?
> 
> Please advise.

Hmm, checking -blockdev doc in qemu-options.hx, nothing about json.
Is this documented elsewhere?

cheers,
  Gerd


