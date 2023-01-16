Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pHU0s-0005Zu-5p
	for mharc-qemu-trivial@gnu.org; Mon, 16 Jan 2023 13:15:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pHU0q-0005Yt-37; Mon, 16 Jan 2023 13:15:16 -0500
Received: from mout.kundenserver.de ([212.227.126.135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pHU0o-0004RB-9K; Mon, 16 Jan 2023 13:15:15 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N5VXu-1ogayF1FNq-016xH7; Mon, 16 Jan 2023 19:15:09 +0100
Message-ID: <45ba2636-bf79-560e-e22b-f9b56823658e@vivier.eu>
Date: Mon, 16 Jan 2023 19:15:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] ui/vnc.c: Allow websocket connections over AF_UNIX sockets
Content-Language: fr
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20221202151202.24851-1-pyr@spootnik.org>
Cc: Pierre-Yves Ritschard <pyr@spootnik.org>, qemu-devel@nongnu.org,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20221202151202.24851-1-pyr@spootnik.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:tb+GDvphH+WI9RqV+BQWkasznytgPe3tfFXBSVwncJJ4pmept9l
 RD/EgeqKCQi8O53oF9Kq4lTrY0sicP22PgxGqaAZ+IWT4b4w5BmDOGw9c8iT1NPdvGMlp5g
 HIiVfRcxdNBTcPsRKRKVhrtNlanZC+L22PjFqzNab+3Lg5/85KlT/dJ9LNaazZ5AbR1aOm8
 RAS8ljC0AiCb9bTyPxltw==
UI-OutboundReport: notjunk:1;M01:P0:rbmAAyHdBtM=;8NSyg154TzSqXo9RIDrmaONhwiG
 lObdswasEGddxxZNNPC446n5oSRksZJzofJ1ubIx62S3owzubzvE7PzaHr6I8sytDBV3iRspm
 V5GTj2PlH30FNMvBBxllVBB7i3PucE1OOnep5mJXUdmM41jDSrJYLxWvVk5UdpPdXgT8Sv/Oc
 mIaloWlZVn460s362j4xuKdPiNjHFkgb1wNDZ6JQ7HFyrMsU0D3v6cnMYBp+B5xGDGV2CzNTV
 qr1WFBZYY38SODWOrPs+awi7E8YaQUqmjmRf14loIsTHc1NCbnfOgPP2QWLGfZ6zhldW60baL
 c/mFhGIynztFXOyarwDl6YIh3I/MaFyRK8NfiF9hX072AbswO75SqbFll9zm7s+q/nCVIz5rA
 SBLzq371AULSmmAc/n5wnXoZhZD+IYE3HMWPtaoCfAoVldGEqtZr247X9ximwiLv/jM0Jr97H
 ORbT5lr7lgTHNIxxf50p9aaYgsRS6gINSATWWn1Qy8DW5N2flIuFkl0mychdmReINtNjygwLL
 rQHI1nG94vRPCgSoBmsMpz9nfiPjxy1E8I9jHDCCWaWRMuchPuhVjcfGRHfTSuSuoJ3IscDWy
 DUOt3gbnYVZ+CIuUeSgx9Z7cXyHjREpVhajAZAN9eauHo6r8pFnEuwVVqKCjQEDS2ieG/T5mU
 80+TmPWAdSpS98XwzwUE8yhzdoAhtlLNIn1Tc1fp+w==
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.097,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Jan 2023 18:15:17 -0000

Hi Gerd,

If this patch is correct I can queue it via trivial branch.

Thanks,
Laurent

Le 02/12/2022 à 16:12, Pierre-Yves Ritschard a écrit :
> Hi,
> 
> The provided patch allows the VNC websocket server of a qemu process to
> be provided over AF_UNIX as it is already possible for standard TCP VNC
> servers.
> 
> Now that many clients support websocket connections, some exclusively,
> it can be useful to expose the VNC server. One such case is when a
> proxy is present on a host machine, allowing it to proxy to a
> deterministic location withouth having to keep track of port mappings.
> 
> Removing the condition as is done in the provided patch creates a
> functional server. If there's a downside to this approach I could not
> figure it out while reading the code. My hunch was that the condition
> was there for a reason, but it did not jump at me.
> 
> Cheers,
>    - pyr
> 
> ---
>   ui/vnc.c | 5 -----
>   1 file changed, 5 deletions(-)
> 
> diff --git ui/vnc.c ui/vnc.c
> index 88f55cbf3c..b01a655400 100644
> --- ui/vnc.c
> +++ ui/vnc.c
> @@ -3729,11 +3729,6 @@ static int vnc_display_get_address(const char *addrstr,
>           addr->type = SOCKET_ADDRESS_TYPE_UNIX;
>           addr->u.q_unix.path = g_strdup(addrstr + 5);
>   
> -        if (websocket) {
> -            error_setg(errp, "UNIX sockets not supported with websock");
> -            goto cleanup;
> -        }
> -
>           if (to) {
>               error_setg(errp, "Port range not support with UNIX socket");
>               goto cleanup;


