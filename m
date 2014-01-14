Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W38Sc-0006CS-6Y
	for mharc-qemu-trivial@gnu.org; Tue, 14 Jan 2014 13:11:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46289)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1W37R3-0004Vd-GD
	for qemu-trivial@nongnu.org; Tue, 14 Jan 2014 12:05:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1W37Qx-0007vn-Fj
	for qemu-trivial@nongnu.org; Tue, 14 Jan 2014 12:05:53 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:45596)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1W37Qj-0007rS-1N; Tue, 14 Jan 2014 12:05:33 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id EBB96411AD;
	Tue, 14 Jan 2014 21:05:31 +0400 (MSK)
Message-ID: <52D56E5B.9000001@msgid.tls.msk.ru>
Date: Tue, 14 Jan 2014 21:05:31 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20131103 Icedove/17.0.10
MIME-Version: 1.0
To: Luiz Capitulino <lcapitulino@redhat.com>
References: <20140109095816.409cd2a9@redhat.com>
In-Reply-To: <20140109095816.409cd2a9@redhat.com>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
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
X-List-Received-Date: Tue, 14 Jan 2014 18:11:33 -0000

09.01.2014 18:58, Luiz Capitulino wrote:
> Use sizeof(strucy virtio_balloon_config) instead.
> 
> --- a/hw/virtio/virtio-balloon.c
> +++ b/hw/virtio/virtio-balloon.c
> @@ -263,7 +263,7 @@ static void virtio_balloon_get_config(VirtIODevice *vdev, uint8_t *config_data)
>      config.num_pages = cpu_to_le32(dev->num_pages);
>      config.actual = cpu_to_le32(dev->actual);
>  
> -    memcpy(config_data, &config, 8);
> +    memcpy(config_data, &config, sizeof(struct virtio_balloon_config));

I'm not sure any of those is better than another.

This is a published guest <=> host interface, the config _must_ be 8 bytes
long and must contain 2 4-byte words in it.

We may use assert(sizeof(struct virtio_balloon_config) == 8) somewhere,
but to my taste it is a bit overkill.  No?

Thanks,

/mjt

