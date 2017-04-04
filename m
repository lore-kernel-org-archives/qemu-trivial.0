Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cvLZ2-00015S-AD
	for mharc-qemu-trivial@gnu.org; Tue, 04 Apr 2017 06:19:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52912)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cvLYy-000150-Us
	for qemu-trivial@nongnu.org; Tue, 04 Apr 2017 06:19:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cvLYt-0008NE-Rq
	for qemu-trivial@nongnu.org; Tue, 04 Apr 2017 06:19:48 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:33890)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cvLYt-0008Mv-NY; Tue, 04 Apr 2017 06:19:43 -0400
Received: by mail-qt0-x242.google.com with SMTP id x35so22527338qtc.1;
	Tue, 04 Apr 2017 03:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=IKdSD07nQglwVPyFFg6fHCi48EMWt/1NVq6EhvVQPjM=;
	b=UJQlS2DJyvlUBonNrInZVOA1+B5AUdjf7/VuiOXj5QeYL2YXvA7ez17GBmNpgVXHMK
	dr6ZCYKD2yh0e79s80bqdRlcMdBbZQkw4SHhVlSyZ1CT/UCB4x+DTtI69nIuqt5jRflt
	vzvsm50bXlA3raoAF4yetvamu6x173taUVFFXPOQu+B4zeuuhtPr5TcyqSJnWhbLn1OS
	+HME/MZGQxDzCwRYzQIc0fOXDli4mB7/fzFeQ73Yt03jrFouMeX7mUqV4AkGnqw7eYPK
	MUcw3nUmCbeUvgJve5sLHRhSHxywttTUevEi0YGixv6YulHzdtlDSjKbwcf7/WjFGydy
	bGWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=IKdSD07nQglwVPyFFg6fHCi48EMWt/1NVq6EhvVQPjM=;
	b=JkUB8Jn0+1RoTUIxYSrSSOm1s9Ua0AZBtwc7Fj135j+LxgN3r8HlqHyY4DJkDHIFre
	h/wEGeVy1uRzREoRnvYBWL8ueZN2adGmKdUu36O2piei5LP5/6cqjYVytfCrHdJVYHi/
	osSr5r/YQHGDVY/Em45sET5DI7S45m38GnJOUNbbG1YZTxNYzThSf7tghmL9m9+1Jiqs
	M+Q6YMv+W8mIyCsllUXx68RhiZN/GS/k97p1cPa1ZfVb4/Fe93azGz15vPAkhj+fS0UQ
	654YOROhGZYtNb90c/ahKB1z8JE3tNz09AahlwRypwtUfO4DSyOVFkA2xBmR8yiUTeoJ
	zsqg==
X-Gm-Message-State: AFeK/H2Prev8RymSfXpx2el1JYG26WRagXjp7ns6UKqF4WaUc22goWUnLmP360LE7jt/fg==
X-Received: by 10.237.37.41 with SMTP id v38mr22385261qtc.24.1491301183002;
	Tue, 04 Apr 2017 03:19:43 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id
	y197sm11503308qka.59.2017.04.04.03.19.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Apr 2017 03:19:42 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Saurav Sachidanand <sauravsachidanand@gmail.com>, qemu-devel@nongnu.org
References: <20170320173828.3874-1-sauravsachidanand@gmail.com>
Cc: qemu-trivial@nongnu.org, stefanha@gmail.com, laurent@vivier.eu
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <49ef2e7a-4713-1ea3-66ac-5a2a9684e26e@amsat.org>
Date: Tue, 4 Apr 2017 07:19:39 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170320173828.3874-1-sauravsachidanand@gmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c0d::242
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
X-List-Received-Date: Tue, 04 Apr 2017 10:19:50 -0000

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

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

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
>
>  	for (entry = envlist->el_entries.lh_first; entry != NULL;
>  	    entry = entry->ev_link.le_next) {
> -		*(penv++) = strdup(entry->ev_var);
> +		*(penv++) = g_strdup(entry->ev_var);
>  	}
>  	*penv = NULL; /* NULL terminate the list */
>
>

