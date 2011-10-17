Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RFl77-0007jN-4A
	for mharc-qemu-trivial@gnu.org; Mon, 17 Oct 2011 07:12:13 -0400
Received: from eggs.gnu.org ([140.186.70.92]:40480)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1RFl70-0007Ra-D6
	for qemu-trivial@nongnu.org; Mon, 17 Oct 2011 07:12:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1RFl6l-0008Db-1E
	for qemu-trivial@nongnu.org; Mon, 17 Oct 2011 07:11:52 -0400
Received: from cantor2.suse.de ([195.135.220.15]:39350 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1RFl6i-0008D7-AM; Mon, 17 Oct 2011 07:11:48 -0400
Received: from [10.10.102.108] (charybdis-ext.suse.de [195.135.221.2])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id E94768B013;
	Mon, 17 Oct 2011 13:11:45 +0200 (CEST)
Message-ID: <4E9C0D71.6000408@suse.de>
Date: Mon, 17 Oct 2011 13:11:45 +0200
From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110922 Thunderbird/7.0
MIME-Version: 1.0
To: Ray Wang <raywang@linux.vnet.ibm.com>
References: <1318845836-30088-1-git-send-email-raywang@linux.vnet.ibm.com>
In-Reply-To: <1318845836-30088-1-git-send-email-raywang@linux.vnet.ibm.com>
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] change free() to g_free()
 to pair with g_malloc() series.
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
X-List-Received-Date: Mon, 17 Oct 2011 11:12:10 -0000

Am 17.10.2011 12:03, schrieb Ray Wang:
> Signed-off-by: Ray Wang <raywang@linux.vnet.ibm.com>
> ---
>  block/dmg.c         |   14 +++++++-------
>  target-arm/helper.c |    2 +-
>  2 files changed, 8 insertions(+), 8 deletions(-)

> diff --git a/target-arm/helper.c b/target-arm/helper.c
> index e2428eb..2b17dc9 100644
> --- a/target-arm/helper.c
> +++ b/target-arm/helper.c
> @@ -471,7 +471,7 @@ static uint32_t cpu_arm_find_by_name(const char *na=
me)
> =20
>  void cpu_arm_close(CPUARMState *env)
>  {
> -    free(env);
> +    g_free(env);
>  }
> =20
>  uint32_t cpsr_read(CPUARMState *env)

For this last part I had already sent a patch.

Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746, AG N=FCrnb=
erg

