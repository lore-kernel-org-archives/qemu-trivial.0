Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fLLTq-0005xC-Ef
	for mharc-qemu-trivial@gnu.org; Wed, 23 May 2018 00:34:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55522)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fLLTo-0005vN-3g
	for qemu-trivial@nongnu.org; Wed, 23 May 2018 00:34:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fLLTn-00005a-7u
	for qemu-trivial@nongnu.org; Wed, 23 May 2018 00:34:28 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:34732 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1fLLTg-0008QE-VD; Wed, 23 May 2018 00:34:21 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5FC9287ABE;
	Wed, 23 May 2018 04:34:20 +0000 (UTC)
Received: from [10.36.116.80] (ovpn-116-80.ams2.redhat.com [10.36.116.80])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E8D442236;
	Wed, 23 May 2018 04:34:17 +0000 (UTC)
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: david@redhat.com, qemu-trivial@nongnu.org
References: <20180522192034.13318-1-pbonzini@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <3a90789d-ca98-9305-a2d4-2b6d166a6d2d@redhat.com>
Date: Wed, 23 May 2018 06:34:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180522192034.13318-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Wed, 23 May 2018 04:34:20 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Wed, 23 May 2018 04:34:20 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [PATCH] tcg: remove softfloat from --disable-tcg
 builds
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
X-List-Received-Date: Wed, 23 May 2018 04:34:29 -0000

On 22.05.2018 21:20, Paolo Bonzini wrote:
> Even though the presence of softfloat does not cause --disable-tcg builds to fail,
> it is the single largest .o file in them.  Remove it, since TCG is the only client.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  Makefile.target          |   2 +-
>  hw/i386/x86-iommu-stub.c | 132 +++++++++++++++++++++++++++++++++++++++
>  2 files changed, 133 insertions(+), 1 deletion(-)
>  create mode 100644 hw/i386/x86-iommu-stub.c
> 
> diff --git a/Makefile.target b/Makefile.target
> index d0ec77a307..dad2cf8778 100644
> --- a/Makefile.target
> +++ b/Makefile.target
> @@ -97,7 +97,7 @@ obj-$(CONFIG_TCG) += tcg/tcg.o tcg/tcg-op.o tcg/tcg-op-vec.o tcg/tcg-op-gvec.o
>  obj-$(CONFIG_TCG) += tcg/tcg-common.o tcg/optimize.o
>  obj-$(CONFIG_TCG_INTERPRETER) += tcg/tci.o
>  obj-$(CONFIG_TCG_INTERPRETER) += disas/tci.o
> -obj-y += fpu/softfloat.o
> +obj-$(CONFIG_TCG) += fpu/softfloat.o
>  obj-y += target/$(TARGET_BASE_ARCH)/
>  obj-y += disas.o
>  obj-$(call notempty,$(TARGET_XML_FILES)) += gdbstub-xml.o

Without that x86-iommu-stub.c file:

Reviewed-by: Thomas Huth <thuth@redhat.com>

