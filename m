Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1etaMD-0007dQ-1n
	for mharc-qemu-trivial@gnu.org; Wed, 07 Mar 2018 09:47:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54774)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1etaM9-0007as-BP
	for qemu-trivial@nongnu.org; Wed, 07 Mar 2018 09:47:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1etaM4-0007aQ-51
	for qemu-trivial@nongnu.org; Wed, 07 Mar 2018 09:47:49 -0500
Received: from mail-wr0-f178.google.com ([209.85.128.178]:37568)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1etaM3-0007a6-U0
	for qemu-trivial@nongnu.org; Wed, 07 Mar 2018 09:47:44 -0500
Received: by mail-wr0-f178.google.com with SMTP id z12so2445914wrg.4
	for <qemu-trivial@nongnu.org>; Wed, 07 Mar 2018 06:47:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Rw4m9LDscTPLcOH864rbLaBy2vWtVwdLK3XtQKrryN8=;
	b=biZYXMy1ubftI8Htm4KDl2JWwwGPSqTLAmgKhUyVbH3sz4Dk2ouHtwtYC3aF17Lvfa
	olAWs9CkpPN1/AVf7BX2BpmrBXe+Ru/2AZTKjzsTklkwmTBa4fxRL8jNsGLjH2BP0m/q
	zzI6U+BjgOSObUoS3Tt/QfqYXnWDHyZastb/AS4qMfsMw4gZE8Het+Z6wxZFHlQj10QQ
	ltKCJrSHlAbCNaAqi8vebmOL0DP/vkkUIkNGNQ4/JnoWfjD0mNrZYBDrNmERFh7tLyGQ
	uEroYANBIEQjwz0WcLiLbxXMlQ9YmEd9qmWcQpsUvjqlY4WWyFJnp3xVIXtQNzYG4aBr
	zaYg==
X-Gm-Message-State: APf1xPCkCXVbRYK6U1pSPUdZN/MRaBsv/brvMZx6FEb1n4XA4cOVs0dp
	OIK82Nd1zWFRb4dnJGQDHmT4AXnX3/8=
X-Google-Smtp-Source: AG47ELtA0zf8dcxIiDIx4nIH5NjfPCNqLag9hvHyVdnnlhP0vE18go/I6RSMc0Z78F+4fbT1hsw+WQ==
X-Received: by 10.223.177.194 with SMTP id r2mr20740471wra.89.1520434062651;
	Wed, 07 Mar 2018 06:47:42 -0800 (PST)
Received: from [192.168.10.165] (94-36-191-219.adsl-ull.clienti.tiscali.it.
	[94.36.191.219]) by smtp.gmail.com with ESMTPSA id
	v63sm50331410wrc.69.2018.03.07.06.47.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 07 Mar 2018 06:47:42 -0800 (PST)
To: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Samuel Thibault <samuel.thibault@gnu.org>,
	"Jason Wang (jasowang@redhat.com)" <jasowang@redhat.com>
References: <20180201093545.33741-1-aik@ozlabs.ru>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <79532a0f-4cbe-5b85-b113-91cbd3c7f81d@redhat.com>
Date: Wed, 7 Mar 2018 15:47:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180201093545.33741-1-aik@ozlabs.ru>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.178
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH qemu] slirp/debug: Print IP
 addresses in human readable form
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
X-List-Received-Date: Wed, 07 Mar 2018 14:47:51 -0000

On 01/02/2018 10:35, Alexey Kardashevskiy wrote:
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---
>  slirp/arp_table.c | 4 ++--
>  slirp/socket.c    | 8 ++++----
>  slirp/udp.c       | 4 ++--
>  3 files changed, 8 insertions(+), 8 deletions(-)

Samuel, Jason, can you pick this up?

Thanks,

Paolo

> diff --git a/slirp/arp_table.c b/slirp/arp_table.c
> index 3547043..bac608f 100644
> --- a/slirp/arp_table.c
> +++ b/slirp/arp_table.c
> @@ -33,7 +33,7 @@ void arp_table_add(Slirp *slirp, uint32_t ip_addr, uint8_t ethaddr[ETH_ALEN])
>      int i;
>  
>      DEBUG_CALL("arp_table_add");
> -    DEBUG_ARG("ip = 0x%x", ip_addr);
> +    DEBUG_ARG("ip = %s", inet_ntoa(*(struct in_addr *)&ip_addr));
>      DEBUG_ARGS((dfd, " hw addr = %02x:%02x:%02x:%02x:%02x:%02x\n",
>                  ethaddr[0], ethaddr[1], ethaddr[2],
>                  ethaddr[3], ethaddr[4], ethaddr[5]));
> @@ -67,7 +67,7 @@ bool arp_table_search(Slirp *slirp, uint32_t ip_addr,
>      int i;
>  
>      DEBUG_CALL("arp_table_search");
> -    DEBUG_ARG("ip = 0x%x", ip_addr);
> +    DEBUG_ARG("ip = %s", inet_ntoa(*(struct in_addr *)&ip_addr));
>  
>      /* If broadcast address */
>      if (ip_addr == 0xffffffff || ip_addr == broadcast_addr) {
> diff --git a/slirp/socket.c b/slirp/socket.c
> index cb7b5b6..61347d1 100644
> --- a/slirp/socket.c
> +++ b/slirp/socket.c
> @@ -701,10 +701,10 @@ tcp_listen(Slirp *slirp, uint32_t haddr, u_int hport, uint32_t laddr,
>  	memset(&addr, 0, addrlen);
>  
>  	DEBUG_CALL("tcp_listen");
> -	DEBUG_ARG("haddr = %x", haddr);
> -	DEBUG_ARG("hport = %d", hport);
> -	DEBUG_ARG("laddr = %x", laddr);
> -	DEBUG_ARG("lport = %d", lport);
> +	DEBUG_ARG("haddr = %s", inet_ntoa(*(struct in_addr *)&haddr));
> +	DEBUG_ARG("hport = %d", ntohs(hport));
> +	DEBUG_ARG("laddr = %s", inet_ntoa(*(struct in_addr *)&laddr));
> +	DEBUG_ARG("lport = %d", ntohs(lport));
>  	DEBUG_ARG("flags = %x", flags);
>  
>  	so = socreate(slirp);
> diff --git a/slirp/udp.c b/slirp/udp.c
> index 227d779..e5bf065 100644
> --- a/slirp/udp.c
> +++ b/slirp/udp.c
> @@ -241,8 +241,8 @@ int udp_output(struct socket *so, struct mbuf *m,
>  	DEBUG_CALL("udp_output");
>  	DEBUG_ARG("so = %p", so);
>  	DEBUG_ARG("m = %p", m);
> -	DEBUG_ARG("saddr = %lx", (long)saddr->sin_addr.s_addr);
> -	DEBUG_ARG("daddr = %lx", (long)daddr->sin_addr.s_addr);
> +	DEBUG_ARG("saddr = %s", inet_ntoa(saddr->sin_addr));
> +	DEBUG_ARG("daddr = %s", inet_ntoa(daddr->sin_addr));
>  
>  	/*
>  	 * Adjust for header
> 


