Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pMum5-0004qv-7J
	for mharc-qemu-trivial@gnu.org; Tue, 31 Jan 2023 12:50:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pMum0-0004qX-2R; Tue, 31 Jan 2023 12:50:26 -0500
Received: from mout.kundenserver.de ([212.227.126.133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pMuly-000700-C2; Tue, 31 Jan 2023 12:50:23 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MZAvp-1p9OEM2l7J-00VCET; Tue, 31 Jan 2023 18:50:11 +0100
Message-ID: <a6fd96bc-2a63-7503-a848-171ac48de3d3@vivier.eu>
Date: Tue, 31 Jan 2023 18:50:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH qemu 1/1] vmxnet3: add mac address restore upon reset
Content-Language: fr
To: ~vlaomao <vlaomao@gmail.com>
Cc: jasowang@redhat.com, qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
 dmitry@daynix.com
References: <167510561992.30819.15402058368832100381-1@git.sr.ht>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <167510561992.30819.15402058368832100381-1@git.sr.ht>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:M5VJPNEFF8EkaSGLk80pWtqP7PeO1yEJigUWiALdAb3BDcUrsH8
 GeYo0AkrUwKIKs4hxPQ8c2TFqEhW2MGFzCUvz94a0ZXYHYfqOJoi09uSM8/o6WUwsRzGHxo
 kqEyP22MGulYp7vc70Qu4qBeBHfzVDJE15AGphdNjdbDfrnzK1K8AQEziOIlia9zY/MvOdv
 jkBljVWRMVgFmB78yVPFg==
UI-OutboundReport: notjunk:1;M01:P0:ZHgBXKhOkOE=;FD9oFICHA1pNNjwDIe2L+E4LGMw
 yzLNDoOLbncrkZUVwQt1XI4iHqbXmMwqnTGFFKuVbONsOsHEQmDeKO09Sm1n8rQj9bk7Ksjw9
 RLiorNtbyLuEWhLpfxwNgOtnUs3I/VrxaT+E3jeBJzand9P1F7vfNjuAsmiRgT7vchnzaJLm9
 h2mUUu6i8ZnBEL8/9ddxsfWcKdIWVPvsT5GTSv4nnzhd9YY0aKG8i0fRhnEnAW7W+N4UR/GQm
 f7PWasGr965OZatKXzRL64U3HIpjMYLdL7uZhmuqIHCxQL5MVKAXarf9fKYxwqzY+NoR2WYfN
 F7+IlKWTyCbIvzoedQH/pOy3ALwcMrcHtqT/1qEfAZtKgnfkQm42ydyfCzeT1rd45aAQO31mH
 UMRrk4X9UHdGdrxnHGJbLhJ/u3UNKfHAtMtK6Zs2yWzHP2EBIv84+4ew1MMrX2a6K4bhfckXO
 wf27+B2d51kovZ73FZyaMxubjKH95twE+NThNnW5YqZpqDh4kj6YbUiCXZX3R7dyYQZpCrThC
 3VIjgvcH9Bb9BapTtqgyxI2fMPRmmaSqvvGT6yCLQpVPZnQog2lwGcS5ZN1tJ307lyC+JE+Kx
 qybb+TTih63Kjl28ekwXpHT4RWcWPWdyxYEgApuR9et1Vd+cBo4xIMXEM4evl6eiCEnp0Q4jg
 9xN6yJIaMlDVN6bDK3/Zvy/iwGRv8bGyUslvmc+GvQ==
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.09,
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
X-List-Received-Date: Tue, 31 Jan 2023 17:50:27 -0000

Le 30/01/2023 à 18:28, ~vlaomao a écrit :
> From: VlaoMao <vlaomao@gmail.com>
> 
> Changing the address with a subsequent reboot makes this address permanent until the vm is turned off
> ---
> Signed-off-by: Vlao Mao <vlaomao@gmail.com>

As the Signed-off-by is part of the commit message it must be set before the signature signs ("---").

And the "From:" field must have the same value as the "Signed-off-by:" field (a space is missing in 
your "From:" field -> Vlao Mao).

Thanks,
Laurent

> 
>   hw/net/vmxnet3.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/hw/net/vmxnet3.c b/hw/net/vmxnet3.c
> index 04159c822..695ca2f92 100644
> --- a/hw/net/vmxnet3.c
> +++ b/hw/net/vmxnet3.c
> @@ -1206,6 +1206,8 @@ static void vmxnet3_reset(VMXNET3State *s)
>       s->drv_shmem = 0;
>       s->tx_sop = true;
>       s->skip_current_tx_pkt = false;
> +
> +    vmxnet3_reset_mac(s);
>   }
>   
>   static void vmxnet3_update_rx_mode(VMXNET3State *s)


