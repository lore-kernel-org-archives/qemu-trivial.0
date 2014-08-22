Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XKm04-0006RM-7A
	for mharc-qemu-trivial@gnu.org; Fri, 22 Aug 2014 06:23:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47745)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ben@xrsa.net>) id 1XKlzx-0006Px-5L
	for qemu-trivial@nongnu.org; Fri, 22 Aug 2014 06:23:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ben@xrsa.net>) id 1XKlzs-0001XW-2r
	for qemu-trivial@nongnu.org; Fri, 22 Aug 2014 06:23:09 -0400
Received: from mail-ie0-f174.google.com ([209.85.223.174]:64738)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <ben@xrsa.net>)
	id 1XKlzr-0001XO-SZ
	for qemu-trivial@nongnu.org; Fri, 22 Aug 2014 06:23:03 -0400
Received: by mail-ie0-f174.google.com with SMTP id rp18so6247400iec.33
	for <qemu-trivial@nongnu.org>; Fri, 22 Aug 2014 03:23:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=7ungAGUXJQtrr5U7jNFn6Au011ZcfBp/gMo4xJMhVAk=;
	b=JRPesJqxXRyNKPP71VLeC0zefb6MuzAv9ylhW9PfS+c3LPC3evEGq2UkqsgQirVtKi
	jCSj/YPvK20y871afExkS37M9RjIYVKSZfBIltwSvblsZXWfVfif2xQRUC42ZZsUt1mM
	XoqBo03uC6yMiw4Fe+scan3UQYTNx2iIxZa5PczB7ONX+3LdhOgqrcu61R+tlBjFW1gF
	t2+K4NO3ZFtpF+hTWw6C7J5qlgRx5EFKt5ujMB3Ry74HAF9RzCvHxUFurzsCBAsDsiTR
	gc0Wxkux3wpIBJEPTtua7aeXIEs/uzGa2p3bY/47EWXG/+kq00Rb8rB/eXdCjSQuthTi
	jt/A==
X-Gm-Message-State: ALoCoQlBB8P7fIjEKe0cfBvdMqkuXNWe/ToAehPv7S+FqclYKIoafUZVqOWKD9Z1aW0qgA/wE519
MIME-Version: 1.0
X-Received: by 10.42.63.15 with SMTP id a15mr331523ici.80.1408702983010; Fri,
	22 Aug 2014 03:23:03 -0700 (PDT)
Received: by 10.43.10.130 with HTTP; Fri, 22 Aug 2014 03:23:02 -0700 (PDT)
X-Originating-IP: [62.105.160.35]
In-Reply-To: <1408537634-3812-1-git-send-email-ben@xrsa.net>
References: <1408537634-3812-1-git-send-email-ben@xrsa.net>
Date: Fri, 22 Aug 2014 11:23:02 +0100
Message-ID: <CAGNXWDMV-zHmN+dgyJmc53cx_W_WPBQmbudMxChrXoXtnYzKnQ@mail.gmail.com>
From: Ben Draper <ben@xrsa.net>
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary=90e6ba5bb9e9e5930f050135380b
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.223.174
Cc: qemu-trivial@nongnu.org, Ben Draper <ben@xrsa.net>, stefanha@redhat.com
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
X-List-Received-Date: Fri, 22 Aug 2014 10:23:14 -0000

--90e6ba5bb9e9e5930f050135380b
Content-Type: text/plain; charset=UTF-8

Interestingly this does not appear to affect Windows guests on the same
host/bridge as the ESXi guest, as
Windows pads the frames before sending them out. However it does affect
Linux guests on the same host/bridge
from communicating with the ESXi guest itself and the guests ESXi hosts.


--

*View My LinkedIn Profile*

http://uk.linkedin.com/in/bendraper00


On 20 August 2014 13:27, Ben Draper <ben@xrsa.net> wrote:

