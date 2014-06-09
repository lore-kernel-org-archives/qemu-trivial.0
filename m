Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wu5p7-0000UR-Mt
	for mharc-qemu-trivial@gnu.org; Mon, 09 Jun 2014 16:05:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54582)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1Wu5p0-0000Pv-0U
	for qemu-trivial@nongnu.org; Mon, 09 Jun 2014 16:05:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1Wu5ot-0007Gb-Kr
	for qemu-trivial@nongnu.org; Mon, 09 Jun 2014 16:05:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:10364)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>)
	id 1Wu5og-0006xP-Uk; Mon, 09 Jun 2014 16:05:15 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s59K5D0x006877
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Mon, 9 Jun 2014 16:05:13 -0400
Received: from localhost (ovpn-113-65.phx2.redhat.com [10.3.113.65])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s59K5Bvl031174; Mon, 9 Jun 2014 16:05:12 -0400
Date: Mon, 9 Jun 2014 16:04:26 -0400
From: Luiz Capitulino <lcapitulino@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20140609160426.63250974@redhat.com>
In-Reply-To: <1401480140-18653-2-git-send-email-ehabkost@redhat.com>
References: <1401480140-18653-1-git-send-email-ehabkost@redhat.com>
	<1401480140-18653-2-git-send-email-ehabkost@redhat.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Marcel Apfelbaum <marcel.a@redhat.com>,
	qemu-devel@nongnu.org, Anthony Liguori <aliguori@amazon.com>,
	Andreas =?UTF-8?B?RsOkcmJlcg==?= <afaerber@suse.de>
Subject: Re: [Qemu-trivial] [PATCH 1/3] rng-random: NULL check not needed
	before g_free()
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
X-List-Received-Date: Mon, 09 Jun 2014 20:05:40 -0000

On Fri, 30 May 2014 17:02:18 -0300
Eduardo Habkost <ehabkost@redhat.com> wrote:

> g_free() is NULL-safe.
> 
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

This one should to go through qemu-trivial (CCed).

> ---
> Cc: Anthony Liguori <aliguori@amazon.com>
> Cc: Luiz Capitulino <lcapitulino@redhat.com>
> ---
>  backends/rng-random.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/backends/rng-random.c b/backends/rng-random.c
> index 136499d..601d9dc 100644
> --- a/backends/rng-random.c
> +++ b/backends/rng-random.c
> @@ -106,10 +106,7 @@ static void rng_random_set_filename(Object *obj, const char *filename,
>          return;
>      }
>  
> -    if (s->filename) {
> -        g_free(s->filename);
> -    }
> -
> +    g_free(s->filename);
>      s->filename = g_strdup(filename);
>  }
>  


