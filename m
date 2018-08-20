Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1frkJb-0002oX-4B
	for mharc-qemu-trivial@gnu.org; Mon, 20 Aug 2018 09:33:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57516)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1frkJW-0002LH-GJ
	for qemu-trivial@nongnu.org; Mon, 20 Aug 2018 09:33:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1frk9G-0004GS-Vt
	for qemu-trivial@nongnu.org; Mon, 20 Aug 2018 09:23:14 -0400
Received: from mail-wm0-f67.google.com ([74.125.82.67]:37298)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1frk9G-0004G2-JY
	for qemu-trivial@nongnu.org; Mon, 20 Aug 2018 09:23:10 -0400
Received: by mail-wm0-f67.google.com with SMTP id n11-v6so13838719wmc.2
	for <qemu-trivial@nongnu.org>; Mon, 20 Aug 2018 06:23:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=vldPDOWo5j1oG5fM40S2yaDrrL9LZm5jkOliDOrM8e0=;
	b=kb3/RqWtgTfMnfYNh5mkGm7DA79xuJjja9av//VUMdY8zxqxw40EaOyyDphkl93XfZ
	OBDEqcwTKgWkFU+/a5ritEgKH0TByB3oS7Pnp9UkgoB4EUdNXnONcKu1yRP2uoRjDhl3
	nJfURgma4o/n7TzDe1LxG2jwWpdQSfZTjy2OwIATaL8LRzvyv5l9EH+kJctSfHig7zxV
	WeX7metfNqJPCpMibJj0/3b95HrltTjcG1UqYbE5cBoldP9ZS1jFzQptjSyjD/uOXVCH
	q2du+i7k5M/+qCjGPSJ1vj+YmgJ+owkna8qrQ70quTYX5YffPzMqdFDpyJpMSDd/LSjy
	uzJQ==
X-Gm-Message-State: AOUpUlG7i9iM0rKQLVJ/pkULBcKTnoC4KZeeK+rxbgEZZm6We4XrFFAU
	u4mFi4h41u58+qWhUg4yQG4XFQ==
X-Google-Smtp-Source: AA+uWPwp+5X1KD2qNWqJV0cHAnpeCehLXDofCgB7QKfCa7a7WYnnv9Yu+fI1Hmmrx9Zmw8U1CErLSg==
X-Received: by 2002:a1c:7d58:: with SMTP id
	y85-v6mr25236198wmc.91.1534771389497; 
	Mon, 20 Aug 2018 06:23:09 -0700 (PDT)
Received: from [10.32.181.140] (nat-pool-mxp-t.redhat.com. [149.6.153.186])
	by smtp.gmail.com with ESMTPSA id
	j133-v6sm24046512wmd.12.2018.08.20.06.23.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Aug 2018 06:23:08 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Juan Quintela <quintela@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	David Hildenbrand <david@redhat.com>, Howard Spoelstra <hsp.cat7@gmail.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
References: <20180818025653.21192-1-f4bug@amsat.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <66dfe354-9c2c-8642-a905-03155555fe99@redhat.com>
Date: Mon, 20 Aug 2018 15:23:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180818025653.21192-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 74.125.82.67
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] migration: Replace
 strncpy() by g_strlcpy()
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
X-List-Received-Date: Mon, 20 Aug 2018 13:33:49 -0000

On 18/08/2018 04:56, Philippe Mathieu-Daudé wrote:
> Fedora 29 comes with GCC 8.1 which added the 'stringop-truncation' checks.
> 
> Replace the strncpy() calls by g_strlcpy() to avoid the following warning:
> 
>   migration/global_state.c: In function 'global_state_store_running':
>   migration/global_state.c:45:5: error: 'strncpy' specified bound 100 equals destination size [-Werror=stringop-truncation]
>        strncpy((char *)global_state.runstate,
>        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>               state, sizeof(global_state.runstate));
>               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Reported-by: Howard Spoelstra <hsp.cat7@gmail.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> See http://lists.nongnu.org/archive/html/qemu-devel/2018-07/msg03723.html
> 
>  migration/global_state.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/migration/global_state.c b/migration/global_state.c
> index 8e8ab5c51e..d5df502cd5 100644
> --- a/migration/global_state.c
> +++ b/migration/global_state.c
> @@ -42,7 +42,7 @@ int global_state_store(void)
>  void global_state_store_running(void)
>  {
>      const char *state = RunState_str(RUN_STATE_RUNNING);
> -    strncpy((char *)global_state.runstate,
> +    g_strlcpy((char *)global_state.runstate,
>             state, sizeof(global_state.runstate));
>  }
>  
> 

This is wrong because strlcpy doesn't zero the rest of
global_state.runstate, so you could end up with something like
"running\0ate\0\0..." in global_state.runstate However, the same mistake
is already present in vl.c's runstate_store.

Juan, David, what to do?  strncpy is easy to misuse, but we do have
cases where it's correct and it should tingle the reviewers' spidey
senses...  I wouldn't mind disabling the warning, and using strncpy in
runstate_store, because in practice it's already reported by Coverity
and it can be shut up there.

Thanks,

Paolo

