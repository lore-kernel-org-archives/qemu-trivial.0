Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l5Oi1-0000Xx-Ki
	for mharc-qemu-trivial@gnu.org; Fri, 29 Jan 2021 03:00:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1l5Ohw-0000XI-Rm
 for qemu-trivial@nongnu.org; Fri, 29 Jan 2021 03:00:45 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:49949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1l5Ohc-0004zZ-Mp
 for qemu-trivial@nongnu.org; Fri, 29 Jan 2021 03:00:42 -0500
Received: from [192.168.100.1] ([82.252.149.54]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1Mk0FS-1lpV281FMW-00kOYl; Fri, 29 Jan 2021 09:00:16 +0100
Subject: Re: [PATCH] Fix typo in comment.
To: lagarcia@linux.ibm.com, qemu-trivial@nongnu.org
Cc: Leonardo Garcia <lagarcia@br.ibm.com>
References: <2833bf05e3c85267c5fefaab7326b58521da3896.1611685564.git.lagarcia@br.ibm.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <da3ee880-33f5-d43f-6784-bb3d81b6c591@vivier.eu>
Date: Fri, 29 Jan 2021 09:00:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <2833bf05e3c85267c5fefaab7326b58521da3896.1611685564.git.lagarcia@br.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Jqs1QIdm9hPWxkNi5nMAEo2y1d26fRvagHOV00DzxmnDiImJgef
 SLGfVK644vipsZNbPtB+UA/ROdC2y3FeMikegey3ShFyiRcxAEM1PdJYlxqdXHxRqi+d6lI
 ZMGUaRPgfA0xPMBf9sPqspnl4u/12aHKttlwq21NuuGKcPcGZ2MaSA5rXkTWUg1TAUTIeR9
 3k+MRtlHOiF+TW1wu0JrA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:QHkkTjHCios=:LdPmTqXHa29Tht/0czoVkP
 UAmrrtZ5bppgRSgdrCJUtVWXJ9XLhurhE0Hz3M0fyL0rBw+wCEp3+tAAX7QQFEGWR+fItkpOs
 Iz5zBORrK1v/OqAZuvL0C8Gw2A3FxFrR949qIBdE3O/ibIl50BhV6qbrGUuWluFthQe1JcAeu
 +ycDBGYC3IeuMcp5W5u4CbBTAs0kDJjrrvQ14Wt+U9cc6XV3YdsxkBjT1qh5WtYyFUPHiMGtt
 cmwFU3K8IwUDjdqGHDEwXSau2Py89ypY0iOGaFjvc90zRwDgif6DaT7Q/sIq5z1qbayaAjbTO
 T231rEPQ5Jq1s2fn0awl+4YMLEELFPmPkhF2WzuZTZtBjrSb5E56fnWdRBQ3wSEaaeFrBY8UR
 t/uTeIavwZbA3hezU7OkvmuocaIvCn8GCefQCpLerNic2ABSme2Hov0vlWzk5rjQ82ny2Hc6z
 Crvjb+Ui8w==
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 29 Jan 2021 08:00:45 -0000

Le 26/01/2021 à 19:26, lagarcia@linux.ibm.com a écrit :
> From: Leonardo Garcia <lagarcia@br.ibm.com>
> 
> Signed-off-by: Leonardo Garcia <lagarcia@br.ibm.com>
> ---
>  hw/virtio/vhost.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> index 28c7d78172..d6d290e79f 100644
> --- a/hw/virtio/vhost.c
> +++ b/hw/virtio/vhost.c
> @@ -285,7 +285,7 @@ static int vhost_dev_has_iommu(struct vhost_dev *dev)
>       * For vhost, VIRTIO_F_IOMMU_PLATFORM means the backend support
>       * incremental memory mapping API via IOTLB API. For platform that
>       * does not have IOMMU, there's no need to enable this feature
> -     * which may cause unnecessary IOTLB miss/update trnasactions.
> +     * which may cause unnecessary IOTLB miss/update transactions.
>       */
>      return vdev->dma_as != &address_space_memory &&
>             virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

Please, re-send your patch to qemu-devel@nongnu.org, this is the reference list.

Thanks,
Laurent

