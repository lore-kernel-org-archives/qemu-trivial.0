Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZAxuv-0001lr-W3
	for mharc-qemu-trivial@gnu.org; Fri, 03 Jul 2015 06:09:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51932)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1ZAxus-0001iG-Rj
	for qemu-trivial@nongnu.org; Fri, 03 Jul 2015 06:09:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1ZAxus-0001Fn-3K
	for qemu-trivial@nongnu.org; Fri, 03 Jul 2015 06:09:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55794)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1ZAxun-0001BD-Ad; Fri, 03 Jul 2015 06:09:49 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id AE6F719F222;
	Fri,  3 Jul 2015 10:09:48 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-44.ams2.redhat.com
	[10.36.116.44])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t63A9ksS010500
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Fri, 3 Jul 2015 06:09:48 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 3D33A303FEAE; Fri,  3 Jul 2015 12:09:46 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
References: <1435917064-17827-1-git-send-email-marcandre.lureau@redhat.com>
	<1435917064-17827-3-git-send-email-marcandre.lureau@redhat.com>
Date: Fri, 03 Jul 2015 12:09:46 +0200
In-Reply-To: <1435917064-17827-3-git-send-email-marcandre.lureau@redhat.com>
	(=?utf-8?Q?=22Marc-Andr=C3=A9?= Lureau"'s message of "Fri, 3 Jul 2015
	11:51:01 +0200")
Message-ID: <87h9pleemt.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/5] qapi: add missing @
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
X-List-Received-Date: Fri, 03 Jul 2015 10:09:55 -0000

Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com> writes:

> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  qapi-schema.json | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/qapi-schema.json b/qapi-schema.json
> index 71c894e..1d3ee6b 100644
> --- a/qapi-schema.json
> +++ b/qapi-schema.json
> @@ -15,7 +15,7 @@
>  { 'include': 'qapi/trace.json' }
>=20=20
>  ##
> -# LostTickPolicy:
> +# @LostTickPolicy:
>  #
>  # Policy for handling lost ticks in timer devices.
>  #

Copying -trivial because it is, and I don't have anything queued up.

There's another one in qapi/block.json: BiosAtaTranslation.

Preferably with that one fixed, too:
Reviewed-by: Markus Armbruster <armbru@redhat.com>

