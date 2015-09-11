Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZaOaR-0005ZA-0C
	for mharc-qemu-trivial@gnu.org; Fri, 11 Sep 2015 09:41:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41960)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1ZaOaO-0005Wp-Th
	for qemu-trivial@nongnu.org; Fri, 11 Sep 2015 09:41:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1ZaOaO-0000MS-0i
	for qemu-trivial@nongnu.org; Fri, 11 Sep 2015 09:41:52 -0400
Received: from mx2.suse.de ([195.135.220.15]:55017)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1ZaOaJ-0000KP-Rw; Fri, 11 Sep 2015 09:41:47 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay1.suse.de (charybdis-ext.suse.de [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 52F58ADD0;
	Fri, 11 Sep 2015 13:41:47 +0000 (UTC)
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1431397521-2316-1-git-send-email-shannon.zhao@linaro.org>
	<1431397521-2316-2-git-send-email-shannon.zhao@linaro.org>
	<55F28A17.3080800@msgid.tls.msk.ru>
From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Organization: SUSE Linux GmbH
Message-ID: <55F2DA1B.2040502@suse.de>
Date: Fri, 11 Sep 2015 15:41:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <55F28A17.3080800@msgid.tls.msk.ru>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 195.135.220.15
Cc: peter.maydell@linaro.org, hangaohuai@huawei.com, qemu-trivial@nongnu.org,
	peter.huangpeng@huawei.com, qemu-devel@nongnu.org,
	shannon.zhao@linaro.org, zhaoshenglong@huawei.com,
	christoffer.dall@linaro.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/6]
 hw/s390x/s390-virtio-bus: Remove meaningless blank Property
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
X-List-Received-Date: Fri, 11 Sep 2015 13:41:53 -0000

Michael,

Am 11.09.2015 um 10:00 schrieb Michael Tokarev:
> Applied (finally!) to -trivial, without already fixed -net and -scsi bi=
ts.
> Thanks!

Can you please tweak the subjects? I found "blank Property" a very
troubling thing to read. In fact it's an empty Property[] array.

Thanks,
Andreas

--=20
SUSE Linux GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Felix Imend=F6rffer, Jane Smithard, Graham Norton; HRB 21284 (AG N=FC=
rnberg)

