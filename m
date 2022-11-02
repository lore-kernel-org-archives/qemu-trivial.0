Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oqKLu-0003SX-U1
	for mharc-qemu-trivial@gnu.org; Wed, 02 Nov 2022 16:28:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>)
 id 1oqKLt-0003SI-1z; Wed, 02 Nov 2022 16:28:45 -0400
Received: from mail.weilnetz.de ([37.120.169.71]
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>)
 id 1oqKLr-0001pl-E8; Wed, 02 Nov 2022 16:28:44 -0400
Received: from [192.168.178.185] (p57907e6e.dip0.t-ipconnect.de
 [87.144.126.110])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id CBF3BDA0277;
 Wed,  2 Nov 2022 21:28:37 +0100 (CET)
Message-ID: <01dd0ae1-b9f2-169a-e8e0-f622ce9b9c0a@weilnetz.de>
Date: Wed, 2 Nov 2022 21:28:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH] Run docker probe only if docker or podman are available
To: qemu-devel@nongnu.org, QEMU Trivial <qemu-trivial@nongnu.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20221030083510.310584-1-sw@weilnetz.de>
From: Stefan Weil <sw@weilnetz.de>
In-Reply-To: <20221030083510.310584-1-sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 02 Nov 2022 20:28:45 -0000

Am 30.10.22 um 09:35 schrieb Stefan Weil:

> The docker probe uses "sudo -n" which can cause an e-mail with a security warning
> each time when configure is run. Therefore run docker probe only if either docker
> or podman are available.
>
> That avoids the problematic "sudo -n" on build environments which have neither
> docker nor podman installed.
>
> Fixes: c4575b59155e2e00 ("configure: store container engine in config-host.mak")
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>   configure | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/configure b/configure
> index 81561be7c1..3af99282b7 100755
> --- a/configure
> +++ b/configure
> @@ -1779,7 +1779,7 @@ fi
>   # functions to probe cross compilers
>   
>   container="no"
> -if test $use_containers = "yes"; then
> +if test $use_containers = "yes" && (has "docker" || has "podman"); then
>       case $($python "$source_path"/tests/docker/docker.py probe) in
>           *docker) container=docker ;;
>           podman) container=podman ;;


Can this patch be applied by qemu-trivial? For me those security e-mails 
are a bug and should be at least avoided as far as possible in the new 
QEMU release.

Thanks, Stefan