> When running VMware ESXi under qemu-kvm the guest discards frames
> that are too short. Short ARP Requests will be dropped, this prevents
> guests on the same bridge as VMware ESXi from communicating. This patch
> simply adds the padding on the network device itself.
>
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
> @@ -1871,12 +1872,21 @@ vmxnet3_receive(NetClientState *nc, const uint8_t
> *buf, size_t size)
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
> --
> 1.7.10.4
>
>

--90e6ba5bb9e9e5930f050135380b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Interestingly this does not appear to affect Windows guest=
s on the same host/bridge as the ESXi guest, as<div>Windows pads the frames=
 before sending them out. However it does affect Linux guests on the same h=
ost/bridge</div>
<div>from communicating with the ESXi guest itself and the guests ESXi host=
s.</div></div><div class=3D"gmail_extra"><br clear=3D"all"><div><div dir=3D=
"ltr"><div><br></div><div>--</div><div><br></div><div><u>View My LinkedIn P=
rofile</u></div>
<div><br></div><div><a href=3D"http://uk.linkedin.com/in/bendraper00" targe=
t=3D"_blank">http://uk.linkedin.com/in/bendraper00</a><br></div></div></div=
>
<br><br><div class=3D"gmail_quote">On 20 August 2014 13:27, Ben Draper <spa=
n dir=3D"ltr">&lt;<a href=3D"mailto:ben@xrsa.net" target=3D"_blank">ben@xrs=
a.net</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
When running VMware ESXi under qemu-kvm the guest discards frames<br>
that are too short. Short ARP Requests will be dropped, this prevents<br>
guests on the same bridge as VMware ESXi from communicating. This patch<br>
simply adds the padding on the network device itself.<br>
<br>
Signed-off-by: Ben Draper &lt;<a href=3D"mailto:ben@xrsa.net">ben@xrsa.net<=
/a>&gt;<br>
---<br>
=C2=A0hw/net/vmxnet3.c |=C2=A0 =C2=A010 ++++++++++<br>
=C2=A01 file changed, 10 insertions(+)<br>
<br>
diff --git a/hw/net/vmxnet3.c b/hw/net/vmxnet3.c<br>
index 791321f..f246fa1 100644<br>
--- a/hw/net/vmxnet3.c<br>
+++ b/hw/net/vmxnet3.c<br>
@@ -34,6 +34,7 @@<br>
<br>
=C2=A0#define PCI_DEVICE_ID_VMWARE_VMXNET3_REVISION 0x1<br>
=C2=A0#define VMXNET3_MSIX_BAR_SIZE 0x2000<br>
+#define MIN_BUF_SIZE 60<br>
<br>
=C2=A0#define VMXNET3_BAR0_IDX=C2=A0 =C2=A0 =C2=A0 (0)<br>
=C2=A0#define VMXNET3_BAR1_IDX=C2=A0 =C2=A0 =C2=A0 (1)<br>
@@ -1871,12 +1872,21 @@ vmxnet3_receive(NetClientState *nc, const uint8_t *=
buf, size_t size)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0VMXNET3State *s =3D qemu_get_nic_opaque(nc);<br>
=C2=A0 =C2=A0 =C2=A0size_t bytes_indicated;<br>
+=C2=A0 =C2=A0 uint8_t min_buf[MIN_BUF_SIZE];<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (!vmxnet3_can_receive(nc)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMW_PKPRN(&quot;Cannot receive now&quot;)=
;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
+=C2=A0 =C2=A0 /* Pad to minimum Ethernet frame length */<br>
+=C2=A0 =C2=A0 if (size &lt; sizeof(min_buf)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 memcpy(min_buf, buf, size);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 memset(&amp;min_buf[size], 0, sizeof(min_buf) =
- size);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 buf =3D min_buf;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 size =3D sizeof(min_buf);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
=C2=A0 =C2=A0 =C2=A0if (s-&gt;peer_has_vhdr) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vmxnet_rx_pkt_set_vhdr(s-&gt;rx_pkt, (str=
uct virtio_net_hdr *)buf);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0buf +=3D sizeof(struct virtio_net_hdr);<b=
r>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.7.10.4<br>
<br>
</font></span></blockquote></div><br></div>

--90e6ba5bb9e9e5930f050135380b--

