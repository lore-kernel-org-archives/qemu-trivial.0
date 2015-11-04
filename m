Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Zu2iu-0005M3-4x
	for mharc-qemu-trivial@gnu.org; Wed, 04 Nov 2015 13:23:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55526)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1Zu2ir-0005K9-Td
	for qemu-trivial@nongnu.org; Wed, 04 Nov 2015 13:23:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1Zu2iq-0006Mc-Ty
	for qemu-trivial@nongnu.org; Wed, 04 Nov 2015 13:23:49 -0500
Received: from mx2.suse.de ([195.135.220.15]:59552)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1Zu2il-0006Le-MS; Wed, 04 Nov 2015 13:23:43 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (charybdis-ext.suse.de [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id CF1BCAAC1;
	Wed,  4 Nov 2015 18:23:24 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>,
	Cao jin <caoj.fnst@cn.fujitsu.com>
References: <1446518202-12162-1-git-send-email-caoj.fnst@cn.fujitsu.com>
	<CAFEAcA--Rq8iXJXSXeVgwqkh3bUAre-87euBnHt3f-Ev=3eRJQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Organization: SUSE Linux GmbH
Message-ID: <563A4D2E.6080800@suse.de>
Date: Wed, 4 Nov 2015 19:23:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA--Rq8iXJXSXeVgwqkh3bUAre-87euBnHt3f-Ev=3eRJQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 195.135.220.15
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH v2] qom/object: fix 2 comment typos
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
X-List-Received-Date: Wed, 04 Nov 2015 18:23:50 -0000

Am 03.11.2015 um 14:39 schrieb Peter Maydell:
> On 3 November 2015 at 02:36, Cao jin <caoj.fnst@cn.fujitsu.com> wrote:
>> Also change the misleading definition of macro OBJECT_CLASS_CHECK
>>
>> Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
>=20
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Thanks, applied to qom-next (tweaking the commit message):
https://github.com/afaerber/qemu-cpu/commits/qom-next

Regards,
Andreas

--=20
SUSE Linux GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Felix Imend=C3=B6rffer, Jane Smithard, Graham Norton; HRB 21284 (AG N=
=C3=BCrnberg)

