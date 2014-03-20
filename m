Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WQkv9-0003i0-F7
	for mharc-qemu-trivial@gnu.org; Thu, 20 Mar 2014 17:54:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39928)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1WQkv3-0003dw-AL
	for qemu-trivial@nongnu.org; Thu, 20 Mar 2014 17:54:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1WQkuw-0004kj-JO
	for qemu-trivial@nongnu.org; Thu, 20 Mar 2014 17:54:33 -0400
Received: from mail-qa0-x234.google.com ([2607:f8b0:400d:c00::234]:46010)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1WQkuw-0004kY-8y; Thu, 20 Mar 2014 17:54:26 -0400
Received: by mail-qa0-f52.google.com with SMTP id m5so1565018qaj.25
	for <multiple recipients>; Thu, 20 Mar 2014 14:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=f7jwDI+pATSEarx2m3DuAJ43EZc+KrJvXur93rb0XAs=;
	b=yuV6peznNBN2bpyACnTo/KfR5IevNyIzUP/eKHuGl2dR5gVK+fY8sLL0NvqJnjU4o3
	SQFhDuUbV/0lRFnWsYwqWpau+cDY3qzHs1W3Zgdp5kZuP6k+MPlXVViEsTZJZtDNJ+Yz
	m62fzZsYKtx0ZbmsxqXk+7FFhO7XWbIraz+N5lGounH2l0ZJeZ4XvbgdCVH5RKRiwfwg
	jo15qq75wwa0h6XW6YtKwho7oOAHFphoWfwU0aRwy7u0bB6df8hrZgER6lpAvaYEtulI
	ZpWpWyC5m96JuGoinhcRZy8uJPv/raEYat8cavp+PdJ9zpVKCr1mf7oq3pUjw1BoFYu1
	4vNg==
X-Received: by 10.224.74.201 with SMTP id v9mr5516313qaj.94.1395352465715;
	Thu, 20 Mar 2014 14:54:25 -0700 (PDT)
Received: from yakj.usersys.redhat.com
	(net-37-117-154-249.cust.vodafonedsl.it. [37.117.154.249])
	by mx.google.com with ESMTPSA id m11sm4831850qge.13.2014.03.20.14.54.23
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 20 Mar 2014 14:54:24 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <532B638D.2040608@redhat.com>
Date: Thu, 20 Mar 2014 22:54:21 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>, qemu-trivial@nongnu.org
References: <1395351032-11920-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1395351032-11920-1-git-send-email-sw@weilnetz.de>
X-Enigmail-Version: 1.6
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c00::234
Cc: Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
	kvm@vger.kernel.org
Subject: Re: [Qemu-trivial] [PATCH] target-i386: Remove unused data from
	local array
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 20 Mar 2014 21:54:38 -0000

Il 20/03/2014 22:30, Stefan Weil ha scritto:
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>
> This patch is based on a previous patch for the same file,
> see http://patchwork.ozlabs.org/patch/330708/.
>
> Regards
> Stefan W.
>
>  target-i386/kvm.c |    3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/target-i386/kvm.c b/target-i386/kvm.c
> index 4389959..d17eea3 100644
> --- a/target-i386/kvm.c
> +++ b/target-i386/kvm.c
> @@ -130,14 +130,13 @@ static const struct kvm_para_features {
>      { KVM_CAP_NOP_IO_DELAY, KVM_FEATURE_NOP_IO_DELAY },
>      { KVM_CAP_PV_MMU, KVM_FEATURE_MMU_OP },
>      { KVM_CAP_ASYNC_PF, KVM_FEATURE_ASYNC_PF },
> -    { -1, -1 }
>  };
>
>  static int get_para_features(KVMState *s)
>  {
>      int i, features = 0;
>
> -    for (i = 0; i < ARRAY_SIZE(para_features) - 1; i++) {
> +    for (i = 0; i < ARRAY_SIZE(para_features); i++) {
>          if (kvm_check_extension(s, para_features[i].cap)) {
>              features |= (1 << para_features[i].feature);
>          }
>

Applied to uq/master, thanks.

I'm leaving the other patch to Andreas or Michael Tokarev.

Paolo

