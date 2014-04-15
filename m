Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WZz5J-0004WG-9a
	for mharc-qemu-trivial@gnu.org; Tue, 15 Apr 2014 04:51:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33198)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1WZz5C-0004GN-Nh
	for qemu-trivial@nongnu.org; Tue, 15 Apr 2014 04:51:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1WZz56-00030o-Iz
	for qemu-trivial@nongnu.org; Tue, 15 Apr 2014 04:51:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44189)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1WZz4t-0002yI-Ta; Tue, 15 Apr 2014 04:50:52 -0400
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s3F8olKp003385
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 15 Apr 2014 04:50:47 -0400
Received: from blackfin.pond.sub.org (ovpn-116-48.ams2.redhat.com
	[10.36.116.48])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id s3F8ojj8016528
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 15 Apr 2014 04:50:46 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id E55BA200D1; Tue, 15 Apr 2014 10:50:44 +0200 (CEST)
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
	<533E7DD5.3090203@gmail.com> <5340F4FD.7040305@msgid.tls.msk.ru>
	<53414941.5040908@gmail.com> <5343E4D4.6070305@gmail.com>
	<5343E516.3020103@gmail.com>
Date: Tue, 15 Apr 2014 10:50:44 +0200
In-Reply-To: <5343E516.3020103@gmail.com> (Chen Gang's message of "Tue, 08 Apr
	2014 20:01:26 +0800")
Message-ID: <87lhv7gemz.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>, Michael Tokarev <mjt@tls.msk.ru>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Anthony Liguori <aliguori@amazon.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH trivial 1/3] vl: remove
	useless 'continue'
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
X-List-Received-Date: Tue, 15 Apr 2014 08:51:17 -0000

Chen Gang <gang.chen.5i5j@gmail.com> writes:

> Normal "if (...) {...} else {...}" is enough in "while(...) {...}", not
> need additional useless 'continue'.
>
> Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
> ---
>  vl.c |    1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/vl.c b/vl.c
> index 9975e5a..7505002 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -3034,7 +3034,6 @@ int main(int argc, char **argv, char **envp)
>          if (argv[optind][0] != '-') {
>              /* disk image */
>              optind++;
> -            continue;
>          } else {
>              const QEMUOption *popt;

Reviewed-by: Markus Armbruster <armbru@redhat.com>

