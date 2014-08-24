Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XLYAR-0000ti-Kn
	for mharc-qemu-trivial@gnu.org; Sun, 24 Aug 2014 09:49:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59413)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dmitry@daynix.com>) id 1XLWue-0001AL-8h
	for qemu-trivial@nongnu.org; Sun, 24 Aug 2014 08:28:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dmitry@daynix.com>) id 1XLWuS-0001t1-7N
	for qemu-trivial@nongnu.org; Sun, 24 Aug 2014 08:28:48 -0400
Received: from mail-we0-f175.google.com ([74.125.82.175]:48721)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dmitry@daynix.com>) id 1XLWuS-0001st-1U
	for qemu-trivial@nongnu.org; Sun, 24 Aug 2014 08:28:36 -0400
Received: by mail-we0-f175.google.com with SMTP id t60so12057219wes.6
	for <qemu-trivial@nongnu.org>; Sun, 24 Aug 2014 05:28:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=kJfR19rNnSEAtNQWNzfUGrs27WOY/PG0XQ7uVDMEst0=;
	b=BtAHDHZG4u3JdSeQgHnddJSNQYuVSVhmNd6u7EJOvnA1BY4cvr2iySgpeKgAkmWmd1
	xwcoNSZ2Psu9zBaalr9Dr9+DVQ0KULANPV/UhJts/DcaLjbeYntZx/a/TnTa1qC22F3W
	6y1fKi07hw2sAWHE06/xeLoFa0tK5dvr67L3T/qvgiJ/y4RwxYrZikXpusGERj7vLIpa
	8ODsItiLd63+QlwmNHmKth/cYGP/NHEkmnD/wn/eYoyB/7L5lM+dYazcuyZ0IVmw/yZu
	WXAOLWnKWt13LSQuXzgwCLryenziA3yx4FYqGRbL3Ciytki9REgeBcnNztX6Rt/YJV7B
	QAHg==
X-Gm-Message-State: ALoCoQn8Vh6WMaCREJq7vzEvUEsHORwhILfq/zg/969RhtlDXXMqgK96lU1VnSG3wA3kP17yPvby
X-Received: by 10.180.188.205 with SMTP id gc13mr9019551wic.66.1408883314978; 
	Sun, 24 Aug 2014 05:28:34 -0700 (PDT)
Received: from [10.0.1.86] ([91.205.155.63]) by mx.google.com with ESMTPSA id
	ph10sm91304764wjb.25.2014.08.24.05.28.33 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 24 Aug 2014 05:28:34 -0700 (PDT)
Content-Type: text/plain; charset=windows-1252
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
From: Dmitry Fleytman <dmitry@daynix.com>
In-Reply-To: <53F9D55D.6060804@msgid.tls.msk.ru>
Date: Sun, 24 Aug 2014 15:28:31 +0300
Content-Transfer-Encoding: quoted-printable
Message-Id: <A9C9B9DB-AEEE-4D79-A968-E0F34671C865@daynix.com>
References: <1408537634-3812-1-git-send-email-ben@xrsa.net>
	<53F9D55D.6060804@msgid.tls.msk.ru>
To: Michael Tokarev <mjt@tls.msk.ru>
X-Mailer: Apple Mail (2.1878.6)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 74.125.82.175
X-Mailman-Approved-At: Sun, 24 Aug 2014 09:49:08 -0400
Cc: qemu-trivial@nongnu.org, Tamir Shomer <tamirs@daynix.com>,
	qemu-devel@nongnu.org, Ben Draper <ben@xrsa.net>,
	Stefan Hajnoczi <stefanha@redhat.com>, Yan Vugenfirer <yan@daynix.com>
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
X-List-Received-Date: Sun, 24 Aug 2014 12:28:53 -0000


On Aug 24, 2014, at 15:06 PM, Michael Tokarev <mjt@tls.msk.ru> wrote:

> 20.08.2014 16:27, Ben Draper wrote:
>> When running VMware ESXi under qemu-kvm the guest discards frames
>> that are too short. Short ARP Requests will be dropped, this prevents
>> guests on the same bridge as VMware ESXi from communicating. This =
patch
>> simply adds the padding on the network device itself.
>=20
> I'm not sure it is "trivial enough", so to say.  Do we have a =
maintainer
> for vmxnet?  It's been written and updated several times by vmware =
(Daynix)
> people, maybe they can comment on this somehow?  I mean, if we don't =
have
> a maintainer for this device, it is okay to go to -trivial, but maybe =
it's
> a good idea to try to reach the author(s) first?  (Adding Cc).
>=20
> Especially since this change is only required in certain cases, not
> generally.


Hi Michael,

I=92m the maintainer of vmxnet3/pvscsi devices in QEMU. Thanks for =
CC=92ing me.

I think this patch is correct and needed.

As we saw a few times already on different operating systems,
vmware drivers expect short packets to be padded as required
by corresponding RFC. Therefore this patch fixes a real bug.

Reviewed-by: Dmitry Fleytman <dmitry@daynix.com>

>=20
> Thanks,
>=20
> /mjt
>=20
>> Signed-off-by: Ben Draper <ben@xrsa.net>
>> ---
>> hw/net/vmxnet3.c |   10 ++++++++++
>> 1 file changed, 10 insertions(+)
>>=20
>> diff --git a/hw/net/vmxnet3.c b/hw/net/vmxnet3.c
>> index 791321f..f246fa1 100644
>> --- a/hw/net/vmxnet3.c
>> +++ b/hw/net/vmxnet3.c
>> @@ -34,6 +34,7 @@
>>=20
>> #define PCI_DEVICE_ID_VMWARE_VMXNET3_REVISION 0x1
>> #define VMXNET3_MSIX_BAR_SIZE 0x2000
>> +#define MIN_BUF_SIZE 60
>>=20
>> #define VMXNET3_BAR0_IDX      (0)
>> #define VMXNET3_BAR1_IDX      (1)
>> @@ -1871,12 +1872,21 @@ vmxnet3_receive(NetClientState *nc, const =
uint8_t *buf, size_t size)
>> {
>>     VMXNET3State *s =3D qemu_get_nic_opaque(nc);
>>     size_t bytes_indicated;
>> +    uint8_t min_buf[MIN_BUF_SIZE];
>>=20
>>     if (!vmxnet3_can_receive(nc)) {
>>         VMW_PKPRN("Cannot receive now");
>>         return -1;
>>     }
>>=20
>> +    /* Pad to minimum Ethernet frame length */
>> +    if (size < sizeof(min_buf)) {
>> +        memcpy(min_buf, buf, size);
>> +        memset(&min_buf[size], 0, sizeof(min_buf) - size);
>> +        buf =3D min_buf;
>> +        size =3D sizeof(min_buf);
>> +    }
>> +
>>     if (s->peer_has_vhdr) {
>>         vmxnet_rx_pkt_set_vhdr(s->rx_pkt, (struct virtio_net_hdr =
*)buf);
>>         buf +=3D sizeof(struct virtio_net_hdr);
>>=20
>=20


