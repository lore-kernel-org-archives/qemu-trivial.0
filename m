Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ft5wl-00040Z-QY
	for mharc-qemu-trivial@gnu.org; Fri, 24 Aug 2018 02:51:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45106)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1ft5wj-0003zO-7p
	for qemu-trivial@nongnu.org; Fri, 24 Aug 2018 02:51:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1ft5wi-0004Xj-Dg
	for qemu-trivial@nongnu.org; Fri, 24 Aug 2018 02:51:49 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:50426 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1ft5we-0004Uw-Ca; Fri, 24 Aug 2018 02:51:44 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CA19C4021CC3;
	Fri, 24 Aug 2018 06:51:43 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-82.ams2.redhat.com
	[10.36.116.82])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 65F5310073A4;
	Fri, 24 Aug 2018 06:51:43 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 40E2316E29; Fri, 24 Aug 2018 08:51:41 +0200 (CEST)
Date: Fri, 24 Aug 2018 08:51:41 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
	Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20180824065141.to374mbp6hho244p@sirius.home.kraxel.org>
References: <20180419132026.5494-1-kraxel@redhat.com>
	<20180419132026.5494-2-kraxel@redhat.com>
	<87va92dv39.fsf@dusky.pond.sub.org>
	<87tvnk6zuo.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87tvnk6zuo.fsf@dusky.pond.sub.org>
User-Agent: NeoMutt/20180622
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Fri, 24 Aug 2018 06:51:43 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Fri, 24 Aug 2018 06:51:43 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
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
X-List-Received-Date: Fri, 24 Aug 2018 06:51:50 -0000

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

No, just -ENOTIME.

> Please advise.

Well, just need to find some time to do it.

In case you want tackle it:  Works simliar to -blockdev, with a few
exceptions.  Some legacy sdl options I plan to deprecate are not
supported via json.

cheers,
  Gerd


