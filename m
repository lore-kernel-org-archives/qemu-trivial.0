Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XwSoB-0003zn-JU
	for mharc-qemu-trivial@gnu.org; Thu, 04 Dec 2014 04:34:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46026)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1XwSo3-0003nv-K3
	for qemu-trivial@nongnu.org; Thu, 04 Dec 2014 04:34:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1XwSnx-0000by-CI
	for qemu-trivial@nongnu.org; Thu, 04 Dec 2014 04:34:39 -0500
Received: from mx1.redhat.com ([209.132.183.28]:54805)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>)
	id 1XwSni-0000Uc-6t; Thu, 04 Dec 2014 04:34:18 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sB49YH2I014687
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Thu, 4 Dec 2014 04:34:17 -0500
Received: from localhost (dhcp-14-137.nay.redhat.com [10.66.14.137])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sB49YERH011958; Thu, 4 Dec 2014 04:34:16 -0500
Date: Thu, 4 Dec 2014 17:34:14 +0800
From: Fam Zheng <famz@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20141204093414.GB28961@ad.nay.redhat.com>
References: <1417685215-5289-1-git-send-email-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1417685215-5289-1-git-send-email-armbru@redhat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Drop superfluous
 conditionals around g_strdup()
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
X-List-Received-Date: Thu, 04 Dec 2014 09:34:46 -0000

On Thu, 12/04 10:26, Markus Armbruster wrote:
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  backends/rng-random.c    |  6 +-----
>  hw/tpm/tpm_passthrough.c |  4 +---
>  util/uri.c               | 43 +++++++++++++++++--------------------------
>  3 files changed, 19 insertions(+), 34 deletions(-)
> 
> diff --git a/backends/rng-random.c b/backends/rng-random.c
> index 601d9dc..4f85a8e 100644
> --- a/backends/rng-random.c
> +++ b/backends/rng-random.c
> @@ -88,11 +88,7 @@ static char *rng_random_get_filename(Object *obj, Error **errp)
>  {
>      RndRandom *s = RNG_RANDOM(obj);
>  
> -    if (s->filename) {
> -        return g_strdup(s->filename);
> -    }
> -
> -    return NULL;
> +    return g_strdup(s->filename);
>  }
>  
>  static void rng_random_set_filename(Object *obj, const char *filename,
> diff --git a/hw/tpm/tpm_passthrough.c b/hw/tpm/tpm_passthrough.c
> index 56e9e0f..2bf3c6f 100644
> --- a/hw/tpm/tpm_passthrough.c
> +++ b/hw/tpm/tpm_passthrough.c
> @@ -400,9 +400,7 @@ static int tpm_passthrough_handle_device_opts(QemuOpts *opts, TPMBackend *tb)
>      const char *value;
>  
>      value = qemu_opt_get(opts, "cancel-path");
> -    if (value) {
> -        tb->cancel_path = g_strdup(value);
> -    }
> +    tb->cancel_path = g_strdup(value);
>  
>      value = qemu_opt_get(opts, "path");
>      if (!value) {
> diff --git a/util/uri.c b/util/uri.c
> index e348c17..bbf2832 100644
> --- a/util/uri.c
> +++ b/util/uri.c
> @@ -1736,24 +1736,21 @@ uri_resolve(const char *uri, const char *base) {
>  	goto done;
>      if ((ref->scheme == NULL) && (ref->path == NULL) &&
>  	((ref->authority == NULL) && (ref->server == NULL))) {
> -	if (bas->scheme != NULL)
> -	    res->scheme = g_strdup(bas->scheme);
> +        res->scheme = g_strdup(bas->scheme);
>  	if (bas->authority != NULL)
>  	    res->authority = g_strdup(bas->authority);
>  	else if (bas->server != NULL) {
> -	    res->server = g_strdup(bas->server);
> -	    if (bas->user != NULL)
> -		res->user = g_strdup(bas->user);
> -	    res->port = bas->port;
> +            res->server = g_strdup(bas->server);
> +            res->user = g_strdup(bas->user);
> +            res->port = bas->port;
>  	}
> -	if (bas->path != NULL)
> -	    res->path = g_strdup(bas->path);
> -	if (ref->query != NULL)
> +        res->path = g_strdup(bas->path);
> +        if (ref->query != NULL) {
>  	    res->query = g_strdup (ref->query);
> -	else if (bas->query != NULL)
> -	    res->query = g_strdup(bas->query);
> -	if (ref->fragment != NULL)
> -	    res->fragment = g_strdup(ref->fragment);
> +        } else {
> +            res->query = g_strdup(bas->query);
> +        }
> +        res->fragment = g_strdup(ref->fragment);
>  	goto step_7;
>      }
>  
> @@ -1767,13 +1764,10 @@ uri_resolve(const char *uri, const char *base) {
>  	val = uri_to_string(ref);
>  	goto done;
>      }
> -    if (bas->scheme != NULL)
> -	res->scheme = g_strdup(bas->scheme);
> +    res->scheme = g_strdup(bas->scheme);
>  
> -    if (ref->query != NULL)
> -	res->query = g_strdup(ref->query);
> -    if (ref->fragment != NULL)
> -	res->fragment = g_strdup(ref->fragment);
> +    res->query = g_strdup(ref->query);
> +    res->fragment = g_strdup(ref->fragment);
>  
>      /*
>       * 4) If the authority component is defined, then the reference is a
> @@ -1787,20 +1781,17 @@ uri_resolve(const char *uri, const char *base) {
>  	    res->authority = g_strdup(ref->authority);
>  	else {
>  	    res->server = g_strdup(ref->server);
> -	    if (ref->user != NULL)
> -		res->user = g_strdup(ref->user);
> +            res->user = g_strdup(ref->user);
>              res->port = ref->port;
>  	}
> -	if (ref->path != NULL)
> -	    res->path = g_strdup(ref->path);
> +        res->path = g_strdup(ref->path);
>  	goto step_7;
>      }
>      if (bas->authority != NULL)
>  	res->authority = g_strdup(bas->authority);
>      else if (bas->server != NULL) {
> -	res->server = g_strdup(bas->server);
> -	if (bas->user != NULL)
> -	    res->user = g_strdup(bas->user);
> +        res->server = g_strdup(bas->server);
> +        res->user = g_strdup(bas->user);
>  	res->port = bas->port;
>      }
>  
> -- 
> 1.9.3
> 
> 

Very confusing tab/whitespace mixture. Code is better, format is worse. I'm not
sure it's a win. :)

Fam

