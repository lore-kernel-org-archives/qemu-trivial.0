Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W39BY-0004t5-IJ
	for mharc-qemu-trivial@gnu.org; Tue, 14 Jan 2014 13:58:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47336)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1W39BR-0004l0-RJ
	for qemu-trivial@nongnu.org; Tue, 14 Jan 2014 13:57:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1W39BM-0002qD-VY
	for qemu-trivial@nongnu.org; Tue, 14 Jan 2014 13:57:53 -0500
Received: from mx1.redhat.com ([209.132.183.28]:13565)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>)
	id 1W39BC-0002mU-Ok; Tue, 14 Jan 2014 13:57:39 -0500
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s0EITwZW020733
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 14 Jan 2014 13:29:59 -0500
Received: from localhost (ovpn-113-136.phx2.redhat.com [10.3.113.136])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s0EITv0p025030; Tue, 14 Jan 2014 13:29:57 -0500
Date: Tue, 14 Jan 2014 13:29:56 -0500
From: Luiz Capitulino <lcapitulino@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <20140114132956.1c21c68c@redhat.com>
In-Reply-To: <52D56E5B.9000001@msgid.tls.msk.ru>
References: <20140109095816.409cd2a9@redhat.com>
	<52D56E5B.9000001@msgid.tls.msk.ru>
Organization: Red Hat
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	qemu-devel <qemu-devel@nongnu.org>, mst@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] virtio-balloon: don't
 hardcode config size value
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
X-List-Received-Date: Tue, 14 Jan 2014 18:57:58 -0000

On Tue, 14 Jan 2014 21:05:31 +0400
Michael Tokarev <mjt@tls.msk.ru> wrote:

> 09.01.2014 18:58, Luiz Capitulino wrote:
> > Use sizeof(strucy virtio_balloon_config) instead.
> > 
> > --- a/hw/virtio/virtio-balloon.c
> > +++ b/hw/virtio/virtio-balloon.c
> > @@ -263,7 +263,7 @@ static void virtio_balloon_get_config(VirtIODevice *vdev, uint8_t *config_data)
> >      config.num_pages = cpu_to_le32(dev->num_pages);
> >      config.actual = cpu_to_le32(dev->actual);
> >  
> > -    memcpy(config_data, &config, 8);
> > +    memcpy(config_data, &config, sizeof(struct virtio_balloon_config));
> 
> I'm not sure any of those is better than another.

No duplication, no risk of changing virtio_balloon_config and
forgetting about changing all the memcpys out there (which is
exactly what happened to me). This is also what the other
devices do.

> This is a published guest <=> host interface, the config _must_ be 8 bytes
> long and must contain 2 4-byte words in it.

That's not changed by this patch.

> We may use assert(sizeof(struct virtio_balloon_config) == 8) somewhere,
> but to my taste it is a bit overkill.  No?
> 
> Thanks,
> 
> /mjt
> 


