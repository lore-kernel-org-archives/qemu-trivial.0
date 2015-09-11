Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZaKYi-0006Zp-0W
	for mharc-qemu-trivial@gnu.org; Fri, 11 Sep 2015 05:23:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54433)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZaKYf-0006UI-9t
	for qemu-trivial@nongnu.org; Fri, 11 Sep 2015 05:23:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZaKYe-00027N-CC
	for qemu-trivial@nongnu.org; Fri, 11 Sep 2015 05:23:49 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:58815)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZaKYY-00024y-Fi; Fri, 11 Sep 2015 05:23:42 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id AA3CD4142B;
	Fri, 11 Sep 2015 12:23:40 +0300 (MSK)
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 9282BA52;
	Fri, 11 Sep 2015 12:23:40 +0300 (MSK)
Message-ID: <55F29D9C.6080504@msgid.tls.msk.ru>
Date: Fri, 11 Sep 2015 12:23:40 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: Gerd Hoffmann <kraxel@redhat.com>
References: <1436788726-20590-1-git-send-email-kraxel@redhat.com>	<55F2830C.1000308@msgid.tls.msk.ru>
	<1441962833.29362.16.camel@redhat.com>
In-Reply-To: <1441962833.29362.16.camel@redhat.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
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
X-List-Received-Date: Fri, 11 Sep 2015 09:23:50 -0000

11.09.2015 12:13, Gerd Hoffmann =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> On Fr, 2015-09-11 at 10:30 +0300, Michael Tokarev wrote:
>> 13.07.2015 14:58, Gerd Hoffmann wrote:
>>> Cc: Paolo Bonzini <pbonzini@redhat.com>
>>> Cc: qemu-trivial@nongnu.org
>>> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
>>
>> Gerd, -trivial received 3 patches like this enabling various virtio
>> bits for various architectures.  I never got any reviewed-by or ACK
>> on these patches, so they're not applied still.  Maybe you can add
>> some explanation as to why you think it's a good idea, or else it
>> doesn't seem like a trivial change? :)
>=20
> This one just syncs x86_64 and i386.  Dunno about the other ones, have =
a
> pointer?

Ok, applied this one to -trivial (with a commit comment :)

The other 2 are actually 2 incarnations of the same patch,
http://patchwork.ozlabs.org/patch/494250/

Since the replies hasn't been seen at qemu-trivial@ I haven't
found the replies.  Now I did, and it looks like the patch
needs some more work ;)

Thanks,

/mjt

