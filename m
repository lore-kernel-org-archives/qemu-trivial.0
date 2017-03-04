Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ck7VW-0002vb-E2
	for mharc-qemu-trivial@gnu.org; Sat, 04 Mar 2017 06:05:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40565)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1ck7VT-0002vV-Ks
	for qemu-trivial@nongnu.org; Sat, 04 Mar 2017 06:05:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1ck7VQ-0003NY-AR
	for qemu-trivial@nongnu.org; Sat, 04 Mar 2017 06:05:47 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:50521)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>) id 1ck7VP-0003ND-V9
	for qemu-trivial@nongnu.org; Sat, 04 Mar 2017 06:05:44 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue001 [212.227.15.167]) with ESMTPSA (Nemesis) id
	0LnXSB-1c4ybK2k87-00hspx; Sat, 04 Mar 2017 12:05:41 +0100
To: Saurav Sachidanand <sauravsachidanand@gmail.com>, qemu-trivial@nongnu.org
References: <20170304105355.994-1-sauravsachidanand@gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <9c628f9f-a95c-bd47-d276-1ca8b769af3a@vivier.eu>
Date: Sat, 4 Mar 2017 12:05:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <20170304105355.994-1-sauravsachidanand@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K0:HM0Cl94n/dP8bSKdtqfO/nqAOW/106vwgHTwubYvIDqNwzDDxCt
	/9A2DZDAzFsbywcfXfvfQMoVPyeqoNSSW5bdwIDuuxmus2YUcd3uKQR3FBnAsbD5OnxonLw
	R/V8G2zOA3nwoPUdbVIsmpr1mhXwPBGlW5DjHPcFWLXCQCyn/aQ0c0L/h7c9FS9af1lj8wE
	u6zvOGre0DRNcGhu+E2iA==
X-UI-Out-Filterresults: notjunk:1;V01:K0:tsAenPGSjOY=:r7YNzS8HET8EHBDqNVDJw4
	A3EUKfswTcSPeJI+7fz7Dwo4bCN6acZV1fff+G4N0cXHWskH8BIipBUCE3ZxFdBBRrYH5EmCj
	uW8zoSPPaLZcqpbYnhyGMpMPJh47GAuqkXOG9y6Nt68LCOMn+Sb55hzD9QCeNQ+OizlQPabCe
	M4BDj2lTsCVJ0QMDwaF6gG7imN7sZ5cNe4CXhyVXqB9WCsdyOECWQnyr+CTRRy2tath8hgA8c
	ZmowuFOFqxYp8RAzMzTwTwLxHZ9cMKLbdGJZ9pQv/F7Utt7j0rF5aYAoblFRc2GI4WLiZ4l2M
	rtTMUpSO2Ei6FAVC1OKFTqJ5lgTC9YZvZgayEB54gm6G23dwjR/nSczWocTJzJEZg9ped0xZU
	vpT9WuR+aykperrXYDcuKnt675VaYDyAmxBAlFJwN1k3CPA069P6ZlxpLJ1KrF5gB+ezLdJ53
	5/6vEWgNiCoD+gGP6Taum9gzuTCOhxBRtZvz7xhMQGCbqWSVROI/H9oxw5uP0BTfQprF1hmIm
	gksdh2rtOvxkbzl60aDTgGmBfLyGABq41I+a8eDX09X6AnCIi2dp2iFBg2doyWKmnNbG4TgXp
	vDvJPu2VnrttKO3d2R7Ki2+KdZSTJvCgmLTY0M3YLA6Kj0W1HmjNOG5LJyH/c10eKw+Ki0yDR
	9EzT9ZCRonmqqxoqTQeyTdytPspXW4SS9t3mvGXJ7em7qXVM3j+QmyqAzcweYw9OdjGC9oIFL
	04QsbJdmX+gtBB3G
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 212.227.126.130
Subject: Re: [Qemu-trivial] [PATCH] util: Use g_malloc/g_free in envlist.c
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
X-List-Received-Date: Sat, 04 Mar 2017 11:05:49 -0000

Please, cc: qemu-devel@nongnu.org

Laurent

