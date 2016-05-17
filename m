Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b2dGe-0006Mu-UP
	for mharc-qemu-trivial@gnu.org; Tue, 17 May 2016 07:34:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35743)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1b2dGc-0006Ec-1w
	for qemu-trivial@nongnu.org; Tue, 17 May 2016 07:34:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1b2dGZ-0000H5-RL
	for qemu-trivial@nongnu.org; Tue, 17 May 2016 07:34:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41587)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1b2dGU-0000Fz-Cv; Tue, 17 May 2016 07:34:18 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3DB87552D3;
	Tue, 17 May 2016 11:34:17 +0000 (UTC)
Received: from [10.36.112.44] (ovpn-112-44.ams2.redhat.com [10.36.112.44])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4HBY9Ji013061
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 17 May 2016 07:34:13 -0400
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1463484451-22979-1-git-send-email-peter.maydell@linaro.org>
Cc: qemu-trivial@nongnu.org
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <573B01B1.5050008@redhat.com>
Date: Tue, 17 May 2016 13:34:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.1
MIME-Version: 1.0
In-Reply-To: <1463484451-22979-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Tue, 17 May 2016 11:34:17 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] Remove config-devices.mak on 'make clean'
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 17 May 2016 11:34:27 -0000



On 17/05/2016 13:27, Peter Maydell wrote:
> Our dependency mechanism works like this:
>  * on first build there is neither a .o nor a .d
>  * we create the .d as a side effect of creating the .o
>  * for rebuilds we know when we need to update the .o,
>    which also updates the .d
> 
> This system requires that you're never in a situation where there is
> a .o file but no .d (because then we will never realise we need to
> build the .d, and we will not have the dependency information about
> when to rebuild the .o).
> 
> This is working fine for our object files, but we also try to use it
> for $TARGET/config-devices.mak (where the dependency file is
> in $TARGET-config-devices.mak.d). Unfortunately "make clean" doesn't
> remove config-devices.mak, which means that it puts us in the
> forbidden situation of "object file exists but not its .d file".
> This in turn means that we will fail to notice when we need to rebuild:
>   mkdir build/depbug
>   (cd build/depbug && '../../configure')
>   make -C build/depbug -j8
>   make -C build/depbug clean
>   echo "CONFIG_CANARY = y" >> default-configs/arm-softmmu.mak
>   make -C build/depbug
>   grep CANARY build/depbug/aarch64-softmmu/config-devices.mak
> 
> The CANARY token should show up in config-devices.mak but does not.
> 
> Fix this bug by making "make clean" delete the config-devices.mak files.
> config-all-devices.mak doesn't have the same problem since it has
> no .d file, but delete it too, since it is created by "make" and
> logically should be removed by "make clean".
> 
> (Note that it is important not to remove config-devices.mak until
> after we have recursively run 'make clean' in the subdirectories.)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  Makefile | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Makefile b/Makefile
> index 1d076a9..a5d7e62 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -356,6 +356,7 @@ clean:
>  	if test -d $$d; then $(MAKE) -C $$d $@ || exit 1; fi; \
>  	rm -f $$d/qemu-options.def; \
>          done
> +	rm -f $(SUBDIR_DEVICES_MAK) config-all-devices.mak
>  
>  VERSION ?= $(shell cat VERSION)
>  
> 

Queued, thanks (and nice writeup too!)

Paolo

