Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VpzVA-0006mV-Q3
	for mharc-qemu-trivial@gnu.org; Mon, 09 Dec 2013 06:59:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42865)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <akong@redhat.com>) id 1VpzV3-0006lc-Dd
	for qemu-trivial@nongnu.org; Mon, 09 Dec 2013 06:59:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <akong@redhat.com>) id 1VpzUx-00063H-Es
	for qemu-trivial@nongnu.org; Mon, 09 Dec 2013 06:59:45 -0500
Received: from mx1.redhat.com ([209.132.183.28]:42514)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <akong@redhat.com>)
	id 1VpzUx-00063C-6c; Mon, 09 Dec 2013 06:59:39 -0500
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id rB9BxcnP000335
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 9 Dec 2013 06:59:38 -0500
Received: from localhost ([10.66.5.47])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id rB9BxaEO014530; Mon, 9 Dec 2013 06:59:37 -0500
Date: Mon, 9 Dec 2013 19:59:36 +0800
From: Amos Kong <akong@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <20131209115936.GD13283@amosk.info>
References: <1386577170-6851-1-git-send-email-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1386577170-6851-1-git-send-email-mjt@msgid.tls.msk.ru>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] vl: make boot_strict
 variable static (not used outside vl.c)
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
X-List-Received-Date: Mon, 09 Dec 2013 11:59:51 -0000

On Mon, Dec 09, 2013 at 12:19:30PM +0400, Michael Tokarev wrote:
> ---
>  vl.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/vl.c b/vl.c
> index ae6d0c6..e47fea1 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -230,7 +230,7 @@ int ctrl_grab = 0;
>  unsigned int nb_prom_envs = 0;
>  const char *prom_envs[MAX_PROM_ENVS];
>  int boot_menu;
> -bool boot_strict;
> +static bool boot_strict;

Reviewed-by: Amos Kong <akong@redhat.com>

>  uint8_t *boot_splash_filedata;
>  size_t boot_splash_filedata_size;
>  uint8_t qemu_extra_params_fw[2];
> -- 
> 1.7.10.4
> 

-- 
			Amos.

