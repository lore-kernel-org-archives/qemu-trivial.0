Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bkvFG-0007X0-Es
	for mharc-qemu-trivial@gnu.org; Fri, 16 Sep 2016 11:40:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32882)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1bkvFE-0007UW-U2
	for qemu-trivial@nongnu.org; Fri, 16 Sep 2016 11:40:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1bkvFC-0002oM-Vz
	for qemu-trivial@nongnu.org; Fri, 16 Sep 2016 11:40:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58420)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>)
	id 1bkvF6-0002eT-9D; Fri, 16 Sep 2016 11:39:56 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 697EF4481A;
	Fri, 16 Sep 2016 15:39:55 +0000 (UTC)
Received: from redhat.com (vpn1-4-24.ams2.redhat.com [10.36.4.24])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8GFdqM4028964
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Fri, 16 Sep 2016 11:39:54 -0400
Date: Fri, 16 Sep 2016 16:39:51 +0100
From: "Daniel P. Berrange" <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Laurent Vivier <lvivier@redhat.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Message-ID: <20160916153951.GE9654@redhat.com>
Reply-To: "Daniel P. Berrange" <berrange@redhat.com>
References: <1474034177-17663-1-git-send-email-lvivier@redhat.com>
	<CAFEAcA9kTe0geCwguRbRSn8ozhnfarz4eTd5+Ra5kTZeR-fJkA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAFEAcA9kTe0geCwguRbRSn8ozhnfarz4eTd5+Ra5kTZeR-fJkA@mail.gmail.com>
User-Agent: Mutt/1.7.0 (2016-08-17)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Fri, 16 Sep 2016 15:39:55 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 00/26] trivial: use
 exit(EXIT_SUCCESS) and exit(EXIT_FAILURE)
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
X-List-Received-Date: Fri, 16 Sep 2016 15:40:06 -0000

On Fri, Sep 16, 2016 at 03:47:37PM +0100, Peter Maydell wrote:
> On 16 September 2016 at 14:55, Laurent Vivier <lvivier@redhat.com> wrote:
> > This series is the result of coccinelle patch
> > scripts/coccinelle/exit.cocci
> > provided by the first patch of the series.
> >
> > It replaces exit(0) by exit(EXIT_SUCCESS)
> > and exit(1) by exit(EXIT_FAILURE).
> >
> > All other exit() are not modified as we don't want
> > to change the behavior.
> >
> > In some cases, I've added manually a line break to comply
> > with the maximum line length.
> 
> >  182 files changed, 734 insertions(+), 715 deletions(-)
> 
> You don't say why this is a useful change to make, and it's an
> awful lot of churn for a stylistic issue...

Currently QEMU uses a mix of at least

  exit(EXIT_SUCCESS)
  exit(EXIT_FAILURE)
  exit(1)
  exit(-1)
  _exit(1)
  _exit(0);

so this series has the potential giving us more consistency style
and behaviour, across our code. By not fixing the up the usage of -1,
or fixing the _exit() usage, the series feels incomplete to me though.

Regards,
Daniel
-- 
|: http://berrange.com      -o-    http://www.flickr.com/photos/dberrange/ :|
|: http://libvirt.org              -o-             http://virt-manager.org :|
|: http://autobuild.org       -o-         http://search.cpan.org/~danberr/ :|
|: http://entangle-photo.org       -o-       http://live.gnome.org/gtk-vnc :|

