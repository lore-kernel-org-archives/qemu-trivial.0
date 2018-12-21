Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gaM4V-0004n4-LW
	for mharc-qemu-trivial@gnu.org; Fri, 21 Dec 2018 09:46:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57850)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1gaM4R-0004iL-7k
	for qemu-trivial@nongnu.org; Fri, 21 Dec 2018 09:46:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1gaM4Q-00054v-Gb
	for qemu-trivial@nongnu.org; Fri, 21 Dec 2018 09:46:35 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:53853)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mjt@tls.msk.ru>)
	id 1gaM4I-0004mm-17; Fri, 21 Dec 2018 09:46:26 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id A20354290C;
	Fri, 21 Dec 2018 17:46:12 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with ESMTP id 83C8F170E;
	Fri, 21 Dec 2018 17:46:12 +0300 (MSK)
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
	qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, qemu-trivial@nongnu.org
References: <20181221134115.27973-1-berrange@redhat.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <185800dd-7eec-5553-ed19-f79c4d6c6cff@msgid.tls.msk.ru>
Date: Fri, 21 Dec 2018 17:46:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <20181221134115.27973-1-berrange@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] hw/usb: fix mistaken de-initialization
 of CCID state
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
X-List-Received-Date: Fri, 21 Dec 2018 14:46:38 -0000

21.12.2018 16:41, Daniel P. Berrang=C3=A9 wrote:
> In previous commit:
>=20
>    commit 7dea29e4af17fc1d27478de9f8ea38144deac54a
>    Author: Li Qiang <liq3ea@gmail.com>
>    Date:   Fri Oct 19 03:50:36 2018 -0700
[]

> --- a/hw/usb/ccid-card-emulated.c
> +++ b/hw/usb/ccid-card-emulated.c
> @@ -549,6 +549,8 @@ static void emulated_realize(CCIDCardState *base, E=
rror **errp)
>       qemu_thread_create(&card->apdu_thread_id, "ccid/apdu", handle_apd=
u_thread,
>                          card, QEMU_THREAD_JOINABLE);
>  =20
> +    return;
> +
>   out2:
>       clean_event_notifier(card);
>   out1:

Lovely :)

Reviewed-By: Michael Tokarev <mjt@tls.msk.ru>

/mjt