Le 04/03/2017 à 11:53, Saurav Sachidanand a écrit :
> Change malloc/free to g_malloc/g_free in util/envlist.c, except for
> entry->env_var which is allocated using strdup(3).
> 
> Remove NULL checks for pointers returned from g_malloc as it exits
> in case of failure. Update calls to envlist_create to reflect this.
> 
> Free array returned by envlist_to_environ using g_free.
> 
> Update comments to reflect change in semantics.
> 
> Signed-off-by: Saurav Sachidanand <sauravsachidanand@gmail.com>
> ---
>  bsd-user/main.c   | 12 +++---------
>  linux-user/main.c |  7 ++-----
>  util/envlist.c    | 31 +++++++++++++------------------
>  3 files changed, 18 insertions(+), 32 deletions(-)
> 
> diff --git a/bsd-user/main.c b/bsd-user/main.c
> index 714a692e6f..4d715840ff 100644
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
> @@ -959,7 +953,7 @@ int main(int argc, char **argv)
>          free(*wrk);
>      }
>  
> -    free(target_environ);
> +    g_free(target_environ);
>  
>      if (qemu_loglevel_mask(CPU_LOG_PAGE)) {
>          qemu_log("guest_base  0x%lx\n", guest_base);
> diff --git a/linux-user/main.c b/linux-user/main.c
> index 10a3bb3a12..3542c899f6 100644
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
> @@ -4432,7 +4429,7 @@ int main(int argc, char **argv, char **envp)
>          free(*wrk);
>      }
>  
> -    free(target_environ);
> +    g_free(target_environ);
>  
>      if (qemu_loglevel_mask(CPU_LOG_PAGE)) {
>          qemu_log("guest_base  0x%lx\n", guest_base);
> diff --git a/util/envlist.c b/util/envlist.c
> index e86857e70a..bc21481b17 100644
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
> +	envlist = g_malloc(sizeof (*envlist));
>  
>  	QLIST_INIT(&envlist->el_entries);
>  	envlist->el_count = 0;
> @@ -49,9 +47,9 @@ envlist_free(envlist_t *envlist)
>  		QLIST_REMOVE(entry, ev_link);
>  
>  		free((char *)entry->ev_var);
> -		free(entry);
> +		g_free(entry);
>  	}
> -	free(envlist);
> +	g_free(envlist);
>  }
>  
>  /*
> @@ -156,15 +154,14 @@ envlist_setenv(envlist_t *envlist, const char *env)
>  	if (entry != NULL) {
>  		QLIST_REMOVE(entry, ev_link);
>  		free((char *)entry->ev_var);
> -		free(entry);
> +		g_free(entry);
>  	} else {
>  		envlist->el_count++;
>  	}
>  
> -	if ((entry = malloc(sizeof (*entry))) == NULL)
> -		return (errno);
> +	entry = g_malloc(sizeof (*entry));
>  	if ((entry->ev_var = strdup(env)) == NULL) {
> -		free(entry);
> +		g_free(entry);
>  		return (errno);
>  	}
>  	QLIST_INSERT_HEAD(&envlist->el_entries, entry, ev_link);
> @@ -202,7 +199,7 @@ envlist_unsetenv(envlist_t *envlist, const char *env)
>  	if (entry != NULL) {
>  		QLIST_REMOVE(entry, ev_link);
>  		free((char *)entry->ev_var);
> -		free(entry);
> +		g_free(entry);
>  
>  		envlist->el_count--;
>  	}
> @@ -212,12 +209,12 @@ envlist_unsetenv(envlist_t *envlist, const char *env)
>  /*
>   * Returns given envlist as array of strings (in same form that
>   * global variable environ is).  Caller must free returned memory
> - * by calling free(3) for each element and for the array.  Returned
> - * array and given envlist are not related (no common references).
> + * by calling free(3) for each element, and g_free for the array.
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
> @@ -225,9 +222,7 @@ envlist_to_environ(const envlist_t *envlist, size_t *count)
>  	struct envlist_entry *entry;
>  	char **env, **penv;
>  
> -	penv = env = malloc((envlist->el_count + 1) * sizeof (char *));
> -	if (env == NULL)
> -		return (NULL);
> +	penv = env = g_malloc((envlist->el_count + 1) * sizeof (char *));
>  
>  	for (entry = envlist->el_entries.lh_first; entry != NULL;
>  	    entry = entry->ev_link.le_next) {
> 


