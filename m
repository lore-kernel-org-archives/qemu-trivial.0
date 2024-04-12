Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rvGip-0008LF-8c
	for mharc-qemu-trivial@gnu.org; Fri, 12 Apr 2024 09:13:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1rvFSk-0005Ks-9k; Fri, 12 Apr 2024 07:52:58 -0400
Received: from proxmox-new.maurer-it.com ([94.136.29.106])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1rvFSi-0004tJ-E2; Fri, 12 Apr 2024 07:52:58 -0400
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 2D0E944FFA;
 Fri, 12 Apr 2024 13:52:45 +0200 (CEST)
Message-ID: <81117f0e-407b-4729-bb78-cbadc196c8f1@proxmox.com>
Date: Fri, 12 Apr 2024 13:52:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Makefile: preserve --jobserver-auth argument when calling
 ninja
To: =?UTF-8?Q?Martin_Hundeb=C3=B8ll?= <martin@geanix.com>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20240402081738.1051560-1-martin@geanix.com>
Content-Language: en-US
From: Fiona Ebner <f.ebner@proxmox.com>
In-Reply-To: <20240402081738.1051560-1-martin@geanix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=94.136.29.106; envelope-from=f.ebner@proxmox.com;
 helo=proxmox-new.maurer-it.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 12 Apr 2024 09:13:37 -0400
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
X-List-Received-Date: Fri, 12 Apr 2024 11:52:58 -0000

Am 02.04.24 um 10:17 schrieb Martin Hundebøll:
> Qemu wraps its call to ninja in a Makefile. Since ninja, as opposed to
> make, utilizes all CPU cores by default, the qemu Makefile translates
> the absense of a `-jN` argument into `-j1`. This breaks jobserver
> functionality, so update the -jN mangling to take the --jobserver-auth
> argument into considerationa too.
> 
> Signed-off-by: Martin Hundebøll <martin@geanix.com>
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 8f36990335..183756018f 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -142,7 +142,7 @@ MAKE.k = $(findstring k,$(firstword $(filter-out --%,$(MAKEFLAGS))))
>  MAKE.q = $(findstring q,$(firstword $(filter-out --%,$(MAKEFLAGS))))
>  MAKE.nq = $(if $(word 2, $(MAKE.n) $(MAKE.q)),nq)
>  NINJAFLAGS = $(if $V,-v) $(if $(MAKE.n), -n) $(if $(MAKE.k), -k0) \
> -        $(filter-out -j, $(lastword -j1 $(filter -l% -j%, $(MAKEFLAGS)))) \
> +        $(or $(filter -l% -j%, $(MAKEFLAGS)), $(if $(filter --jobserver-auth=%, $(MAKEFLAGS)),, -j1)) \
>          -d keepdepfile
>  ninja-cmd-goals = $(or $(MAKECMDGOALS), all)
>  ninja-cmd-goals += $(foreach g, $(MAKECMDGOALS), $(.ninja-goals.$g))

Hi,

unfortunately, this patch breaks build when specifying just '-j' as a
make flag (i.e. without a number), because it will now end up being
passed to ninja:

> $ make -j
> changing dir to build for make ""...
> make[1]: Entering directory '/home/febner/repos/qemu/build'
> ninja: fatal: invalid -j parameter

Best Regards,
Fiona


