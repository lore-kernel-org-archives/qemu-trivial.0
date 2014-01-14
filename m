Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W3AFT-00011X-27
	for mharc-qemu-trivial@gnu.org; Tue, 14 Jan 2014 15:06:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34885)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1W3AFL-0000jn-17
	for qemu-trivial@nongnu.org; Tue, 14 Jan 2014 15:06:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1W3AFE-0007OY-Ro
	for qemu-trivial@nongnu.org; Tue, 14 Jan 2014 15:05:58 -0500
Received: from mx1.redhat.com ([209.132.183.28]:31153)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>)
	id 1W3AF1-0007MW-Qc; Tue, 14 Jan 2014 15:05:40 -0500
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s0EK5cEk005018
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 14 Jan 2014 15:05:38 -0500
Received: from redhat.com (vpn1-4-212.ams2.redhat.com [10.36.4.212])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with SMTP
	id s0EK5ZYj014101; Tue, 14 Jan 2014 15:05:36 -0500
Date: Tue, 14 Jan 2014 22:05:35 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <20140114200535.GA31642@redhat.com>
References: <20140109095816.409cd2a9@redhat.com>
	<52D56E5B.9000001@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <52D56E5B.9000001@msgid.tls.msk.ru>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	qemu-devel <qemu-devel@nongnu.org>,
	Luiz Capitulino <lcapitulino@redhat.com>
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
X-List-Received-Date: Tue, 14 Jan 2014 20:06:05 -0000

On Tue, Jan 14, 2014 at 09:05:31PM +0400, Michael Tokarev wrote:
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
> 
> This is a published guest <=> host interface, the config _must_ be 8 bytes
> long and must contain 2 4-byte words in it.

no, config can be extended in the future.
and hard coded constants are evil.

> 
> We may use assert(sizeof(struct virtio_balloon_config) == 8) somewhere,
> but to my taste it is a bit overkill.  No?

I agree assert like this would be overkill.

> Thanks,
> 
> /mjt
-- 
MST

