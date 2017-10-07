Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0hoZ-0000nY-2R
	for mharc-qemu-trivial@gnu.org; Sat, 07 Oct 2017 01:38:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34391)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1e0dGv-0006ef-ME
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 20:47:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1e0dGu-0002UT-Vr
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 20:47:17 -0400
Received: from m50-138.163.com ([123.125.50.138]:57332)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1e0dGq-0002Qp-0X; Fri, 06 Oct 2017 20:47:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Mime-Version:Subject:From:Date:Message-Id; bh=3GNzx
	4OpGYG15Hby2PC1VyWYaCoflYTde8zpyJTiDMQ=; b=Wf9nAtRqi1TJ6il396KR0
	druYqemqc0qBfuXSI2CrmqguXNqwq6tHhN8UT3cAqo54SPdcMrt3IVPsv78tddWi
	l0lnAQSMzDD8o62ydYq35oJPxDD/fc0ZGmskaBdj1bxvjdHnAtbSzriFveUZRdp/
	CV3gOmM61UEpjag/r4/gLo=
Received: from [192.168.0.115] (unknown [171.124.242.126])
	by smtp1 (Coremail) with SMTP id C9GowAAnSdf6I9hZvGrCAA--.435S2;
	Sat, 07 Oct 2017 08:46:51 +0800 (CST)
Content-Type: text/plain;
	charset=gb2312
Mime-Version: 1.0 (1.0)
From: xiaoqiang zhao <zxq_yx_007@163.com>
X-Mailer: iPhone Mail (15A402)
In-Reply-To: <20171006235023.11952-52-f4bug@amsat.org>
Date: Sat, 7 Oct 2017 08:46:50 +0800
Cc: =?GB2312?Q?Marc-Andr=A8=A6_Lureau?= <marcandre.lureau@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>, 
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>, Kevin Wolf <kwolf@redhat.com>, 
	=?GB2312?Q?Marc-Andr=A8=A6_Lureau?= <marcandre.lureau@redhat.com>,
	qemu trival <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <2F978D95-3433-4ABB-8421-B43017497006@163.com>
References: <20171006235023.11952-1-f4bug@amsat.org>
	<20171006235023.11952-52-f4bug@amsat.org>
To: =?GB2312?Q?Philippe_Mathieu-Daud=A8=A6?= <f4bug@amsat.org>
X-CM-TRANSID: C9GowAAnSdf6I9hZvGrCAA--.435S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7GFW3Xw1ktFWrAr1fAFy5Arb_yoW3CrX_GF
	48ua17JFsxWrnrKF4rA3Z8Xr1Yva18CryFy3WDZr17Xa1Yya42vw12ga1UCF15urWxCF47
	uws5ArWqkryfZjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU12Xd5UUUUU==
X-Originating-IP: [171.124.242.126]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/xtbBEgtqxlZX4wpT6AAAsm
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 123.125.50.138
X-Mailman-Approved-At: Sat, 07 Oct 2017 01:38:18 -0400
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 51/88] hw/timer: use g_new()
 family of functions
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
X-List-Received-Date: Sat, 07 Oct 2017 00:47:18 -0000


> =D4=DA 2017=C4=EA10=D4=C27=C8=D5=A3=AC=C9=CF=CE=E77:49=A3=ACPhilippe Mathi=
eu-Daud=A8=A6 <f4bug@amsat.org> =D0=B4=B5=C0=A3=BA
>=20
> From: Marc-Andr=A8=A6 Lureau <marcandre.lureau@redhat.com>
>=20
> Signed-off-by: Marc-Andr=A8=A6 Lureau <marcandre.lureau@redhat.com>
> ---
> hw/timer/slavio_timer.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/timer/slavio_timer.c b/hw/timer/slavio_timer.c
> index a8cc9c0148..6d0282a788 100644
> --- a/hw/timer/slavio_timer.c
> +++ b/hw/timer/slavio_timer.c
> @@ -385,7 +385,7 @@ static void slavio_timer_init(Object *obj)
>       uint64_t size;
>       char timer_name[20];
>=20
> -        tc =3D g_malloc0(sizeof(TimerContext));
> +        tc =3D g_new0(TimerContext, 1);
>       tc->s =3D s;
>       tc->timer_index =3D i;
>=20
> --=20
> 2.14.2

Reviewed-by: xiaoqiang zhao <zxq_yx_007@163.com>=



