Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e00Kf-0001gU-UH
	for mharc-qemu-trivial@gnu.org; Thu, 05 Oct 2017 03:12:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52319)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1e00Kd-0001ek-Ph
	for qemu-trivial@nongnu.org; Thu, 05 Oct 2017 03:12:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1e00Kc-00077O-Pe
	for qemu-trivial@nongnu.org; Thu, 05 Oct 2017 03:12:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44592)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1e00KX-00070U-IU; Thu, 05 Oct 2017 03:12:25 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DEBC5C0587E8;
	Thu,  5 Oct 2017 07:12:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com DEBC5C0587E8
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=lvivier@redhat.com
Received: from [10.36.116.122] (ovpn-116-122.ams2.redhat.com [10.36.116.122])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F1EB65C3FF;
	Thu,  5 Oct 2017 07:12:22 +0000 (UTC)
To: Marco A L Barbosa <malbarbo@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <CAHpsRN-XzxjJZb=rb0iHMv4Afv=2H3N5U7p4+NNJFPkxgSLMXg@mail.gmail.com>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <43071208-759c-6476-0cb0-c4e7e0daaf77@redhat.com>
Date: Thu, 5 Oct 2017 09:12:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAHpsRN-XzxjJZb=rb0iHMv4Afv=2H3N5U7p4+NNJFPkxgSLMXg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Thu, 05 Oct 2017 07:12:24 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] linux-user: Add random ioctls
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
X-List-Received-Date: Thu, 05 Oct 2017 07:12:32 -0000

On 05/10/2017 00:06, Marco A L Barbosa wrote:
> I don't know how (and if it is necessary) to add buf field to
> rand_pool_info struct. See
> https://github.com/torvalds/linux/blob/5924bbecd0267d87c24110cbe2041b50=
75173a25/include/uapi/linux/random.h#L17

I doesn't look really trivial...

To manage the buf field you must read buf_size and it cannot be done in=20
a generic way: you must define a function to translate the buffer, use=20
IOCTL_SPECIAL() with RNDADDENTROPY and RNDGETPOOL.

You should send your patch using "git send-email" or "git publish"=20
instead of adding it in you email client.

> Signed-off-by: Marco A L Barbosa <malbarbo@gmail.com
> <mailto:malbarbo@gmail.com>>
> ---
> =C2=A0linux-user/ioctls.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 7=
 +++++++
> =C2=A0linux-user/syscall.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +
> =C2=A0linux-user/syscall_defs.h=C2=A0 | 9 +++++++++
> =C2=A0linux-user/syscall_types.h | 4 ++++
> =C2=A04 files changed, 21 insertions(+)
>=20
> diff --git a/linux-user/ioctls.h b/linux-user/ioctls.h
> index e6997ff230..9240a83f30 100644
> --- a/linux-user/ioctls.h
> +++ b/linux-user/ioctls.h
> @@ -173,6 +173,13 @@
> =C2=A0=C2=A0 IOCTL(SIOCGSTAMP, IOC_R, MK_PTR(MK_STRUCT(STRUCT_timeval))=
)
> =C2=A0=C2=A0 IOCTL(SIOCGSTAMPNS, IOC_R, MK_PTR(MK_STRUCT(STRUCT_timespe=
c)))
> =C2=A0
> +=C2=A0 IOCTL(RNDGETENTCNT, IOC_R, MK_PTR(TYPE_INT))
> +=C2=A0 IOCTL(RNDADDTOENTCNT, IOC_W, MK_PTR(MK_STRUCT(STRUCT_rand_pool_=
info)))

..., MK_PTR(TYPE_INT)

> +=C2=A0 IOCTL(RNDGETPOOL, IOC_R, MK_PTR(TYPE_INT))

... MK_PTR(MK_STRUCT(STRUCT_rand_pool_info))

Thanks,
Laurent

