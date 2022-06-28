Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o684g-0000rY-TW
	for mharc-qemu-trivial@gnu.org; Tue, 28 Jun 2022 06:04:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1o684f-0000pV-Hn
 for qemu-trivial@nongnu.org; Tue, 28 Jun 2022 06:04:01 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:47143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1o684e-00059k-2F
 for qemu-trivial@nongnu.org; Tue, 28 Jun 2022 06:04:01 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MmD6U-1nO1ta2xeK-00iCU3; Tue, 28 Jun 2022 12:03:54 +0200
Message-ID: <0bcc1576-0a4f-2726-2503-74e19dddaeec@vivier.eu>
Date: Tue, 28 Jun 2022 12:03:53 +0200
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
X-Provags-ID: V03:K1:WaZxcIXTVxfSCxjHeoJkyOHO8pIbyS9jaIrvTmsgwGJW/A7Z9hW
 AbeDfDV0XZ/eRLFuboFS+DwttOz1gDc6thiYl/FiklDkk16c5afMD0vsL78cHnFK4kCRXag
 jsNeipBo01yKMrqkF48qZi2fJnXLwjuuJ4Uuv+WLv4DshqBPxKrniEcZ+SGwNR44usRm3js
 9nk6lmNejQacTIb4wkfCQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:+wjmHdWiUGQ=:4btTY5RqQ+m6d9yi6RB46V
 X0eXI424goPuPpteHJjm1c6Mz9etNoI79j6/fHEPO5MWKDfiOSaFEzibl8r4hEmRubaBc7p5I
 KlDjoPLdQvmPxxaHUGAy6rwRKo19l6MrhtJwVU7ErNOe2zV1ixjnggUNZLhIyHvvPInQrT7Ex
 r3HXPIFjBU83q+TKd0ofN590mHn6SYrWvGgw3aEtg0lPlyzNtBmuwFp8jv1nl95l4hGtrVNgS
 kQbwRn6DK+IYTXOQJpvpxdoh4M4OjbTCJXUl3AgVnCYl6Re8dBg/T6uNOyFb3bTRV7iZ/PVm4
 iEiyBZ2zqGr/ugSlOVrKDq3ZkGPm81z9RLiRcFmvfwVBCs1GhOFKeFsuSJf2rD/dC64mehZqT
 AUzayBfnq8LMQrI4HONuKYs4n4YvSQni55l4BEWdjgrl2M4yRR6Z78gBF5MCvaorFPPq+k3Wi
 fTrspSIT6cWa6jGe115peof9LxuMrNJHCIn1ncc4M2kChPO04nmU71tewITBjKH///z89MdJn
 X2+lCAmlPISC+thIMHtCrsMp0a06+T5ccRqYLf4yDy0CT6z/eSAANWOW/nwIwlKbD513vIijU
 2JU3fe7QJwWG/4LuzGxFpkEhuCPvS+kGBHkBB09LX3P0T5QgOF5lGtmICF6BZtVNjhaXVPkWv
 m7L1wzuZM/BhbnRsxLJtQOF/UVNX1hrw1RX5TWREVSoKqetothPsmy0itPEV7A6SwCkByYyKl
 ZpGBHDwFRQfbwrYFqJ1V/Y/Q6xdJ1BbvHNU87Q==
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
X-List-Received-Date: Tue, 28 Jun 2022 10:04:01 -0000

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

Applied to my trivial-patches branch.

Thanks,
Laurent


