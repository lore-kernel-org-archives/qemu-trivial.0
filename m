Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WaJvC-0001S2-2I
	for mharc-qemu-trivial@gnu.org; Wed, 16 Apr 2014 03:06:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43322)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1WaJv4-0001IM-9E
	for qemu-trivial@nongnu.org; Wed, 16 Apr 2014 03:06:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1WaJuy-0004ki-5h
	for qemu-trivial@nongnu.org; Wed, 16 Apr 2014 03:06:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:32802)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1WaJul-0004iR-KZ; Wed, 16 Apr 2014 03:05:47 -0400
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s3G74gg0031122
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Wed, 16 Apr 2014 03:04:43 -0400
Received: from blackfin.pond.sub.org (ovpn-116-32.ams2.redhat.com
	[10.36.116.32])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s3G74dFY012564
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 16 Apr 2014 03:04:40 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id EBCC5200D1; Wed, 16 Apr 2014 09:04:38 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Chen Gang <gang.chen.5i5j@gmail.com>
References: <534DC6EA.6050203@gmail.com>
Date: Wed, 16 Apr 2014 09:04:38 +0200
In-Reply-To: <534DC6EA.6050203@gmail.com> (Chen Gang's message of "Wed, 16 Apr
	2014 07:55:22 +0800")
Message-ID: <87ha5t21rt.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>, Michael Tokarev <mjt@tls.msk.ru>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Anthony Liguori <aliguori@amazon.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH trivial v2 0/2] vl: simplify
	code for main()
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
X-List-Received-Date: Wed, 16 Apr 2014 07:06:12 -0000

Chen Gang <gang.chen.5i5j@gmail.com> writes:

> In "vl.c", at least, we can simplify the code below, so can let readers
> read professional C code (especially for new readers, which often start
> reading code at main function).
>
>  - Remove useless 'continue' in main().
>
>  - Eliminate a superfluous local variable in main().
>
> Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>

Reviewed-by: Markus Armbruster <armbru@redhat.com>

