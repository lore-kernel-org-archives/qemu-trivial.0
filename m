Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kODGb-0000sd-NA
	for mharc-qemu-trivial@gnu.org; Fri, 02 Oct 2020 01:06:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kODGZ-0000rV-T8
 for qemu-trivial@nongnu.org; Fri, 02 Oct 2020 01:05:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kODGX-0004MM-6R
 for qemu-trivial@nongnu.org; Fri, 02 Oct 2020 01:05:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601615154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4J2JYZI+sEeqFiooLGr4xu/fqgQw3qTpXIjv2UVybm0=;
 b=ZOsOGPyUkOKdEFE20CPKnG+NRASSBehyXvvoI5VsYKvvCaA6LzERsz19GKl7VeH3HS/mmG
 svKYWZpV557No3Hm2fJXoB26frtuNaI5ZAjWPf0ARCGc4V3/DWnkW/5/BVNW5EsSXwPG4F
 hrknechTO8s3eblZScVcq6hcGBqXx6w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394-LpZpyYtLN6aW15JoJrdB7A-1; Fri, 02 Oct 2020 01:05:53 -0400
X-MC-Unique: LpZpyYtLN6aW15JoJrdB7A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0743756B2B;
 Fri,  2 Oct 2020 05:05:52 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-101.ams2.redhat.com
 [10.36.112.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B4BAF78822;
 Fri,  2 Oct 2020 05:05:51 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 407981132784; Fri,  2 Oct 2020 07:05:50 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Elena Afanasova <eafanasova@gmail.com>
Cc: qemu-devel@nongnu.org,  qemu-trivial@nongnu.org
Subject: Re: [PATCH] elfload: use g_new instead of malloc
References: <20201001123807.42978-1-eafanasova@gmail.com>
Date: Fri, 02 Oct 2020 07:05:50 +0200
In-Reply-To: <20201001123807.42978-1-eafanasova@gmail.com> (Elena Afanasova's
 message of "Thu, 1 Oct 2020 05:38:07 -0700")
Message-ID: <87r1qhtdxt.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/01 23:37:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 02 Oct 2020 05:06:00 -0000

Elena Afanasova <eafanasova@gmail.com> writes:

> Signed-off-by: Elena Afanasova <eafanasova@gmail.com>
> ---
>  bsd-user/elfload.c | 92 +++++++++++++++-------------------------------
>  1 file changed, 30 insertions(+), 62 deletions(-)
>
> diff --git a/bsd-user/elfload.c b/bsd-user/elfload.c
> index 32378af7b2..e10ca54eb7 100644
> --- a/bsd-user/elfload.c
> +++ b/bsd-user/elfload.c
> @@ -867,18 +867,14 @@ static abi_ulong load_elf_interp(struct elfhdr * interp_elf_ex,
>          if (sizeof(struct elf_phdr) * interp_elf_ex->e_phnum > TARGET_PAGE_SIZE)
>              return ~(abi_ulong)0UL;
>  
> -        elf_phdata =  (struct elf_phdr *)
> -                malloc(sizeof(struct elf_phdr) * interp_elf_ex->e_phnum);
> -
> -        if (!elf_phdata)
> -          return ~((abi_ulong)0UL);
> +        elf_phdata = g_new(struct elf_phdr, interp_elf_ex->e_phnum);
>  
>          /*
>           * If the size of this structure has changed, then punt, since
>           * we will be doing the wrong thing.
>           */
>          if (interp_elf_ex->e_phentsize != sizeof(struct elf_phdr)) {
> -            free(elf_phdata);
> +            g_free(elf_phdata);
>              return ~((abi_ulong)0UL);
>          }
>  
> @@ -890,9 +886,8 @@ static abi_ulong load_elf_interp(struct elfhdr * interp_elf_ex,
>          }
>          if (retval < 0) {
>                  perror("load_elf_interp");
> +                g_free(elf_phdata);
>                  exit(-1);
> -                free (elf_phdata);
> -                return retval;

Deleting return looks wrong.

>          }
>  #ifdef BSWAP_NEEDED
>          eppnt = elf_phdata;
> @@ -940,7 +935,7 @@ static abi_ulong load_elf_interp(struct elfhdr * interp_elf_ex,
>              if (error == -1) {
>                /* Real error */
>                close(interpreter_fd);
> -              free(elf_phdata);
> +              g_free(elf_phdata);
>                return ~((abi_ulong)0UL);
>              }
>  
> @@ -983,7 +978,7 @@ static abi_ulong load_elf_interp(struct elfhdr * interp_elf_ex,
>                          PROT_READ|PROT_WRITE|PROT_EXEC,
>                          MAP_FIXED|MAP_PRIVATE|MAP_ANON, -1, 0);
>          }
> -        free(elf_phdata);
> +        g_free(elf_phdata);
>  
>          *interp_load_addr = load_addr;
>          return ((abi_ulong) interp_elf_ex->e_entry) + load_addr;
> @@ -1064,24 +1059,15 @@ static void load_symbols(struct elfhdr *hdr, int fd)
>  
>   found:
>      /* Now know where the strtab and symtab are.  Snarf them. */
> -    s = malloc(sizeof(*s));
> -    syms = malloc(symtab.sh_size);
> -    if (!syms) {
> -        free(s);
> -        return;
> -    }
> -    s->disas_strtab = strings = malloc(strtab.sh_size);
> -    if (!s->disas_strtab) {
> -        free(s);
> -        free(syms);
> -        return;
> -    }
> +    s = g_new(struct syminfo, 1);
> +    syms = g_new(symtab.sh_size, 1);

g_new() takes a struct type argument, symtab.sh_size is an expression.
I'm pretty sure this doesn't even compile.

I'm looking no further.

Nacked-by: Markus Armbruster <armbru@redhat.com>

[...]


