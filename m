Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qnHXC-00037i-QJ
	for mharc-qemu-trivial@gnu.org; Mon, 02 Oct 2023 07:56:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1qnHX4-0002zs-Ma; Mon, 02 Oct 2023 07:56:16 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1qnHX2-0002Y6-U7; Mon, 02 Oct 2023 07:56:14 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 780F926BC9;
 Mon,  2 Oct 2023 14:56:50 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id A0DD72C279;
 Mon,  2 Oct 2023 14:56:07 +0300 (MSK)
Message-ID: <9e380190-4147-fc73-3205-112cb854f25a@tls.msk.ru>
Date: Mon, 2 Oct 2023 14:56:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] Fix compilation when UFFDIO_REGISTER is not set.
Content-Language: en-US
To: Pierre Labatut <plabatut@google.com>, qemu-trivial@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
References: <20230928125700.1504442-1-plabatut@google.com>
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <20230928125700.1504442-1-plabatut@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -91
X-Spam_score: -9.2
X-Spam_bar: ---------
X-Spam_report: (-9.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.321,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 02 Oct 2023 11:56:18 -0000

28.09.2023 15:56, Pierre Labatut wrote:
> Signed-off-by: Pierre Labatut <plabatut@google.com>
> ---
>   subprojects/libvhost-user/libvhost-user.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

I'm not sure how subprojects are handled here.  Should we commit things
to a subproject directly? This one does not seem to be wrapped at least,
and has been in contrib/ before moving to subprojects/, so seems to be
ok.

> diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
> index 0469a50101..d4a2eab883 100644
> --- a/subprojects/libvhost-user/libvhost-user.c
> +++ b/subprojects/libvhost-user/libvhost-user.c
> @@ -629,9 +629,9 @@ static bool
>   generate_faults(VuDev *dev) {
>       unsigned int i;
>       for (i = 0; i < dev->nregions; i++) {
> +#ifdef UFFDIO_REGISTER
>           VuDevRegion *dev_region = &dev->regions[i];
>           int ret;
> -#ifdef UFFDIO_REGISTER
>           struct uffdio_register reg_struct;
>   
>           /*

Applied to my trivial-patches tree, thank you!

/mjt

