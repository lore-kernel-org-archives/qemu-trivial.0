Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1botCD-0008Mr-Rc
	for mharc-qemu-trivial@gnu.org; Tue, 27 Sep 2016 10:17:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44044)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1botC8-0008HO-1o
	for qemu-trivial@nongnu.org; Tue, 27 Sep 2016 10:17:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1botC6-00005f-UA
	for qemu-trivial@nongnu.org; Tue, 27 Sep 2016 10:17:15 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35712)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1botC0-0008Su-MW; Tue, 27 Sep 2016 10:17:08 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 19F3F6267F;
	Tue, 27 Sep 2016 14:17:07 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-56.ams2.redhat.com
	[10.36.116.56])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8REH5hH000927
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 27 Sep 2016 10:17:06 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id DB97C1132B64; Tue, 27 Sep 2016 16:17:04 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <20160923123508.27000-1-marcandre.lureau@redhat.com>
Date: Tue, 27 Sep 2016 16:17:04 +0200
In-Reply-To: <20160923123508.27000-1-marcandre.lureau@redhat.com>
	(=?utf-8?Q?=22Marc-Andr=C3=A9?=
	Lureau"'s message of "Fri, 23 Sep 2016 16:35:08 +0400")
Message-ID: <87wphxh1gf.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Tue, 27 Sep 2016 14:17:07 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] build-sys: fix find-in-path
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
X-List-Received-Date: Tue, 27 Sep 2016 14:17:21 -0000

Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com> writes:

> Fix spelling, the GNU make text functions is not called "find-string"
> but "findstring".
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  rules.mak | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/rules.mak b/rules.mak
> index 5c82c19..f721988 100644
> --- a/rules.mak
> +++ b/rules.mak
> @@ -132,7 +132,7 @@ endef
>  # Looks in the PATH if the argument contains no slash, else only conside=
rs one
>  # specific directory.  Returns an # empty string if the program doesn't =
exist
>  # there.
> -find-in-path =3D $(if $(find-string /, $1), \
> +find-in-path =3D $(if $(findstring /, $1), \
>          $(wildcard $1), \
>          $(wildcard $(patsubst %, %/$1, $(subst :, ,$(PATH)))))

Impact?

