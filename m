Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gRidc-0003au-Aq
	for mharc-qemu-trivial@gnu.org; Tue, 27 Nov 2018 14:03:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57784)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1gRidZ-0003Z5-Ku
	for qemu-trivial@nongnu.org; Tue, 27 Nov 2018 14:03:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1gRidY-0005Tx-Do
	for qemu-trivial@nongnu.org; Tue, 27 Nov 2018 14:03:09 -0500
Received: from mx1.redhat.com ([209.132.183.28]:43560)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1gRidI-0005OM-1m; Tue, 27 Nov 2018 14:02:52 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C7F0030B8F90;
	Tue, 27 Nov 2018 19:02:50 +0000 (UTC)
Received: from [10.10.124.147] (ovpn-124-147.rdu2.redhat.com [10.10.124.147])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 29DD55F726;
	Tue, 27 Nov 2018 19:02:29 +0000 (UTC)
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org, qemu-block@nongnu.org, 
	Paolo Bonzini <pbonzini@redhat.com>
References: <20181127184929.20065-1-jsnow@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <f2257e95-b17c-55d4-1d5f-cc09db3d6a58@redhat.com>
Date: Tue, 27 Nov 2018 13:02:29 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <20181127184929.20065-1-jsnow@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Tue, 27 Nov 2018 19:02:50 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] scsi: Address spurious
 clang warning
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
X-List-Received-Date: Tue, 27 Nov 2018 19:03:10 -0000

On 11/27/18 12:49 PM, John Snow wrote:
> Some versions of Clang prior to 6.0 (and some builds of clang after,
> such as 6.0.1-2.fc28) fail to recognize { 0 } as a valid initializer
> for a struct with subobjects when -Wmissing-braces is enabled.
> 
> https://bugs.llvm.org/show_bug.cgi?id=21689 and
> https://reviews.llvm.org/rL314499 suggests this should be fixed in 6.0,
> but it might not be the case for older versions or downstream versions.
> 
> For now, follow the precedent of ebf2a499 and replace the standard { 0 }
> with the accepted { } to silence this warning and allow the build to
> work under clang 6.0.1-2.fc28, and builds prior to 6.0.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> 

Reviewed-by: Eric Blake <eblake@redhat.com>

I'm okay if this goes into -rc3 as a build-fix; I'm also okay if it 
slips to 4.0.

> ---
> 
> What I am actually less clear on is why this appears to be a problem
> only now; since the introduction of { 0 } was in 2.11. It might be
> a regression only in the fedora distribution of Clang 6.0.

Or even a redefinition of struct dm_ioctl in some header where you are 
just now picking up a new struct layout that tickles the Clang issue in 
relation to the previous layout (since it is possible to have two 
structs that are ABI-compatible but where only one of the two has a 
nested substruct).

> +++ b/scsi/qemu-pr-helper.c
> @@ -236,7 +236,7 @@ static void dm_init(void)
>           perror("Cannot open " CONTROL_PATH);
>           exit(1);
>       }
> -    struct dm_ioctl dm = { 0 };
> +    struct dm_ioctl dm = { };

Random thought: would it be worth having "qemu/compiler.h" define a macro:

#if ...broken clang
#define ZERO_INIT {}
#else
#define ZERO_INIT {0}
#endif

and then rewrite all our '= { 0? }' initializers into '= ZERO_INIT'?  Or 
is that aesthetically too ugly?

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

