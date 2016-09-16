Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bkuO4-0000Cm-Up
	for mharc-qemu-trivial@gnu.org; Fri, 16 Sep 2016 10:45:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54233)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1bkuNy-00005v-NG
	for qemu-trivial@nongnu.org; Fri, 16 Sep 2016 10:45:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1bkuNu-0008DY-FT
	for qemu-trivial@nongnu.org; Fri, 16 Sep 2016 10:45:01 -0400
Received: from mail-wm0-f67.google.com ([74.125.82.67]:35070)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>)
	id 1bkuNu-0007YL-58; Fri, 16 Sep 2016 10:44:58 -0400
Received: by mail-wm0-f67.google.com with SMTP id 133so4084616wmq.2;
	Fri, 16 Sep 2016 07:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=vcKV3Uxxlj44Y+MRU7Pl6REWK8hJYYESl2iJv1fzMAM=;
	b=vFgVCzlzAwbmoZHZRQjtkoI109+YUK2y2CMJFkVGMPqKjPS3yyDZ1M2cMsoIZ+P8PL
	hlPl2uOuUHfLJd9E2U150ZUcm13hI8nYSHiOvdgHnetZ0QcO/kEkMiy35Ka3LE+gzwCE
	FCeAqDX/EM1ae7ujForQZrvGv4xChvuJHbFgKPZ/Y9llA+8Sk2Tjwz28iWzr76au9bTT
	8u/6ZBR2eLpLRmNeL5Wly1sL787z/B/nPZAA6J2b1iiP3N4CoBxLx5zApFJACQ1foxy7
	lWUzAJaIl4ixDPdptlMl2qSW00br1msQmkM4XJNsZTNSz7GRhUXET4u3ouXKEczQdehI
	a6BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=vcKV3Uxxlj44Y+MRU7Pl6REWK8hJYYESl2iJv1fzMAM=;
	b=mEVXmTdPZGFdduf2SzKh49f9tUw0iY3wbpCrpeylqrmUd+0NjEXexRQrXe9ItTCrJu
	K3uOZ8wyXPFnKhKkbB4eZ++2OiQDyVRaSsA3IEhCipKadzt/8hjAJxm+oM63t9mrtcAV
	5sEotTnYHfKd5jOqRkr54T93M5G2YJ1+F2jv7nfVguWdJiN9yNHM60sBWjtgu4VG7Wb9
	h3mFrzyiAhRv51HRWj+tmWwryQ3hVEMRsjSc5t+zab9OFYBSjMOkxiyyCvabRwnXhRCo
	cuBx6yMWpxeews1vlOUCY5A7zD9G6JJ1smCXNtgpsJlRWnsje30klfZk7kpFRy5UFQ0r
	KYcA==
X-Gm-Message-State: AE9vXwNPYlueFmslxuwN0AX0vy9qrYfX/DTI8VyUQvfr6DIKkZkQnSLobB0nv3j5JITaEg==
X-Received: by 10.194.68.8 with SMTP id r8mr13007193wjt.190.1474036889823;
	Fri, 16 Sep 2016 07:41:29 -0700 (PDT)
