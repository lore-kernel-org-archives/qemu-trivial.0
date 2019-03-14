Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h4SBv-0007fv-QC
	for mharc-qemu-trivial@gnu.org; Thu, 14 Mar 2019 11:22:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44783)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1h4SBt-0007Cx-21
	for qemu-trivial@nongnu.org; Thu, 14 Mar 2019 11:22:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1h4RxO-0005m4-Us
	for qemu-trivial@nongnu.org; Thu, 14 Mar 2019 11:07:46 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:52859)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1h4RsQ-0002be-Si; Thu, 14 Mar 2019 11:02:35 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
	1MavF5-1gSuIu0Mwd-00cSzF; Thu, 14 Mar 2019 16:00:47 +0100
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20190313144557.8845-1-eblake@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <07c6415e-bda3-e01c-57a6-1aaae9db6e89@vivier.eu>
Date: Thu, 14 Mar 2019 16:00:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20190313144557.8845-1-eblake@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:8AHoqyx+qHQ3T/uL3QoxQacaLotdI4j5tsG+VYWnWAXt2vbHHvQ
	sW/WdWIQlhZVteQV5qhEV7nL//zKTjwFYD2AYVHX9RizCsZckio7blouNnhvpZwwwuy7UW3
	52syyYTJZOxxRvuPiZwI4em9kZjTaentDgDo9cwvo4vIf0dJKZDEVq0O9tKhfMjJ81vrWJT
	zqPJ1lRh7kP/vXUaKRfsg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:NYpnbdGc/R8=:AbsafgBqYhtsGaBtytJSJJ
	cHaj5XNnGuj8LpzbwcZcOq1joabRMw66KLpOipl8HW4ebvIVsL8h88zufw+whkSrDskGaRmjB
	GF6R7Ct4uB0IzVqt1bC/f76pO05xVHVhJ7n2DyU1RKKiFVqc4Ww3cCaeEjIUSQAKLdHMQzTtd
	fSR0/wf0cKRYFPdd6Dv/XELIaoi1amO5IsVqOY3y6w158pKTOaZCBgjBOaaPI1m17HOOLWo88
	0giJlAmGgofsoD/CvXp8TXg06xo2WvS/NNJanyfwCmWk+3Mq2g2Sr3DiKqnsRfDlbbOEvrlwd
	UyE4ZxNl7+ZLx586qOxmfLPAbPVDdXz7GnLZ1VAqIg0oVpTfBuFKL3zG18LG7WmTaDxjv6enw
	otVvrdRbVX3uHAvpEYiELJ4GHNVO7sfiXYuMLjlK6phULIX83dbY9zC2pjKpVy7eQpSrpnWZn
	hDRUnQ0pvnFdzqiNROpIEcSLSEwZGjoPZu7l/tUUHMjIcpjUorWNMB6EUlTQ4KkHZnu7fLAAZ
	uumBoh8pXTOx1nOZSN+jl8iNNVKH+mZG912bv2/YSFCS9QXtKsYsSPtH0aBO3/C3rqAnvBpfl
	hj0+rx3GAEmEjnhIas+1Xx12AKR7fKnrOwfNLMVOw86gQBb7Y7NynHax53LnYjS87UeKlDzMC
	5qWYwr5efUzbtZGPW+mFiYKfH6i981w5eeomme49IW1vZg/yFalDsrVN9byccwd7plxZpI/6k
	Fag0nmyWgVuk8h9s6pMPcjiT4YAGgulxLooRoa9WylpN0UctSvdRP2q22Ck=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.187
Subject: Re: [Qemu-trivial] [PATCH for-4.0] maint: Ignore built elf2dmp
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
X-List-Received-Date: Thu, 14 Mar 2019 15:22:42 -0000

On 13/03/2019 15:45, Eric Blake wrote:
> Commit 3fa2d384 added a binary 'elf2dmp' but did not ignore it
> during an in-tree build.
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
> 
> Yes, I know we want to get rid of in-tree builds for 4.1; but
> for 4.0, this patch may still make sense.
> 
>   .gitignore | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/.gitignore b/.gitignore
> index 77522561b8e..42d2d473559 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -6,6 +6,7 @@
>   /config-target.*
>   /config.status
>   /config-temp
> +/elf2dmp
>   /trace-events-all
>   /trace/generated-events.h
>   /trace/generated-events.c
> 


Applied to my trivial-patches branch.

Thanks,
Laurent

