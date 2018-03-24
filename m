Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ezid5-0006FC-TD
	for mharc-qemu-trivial@gnu.org; Sat, 24 Mar 2018 08:50:39 -0400
Received: from eggs.gnu.org ([208.118.235.92]:37741)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mprivozn@redhat.com>) id 1ezic1-00062V-FH
	for qemu-trivial@nongnu.org; Sat, 24 Mar 2018 08:50:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mprivozn@redhat.com>) id 1eziYO-00014w-FN
	for qemu-trivial@nongnu.org; Sat, 24 Mar 2018 08:49:33 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:50744 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mprivozn@redhat.com>)
	id 1eziTY-0007Yd-AD; Sat, 24 Mar 2018 08:40:48 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D6B51722C4;
	Sat, 24 Mar 2018 12:40:44 +0000 (UTC)
Received: from [10.40.204.18] (ovpn-204-18.brq.redhat.com [10.40.204.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8537A10B0F2C;
	Sat, 24 Mar 2018 12:40:39 +0000 (UTC)
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
Cc: QEMU <qemu-devel@nongnu.org>, qemu trival <qemu-trivial@nongnu.org>,
	Gerd Hoffmann <kraxel@redhat.com>
References: <4e8dcc24123a09587ecc427f2e80727ba41a7866.1521868380.git.mprivozn@redhat.com>
	<CAJ+F1CJgXUY888Bo-SQ2yiDWeKk0NKe06bdzkZFL7A-6B4FusQ@mail.gmail.com>
From: Michal Privoznik <mprivozn@redhat.com>
Message-ID: <82d1bda3-36a9-e5b9-1aa0-8319750c57f7@redhat.com>
Date: Sat, 24 Mar 2018 13:40:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAJ+F1CJgXUY888Bo-SQ2yiDWeKk0NKe06bdzkZFL7A-6B4FusQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Sat, 24 Mar 2018 12:40:44 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Sat, 24 Mar 2018 12:40:44 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'mprivozn@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] ccid-card: include
 libcacard.h only
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
X-List-Received-Date: Sat, 24 Mar 2018 12:50:39 -0000

On 03/24/2018 12:01 PM, Marc-Andr=C3=A9 Lureau wrote:
> Hi
>=20
> On Sat, Mar 24, 2018 at 6:13 AM, Michal Privoznik <mprivozn@redhat.com>=
 wrote:
>> When trying to build with latest libcacard-2.5.1, I hit the
>> following error:
>>
>> In file included from hw/usb/ccid-card-passthru.c:12:0:
>> /usr/include/cacard/vscard_common.h:26:2: error: #warning "Only <libca=
card.h> can be included directly" [-Werror=3Dcpp]
>>  #warning "Only <libcacard.h> can be included directly"
>>
>=20
> The warning was promptly removed in 2.5.2:
> https://cgit.freedesktop.org/spice/libcacard/commit/?id=3D998db1e88eb82=
19264476c022d1446f3cb4330e8

Cool. But We can still include just top level header file instead of
individual files, can't we?

Michal