Received: from localhost (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
	by smtp.gmail.com with ESMTPSA id
	gg10sm8767859wjd.4.2016.09.16.07.41.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Sep 2016 07:41:29 -0700 (PDT)
Date: Fri, 16 Sep 2016 16:41:27 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Message-ID: <20160916144127.GT16305@toto>
References: <1474034177-17663-1-git-send-email-lvivier@redhat.com>
	<1474034177-17663-4-git-send-email-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1474034177-17663-4-git-send-email-lvivier@redhat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 74.125.82.67
Subject: Re: [Qemu-trivial] [PATCH 03/26] cris: use exit(EXIT_SUCCESS) and
 exit(EXIT_FAILURE)
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
X-List-Received-Date: Fri, 16 Sep 2016 14:45:07 -0000

On Fri, Sep 16, 2016 at 03:55:54PM +0200, Laurent Vivier wrote:
> This patch is the result of coccinelle script
> scripts/coccinelle/exit.cocci
> 
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> CC: Edgar E. Iglesias <edgar.iglesias@gmail.com>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> ---
>  hw/cris/boot.c                              | 4 ++--
>  tests/tcg/cris/check_gcctorture_pr28634-1.c | 2 +-
>  tests/tcg/cris/check_gcctorture_pr28634.c   | 2 +-
>  tests/tcg/cris/check_glibc_kernelversion.c  | 2 +-
>  tests/tcg/cris/check_hello.c                | 2 +-
>  tests/tcg/cris/check_lz.c                   | 2 +-
>  tests/tcg/cris/check_mapbrk.c               | 6 +++---
>  tests/tcg/cris/check_mmap1.c                | 2 +-
>  tests/tcg/cris/check_mmap2.c                | 2 +-
>  tests/tcg/cris/check_mmap3.c                | 2 +-
>  tests/tcg/cris/check_openpf5.c              | 2 +-
>  tests/tcg/cris/check_stat1.c                | 2 +-
>  tests/tcg/cris/check_stat2.c                | 2 +-
>  tests/tcg/cris/check_stat3.c                | 2 +-
>  tests/tcg/cris/check_stat4.c                | 2 +-
>  tests/tcg/cris/check_time1.c                | 2 +-
>  tests/tcg/cris/check_time2.c                | 2 +-
>  tests/tcg/cris/sys.c                        | 2 +-
>  18 files changed, 21 insertions(+), 21 deletions(-)
> 
> diff --git a/hw/cris/boot.c b/hw/cris/boot.c
> index f896ed7..85ab8c4 100644
> --- a/hw/cris/boot.c
> +++ b/hw/cris/boot.c
> @@ -88,13 +88,13 @@ void cris_load_image(CRISCPU *cpu, struct cris_load_info *li)
>      if (image_size < 0) {
>          fprintf(stderr, "qemu: could not load kernel '%s'\n",
>                  li->image_filename);
> -        exit(1);
> +        exit(EXIT_FAILURE);
>      }
>  
>      if (li->cmdline && (kcmdline_len = strlen(li->cmdline))) {
>          if (kcmdline_len > 256) {
>              fprintf(stderr, "Too long CRIS kernel cmdline (max 256)\n");
> -            exit(1);
> +            exit(EXIT_FAILURE);
>          }
>          pstrcpy_targphys("cmdline", 0x40000000, 256, li->cmdline);
>      }
> diff --git a/tests/tcg/cris/check_gcctorture_pr28634-1.c b/tests/tcg/cris/check_gcctorture_pr28634-1.c
> index 45ecd15..ebe3f6f 100644
> --- a/tests/tcg/cris/check_gcctorture_pr28634-1.c
> +++ b/tests/tcg/cris/check_gcctorture_pr28634-1.c
> @@ -11,5 +11,5 @@ main (void)
>      y += x;
>    if (y != x + 1)
>      abort ();
> -  exit (0);
> +  exit(EXIT_SUCCESS);
>  }
> diff --git a/tests/tcg/cris/check_gcctorture_pr28634.c b/tests/tcg/cris/check_gcctorture_pr28634.c
> index a0c5254..52e5ef3 100644
> --- a/tests/tcg/cris/check_gcctorture_pr28634.c
> +++ b/tests/tcg/cris/check_gcctorture_pr28634.c
> @@ -11,5 +11,5 @@ main (void)
>      y += x;
>    if (y != x + 1)
>      abort ();
> -  exit (0);
> +  exit(EXIT_SUCCESS);
>  }
> diff --git a/tests/tcg/cris/check_glibc_kernelversion.c b/tests/tcg/cris/check_glibc_kernelversion.c
> index 0744872..ebc4959 100644
> --- a/tests/tcg/cris/check_glibc_kernelversion.c
> +++ b/tests/tcg/cris/check_glibc_kernelversion.c
> @@ -112,5 +112,5 @@ int main(void)
>  	if (version < __LINUX_KERNEL_VERSION)
>  		err();
>  	pass();
> -	exit(0);
> +	exit(EXIT_SUCCESS);
>  }
> diff --git a/tests/tcg/cris/check_hello.c b/tests/tcg/cris/check_hello.c
> index fb403ba..14b6fff 100644
> --- a/tests/tcg/cris/check_hello.c
> +++ b/tests/tcg/cris/check_hello.c
> @@ -3,5 +3,5 @@
>  int main ()
>  {
>    printf ("pass\n");
> -  exit (0);
> +  exit(EXIT_SUCCESS);
>  }
> diff --git a/tests/tcg/cris/check_lz.c b/tests/tcg/cris/check_lz.c
> index 69c2e6d..603aeac 100644
> --- a/tests/tcg/cris/check_lz.c
> +++ b/tests/tcg/cris/check_lz.c
> @@ -45,5 +45,5 @@ int main(void)
>  {
>  	check_lz();
>  	pass();
> -	exit(0);
> +	exit(EXIT_SUCCESS);
>  }
> diff --git a/tests/tcg/cris/check_mapbrk.c b/tests/tcg/cris/check_mapbrk.c
> index 1aff762..8d5ec3f 100644
> --- a/tests/tcg/cris/check_mapbrk.c
> +++ b/tests/tcg/cris/check_mapbrk.c
> @@ -16,7 +16,7 @@ int main ()
>        || (p6 = malloc (8191*1024)) == NULL)
>    {
>      printf ("fail\n");
> -    exit (1);
> +    exit(EXIT_FAILURE);
>    }
>  
>    free (p1);
> @@ -30,10 +30,10 @@ int main ()
>    if (p1 == NULL)
>    {
>      printf ("fail\n");
> -    exit (1);
> +    exit(EXIT_FAILURE);
>    }
>    free (p1);
>  
>    printf ("pass\n");
> -  exit (0);
> +  exit(EXIT_SUCCESS);
>  }
> diff --git a/tests/tcg/cris/check_mmap1.c b/tests/tcg/cris/check_mmap1.c
> index b803f0c..12a7fb5 100644
> --- a/tests/tcg/cris/check_mmap1.c
> +++ b/tests/tcg/cris/check_mmap1.c
> @@ -44,5 +44,5 @@ int main (int argc, char *argv[])
>      abort ();
>  
>    printf ("pass\n");
> -  exit (0);
> +  exit(EXIT_SUCCESS);
>  }
> diff --git a/tests/tcg/cris/check_mmap2.c b/tests/tcg/cris/check_mmap2.c
> index 35139a0..6c04db3 100644
> --- a/tests/tcg/cris/check_mmap2.c
> +++ b/tests/tcg/cris/check_mmap2.c
> @@ -44,5 +44,5 @@ int main (int argc, char *argv[])
>      abort ();
>  
>    printf ("pass\n");
> -  exit (0);
> +  exit(EXIT_SUCCESS);
>  }
> diff --git a/tests/tcg/cris/check_mmap3.c b/tests/tcg/cris/check_mmap3.c
> index 34401fa..9430177 100644
> --- a/tests/tcg/cris/check_mmap3.c
> +++ b/tests/tcg/cris/check_mmap3.c
> @@ -29,5 +29,5 @@ int main (int argc, char *argv[])
>      abort ();
>  
>    printf ("pass\n");
> -  exit (0);
> +  exit(EXIT_SUCCESS);
>  }
> diff --git a/tests/tcg/cris/check_openpf5.c b/tests/tcg/cris/check_openpf5.c
> index 1f86ea2..29c9ad3 100644
> --- a/tests/tcg/cris/check_openpf5.c
> +++ b/tests/tcg/cris/check_openpf5.c
> @@ -52,5 +52,5 @@ int main (int argc, char *argv[])
>  
>  ok:
>    printf ("pass\n");
> -  exit (0);
> +  exit(EXIT_SUCCESS);
>  }
> diff --git a/tests/tcg/cris/check_stat1.c b/tests/tcg/cris/check_stat1.c
> index 2e2cae5..bf17527 100644
> --- a/tests/tcg/cris/check_stat1.c
> +++ b/tests/tcg/cris/check_stat1.c
> @@ -12,5 +12,5 @@ int main (void)
>        || !S_ISDIR (buf.st_mode))
>      abort ();
>    printf ("pass\n");
> -  exit (0);
> +  exit(EXIT_SUCCESS);
>  }
> diff --git a/tests/tcg/cris/check_stat2.c b/tests/tcg/cris/check_stat2.c
> index e36172e..e9ca81a 100644
> --- a/tests/tcg/cris/check_stat2.c
> +++ b/tests/tcg/cris/check_stat2.c
> @@ -16,5 +16,5 @@ int main (void)
>        || !S_ISDIR (buf.st_mode))
>      abort ();
>    printf ("pass\n");
> -  exit (0);
> +  exit(EXIT_SUCCESS);
>  }
> diff --git a/tests/tcg/cris/check_stat3.c b/tests/tcg/cris/check_stat3.c
> index 36a9d5d..3696f0d 100644
> --- a/tests/tcg/cris/check_stat3.c
> +++ b/tests/tcg/cris/check_stat3.c
> @@ -21,5 +21,5 @@ int main (int argc, char *argv[])
>        || !S_ISREG (buf.st_mode))
>      abort ();
>    printf ("pass\n");
> -  exit (0);
> +  exit(EXIT_SUCCESS);
>  }
> diff --git a/tests/tcg/cris/check_stat4.c b/tests/tcg/cris/check_stat4.c
> index 04f21fe..bc28b98 100644
> --- a/tests/tcg/cris/check_stat4.c
> +++ b/tests/tcg/cris/check_stat4.c
> @@ -23,5 +23,5 @@ int main (int argc, char *argv[])
>        || !S_ISREG (buf.st_mode))
>      abort ();
>    printf ("pass\n");
> -  exit (0);
> +  exit(EXIT_SUCCESS);
>  }
> diff --git a/tests/tcg/cris/check_time1.c b/tests/tcg/cris/check_time1.c
> index 3fcf0e1..92c00a3 100644
> --- a/tests/tcg/cris/check_time1.c
> +++ b/tests/tcg/cris/check_time1.c
> @@ -42,5 +42,5 @@ main (void)
>      }
>  
>    printf ("pass\n");
> -  exit (0);
> +  exit(EXIT_SUCCESS);
>  }
> diff --git a/tests/tcg/cris/check_time2.c b/tests/tcg/cris/check_time2.c
> index 20b69b4..9960866 100644
> --- a/tests/tcg/cris/check_time2.c
> +++ b/tests/tcg/cris/check_time2.c
> @@ -14,5 +14,5 @@ main (void)
>    if (t == (time_t) -1 || t != x)
>      abort ();
>    printf ("pass\n");
> -  exit (0);
> +  exit(EXIT_SUCCESS);
>  }
> diff --git a/tests/tcg/cris/sys.c b/tests/tcg/cris/sys.c
> index 551c5dd..ace397e 100644
> --- a/tests/tcg/cris/sys.c
> +++ b/tests/tcg/cris/sys.c
> @@ -12,7 +12,7 @@ static inline int mystrlen(char *s) {
>  void pass(void) {
>  	char s[] = "passed.\n";
>  	write (1, s, sizeof (s) - 1);
> -	exit (0);
> +	exit(EXIT_SUCCESS);
>  }
>  
>  void _fail(char *reason) {
> -- 
> 2.5.5
> 

