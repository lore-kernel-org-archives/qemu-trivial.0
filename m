Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z814s-0003Vh-Fj
	for mharc-qemu-trivial@gnu.org; Thu, 25 Jun 2015 02:56:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38125)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Z814p-0003UI-H8
	for qemu-trivial@nongnu.org; Thu, 25 Jun 2015 02:56:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Z814o-0000Fo-8x
	for qemu-trivial@nongnu.org; Thu, 25 Jun 2015 02:55:59 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47137)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1Z814j-0000En-Kw; Thu, 25 Jun 2015 02:55:53 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id 1864D2EBCFC;
	Thu, 25 Jun 2015 06:55:53 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-21.ams2.redhat.com
	[10.36.116.21])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t5P6tpmR013257
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 25 Jun 2015 02:55:52 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id D8E1C303F90A; Thu, 25 Jun 2015 08:55:50 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: <arei.gonglei@huawei.com>
References: <1435137497-11972-1-git-send-email-arei.gonglei@huawei.com>
Date: Thu, 25 Jun 2015 08:55:50 +0200
In-Reply-To: <1435137497-11972-1-git-send-email-arei.gonglei@huawei.com> (arei
	gonglei's message of "Wed, 24 Jun 2015 17:18:17 +0800")
Message-ID: <87lhf8xond.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, kraxel@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] ossaudio: fix memory leak
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
X-List-Received-Date: Thu, 25 Jun 2015 06:56:00 -0000

<arei.gonglei@huawei.com> writes:

> From: Gonglei <arei.gonglei@huawei.com>
>
> Variable "conf" going out of scope leaks the storage
> it points to in line 856.
>
> Signed-off-by: Gonglei <arei.gonglei@huawei.com>
> ---
> v2:
>  using an better way to avoid memory leak. (Markus) 
> ---
>  audio/ossaudio.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/audio/ossaudio.c b/audio/ossaudio.c
> index 11e76a1..94b473b 100644
> --- a/audio/ossaudio.c
> +++ b/audio/ossaudio.c
> @@ -848,14 +848,11 @@ static OSSConf glob_conf = {
>  
>  static void *oss_audio_init (void)
>  {
> -    OSSConf *conf = g_malloc(sizeof(OSSConf));
> -    *conf = glob_conf;
> -
> -    if (access(conf->devpath_in, R_OK | W_OK) < 0 ||
> -        access(conf->devpath_out, R_OK | W_OK) < 0) {
> +    if (access(glob_conf.devpath_in, R_OK | W_OK) < 0 ||
> +        access(glob_conf.devpath_out, R_OK | W_OK) < 0) {
>          return NULL;
>      }
> -    return conf;
> +    return g_memdup(&glob_conf, sizeof(glob_conf));
>  }
>  
>  static void oss_audio_fini (void *opaque)

Reviewed-by: Markus Armbruster <armbru@redhat.com>

Now I get to add g_memdup() to scripts/coverity-model.c...

