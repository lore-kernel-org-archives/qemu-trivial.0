Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WW1pl-0004Nl-KN
	for mharc-qemu-trivial@gnu.org; Fri, 04 Apr 2014 06:58:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35710)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1WW1pd-0004DN-6C
	for qemu-trivial@nongnu.org; Fri, 04 Apr 2014 06:58:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1WW1pX-0005q1-1p
	for qemu-trivial@nongnu.org; Fri, 04 Apr 2014 06:58:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47626)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1WW1pK-0005n2-BW; Fri, 04 Apr 2014 06:58:26 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s34AvMI6000579
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 4 Apr 2014 06:57:22 -0400
Received: from blackfin.pond.sub.org (ovpn-116-22.ams2.redhat.com
	[10.36.116.22])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s34AvKj4002608
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Fri, 4 Apr 2014 06:57:21 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id B2AC2200D1; Fri,  4 Apr 2014 12:57:19 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Chen Gang <gang.chen.5i5j@gmail.com>
References: <53337BEB.90305@gmail.com> <87wqfgrp83.fsf@blackfin.pond.sub.org>
	<5333F6E2.9080202@gmail.com> <53382DDD.8050001@gmail.com>
	<87fvlylf02.fsf@blackfin.pond.sub.org> <53396545.805@gmail.com>
	<CAFEAcA-GL7bnZ-Pkga9PzDq7DpwPf8Gx0Wezzkm_CCbSUB1W8A@mail.gmail.com>
	<533969AB.4010505@gmail.com>
	<CAFEAcA_w=35e9dVL_Zo84MoxZqCUH9qJ76v=Pn=XQ0FZq8g_-g@mail.gmail.com>
	<53396CE9.9090405@gmail.com>
	<CAFEAcA9dk3991gc+FK0qp9QwhWkjxO0vK=X1TxS37Y1sXD5RNw@mail.gmail.com>
	<533E7DD5.3090203@gmail.com>
Date: Fri, 04 Apr 2014 12:57:19 +0200
In-Reply-To: <533E7DD5.3090203@gmail.com> (Chen Gang's message of "Fri, 04 Apr
	2014 17:39:33 +0800")
Message-ID: <87r45dweeo.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Anthony Liguori <aliguori@amazon.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH-trivial v2] vl: Report
	accelerator not supported for target more nicely
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
X-List-Received-Date: Fri, 04 Apr 2014 10:58:51 -0000

Chen Gang <gang.chen.5i5j@gmail.com> writes:

> When you ask for an accelerator not supported for your target, you get
> a bogus "accelerator does not exist" message:
>
>   $ qemu-system-arm -machine none,accel=kvm
>   KVM not supported for this target
>   "kvm" accelerator does not exist.
>   No accelerator found!
>
> Suppress it.
>
>
> Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>

Reviewed-by: Markus Armbruster <armbru@redhat.com>

