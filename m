Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ffKeJ-0003f6-AA
	for mharc-qemu-trivial@gnu.org; Tue, 17 Jul 2018 03:43:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59669)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ffKeF-0003dA-Tw
	for qemu-trivial@nongnu.org; Tue, 17 Jul 2018 03:43:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ffKeE-0003wW-Lr
	for qemu-trivial@nongnu.org; Tue, 17 Jul 2018 03:43:51 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:53280 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1ffKe8-0003uS-Je; Tue, 17 Jul 2018 03:43:44 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5D4247C6CA;
	Tue, 17 Jul 2018 07:43:42 +0000 (UTC)
Received: from [10.36.117.124] (ovpn-117-124.ams2.redhat.com [10.36.117.124])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 55D1376EF;
	Tue, 17 Jul 2018 07:43:38 +0000 (UTC)
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini
	<pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
References: <20180716193312.A5BA17456B9@zero.eik.bme.hu>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=thuth@redhat.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <2164ddc5-68be-ffa2-cebf-6980220b1238@redhat.com>
Date: Tue, 17 Jul 2018 09:43:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180716193312.A5BA17456B9@zero.eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Tue, 17 Jul 2018 07:43:42 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Tue, 17 Jul 2018 07:43:42 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [PATCH] Document command line options with
 single dash
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
X-List-Received-Date: Tue, 17 Jul 2018 07:43:53 -0000

On 16.07.2018 21:12, BALATON Zoltan wrote:
> QEMU options have a single dash (but also work as double dash for
> convenience and compatibility). Most options are listed with single
> dash in command line help but some were listed with two dashes.
> Normalize these to have the same format as the others.
> 
> Left --preconfig as that is mentioned as double dash everywhere so I
> assume that is the preferred form for that.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  qemu-options.hx | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 371c427..b1bf0f4 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -471,7 +471,7 @@ STEXI
>  @item -balloon virtio[,addr=@var{addr}]
>  @findex -balloon
>  Enable virtio balloon device, optionally with PCI address @var{addr}. This
> -option is deprecated, use @option{--device virtio-balloon} instead.
> +option is deprecated, use @option{-device virtio-balloon} instead.
>  ETEXI
>  
>  DEF("device", HAS_ARG, QEMU_OPTION_device,
> @@ -2005,7 +2005,7 @@ DEF("netdev", HAS_ARG, QEMU_OPTION_netdev,
>      "-netdev hubport,id=str,hubid=n[,netdev=nd]\n"
>      "                configure a hub port on the hub with ID 'n'\n", QEMU_ARCH_ALL)
>  DEF("nic", HAS_ARG, QEMU_OPTION_nic,
> -    "--nic [tap|bridge|"
> +    "-nic [tap|bridge|"
>  #ifdef CONFIG_SLIRP
>      "user|"
>  #endif
> @@ -2024,7 +2024,7 @@ DEF("nic", HAS_ARG, QEMU_OPTION_nic,
>      "socket][,option][,...][mac=macaddr]\n"
>      "                initialize an on-board / default host NIC (using MAC address\n"
>      "                macaddr) and connect it to the given host network backend\n"
> -    "--nic none      use it alone to have zero network devices (the default is to\n"
> +    "-nic none       use it alone to have zero network devices (the default is to\n"
>      "                provided a 'user' network connection)\n",
>      QEMU_ARCH_ALL)
>  DEF("net", HAS_ARG, QEMU_OPTION_net,
> @@ -3339,7 +3339,7 @@ mlocking qemu and guest memory can be enabled via @option{mlock=on}
>  ETEXI
>  
>  DEF("overcommit", HAS_ARG, QEMU_OPTION_overcommit,
> -    "--overcommit [mem-lock=on|off][cpu-pm=on|off]\n"
> +    "-overcommit [mem-lock=on|off][cpu-pm=on|off]\n"
>      "                run qemu with overcommit hints\n"
>      "                mem-lock=on|off controls memory lock support (default: off)\n"
>      "                cpu-pm=on|off controls cpu power management (default: off)\n",
> 

Acked-by: Thomas Huth <thuth@redhat.com>

... I'm in favour for consistency for the 3.0 release. But in the long
run, we should really come to a conclusion what we prefer (we still got
the double dash task at
https://wiki.qemu.org/BiteSizedTasks#Consistent_option_usage_in_documentation
)

