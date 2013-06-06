Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UkNwG-0007AU-Jh
	for mharc-qemu-trivial@gnu.org; Wed, 05 Jun 2013 20:20:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38663)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>) id 1UkNwA-0007AM-UY
	for qemu-trivial@nongnu.org; Wed, 05 Jun 2013 20:20:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>) id 1UkNw5-0006uo-Pc
	for qemu-trivial@nongnu.org; Wed, 05 Jun 2013 20:20:18 -0400
Received: from [222.73.24.84] (port=61873 helo=song.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>)
	id 1UkNw5-0006dT-Eq; Wed, 05 Jun 2013 20:20:13 -0400
X-IronPort-AV: E=Sophos;i="4.87,810,1363104000"; 
   d="scan'208";a="7472120"
Received: from unknown (HELO tang.cn.fujitsu.com) ([10.167.250.3])
	by song.cn.fujitsu.com with ESMTP; 06 Jun 2013 08:17:04 +0800
Received: from fnstmail02.fnst.cn.fujitsu.com (tang.cn.fujitsu.com [127.0.0.1])
	by tang.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id r560JuRJ026598;
	Thu, 6 Jun 2013 08:19:56 +0800
Received: from [10.167.233.147] ([10.167.233.147])
	by fnstmail02.fnst.cn.fujitsu.com (Lotus Domino Release 8.5.3)
	with ESMTP id 2013060608181418-1875918 ;
	Thu, 6 Jun 2013 08:18:14 +0800 
From: li guang <lig.fnst@cn.fujitsu.com>
To: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <1370467013-9270-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1370467013-9270-1-git-send-email-mjt@msgid.tls.msk.ru>
Date: Thu, 06 Jun 2013 08:18:51 +0800
Message-ID: <1370477931.17798.79.camel@liguang.fnst.cn.fujitsu.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-MIMETrack: Itemize by SMTP Server on mailserver/fnst(Release 8.5.3|September
	15, 2011) at 2013/06/06 08:18:14,
	Serialize by Router on mailserver/fnst(Release 8.5.3|September 15,
	2011) at 2013/06/06 08:18:14,
	Serialize complete at 2013/06/06 08:18:14
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 222.73.24.84
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH trivial] gitignore: unignore *.patch
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
X-List-Received-Date: Thu, 06 Jun 2013 00:20:23 -0000

=E5=9C=A8 2013-06-06=E5=9B=9B=E7=9A=84 01:16 +0400=EF=BC=8CMichael Tokarev=
=E5=86=99=E9=81=93=EF=BC=9A
> This partially reverts:
>=20
>  commit 082369e62c5bbaba89f173c2b803bc24115bb111
>  Author: liguang <lig.fnst@cn.fujitsu.com>
>  Date:   Fri Mar 22 16:44:13 2013 +0800
>=20
>     gitignore: ignore more files
>=20
> I'm not sure how this went in.  The thing is that
> ignoring *.patch, in my opinion, is just wrong.
> Especially for downstreams who apply patches for
> real.
>=20

ignore *.patch is convenient in my opinion, you can change
if it bothered someone else.

thanks!

> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>  .gitignore |    1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/.gitignore b/.gitignore
> index 64e9466..0fe114d 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -82,7 +82,6 @@ fsdev/virtfs-proxy-helper.pod
>  *.swp
>  *.orig
>  .pc
> -*.patch
>  *.gcda
>  *.gcno
>  patches



