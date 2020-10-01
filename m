Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kO0WD-0006ea-VP
	for mharc-qemu-trivial@gnu.org; Thu, 01 Oct 2020 11:29:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kO0WC-0006Z7-2a
 for qemu-trivial@nongnu.org; Thu, 01 Oct 2020 11:29:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31298)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kO0WA-0001m3-6n
 for qemu-trivial@nongnu.org; Thu, 01 Oct 2020 11:29:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601566153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f5pHWvDCyABD6d0YVAKEAIJ46zXaao01/+3Oj0tCg7w=;
 b=KiHPnfCiZ2Y3IsZlw8OPgxXASzJXnw/ZyRbVQAg25U9REBoSkN3+2CK6wMyef+UNXmZHbi
 +nmoMjH8Gwdjxkqm7ZkGWbv8MxKieOfdnpZQLjDHlR4Gm0jXKUn0XD83LI13axw1vpPE1D
 fCJrAm18KP3x6TM2ODXksViJbixJw8Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-434-sNuLgNiQMQu4IYVGAAYutg-1; Thu, 01 Oct 2020 11:29:09 -0400
X-MC-Unique: sNuLgNiQMQu4IYVGAAYutg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B75BD1029D20;
 Thu,  1 Oct 2020 15:29:07 +0000 (UTC)
Received: from localhost (unknown [10.10.67.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3E7C21001901;
 Thu,  1 Oct 2020 15:29:05 +0000 (UTC)
Date: Thu, 1 Oct 2020 11:29:05 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, Richard Henderson <rth@twiddle.net>,
 Markus Armbruster <armbru@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 qemu-trivial@nongnu.org, Eric Blake <eblake@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v4 3/3] target/i386: Restrict X86CPUFeatureWord to X86
 targets
Message-ID: <20201001152905.GC3717385@habkost.net>
References: <20201001144152.1555659-1-philmd@redhat.com>
 <20201001144152.1555659-4-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201001144152.1555659-4-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/01 02:15:30
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 01 Oct 2020 15:29:16 -0000

On Thu, Oct 01, 2020 at 04:41:52PM +0200, Philippe Mathieu-Daudé wrote:
> Only qemu-system-FOO and qemu-storage-daemon provide QMP
> monitors, therefore such declarations and definitions are
> irrelevant for user-mode emulation.
> 
> Restricting the x86-specific commands to machine-target.json
> pulls less QAPI-generated code into user-mode.

Is this still true without "qapi: Restrict code generated for
user-mode"?

Markus, Eric: what's the difference between machine.json and
machine-target.json? commit 7f7b4e7abef4 ("qapi: Split
machine-target.json off target.json and misc.json") explains what
but not why.

> 
> Acked-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Why the visit_type_X86CPUFeatureWordInfoList() stub was required
in v3, but not in this version?


> ---
>  qapi/machine-target.json | 45 ++++++++++++++++++++++++++++++++++++++++
>  qapi/machine.json        | 42 -------------------------------------
>  target/i386/cpu.c        |  2 +-
>  3 files changed, 46 insertions(+), 43 deletions(-)
> 
> diff --git a/qapi/machine-target.json b/qapi/machine-target.json
> index 698850cc78..b4d769a53b 100644
> --- a/qapi/machine-target.json
> +++ b/qapi/machine-target.json
> @@ -4,6 +4,51 @@
>  # This work is licensed under the terms of the GNU GPL, version 2 or later.
>  # See the COPYING file in the top-level directory.
>  
> +##
> +# @X86CPURegister32:
> +#
> +# A X86 32-bit register
> +#
> +# Since: 1.5
> +##
> +{ 'enum': 'X86CPURegister32',
> +  'data': [ 'EAX', 'EBX', 'ECX', 'EDX', 'ESP', 'EBP', 'ESI', 'EDI' ],
> +  'if': 'defined(TARGET_I386)' }
> +
> +##
> +# @X86CPUFeatureWordInfo:
> +#
> +# Information about a X86 CPU feature word
> +#
> +# @cpuid-input-eax: Input EAX value for CPUID instruction for that feature word
> +#
> +# @cpuid-input-ecx: Input ECX value for CPUID instruction for that
> +#                   feature word
> +#
> +# @cpuid-register: Output register containing the feature bits
> +#
> +# @features: value of output register, containing the feature bits
> +#
> +# Since: 1.5
> +##
> +{ 'struct': 'X86CPUFeatureWordInfo',
> +  'data': { 'cpuid-input-eax': 'int',
> +            '*cpuid-input-ecx': 'int',
> +            'cpuid-register': 'X86CPURegister32',
> +            'features': 'int' },
> +  'if': 'defined(TARGET_I386)' }
> +
> +##
> +# @DummyForceArrays:
> +#
> +# Not used by QMP; hack to let us use X86CPUFeatureWordInfoList internally
> +#
> +# Since: 2.5
> +##
> +{ 'struct': 'DummyForceArrays',
> +  'data': { 'unused': ['X86CPUFeatureWordInfo'] },
> +  'if': 'defined(TARGET_I386)' }
> +
>  ##
>  # @CpuModelInfo:
>  #
> diff --git a/qapi/machine.json b/qapi/machine.json
> index 756dacb06f..995e972858 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -574,48 +574,6 @@
>     'dst': 'uint16',
>     'val': 'uint8' }}
>  
> -##
> -# @X86CPURegister32:
> -#
> -# A X86 32-bit register
> -#
> -# Since: 1.5
> -##
> -{ 'enum': 'X86CPURegister32',
> -  'data': [ 'EAX', 'EBX', 'ECX', 'EDX', 'ESP', 'EBP', 'ESI', 'EDI' ] }
> -
> -##
> -# @X86CPUFeatureWordInfo:
> -#
> -# Information about a X86 CPU feature word
> -#
> -# @cpuid-input-eax: Input EAX value for CPUID instruction for that feature word
> -#
> -# @cpuid-input-ecx: Input ECX value for CPUID instruction for that
> -#                   feature word
> -#
> -# @cpuid-register: Output register containing the feature bits
> -#
> -# @features: value of output register, containing the feature bits
> -#
> -# Since: 1.5
> -##
> -{ 'struct': 'X86CPUFeatureWordInfo',
> -  'data': { 'cpuid-input-eax': 'int',
> -            '*cpuid-input-ecx': 'int',
> -            'cpuid-register': 'X86CPURegister32',
> -            'features': 'int' } }
> -
> -##
> -# @DummyForceArrays:
> -#
> -# Not used by QMP; hack to let us use X86CPUFeatureWordInfoList internally
> -#
> -# Since: 2.5
> -##
> -{ 'struct': 'DummyForceArrays',
> -  'data': { 'unused': ['X86CPUFeatureWordInfo'] } }
> -
>  ##
>  # @NumaCpuOptions:
>  #
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index 9f72342506..848a65ded2 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -38,7 +38,7 @@
>  #include "qemu/option.h"
>  #include "qemu/config-file.h"
>  #include "qapi/error.h"
> -#include "qapi/qapi-visit-machine.h"
> +#include "qapi/qapi-visit-machine-target.h"
>  #include "qapi/qapi-visit-run-state.h"
>  #include "qapi/qmp/qdict.h"
>  #include "qapi/qmp/qerror.h"
> -- 
> 2.26.2
> 

-- 
Eduardo


