Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VG9BJ-0005EN-N7
	for mharc-qemu-trivial@gnu.org; Sun, 01 Sep 2013 11:03:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49452)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VG9BC-0004tw-4r
	for qemu-trivial@nongnu.org; Sun, 01 Sep 2013 11:03:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VG9B5-0000yl-Rl
	for qemu-trivial@nongnu.org; Sun, 01 Sep 2013 11:03:06 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:38620)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VG9At-0000hf-6Z; Sun, 01 Sep 2013 11:02:47 -0400
Received: from gandalf.local (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 50D29400BA;
	Sun,  1 Sep 2013 19:02:45 +0400 (MSK)
Message-ID: <52235715.6050008@msgid.tls.msk.ru>
Date: Sun, 01 Sep 2013 19:02:45 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130827 Icedove/17.0.8
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1376847606-14202-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1376847606-14202-1-git-send-email-sw@weilnetz.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] misc: Fix some typos in names and
	comments
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 01 Sep 2013 15:03:12 -0000

18.08.2013 21:40, Stefan Weil wrote:
> Most typos were found using a modified version of codespell:
>
> accross -> across
> issueing -> issuing
> TICNT_THRESHHOLD -> TICNT_THRESHOLD
> bandwith -> bandwidth
> VCARD_7816_PROPIETARY -> VCARD_7816_PROPRIETARY
> occured -> occurred
> gaurantee -> guarantee
> sofware -> software

Gosh.

> diff --git a/include/hw/bt.h b/include/hw/bt.h
> index 830af94..3f365bc 100644
> --- a/include/hw/bt.h
> +++ b/include/hw/bt.h
> @@ -640,8 +640,8 @@ typedef struct {
>   #define OCF_SETUP_SYNC_CONN		0x0028
>   typedef struct {
>       uint16_t	handle;
> -    uint32_t	tx_bandwith;
> -    uint32_t	rx_bandwith;
> +    uint32_t	tx_bandwidth;
> +    uint32_t	rx_bandwidth;
>       uint16_t	max_latency;
>       uint16_t	voice_setting;
>       uint8_t	retrans_effort;
> @@ -652,8 +652,8 @@ typedef struct {
>   #define OCF_ACCEPT_SYNC_CONN_REQ	0x0029
>   typedef struct {
>       bdaddr_t	bdaddr;
> -    uint32_t	tx_bandwith;
> -    uint32_t	rx_bandwith;
> +    uint32_t	tx_bandwidth;
> +    uint32_t	rx_bandwidth;
>       uint16_t	max_latency;
>       uint16_t	voice_setting;
>       uint8_t	retrans_effort;

BTW, these aren't used anywhere.

Thanks, applied to the trivial-patches queue.

/mjt

