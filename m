Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n9mvs-00086B-IA
	for mharc-qemu-trivial@gnu.org; Tue, 18 Jan 2022 06:45:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1n9mvq-00083g-Gd; Tue, 18 Jan 2022 06:45:46 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:54841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1n9mvo-0003J3-Ih; Tue, 18 Jan 2022 06:45:46 -0500
Received: from [192.168.100.1] ([82.142.13.186]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MplLZ-1mXPNJ0hCf-00qEJ9; Tue, 18 Jan 2022 12:45:32 +0100
Message-ID: <cdc1b831-82b3-9d1f-8dab-d14d138ab0bf@vivier.eu>
Date: Tue, 18 Jan 2022 12:45:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 1/2] linx-user: Remove MAX_SIGQUEUE_SIZE
Content-Language: fr
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: f4bug@amsat.org, richard.henderson@linaro.org,
 Peter Maydell <peter.maydell@linaro.org>,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
References: <20220116204423.16133-1-imp@bsdimp.com>
 <20220116204423.16133-2-imp@bsdimp.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220116204423.16133-2-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:HoFBMq2TE9XiNcqsfhicisyt36KKBNA0HDmPNjcXSFYnGeMOq8i
 H/TlNmee+DcYIDtZJiJcKt87kQdslg+fbIpL4bai6P3DpdgR9rxq6Xljdal5Om/I6xG8ovg
 RvnvOZ5GcQNr5QkgTv/B/rk85kOkcVwAXPOyyRfaylrMmmI48QG8DLdpvlqbermna6CM4rt
 57QG/aaqnXZkYZI8G7ceA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:BFYlGZ0WjgU=:YRJ2xFHVPF8Wufplq3cdMG
 D+wq4QjbhNkiPx/PRzlMZiU5UdesWTSBxxF2en54GnVQlW2/4hKpHnZBuGXPIoDMExWCaVC+J
 iVMjcMiQi/hXXgMkVRTd93GDKkWUpLSOntN7Xu9Um/LjMvs0GMKADWPX5B6+rWzKT4YVMWc7A
 QPIgiTqR5i0yFfnEWZYaXNXdC1C8/3rlbnXJQWBShE9tj+dTVNt3Y05a/sVa7R/pZ83L7o1rE
 hIWxLuilka+cJ+nWZ5xRqhVwpYHF2SUAl32HiqWr38v78mrVyCbvazCXJoaGDVqheB5ZDXjoq
 3NsiI+g5CwbtDp+wNZW2p4czJZLPcpOO1PSbitGRgKrHajfuZGriB1B45JSTlAt5H9kPTxLFo
 V6YK3HLNfrkAvSNtLfMIish6t62jwkouT1pdHGl/roIDy8AihoQY7m2jbreNF74SrBVvLMC6Q
 WW8M0RdtV7qr5IdJ7VRWbT3CJ6tBaelJFCdm5jdFtKFgw12JYvwhV3aHu30oCMdKcDu4Gnst9
 S3iZk0GjjWfqXkTWZ3J7refeqcgzXyDRt1+GR3zcq51vOmUYPdf8igAgASoQ6nELYTUAOIE8f
 PraAM6PHCPRqb0y9eHELjwCGtEZNT12Ih5yBH67bMNoK3AABjTAjrfXcgrekVMDrsw3icP3BD
 ecs9jrZdKUYed99OGzyYG64ELTV9pxdez7FtXnVkr4H2sJNs1f3alDvSjcjSbtUXB4Wo=
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 18 Jan 2022 11:45:46 -0000

Le 16/01/2022 à 21:44, Warner Losh a écrit :
> It's been unused for 7 years since 907f5fddaa67 when linux-user stopped
> queueing any signals.
> 
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>   linux-user/qemu.h | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/linux-user/qemu.h b/linux-user/qemu.h
> index 5c713fa8ab2..7910ce59cc8 100644
> --- a/linux-user/qemu.h
> +++ b/linux-user/qemu.h
> @@ -89,8 +89,6 @@ struct vm86_saved_state {
>   #include "nwfpe/fpa11.h"
>   #endif
>   
> -#define MAX_SIGQUEUE_SIZE 1024
> -
>   struct emulated_sigtable {
>       int pending; /* true if signal is pending */
>       target_siginfo_t info;

Applied to my trivial-patches branch.
(typo fixed)

Thanks,
Laurent

