Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XLWZr-0006XN-Mb
	for mharc-qemu-trivial@gnu.org; Sun, 24 Aug 2014 08:07:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57785)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XLWZk-0006NL-Bf
	for qemu-trivial@nongnu.org; Sun, 24 Aug 2014 08:07:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XLWZf-0004wQ-8M
	for qemu-trivial@nongnu.org; Sun, 24 Aug 2014 08:07:12 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:33007)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XLWZU-0004vr-Sz; Sun, 24 Aug 2014 08:06:57 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 9894F449BA;
	Sun, 24 Aug 2014 16:06:53 +0400 (MSK)
Message-ID: <53F9D55D.6060804@msgid.tls.msk.ru>
Date: Sun, 24 Aug 2014 16:06:53 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.7.0
MIME-Version: 1.0
To: Ben Draper <ben@xrsa.net>, qemu-devel@nongnu.org
References: <1408537634-3812-1-git-send-email-ben@xrsa.net>
In-Reply-To: <1408537634-3812-1-git-send-email-ben@xrsa.net>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Dmitry Fleytman <dmitry@daynix.com>,
	Yan Vugenfirer <yan@daynix.com>, stefanha@redhat.com,
	Tamir Shomer <tamirs@daynix.com>
Subject: Re: [Qemu-trivial] [PATCH] vmxnet3: Pad short frames to minimum
	size (60 bytes)
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
X-List-Received-Date: Sun, 24 Aug 2014 12:07:17 -0000

20.08.2014 16:27, Ben Draper wrote:
> When running VMware ESXi under qemu-kvm the guest discards frames
> that are too short. Short ARP Requests will be dropped, this prevents
> guests on the same bridge as VMware ESXi from communicating. This patch
> simply adds the padding on the network device itself.

I'm not sure it is "trivial enough", so to say.  Do we have a maintainer
for vmxnet?  It's been written and updated several times by vmware (Daynix)
people, maybe they can comment on this somehow?  I mean, if we don't have
a maintainer for this device, it is okay to go to -trivial, but maybe it's
a good idea to try to reach the author(s) first?  (Adding Cc).

Especially since this change is only required in certain cases, not
generally.

Thanks,

/mjt

> Signed-off-by: Ben Draper <ben@xrsa.net>
> ---
>  hw/net/vmxnet3.c |   10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/hw/net/vmxnet3.c b/hw/net/vmxnet3.c
> index 791321f..f246fa1 100644
> --- a/hw/net/vmxnet3.c
> +++ b/hw/net/vmxnet3.c
> @@ -34,6 +34,7 @@
>  
>  #define PCI_DEVICE_ID_VMWARE_VMXNET3_REVISION 0x1
>  #define VMXNET3_MSIX_BAR_SIZE 0x2000
> +#define MIN_BUF_SIZE 60
>  
>  #define VMXNET3_BAR0_IDX      (0)
>  #define VMXNET3_BAR1_IDX      (1)
> @@ -1871,12 +1872,21 @@ vmxnet3_receive(NetClientState *nc, const uint8_t *buf, size_t size)
>  {
>      VMXNET3State *s = qemu_get_nic_opaque(nc);
>      size_t bytes_indicated;
> +    uint8_t min_buf[MIN_BUF_SIZE];
>  
>      if (!vmxnet3_can_receive(nc)) {
>          VMW_PKPRN("Cannot receive now");
>          return -1;
>      }
>  
> +    /* Pad to minimum Ethernet frame length */
> +    if (size < sizeof(min_buf)) {
> +        memcpy(min_buf, buf, size);
> +        memset(&min_buf[size], 0, sizeof(min_buf) - size);
> +        buf = min_buf;
> +        size = sizeof(min_buf);
> +    }
> +
>      if (s->peer_has_vhdr) {
>          vmxnet_rx_pkt_set_vhdr(s->rx_pkt, (struct virtio_net_hdr *)buf);
>          buf += sizeof(struct virtio_net_hdr);
> 


