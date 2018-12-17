Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gYsyH-00030p-Vt
	for mharc-qemu-trivial@gnu.org; Mon, 17 Dec 2018 08:30:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55685)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gYsyA-0002vO-JS
	for qemu-trivial@nongnu.org; Mon, 17 Dec 2018 08:30:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gYsy8-0005FZ-Vo
	for qemu-trivial@nongnu.org; Mon, 17 Dec 2018 08:30:02 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:56453)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gYsy2-00059B-3y; Mon, 17 Dec 2018 08:29:54 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
	1MhUDj-1h2k0X0QsN-00eezG; Mon, 17 Dec 2018 14:29:46 +0100
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20181213175807.12039-1-armbru@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
	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
Message-ID: <acaa022e-681c-bf52-a962-b3a10b08321e@vivier.eu>
Date: Mon, 17 Dec 2018 14:29:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20181213175807.12039-1-armbru@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:1pBleH//TSSgcvCzyUhivjobd0nbNt2DfBEswsfR9A2ZW7BlxVx
	Hska9qYeKwwH0ZoEJy5GhTJ4vh5u5k/61jEIEx5YmGao7EaqqjqoKLswScSkircA3JpCqd5
	N0s6eLMnJKa/9NszLZUmDiVpug8Jvwhb36txh27kWZWp1HbK1cMHLP/wYDkxT/+3oU4sgJc
	VlaP1lv7clre9fAjjuBCg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:79Af9L3mJMc=:dPeK2wLs6dHCC9nOjYtvvx
	oBThM/A2/AGd0KhRbw4Fo8kXrsI21krisS3N0d7aBCTk6NEjGXFU8NNW18tqirLaa5724N7DQ
	X1M0zW4FACXm4De2/WiiYqw/K8gY2RuJRssJOnpF94d/H5o1vVO7kQHaQAsyhTprO5ecM/kY+
	ML8zGNEj+Mut8zZQ2v3GG2+T4D9AAyEeoWCA4DkEohiulgDuYTLG8HeisBzQI02XB4XbU0/aW
	vaFxXLuqP6D7goSjZ4EYeiXe0AxUDmwrdhkERMD5D6naN7txPPA2Cnkbp26Mo2u0qZgzQbxoq
	um3uLb+YBg13kZrmZ4c5AAZqX3+wcKk6pQHKUKBg+9l0/ag8zdlKZoj1spC0qqvqa1vok/6cy
	BLTFUPPUdlw6ISvE8yg/yiCNKclY2YNm7ht9ruZiNpC+8D6OoZcI0t/pCXZg+Jo5gzDpWowHi
	v6XUdEBm2gTOdQCZBeTXIRpaOcAqWSTgw3weA9ieKGEQR2q63VBKyYlbUgHAW448Fvj6NzHs8
	0qCYOUQB3dkS4X9ADdX6gNGsn81jZKdfHjP0qkq5LacDZM50WaGxJpCkd9DdG89O5eTONufLc
	C42PxGp5eyQC8Xx7Hc3XU9iSaREUVJJpDXbyIBIqacTZnR1wOO0PUH2zqfeaP0h97csnEBQ9f
	Bd2Zfwuyj1uytZSDBoYUkhI8oQHF3y2OhfSERRTztWcVzyScPYNxDSC0h0CvM/HP32LmOVCH9
	oel6DsKIGiyxGT4BzMhf1tm6yg1I4W8qWroH39bVT2rIAxkiDdXoo+2d3Kw=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.187
Subject: Re: [Qemu-trivial] [PATCH] vl: Use error_fatal to simplify obvious
 fatal errors (again)
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
X-List-Received-Date: Mon, 17 Dec 2018 13:30:08 -0000

On 13/12/2018 18:58, Markus Armbruster wrote:
> Patch created mechanically by rerunning:
> 
>     $ spatch --in-place --sp-file scripts/coccinelle/use-error_fatal.cocci \
>              --macro-file scripts/cocci-macro-file.h vl.c
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  vl.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/vl.c b/vl.c
> index a5ae5f23d2..702a828ca2 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -3138,11 +3138,8 @@ int main(int argc, char **argv, char **envp)
>                      Visitor *v;
>                      BlockdevOptions_queue *bdo;
>  
> -                    v = qobject_input_visitor_new_str(optarg, "driver", &err);
> -                    if (!v) {
> -                        error_report_err(err);
> -                        exit(1);
> -                    }
> +                    v = qobject_input_visitor_new_str(optarg, "driver",
> +                                                      &error_fatal);
>  
>                      bdo = g_new(BlockdevOptions_queue, 1);
>                      visit_type_BlockdevOptions(v, NULL, &bdo->bdo,
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

