Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h0kZa-0008Tk-0t
	for mharc-qemu-trivial@gnu.org; Mon, 04 Mar 2019 05:11:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50836)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1h0kZY-0008S7-0t
	for qemu-trivial@nongnu.org; Mon, 04 Mar 2019 05:11:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1h0kZX-0002Op-A0
	for qemu-trivial@nongnu.org; Mon, 04 Mar 2019 05:11:48 -0500
Received: from mx1.redhat.com ([209.132.183.28]:45746)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1h0kZV-0002JP-GT; Mon, 04 Mar 2019 05:11:45 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AE76E5944A;
	Mon,  4 Mar 2019 10:11:44 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-92.ams2.redhat.com
	[10.36.116.92])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C7E22B893;
	Mon,  4 Mar 2019 10:11:44 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id F01D41138660; Mon,  4 Mar 2019 11:11:42 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org,  Fam Zheng <fam@euphon.net>
References: <20190213130240.15492-1-armbru@redhat.com>
Date: Mon, 04 Mar 2019 11:11:42 +0100
In-Reply-To: <20190213130240.15492-1-armbru@redhat.com> (Markus Armbruster's
	message of "Wed, 13 Feb 2019 14:02:40 +0100")
Message-ID: <87o96r3q5d.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Mon, 04 Mar 2019 10:11:44 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] build: Correct explanation of
 unnest-vars example
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
X-List-Received-Date: Mon, 04 Mar 2019 10:11:48 -0000

I guess this could go via -trivial.

Markus Armbruster <armbru@redhat.com> writes:

> Cc: Fam Zheng <fam@euphon.net>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  rules.mak | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/rules.mak b/rules.mak
> index 86e033d815..19f3d2c126 100644
> --- a/rules.mak
> +++ b/rules.mak
> @@ -327,7 +327,7 @@ endef
>  #     ../water/ice.mo-libs = -licemaker
>  #     ../water/ice.mo-objs = ../water/ice1.o ../water/ice2.o
>  #
> -# Note that 'hot' didn't include 'season/' in the input, so 'summer.o' is not
> +# Note that 'hot' didn't include 'water/' in the input, so 'steam.o' is not
>  # included.
>  #
>  define unnest-vars

