Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1crjPV-0006T6-U7
	for mharc-qemu-trivial@gnu.org; Sat, 25 Mar 2017 06:59:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33398)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1crjPT-0006S0-VA
	for qemu-trivial@nongnu.org; Sat, 25 Mar 2017 06:59:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1crjPO-00040r-PM
	for qemu-trivial@nongnu.org; Sat, 25 Mar 2017 06:59:04 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:49252)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1crjPO-00040X-El; Sat, 25 Mar 2017 06:58:58 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue101 [212.227.15.183]) with ESMTPSA (Nemesis) id
	0M09nw-1c25gr49aG-00uJPr; Sat, 25 Mar 2017 11:58:50 +0100
To: fred.konrad@greensocs.com, qemu-trivial@nongnu.org, qemu-devel@nongnu.org
References: <1490360147-26450-1-git-send-email-fred.konrad@greensocs.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <7e150e14-dfb1-7dda-fb1b-0d885b28b33b@vivier.eu>
Date: Sat, 25 Mar 2017 11:58:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1490360147-26450-1-git-send-email-fred.konrad@greensocs.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K0:nh7Nm/keeoYDDqhxj6LfH/3xhbfgox3h4Tfm/Y5lrQQWi1ERRRr
	BAYQ1bHmddgiQ/KcVDEh0dH1Lfv9t/iWYJ/7YRlpN7oe+GQ7itrRcJdMFltf6GE6U/G1ZyN
	d7jzKWvOXN1BTCWy3aCIuj8top8Jm+C7cwGYMJaIucJViFn7T+0s1mpCdeOCi8O0BEbmlTS
	RW5CNgBe5XjHX/1Vc5/UA==
X-UI-Out-Filterresults: notjunk:1;V01:K0:0oS0YZoy884=:NjUaYprXDLljcMIXOLd+NL
	Za/xXx5hU0oU9zM1MuR2fiyHqoDPp0j67lGRnBUg9x8MIqDz7At0HO6zRw7iHHhBW/hJvzWSD
	/BjCZZn7HwUvWEOFv74Ia7MIJhyCifqZSJ6tGnFYQW21d1PofdOE3DjhyZpejpes2pstdSrru
	h9nrRrGraSF8ma1EOcuDPBy5QG4QaonokFISl0wKkvFlVQo3R2oS649ZoVJ6E56qLeiVg68JD
	NQfwTZyruUAA+oX+n0og93GZn9P68pfg5XsCu8Xt7yeiXuzA71tDX2sNtFBEdBqwLIrKA40WD
	5kDoKeU4CWm0u/bELKh4BIb2fRaQ8THHGru02AlEa9PE9BhQ/kLXMVpRu08dOZduuf1IR1Zbr
	y/vFd2oZVoF5ZCyocoyazhCdrcMXpxoqPQMOiPmgrIhWRoZ5d0wvrvSRnDjq1VV2zxKOAfCW5
	PnhuaK/7qsdiIrjjyeI07SZCcV3m1IetlPU+ohZuarOoxelrkrubtStqu54XQxV67Go2iDjdP
	KMyc0rTg0H04ETPARLL2TtDyzzvrm7QNgCcGWVilInaLWkiwLpgP6lfe37rpz5pi/S8V9tkGC
	4VB+PbT6JrSLGByS54BK+TUJ8dOS5X2IqJLYAWsEQ6wxQA6bKI+YDU6eOdGN9dbohzygC2Xcc
	3mjUwTOcx6feZEcma06UDhT/ERktMUu81Igu4MG04GnIjctqlR71Kp88hwUBniMHdAuMSPelS
	jjXAmVFL5QFSLen/
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 217.72.192.75
Subject: Re: [Qemu-trivial] [PATCH] ppc_booke: drop useless assignment
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
X-List-Received-Date: Sat, 25 Mar 2017 10:59:05 -0000

Le 24/03/2017 à 13:55, fred.konrad@greensocs.com a écrit :
> From: KONRAD Frederic <fred.konrad@greensocs.com>
> 
> The tb_env variable is set two lines above. So just drop the double assignment.
> 
> Signed-off-by: KONRAD Frederic <fred.konrad@greensocs.com>
> ---
>  hw/ppc/ppc_booke.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/hw/ppc/ppc_booke.c b/hw/ppc/ppc_booke.c
> index 60baffa..23bcf1b 100644
> --- a/hw/ppc/ppc_booke.c
> +++ b/hw/ppc/ppc_booke.c
> @@ -282,7 +282,6 @@ void store_booke_tcr(CPUPPCState *env, target_ulong val)
>      ppc_tb_t *tb_env = env->tb_env;
>      booke_timer_t *booke_timer = tb_env->opaque;
>  
> -    tb_env = env->tb_env;
>      env->spr[SPR_BOOKE_TCR] = val;
>      kvmppc_set_tcr(cpu);
>  
> 
Reviewed-by: Laurent Vivier <laurent@vivier.eu>


