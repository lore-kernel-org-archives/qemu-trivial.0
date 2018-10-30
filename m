Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gHX8K-0005Wo-Dd
	for mharc-qemu-trivial@gnu.org; Tue, 30 Oct 2018 12:44:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58217)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gHX8J-0005WA-0C
	for qemu-trivial@nongnu.org; Tue, 30 Oct 2018 12:44:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gHX8I-0000Bx-CV
	for qemu-trivial@nongnu.org; Tue, 30 Oct 2018 12:44:47 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:59537)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gHX8C-0008AI-81; Tue, 30 Oct 2018 12:44:40 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
	1N1Oft-1fY7Kt3CeZ-012sYD; Tue, 30 Oct 2018 17:44:16 +0100
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
	1N1Oft-1fY7Kt3CeZ-012sYD; Tue, 30 Oct 2018 17:44:16 +0100
To: Li Qiang <liq3ea@163.com>, f4bug@amsat.org, armbru@redhat.com
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <20181030151637.37207-1-liq3ea@163.com>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
	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
Message-ID: <9b666a59-bfd2-ddc7-e851-495fbb39386a@vivier.eu>
Date: Tue, 30 Oct 2018 17:44:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181030151637.37207-1-liq3ea@163.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:vt03b68N/Pw+tD41lSHneeTDY0wRgznMhD3zX8Xk3yEDolCJmeM
	a6S1uL9J1GAETkvsf6z/1z5hAAeCJeIqn+x1spe1Fgg5W1mw5KDe/WuwLLZWMGPPSrgcAbH
	3ZF78qZ6fDTw++FKMdBeegS8rOGwHVJ/m8cZrMSBWTwD/0fOo9k3gcQ2ORxGMgl5cu0l1ll
	oW6RhQAy+R22x98En3vFA==
X-UI-Out-Filterresults: notjunk:1;V01:K0:EFUeZolYBcQ=:GnTSy5WB62WFMImALrZRwq
	0YAmRGFNyNC1T60TKawi4mlMSwZ1GdpGKj59/lkoRlivIX+NUd6jEGqelo83wSYj4iinJhLhd
	tbH7m4FQyvJkpBRcHGG1o6/XKTOsfZAOstJJmKJjZCBUTVWoJpiFY8j0YfbjpkoVf06YVbJcW
	Yl1/3yqHwD3F4GvNRxts3Vsqpj/NkSvQVJB/mleezGn5BCelZgZRcrMxwmqtZa89PE/EEhe/4
	IVPuZDk5a5BqQa7nY9uezn/QjDX9DcbPymwJ2E34/OlbJhS0L7jFljFUQJKRkxP+pNyOjNNAh
	yo1CKi9sY1MklSPRGGvnefruiRr6JeBQXcXtKPGyid2Ug7XdQjwCGFFdk+V0VF1dtAWsMTV+u
	qJsediipmyJ/vHzJoGZOIg6qOzJSG6DWITStZotpqPXLKPJeC+Hr711czq2h2znJ7k6ycj140
	iEn1PUDp0x7lpH2DiJUh14dsn5fvzMecdqVZ0r19oGi2UuAYRhwSVDwmq0iZB9p+MH6orP7f0
	1IyczHRrBmcs+v075cHwX36a4+sLr49g5eQEhzdoXPH54Dyov+d1tPwOSZIh7xfosTda0n2Q5
	2E+d1e2b58HujOzAWwO1IKzdbIF4cbzktf3hhvR9VAAkBbymHLdvE9lATOnZFqZEnoqqjsjwp
	BFJNaX/LcTOdPek0creDKWevg4TjWadnhOExZlSL66eom7G1IKmKSuQ2smJ/9u72qeis2TD6v
	tFkw6iBNVCB3gCk+By0DM3jA9t7pMToWhXRPUZjWBnXC5fCqmODBYCGG9hVcnCcLMMBNKg9/W
	XuCkJw1JMihLdT+YSKZ4A4TO0xvXw==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.74
Subject: Re: [Qemu-trivial] [PATCH] hw: qdev: fix error in comment
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
X-List-Received-Date: Tue, 30 Oct 2018 16:44:47 -0000

Le 30/10/2018 à 16:16, Li Qiang a écrit :
> Cc: qemu-trivial@nongnu.org
> 
> Signed-off-by: Li Qiang <liq3ea@163.com>
> ---
>  include/hw/qdev-core.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
> index a24d0dd566..92851e55df 100644
> --- a/include/hw/qdev-core.h
> +++ b/include/hw/qdev-core.h
> @@ -197,7 +197,7 @@ typedef struct BusChild {
>  
>  /**
>   * BusState:
> - * @hotplug_device: link to a hotplug device associated with bus.
> + * @hotplug_handler: link to a hotplug handler associated with bus.
>   */
>  struct BusState {
>      Object obj;
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

Fixes: 0ee4de6ce1d403b3d8017b340cec772c3c5c106f
       (qdev: add to BusState "hotplug-handler" link)

