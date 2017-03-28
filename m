Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1csrQP-0007IV-2L
	for mharc-qemu-trivial@gnu.org; Tue, 28 Mar 2017 09:44:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34392)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1csrQL-0007GH-IQ
	for qemu-trivial@nongnu.org; Tue, 28 Mar 2017 09:44:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1csrQG-0008Fr-Ld
	for qemu-trivial@nongnu.org; Tue, 28 Mar 2017 09:44:37 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:33677)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1csrQG-0008Fk-GC; Tue, 28 Mar 2017 09:44:32 -0400
Received: by mail-qk0-x242.google.com with SMTP id p22so12364366qka.0;
	Tue, 28 Mar 2017 06:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=1mDA4rmuUJAYW/xUZJKTiENuw5m7tivds36AEdEU8Sg=;
	b=Pq1rCjzBtXh7bsQ54aXoWQrVi+VXSgHwT9gxI40H605Lud0sALWVXwWpo+mT1AF37U
	Wy03gib74neqfhdDdMesPmvQN6imUlNp/f8/AGH7VFYBzITVxRnFzr48/wytqbNLeLnZ
	ro5+PVAi6pqKKK5Tsjh/rLAtbPaH48Z7FPPOw/JIUuXhs++rAKIMSFe3ZkX4jbcBEilZ
	cLC+bcJUeDJiLOGB9r7ChWtRAfZhU+kZKcuWtc4lapHE7iz01HqIN5mWY8EaLe3FGcLX
	IbmGaq/kmGA7KVMYY0n2x7lO3WPsjomuOeZrU9FTfV8JJMpPi50pND6HupCrxojKD4Da
	QVOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=1mDA4rmuUJAYW/xUZJKTiENuw5m7tivds36AEdEU8Sg=;
	b=B7cf6KoKeUs9BBL2NucBKqQwWNZNDl/oCsOOAqqs5M3yKvtZJIoTAyAnr/4mJAfthE
	rpk3rVndzwdIhAPpgOTCb0Lo2/+FuQEVeoC8RK1oiqX55IjyxvqeXB4EOHOt6buLUjWS
	uB+9yI3P8uI8xyoctyry51aTsNfSRfov8IO7nUi5k1OSAEUqQ9/YfO5N5xqnUTt5tmAZ
	TmRlgTs0ivkWt+4hX4OxPdJG4Mx7DcIY+DV6e8pg7SP+5LFjPFfUaFTZrVCxyd8fBMK9
	ZTPCj46F2nbNjEOHC7y25hWZbmjkIrOq8lsepoQ2lGKTHqv6c1MzmatP6yUI9zMIt84u
	fGag==
X-Gm-Message-State: AFeK/H17JVWQJ6JZACI7DkrW+KZEkHOudWStiSIRkt5YR6VGhz82VMH+e0EFZSFwpiIXEQ==
X-Received: by 10.55.98.74 with SMTP id w71mr10457329qkb.118.1490708671664;
	Tue, 28 Mar 2017 06:44:31 -0700 (PDT)
Received: from [10.17.0.216] ([181.28.125.130])
	by smtp.gmail.com with ESMTPSA id
	q123sm2637318qkb.63.2017.03.28.06.44.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 Mar 2017 06:44:31 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Saurav Sachidanand <sauravsachidanand@gmail.com>
References: <20170320173828.3874-1-sauravsachidanand@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, stefanha@gmail.com,
	laurent@vivier.eu
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <076d02e7-643c-5d8b-fcef-8660e1269a05@amsat.org>
Date: Tue, 28 Mar 2017 10:44:28 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170320173828.3874-1-sauravsachidanand@gmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c09::242
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v5] util: Use
 g_malloc/g_free in envlist.c
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
X-List-Received-Date: Tue, 28 Mar 2017 13:44:39 -0000

Hi Saurav,

you should read the QEMU Coding Style and replace your tabs by 4 spaces.

