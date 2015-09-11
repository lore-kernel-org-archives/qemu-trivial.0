Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZaKPD-0001JZ-2o
	for mharc-qemu-trivial@gnu.org; Fri, 11 Sep 2015 05:14:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50241)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1ZaKPA-0001Gb-E0
	for qemu-trivial@nongnu.org; Fri, 11 Sep 2015 05:14:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1ZaKP9-0005LG-P2
	for qemu-trivial@nongnu.org; Fri, 11 Sep 2015 05:14:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56492)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1ZaKP5-0005JT-Od; Fri, 11 Sep 2015 05:13:55 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id 58160550CC;
	Fri, 11 Sep 2015 09:13:55 +0000 (UTC)
Received: from nilsson.home.kraxel.org (ovpn-116-57.ams2.redhat.com
	[10.36.116.57])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t8B9DrTA020128; Fri, 11 Sep 2015 05:13:54 -0400
Message-ID: <1441962833.29362.16.camel@redhat.com>
From: Gerd Hoffmann <kraxel@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Date: Fri, 11 Sep 2015 11:13:53 +0200
In-Reply-To: <55F2830C.1000308@msgid.tls.msk.ru>
References: <1436788726-20590-1-git-send-email-kraxel@redhat.com>
	<55F2830C.1000308@msgid.tls.msk.ru>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] virtio-vga: enable for i386
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
X-List-Received-Date: Fri, 11 Sep 2015 09:14:01 -0000

On Fr, 2015-09-11 at 10:30 +0300, Michael Tokarev wrote:
> 13.07.2015 14:58, Gerd Hoffmann wrote:
> > Cc: Paolo Bonzini <pbonzini@redhat.com>
> > Cc: qemu-trivial@nongnu.org
> > Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> 
> Gerd, -trivial received 3 patches like this enabling various virtio
> bits for various architectures.  I never got any reviewed-by or ACK
> on these patches, so they're not applied still.  Maybe you can add
> some explanation as to why you think it's a good idea, or else it
> doesn't seem like a trivial change? :)

This one just syncs x86_64 and i386.  Dunno about the other ones, have a
pointer?

cheers,
  Gerd



