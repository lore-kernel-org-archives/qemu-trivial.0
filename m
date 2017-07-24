Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dZjO8-0003s4-Tz
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jul 2017 15:51:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40338)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1dZjO6-0003rp-J5
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 15:51:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1dZjO2-0002yN-MZ
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 15:51:30 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:52324)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1dZjO2-0002x0-CB; Mon, 24 Jul 2017 15:51:26 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue103 [212.227.15.183]) with ESMTPSA (Nemesis) id
	0MgZE7-1dCIaA0c7D-00NxEf; Mon, 24 Jul 2017 21:51:09 +0200
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Eric Blake <eblake@redhat.com>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	Riku Voipio <riku.voipio@iki.fi>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <20170724182751.18261-1-f4bug@amsat.org>
	<20170724182751.18261-31-f4bug@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <82a0e0b4-392a-020f-eb98-9bc1039f66c4@vivier.eu>
Date: Mon, 24 Jul 2017 21:51:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170724182751.18261-31-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K0:7CTLe31ERnW7vi7Tl1elLNPdBJhIAPyWfm7AGFUmw/9n/49zsSM
	WN/nvcK0iiLWOfonOg0h7LC87xuXuS8M918CAVkYLTuDR8q2tRLdmM5KwMHrqN7KMFfK0+S
	L0+1f98rotrdqmSLi2NUrUZpqjcwQ0CxAlE1pLrM84ciS4ifXNbK3kXsGmSH/PVYVP/vZzO
	uOjNWPv5QBymHpt2+ujbA==
X-UI-Out-Filterresults: notjunk:1;V01:K0:liFHaHlfy/8=:Ln2EJbYPO4oJHTSdBmRZXY
	lgu46BtK+2wkMWK3b4J2TeVasVS+G+cmRt8IiXBg3uEcRn+MAAD1etGeLbdJtMkNynqtiHpBL
	D/MieHzghynk4T5G2qAalzYAISrENIbAxCaXQ7NuMP80JsqRxOc9EIlNkmbqUQnYFLfLfACwd
	0fAYLw+jkTpHkISsxwBZXdxU6GrEVv2FFoH0Fc5G9TzWcwU7RIL5yzJ5xJ+WfI7SK7R2bLVsK
	jfz2ehOBhi89MTV2XeNFEvuCahd4JKtI3X562tGCA/0Y/8w5gSxLbpapeH2mR/xTosx3h+zLw
	F2yNdLd94WBA1gtsbqbZ3QExD3+RCoLEy4/m48/x7bVHfb1uNoVJS94/8GZCAHbvEGVrWtGa7
	4PaJg0VN1evxwHhPepqcfSWyg0rWwsx7DqkEpzlpFojP0P2WdW5Pegec09SQL3J6Az5grUdMo
	I9Sg3g3vjOxfU5CptxFJfk4hTqTllpWbXUdR5fUdEjJkkweB8T2xQ4jtDLBWGCWbZtHlpTZJn
	Gkhs8M7yGNjj1v28lASFsypQFW8ijv8cgSGlvF3hbI/57X7eoJ8raq5LYoVBRtMc4Sq3g5TRm
	xK+o2mpPQOhgzt2NcFL6f++y8Fugjem3X9F2alE9DKYoj/ou6Rr+HLZ9j60aXM663dUP/dbz6
	HU6bIDNONMkl30JkLHmTz62nWsxLapMQHey0IA0wyT1DomVHVgqCFtO5hJjaoyyXGUOEUvqWx
	1/5PZ8mvj/4OyfPoVIfYKrqu2ocdxRYN9/d+Kn74v4vLF6eMXYQRBRu1dhk=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 217.72.192.74
Subject: Re: [Qemu-trivial] [PATCH for 2.10 30/35] syscall: fix use of
 uninitialized values
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
X-List-Received-Date: Mon, 24 Jul 2017 19:51:31 -0000

Le 24/07/2017 à 20:27, Philippe Mathieu-Daudé a écrit :
> linux-user/syscall.c:1627:35: warning: 1st function call argument is an uninitialized value
>         target_saddr->sa_family = tswap16(addr->sa_family);
>                                   ^~~~~~~~~~~~~~~~~~~~~~~~
> linux-user/syscall.c:1629:25: warning: The left operand of '==' is a garbage value
>     if (addr->sa_family == AF_NETLINK && len >= sizeof(struct sockaddr_nl)) {
>         ~~~~~~~~~~~~~~~ ^
> 
> Reported-by: Clang Static Analyzer
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  linux-user/syscall.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 26450d235f..963b9c8f4b 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -1618,6 +1618,7 @@ static inline abi_long host_to_target_sockaddr(abi_ulong target_addr,
>      if (len == 0) {
>          return 0;
>      }
> +    assert(addr);
>  
>      target_saddr = lock_user(VERIFY_WRITE, target_addr, len, 0);
>      if (!target_saddr)
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


