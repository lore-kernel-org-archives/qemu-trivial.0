Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o681L-0005eb-Uj
	for mharc-qemu-trivial@gnu.org; Tue, 28 Jun 2022 06:00:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1o681K-0005co-2E; Tue, 28 Jun 2022 06:00:34 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:34675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1o681I-0004Zj-EC; Tue, 28 Jun 2022 06:00:33 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1M9Ezx-1o2Xe13qp5-006N0q; Tue, 28 Jun 2022 12:00:19 +0200
Message-ID: <7b0382a6-ce91-7611-7b31-e9b5872e3c4d@vivier.eu>
Date: Tue, 28 Jun 2022 12:00:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/4] hw/ide/core: Clear LBA and drive bits for EXECUTE
 DEVICE DIAGNOSTIC
Content-Language: fr
To: Lev Kujawski <lkujaw@member.fsf.org>, qemu-trivial@nongnu.org
References: <20220528210250.175832-1-lkujaw@member.fsf.org>
 <20220528210250.175832-2-lkujaw@member.fsf.org>
Cc: John Snow <jsnow@redhat.com>, qemu-block@nongnu.org
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220528210250.175832-2-lkujaw@member.fsf.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:CtZwn66s2uQmFLtGLPUwVTNmRP4qwCh30DXeG4tm3DY6BHniJqu
 uTGBhkcDFrWhlIYDK5Z6WnnZApYhVnqfCBB0v7qDtAtfHN1v4xDXSRbaPm3psSNFJVTpA/Q
 9eSNWWqeDnzm2/Biap1+eWNNuew81L0eTVCLKnWdfLcGEuHYrNIfcw43phUBkppG3xn+Bex
 FhNXeAV2bwMrP0IH9wNyA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:qqj9aYK4gLQ=:qXqRd5M1tD+W4RNSs4kwyN
 9yHlQf9tJ1XgMawuwPaoOA9jo4XbPxQ+23L2zQvJBrd9nKimLd1RuwcRLMlx0rctl4X1ZO4mH
 H7MyJgBJVBuLe376TDi+gq+5OGx48HKtrJEYv2Du8Q6S+0XRb+qrmfEkgm2O1Gm0eTiQEoxoL
 5lgMuEm6kZoeT9NBNVaSeIA2+2gBo7bwMk9RE3SueGLzwWe8WeoPtPNpc2nSQUtKFvOWda6/d
 6B+8PtSNzxUtSlwsgzq4acJVth5FjLt3Tq20XiDWZN7jRjEkOPjzCyon3kGcgolGH86t7ZEtW
 q5pNYQDFJGbzjYq9q2/SHsbhe+zUfB03YSRiSmTjPdopBt8M75RFYeZQZgNwqfKXHCF3WR73c
 5jJAjzC7/AYyNPVXzHBc9XTt8oL3n7EvvCTcLxzFBuGtRhkGz8FVvN3EFnudT4IYO94mXJEqJ
 idD3kOuWBuSyZuFz/IrDiuD3yPbX53f1pBnuIK86VMC9MEYZqq+nx0wey+cZpxMLxBF1ZaJXU
 Sz1RXMt9fESe5P4khzvD3vl4bAMMo5O5s3n4TlmFG91GEKMcsGtytXl27bP4rOnS00lD4nD+Q
 tcbq0ee1Im+iURV1vN6rEvnPUrzzJ99e1U1HY88EiAqAQ6tHB1ZOrRaVkQ2Ykf4eJKF2z7VKY
 qZ3+Fssyzgj450Jd5Sl35A6yjlNVE0VbRFKxWQ8EtPYQsyBMd9vYZoY94FLFrB+gsdM6A018u
 HKswR/cM50v9PP+rgZiO9XeaSDvY7SBFy0D+kA==
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
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
X-List-Received-Date: Tue, 28 Jun 2022 10:00:34 -0000

CC:

John Snow <jsnow@redhat.com> (supporter:IDE)
qemu-block@nongnu.org (open list:IDE)

Le 28/05/2022 à 23:02, Lev Kujawski a écrit :
> Prior to this patch, cmd_exec_dev_diagnostic relied upon
> ide_set_signature to clear the device register.  While the
> preservation of the drive bit by ide_set_signature is necessary for
> the DEVICE RESET, IDENTIFY DEVICE, and READ SECTOR commands,
> ATA/ATAPI-6 specifies that "DEV shall be cleared to zero" for EXECUTE
> DEVICE DIAGNOSTIC.
> 
> This deviation was uncovered by the ATACT Device Testing Program
> written by Hale Landis.
> 
> Signed-off-by: Lev Kujawski <lkujaw@member.fsf.org>
> ---
>   hw/ide/core.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/hw/ide/core.c b/hw/ide/core.c
> index c2caa54285..5a24547e49 100644
> --- a/hw/ide/core.c
> +++ b/hw/ide/core.c
> @@ -1704,8 +1704,14 @@ static bool cmd_identify_packet(IDEState *s, uint8_t cmd)
>       return false;
>   }
>   
> +/* EXECUTE DEVICE DIAGNOSTIC */
>   static bool cmd_exec_dev_diagnostic(IDEState *s, uint8_t cmd)
>   {
> +    /*
> +     * Clear the device register per the ATA (v6) specification,
> +     * because ide_set_signature does not clear LBA or drive bits.
> +     */
> +    s->select = (ATA_DEV_ALWAYS_ON);
>       ide_set_signature(s);
>   
>       if (s->drive_kind == IDE_CD) {


