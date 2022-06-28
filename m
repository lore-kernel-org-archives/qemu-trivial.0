Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o67yg-0003Ol-55
	for mharc-qemu-trivial@gnu.org; Tue, 28 Jun 2022 05:57:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1o67ye-0003Na-B3
 for qemu-trivial@nongnu.org; Tue, 28 Jun 2022 05:57:48 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:58593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1o67yX-0004B0-R5
 for qemu-trivial@nongnu.org; Tue, 28 Jun 2022 05:57:48 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N33V5-1nekKd0eQ1-013RLH; Tue, 28 Jun 2022 11:57:30 +0200
Message-ID: <dbf0b7bb-5ce0-92d0-4e0c-e2d509944838@vivier.eu>
Date: Tue, 28 Jun 2022 11:57:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/4] hw/ide/atapi.c: Correct typos (CD-CDROM -> CD-ROM)
Content-Language: fr
To: Lev Kujawski <lkujaw@member.fsf.org>, qemu-trivial@nongnu.org
References: <20220528210250.175832-1-lkujaw@member.fsf.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220528210250.175832-1-lkujaw@member.fsf.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:X/vRKCMlUg+AtOyii6LANBTM1FPSxARZ6ysR+eOCdmKRBmCLPHH
 /yM3Wd1wZTiFiZLMRgsbu56flkK/P2Qjbq56csr9MoKmaao85pjK2gqDZiPzH5SvN9p72Nu
 Lqey6ryMlDcFEdoKni8Ihn79+xzBu59E3NMBQf9ceUe7akv0yQOF7YWjdhwsK1aMAtoW8zT
 TcjUJly7zn4LkuF+dvK3Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:vU27858RMxc=:yaeZQ4PzCJRh3KVacIEfj3
 2vA6trGBZg0y/W3CK3whFUDo9I9Srz/ZX9a+LTRqsOaGGAclyjsdo+07gT/Oo/gwhLH/D1QSF
 87m4Vv5SUxJOZ1/YHF/UeFtpPrX8n2gYkdMybfa0pBpLePPgSZnBnzV4MAtGMAtXjH8Ppylc3
 clYm3Q4wQPMli13DP1Ndm/fyzk4VmIf2Kt/MtrzNG5wzg/trCMK+NguTVz10hxQYwHGIkBVl9
 Wy+DVKaVLzsY5tL9g5YNUTQyCqeJLvwN6Y1VWo3+d9AwMwpUvHAE+Qztm3hXQvs6N/GY8gFvl
 Q4f9CyuzIkSOPkr+b3gXwEYroZgTVPP6cfRnl6dP2AnWX5SKdl2bS6+DCUgkqW8YyXN0Y7DnA
 PuyT/FMcIVFvNyygPMZ3AteZvsx/Azh5SFsahlsVAbD1inCkwsZUfqXkVsiIJRx3P3fh271Lu
 3TMyEwvBcbnjZVB0PpnDuvdfOp1VvBZOCUi5Y3UbEGu3qJ3iglJws96kZacC4XQnGpLKom8O3
 jfsN2az7aeD5lb8tsS6LbFZOX92Upr2aALo+flDY5QAPLAlcXTF79V9JD8h51VHOOIJq/7d7r
 TrGhvrJY1JK93kXXOmO047ACCvFQasXAMgeeYf/AfnKcLu5+0MlVQE8UInyRKL/aF+Mhu9s/i
 oG50FvOP0nbErm/TXSwy/PMVg7QmLPb97EOhnjWD6FPDF/qKr6ng8U2evQbCu2sWT8E52hc44
 kYxZv+GtyQJcKB6PZyduJ2DZsL+MNIMlx3+17Q==
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 28 Jun 2022 09:57:48 -0000

Le 28/05/2022 à 23:02, Lev Kujawski a écrit :
> Signed-off-by: Lev Kujawski <lkujaw@member.fsf.org>
> ---
>   hw/ide/atapi.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/ide/atapi.c b/hw/ide/atapi.c
> index b626199e3d..88b2890faf 100644
> --- a/hw/ide/atapi.c
> +++ b/hw/ide/atapi.c
> @@ -318,7 +318,7 @@ static void ide_atapi_cmd_reply(IDEState *s, int size, int max_size)
>       }
>   }
>   
> -/* start a CD-CDROM read command */
> +/* start a CD-ROM read command */
>   static void ide_atapi_cmd_read_pio(IDEState *s, int lba, int nb_sectors,
>                                      int sector_size)
>   {
> @@ -417,7 +417,7 @@ eot:
>       ide_set_inactive(s, false);
>   }
>   
> -/* start a CD-CDROM read command with DMA */
> +/* start a CD-ROM read command with DMA */
>   /* XXX: test if DMA is available */
>   static void ide_atapi_cmd_read_dma(IDEState *s, int lba, int nb_sectors,
>                                      int sector_size)

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


