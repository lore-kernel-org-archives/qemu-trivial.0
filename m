Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1etPuJ-0007yB-Dp
	for mharc-qemu-trivial@gnu.org; Tue, 06 Mar 2018 22:38:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33180)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1etPuH-0007xu-E8
	for qemu-trivial@nongnu.org; Tue, 06 Mar 2018 22:38:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1etPuE-0007na-Hb
	for qemu-trivial@nongnu.org; Tue, 06 Mar 2018 22:38:21 -0500
Received: from mail-pg0-x22d.google.com ([2607:f8b0:400e:c05::22d]:39190)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <aik@ozlabs.ru>) id 1etPuE-0007nL-Bz
	for qemu-trivial@nongnu.org; Tue, 06 Mar 2018 22:38:18 -0500
Received: by mail-pg0-x22d.google.com with SMTP id e3so409403pga.6
	for <qemu-trivial@nongnu.org>; Tue, 06 Mar 2018 19:38:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=ZR2JaARM+8mECbwIjakBr78qR1FE5NqezEdvWfX4sfg=;
	b=pl8HyY9Ok6ndmo1wYsrlz0Tv/G4IOipgHkCsSqvJwnD0pnxWqAEz52ZQAIHjynvGx+
	TU8csVyiUXtIpI1ynMXCsEpTdhTs+EcYaqbxQCe9RhEaUcaE95bkS6VbnQFMHLKwOIAQ
	8IWjFPaT60JnvVmlaXwZpAY9cyPctT6qS/hPCg4rknPp8aNxgY8PWATyFhHKWerpR1BE
	JGKLtDQcjr4J3xW0ZX2L1JCOpKhIDnXwOVKyBA1qXMbscBdL7C8DMRd94hMM72UKc3OR
	d73jac5WQTZI4BK7Q7jqm9PRoOSncWqR+znrRg261NfOPcD2vl/KRlsT+lCWh3zf+AfZ
	9IyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ZR2JaARM+8mECbwIjakBr78qR1FE5NqezEdvWfX4sfg=;
	b=prh4H7M2sd1/2Ulo8DTw6fAmzzOn1hQhyWxw0zBSUzW8YoJlH+GFAevTxcSzwrOM6g
	XB6ELPBEqvBftWK14qTfEvUNQV0wjFjVnjexvIAjG/4oRrP7k/GEPcPXVodMzFDW+r+m
	p4Q1Yck7+y+RFLcTBlNPttOVy8LSW++kZoxhJ5PnhJkEefM5HpAkYLIqShcT4u+ajTW+
	ifjVjBOkBrKeO1ivmnugl+GEwo2Fuuptsf1bx35UbjbhS5rbCIGmdssWFDGIMqVEHqQJ
	43bsZVRdXAjPZdpBKY0wQ1ThsbZ3lW94tY099W9+keQ1ZsmPpugAV6uxnaK4eN1ado8B
	5zNg==
X-Gm-Message-State: APf1xPDTqiKT4ZzRoNY5MffeCAoPqXiwum12sEmfA9OVSMgsustV3vMX
	AtUktAYlr87jUx6EyLbSHkdq57N0
X-Google-Smtp-Source: AG47ELsxSYK0Z+jhJSVTmdWiNkCuvSbEYqhZnHL+IP+wsJMtQ6eluV8XSdV/eX+1UwBdLkJi7SMr8Q==
X-Received: by 10.99.109.138 with SMTP id i132mr17285955pgc.417.1520393896974; 
	Tue, 06 Mar 2018 19:38:16 -0800 (PST)
Received: from [10.61.2.175] ([122.99.82.10])
	by smtp.googlemail.com with ESMTPSA id
	v8sm35310147pfa.32.2018.03.06.19.38.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Mar 2018 19:38:16 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20180201093545.33741-1-aik@ozlabs.ru>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Message-ID: <38e2df74-c7d7-a062-8385-494adae0ef89@ozlabs.ru>
Date: Wed, 7 Mar 2018 14:38:12 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20180201093545.33741-1-aik@ozlabs.ru>
Content-Type: text/plain; charset=utf-8
Content-Language: en-AU
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::22d
Subject: Re: [Qemu-trivial] [PATCH qemu] slirp/debug: Print IP addresses in
 human readable form
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
X-List-Received-Date: Wed, 07 Mar 2018 03:38:22 -0000

On 01/02/18 20:35, Alexey Kardashevskiy wrote:
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>

Ping?


> ---
>  slirp/arp_table.c | 4 ++--
>  slirp/socket.c    | 8 ++++----
>  slirp/udp.c       | 4 ++--
>  3 files changed, 8 insertions(+), 8 deletions(-)
> 
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


-- 
Alexey

