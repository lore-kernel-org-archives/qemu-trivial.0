Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z7IkD-0005J8-7V
	for mharc-qemu-trivial@gnu.org; Tue, 23 Jun 2015 03:35:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51629)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Z7Ik9-0005Gc-Sv
	for qemu-trivial@nongnu.org; Tue, 23 Jun 2015 03:35:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Z7Ik8-0003hC-SJ
	for qemu-trivial@nongnu.org; Tue, 23 Jun 2015 03:35:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38878)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1Z7Ik4-0003ej-Bm; Tue, 23 Jun 2015 03:35:36 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id C2A5A8F287;
	Tue, 23 Jun 2015 07:35:35 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-62.ams2.redhat.com
	[10.36.116.62])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t5N7ZX20027218
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 23 Jun 2015 03:35:35 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 48745303E586; Tue, 23 Jun 2015 09:35:33 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: <arei.gonglei@huawei.com>
References: <1435021270-7768-1-git-send-email-arei.gonglei@huawei.com>
Date: Tue, 23 Jun 2015 09:35:33 +0200
In-Reply-To: <1435021270-7768-1-git-send-email-arei.gonglei@huawei.com> (arei
	gonglei's message of "Tue, 23 Jun 2015 09:01:10 +0800")
Message-ID: <87si9izxkq.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, kraxel@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] ossaudio: fix memory leak
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
X-List-Received-Date: Tue, 23 Jun 2015 07:35:42 -0000

<arei.gonglei@huawei.com> writes:

> From: Gonglei <arei.gonglei@huawei.com>
>
> Variable "conf" going out of scope leaks the storage
> it points to in line 856.
>
> Signed-off-by: Gonglei <arei.gonglei@huawei.com>
> ---
>  audio/ossaudio.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/audio/ossaudio.c b/audio/ossaudio.c
> index 11e76a1..7dbe333 100644
> --- a/audio/ossaudio.c
> +++ b/audio/ossaudio.c
> @@ -853,6 +853,7 @@ static void *oss_audio_init (void)
   static void *oss_audio_init (void)
   {
       OSSConf *conf = g_malloc(sizeof(OSSConf));
       *conf = glob_conf;
>  
>      if (access(conf->devpath_in, R_OK | W_OK) < 0 ||
>          access(conf->devpath_out, R_OK | W_OK) < 0) {
> +        g_free(conf);
>          return NULL;
>      }
>      return conf;
   }

Simpler (untested):

   static void *oss_audio_init (void)
   {
       if (access(globconf.devpath_in, R_OK | W_OK) < 0 ||
           access(globconf.devpath_out, R_OK | W_OK) < 0) {
           return NULL;
       }
       return g_memdup(&glob_conf, sizeof(glob_conf));
   }