On 03/20/2017 02:38 PM, Saurav Sachidanand wrote:
> Change malloc/strdup/free to g_malloc/g_strdup/g_free in
> util/envlist.c.
>
> Remove NULL checks for pointers returned from g_malloc and g_strdup
> as they exit in case of failure. Also, update calls to envlist_create
> to reflect this.
>
> Free array and array contents returned by envlist_to_environ using
> g_free in bsd-user/main.c and linux-user/main.c.
>
> Update comments to reflect change in semantics.
>
> Signed-off-by: Saurav Sachidanand <sauravsachidanand@gmail.com>
> ---
>  bsd-user/main.c   | 14 ++++----------
>  linux-user/main.c |  9 +++------
>  util/envlist.c    | 47 +++++++++++++++++++----------------------------
>  3 files changed, 26 insertions(+), 44 deletions(-)
>
> diff --git a/bsd-user/main.c b/bsd-user/main.c
> index 714a692e6f..04f95ddd54 100644
> --- a/bsd-user/main.c
> +++ b/bsd-user/main.c
> @@ -744,10 +744,7 @@ int main(int argc, char **argv)
>      qemu_init_cpu_list();
>      module_call_init(MODULE_INIT_QOM);
>
> -    if ((envlist = envlist_create()) == NULL) {
> -        (void) fprintf(stderr, "Unable to allocate envlist\n");
> -        exit(1);
> -    }
> +    envlist = envlist_create();
>
>      /* add current environment into the list */
>      for (wrk = environ; *wrk != NULL; wrk++) {
> @@ -785,10 +782,7 @@ int main(int argc, char **argv)
>                  usage();
>          } else if (!strcmp(r, "ignore-environment")) {
>              envlist_free(envlist);
> -            if ((envlist = envlist_create()) == NULL) {
> -                (void) fprintf(stderr, "Unable to allocate envlist\n");
> -                exit(1);
> -            }
> +            envlist = envlist_create();
>          } else if (!strcmp(r, "U")) {
>              r = argv[optind++];
>              if (envlist_unsetenv(envlist, r) != 0)
> @@ -956,10 +950,10 @@ int main(int argc, char **argv)
>      }
>
>      for (wrk = target_environ; *wrk; wrk++) {
> -        free(*wrk);
> +        g_free(*wrk);
>      }
>
> -    free(target_environ);
> +    g_free(target_environ);
>
>      if (qemu_loglevel_mask(CPU_LOG_PAGE)) {
>          qemu_log("guest_base  0x%lx\n", guest_base);
> diff --git a/linux-user/main.c b/linux-user/main.c
> index 10a3bb3a12..5f20769cb9 100644
> --- a/linux-user/main.c
> +++ b/linux-user/main.c
> @@ -4229,10 +4229,7 @@ int main(int argc, char **argv, char **envp)
>      qemu_init_cpu_list();
>      module_call_init(MODULE_INIT_QOM);
>
> -    if ((envlist = envlist_create()) == NULL) {
> -        (void) fprintf(stderr, "Unable to allocate envlist\n");
> -        exit(EXIT_FAILURE);
> -    }
> +    envlist = envlist_create();
>
>      /* add current environment into the list */
>      for (wrk = environ; *wrk != NULL; wrk++) {
> @@ -4429,10 +4426,10 @@ int main(int argc, char **argv, char **envp)
>      }
>
>      for (wrk = target_environ; *wrk; wrk++) {
> -        free(*wrk);
> +        g_free(*wrk);
>      }
>
> -    free(target_environ);
> +    g_free(target_environ);
>
>      if (qemu_loglevel_mask(CPU_LOG_PAGE)) {
>          qemu_log("guest_base  0x%lx\n", guest_base);
> diff --git a/util/envlist.c b/util/envlist.c
> index e86857e70a..1eeb7fca87 100644
> --- a/util/envlist.c
> +++ b/util/envlist.c
> @@ -17,16 +17,14 @@ static int envlist_parse(envlist_t *envlist,
>      const char *env, int (*)(envlist_t *, const char *));
>
>  /*
> - * Allocates new envlist and returns pointer to that or
> - * NULL in case of error.
> + * Allocates new envlist and returns pointer to it.
>   */
>  envlist_t *
>  envlist_create(void)
>  {
>  	envlist_t *envlist;
>
> -	if ((envlist = malloc(sizeof (*envlist))) == NULL)
> -		return (NULL);
> +	envlist = g_malloc(sizeof(*envlist));
>
>  	QLIST_INIT(&envlist->el_entries);
>  	envlist->el_count = 0;
> @@ -48,10 +46,10 @@ envlist_free(envlist_t *envlist)
>  		entry = envlist->el_entries.lh_first;
>  		QLIST_REMOVE(entry, ev_link);
>
> -		free((char *)entry->ev_var);
> -		free(entry);
> +		g_free((char *)entry->ev_var);
> +		g_free(entry);
>  	}
> -	free(envlist);
> +	g_free(envlist);
>  }
>
>  /*
> @@ -101,8 +99,7 @@ envlist_parse(envlist_t *envlist, const char *env,
>  	if ((envlist == NULL) || (env == NULL))
>  		return (EINVAL);
>
> -	if ((tmpenv = strdup(env)) == NULL)
> -		return (errno);
> +	tmpenv = g_strdup(env);
>      envsave = tmpenv;
>
>      do {
> @@ -117,7 +114,7 @@ envlist_parse(envlist_t *envlist, const char *env,
>          tmpenv = envvar + 1;
>      } while (envvar != NULL);
>
> -    free(envsave);
> +    g_free(envsave);
>      return ret;
>  }
>
> @@ -155,18 +152,14 @@ envlist_setenv(envlist_t *envlist, const char *env)
>
>  	if (entry != NULL) {
>  		QLIST_REMOVE(entry, ev_link);
> -		free((char *)entry->ev_var);
> -		free(entry);
> +		g_free((char *)entry->ev_var);
> +		g_free(entry);
>  	} else {
>  		envlist->el_count++;
>  	}
>
> -	if ((entry = malloc(sizeof (*entry))) == NULL)
> -		return (errno);
> -	if ((entry->ev_var = strdup(env)) == NULL) {
> -		free(entry);
> -		return (errno);
> -	}
> +	entry = g_malloc(sizeof(*entry));
> +	entry->ev_var = g_strdup(env);
>  	QLIST_INSERT_HEAD(&envlist->el_entries, entry, ev_link);
>
>  	return (0);
> @@ -201,8 +194,8 @@ envlist_unsetenv(envlist_t *envlist, const char *env)
>  	}
>  	if (entry != NULL) {
>  		QLIST_REMOVE(entry, ev_link);
> -		free((char *)entry->ev_var);
> -		free(entry);
> +		g_free((char *)entry->ev_var);
> +		g_free(entry);
>
>  		envlist->el_count--;
>  	}
> @@ -212,12 +205,12 @@ envlist_unsetenv(envlist_t *envlist, const char *env)
>  /*
>   * Returns given envlist as array of strings (in same form that
>   * global variable environ is).  Caller must free returned memory
> - * by calling free(3) for each element and for the array.  Returned
> - * array and given envlist are not related (no common references).
> + * by calling g_free for each element and the array.
> + * Returned array and given envlist are not related (no common
> + * references).
>   *
>   * If caller provides count pointer, number of items in array is
> - * stored there.  In case of error, NULL is returned and no memory
> - * is allocated.
> + * stored there.
>   */
>  char **
>  envlist_to_environ(const envlist_t *envlist, size_t *count)
> @@ -225,13 +218,11 @@ envlist_to_environ(const envlist_t *envlist, size_t *count)
>  	struct envlist_entry *entry;
>  	char **env, **penv;
>
> -	penv = env = malloc((envlist->el_count + 1) * sizeof (char *));
> -	if (env == NULL)
> -		return (NULL);
> +	penv = env = g_malloc((envlist->el_count + 1) * sizeof(char *));

use g_malloc_n() which cares "to detect possible overflow during 
multiplication":

penv = env = g_malloc_n(envlist->el_count + 1, sizeof(char *));

>
>  	for (entry = envlist->el_entries.lh_first; entry != NULL;
>  	    entry = entry->ev_link.le_next) {
> -		*(penv++) = strdup(entry->ev_var);
> +		*(penv++) = g_strdup(entry->ev_var);
>  	}
>  	*penv = NULL; /* NULL terminate the list */
>
>

