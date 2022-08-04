Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oJZJ8-00009P-9n
	for mharc-qemu-trivial@gnu.org; Thu, 04 Aug 2022 07:46:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oJZJ4-00005t-Dt
 for qemu-trivial@nongnu.org; Thu, 04 Aug 2022 07:46:26 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:58799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oJZJ2-00035r-NC
 for qemu-trivial@nongnu.org; Thu, 04 Aug 2022 07:46:26 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1M2gt5-1oHepF3sHn-0048bM for <qemu-trivial@nongnu.org>; Thu, 04 Aug 2022
 13:46:23 +0200
Message-ID: <e482dc53-61f3-b3a1-2da9-3d772b92eae2@vivier.eu>
Date: Thu, 4 Aug 2022 13:46:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/2] vdpa: Fix file descriptor leak on get features error
Content-Language: fr
To: qemu-trivial@nongnu.org
References: <20220802112447.249436-1-eperezma@redhat.com>
 <20220802112447.249436-2-eperezma@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220802112447.249436-2-eperezma@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:PmuB7fNwfv28AfORleXovvCAWicLWyVZSPbSXc5CTwsuekRt4qN
 X9cdZxzN2VljhDnBPzTjzjyr1XUgnTJqUCWkpRZiz4CqXK3Zkh95tNCKA7FXhuJjWvtPE+q
 I+iUpKuY6fD6pTilWmPTsMMPsQtOu4L0A21ty3foCA9Wr/eOFGdwViZ8n5hI5NjsrAjmD0w
 kXeJPypvjHRehM7ATwcQw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:PNN8ahzpaNY=:ENclnoO/qErfR1LBtiqAnw
 IOV5XuiqyAKaKLLpQkSw1eNymAlYezQn4uPS5pnDPMExsUfh68B2e3ao+OE+0IA/4BxrM6uJJ
 NPSZ+tihTiLo1S+pP/c6On2jnrki9GZToohYtKYdfQNSpLCv5IfaYQvSh1cMeKvrNmYxhknqC
 fz6dt6ESpjVFJoduoqPPdkKIgB/lLI8GC+e6FqOCxb61uQJgIJE/DTctalekoCYJ8LMreeEPT
 IZ8RqZb3XwGpWV91Z89yyJk6Mulxt1XfC/UmKv2i/oe3L+wgPTYSWgjTGb42zGi42EFi9OvS5
 9S5jODirK2AnW3xaI+xJKlXveXggNIQpJP1THbA6iarKwWEO+Mxf76R4sm4NW1veHInZK4FQT
 /keW2y4a6S2BtG/lRpnV5ZLrDAizwm5844+v3jbeIjiqVr8n3rVLMX1nW29wgmdhAubxGCr6J
 w5GdVA8QzR5Ze0JUDRfbdDoxeEjBOa0AxKJVNOuctmIL0RC7TOrgP0ymAHTXFb2KjZ+K0FJwb
 /r7yM8iyzcV054vcU2og+gLGRo4CSKS8oGhcjrN9Kh/z2FK6aoyNp/EQEciLsmA0yAWjfYivk
 V/pqTAB7yiK2gaiiTeRsizbFXEJ/ABNIiyJz17fTLc8kMBK6jLlKtsdawjUVifnyhRy815/02
 P6ofG+vl1kjdQbnXtrLWzVb2U4SNZPDPiZPslcidIn//Qw1DzryC9oloapccbPHJHy3gC/8jZ
 zkNbxawftcpgkcDiacgSz0/i8keUIZAfsVZILQ==
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 04 Aug 2022 11:46:28 -0000

Le 02/08/2022 à 13:24, Eugenio Pérez a écrit :
> File descriptor vdpa_device_fd is not free in the case of returning
> error from vhost_vdpa_get_features. Fixing it by making all errors go to
> the same error path.
> 
> Resolves: Coverity CID 1490785
> Fixes: 8170ab3f43 ("vdpa: Extract get features part from vhost_vdpa_get_max_queue_pairs")
> 
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>   net/vhost-vdpa.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index 6abad276a6..303447a68e 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -566,7 +566,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
>       g_autofree NetClientState **ncs = NULL;
>       g_autoptr(VhostIOVATree) iova_tree = NULL;
>       NetClientState *nc;
> -    int queue_pairs, r, i, has_cvq = 0;
> +    int queue_pairs, r, i = 0, has_cvq = 0;
>   
>       assert(netdev->type == NET_CLIENT_DRIVER_VHOST_VDPA);
>       opts = &netdev->u.vhost_vdpa;
> @@ -582,7 +582,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
>   
>       r = vhost_vdpa_get_features(vdpa_device_fd, &features, errp);
>       if (unlikely(r < 0)) {
> -        return r;
> +        goto err;
>       }
>   
>       queue_pairs = vhost_vdpa_get_max_queue_pairs(vdpa_device_fd, features,

Applied to my trivial-patches branch.

Thanks,
Laurent


