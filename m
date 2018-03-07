Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1etO2Y-0002VE-6e
	for mharc-qemu-trivial@gnu.org; Tue, 06 Mar 2018 20:38:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34364)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1etO2W-0002Tt-54
	for qemu-trivial@nongnu.org; Tue, 06 Mar 2018 20:38:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1etO2V-0000uk-Ej
	for qemu-trivial@nongnu.org; Tue, 06 Mar 2018 20:38:44 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:49366 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <famz@redhat.com>)
	id 1etO2O-0000t8-R6; Tue, 06 Mar 2018 20:38:37 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4985B4023ECC;
	Wed,  7 Mar 2018 01:38:36 +0000 (UTC)
Received: from localhost (ovpn-12-79.pek2.redhat.com [10.72.12.79])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 70B4710B0F46;
	Wed,  7 Mar 2018 01:38:32 +0000 (UTC)
Date: Wed, 7 Mar 2018 09:38:31 +0800
From: Fam Zheng <famz@redhat.com>
To: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Message-ID: <20180307013831.GF13844@lemon.usersys.redhat.com>
References: <20180306161728.20890-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20180306161728.20890-1-marcandre.lureau@redhat.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Wed, 07 Mar 2018 01:38:36 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Wed, 07 Mar 2018 01:38:36 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'famz@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] build-sys: make help could
 have 'modules' target
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
X-List-Received-Date: Wed, 07 Mar 2018 01:38:45 -0000

On Tue, 03/06 17:17, Marc-Andr=E9 Lureau wrote:
> Available when configure --enable-modules.
>=20
> Signed-off-by: Marc-Andr=E9 Lureau <marcandre.lureau@redhat.com>
> ---
>  Makefile | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/Makefile b/Makefile
> index 9a75c48ae0..5d9ef3b8fd 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1046,6 +1046,9 @@ include $(SRC_PATH)/tests/vm/Makefile.include
>  help:
>  	@echo  'Generic targets:'
>  	@echo  '  all             - Build all'
> +ifdef CONFIG_MODULES
> +	@echo  '  modules         - Build all modules'
> +endif

Hi Marc-Andr=E9,

I'd just remove the 'ifdef' condition and include the line everywhere, si=
nce
this is the help. The behavior is fine even without running ./configure:

$ make modules
make: Nothing to be done for 'modules'.
$ make all
make: Nothing to be done for 'all'.

Fam

