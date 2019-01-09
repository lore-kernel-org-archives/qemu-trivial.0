Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ghAo8-0002SW-3K
	for mharc-qemu-trivial@gnu.org; Wed, 09 Jan 2019 05:09:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59757)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1ghAo6-0002S0-K1
	for qemu-trivial@nongnu.org; Wed, 09 Jan 2019 05:09:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1ghAo5-0001vb-VP
	for qemu-trivial@nongnu.org; Wed, 09 Jan 2019 05:09:54 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:40009)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1ghAo4-0001se-4T; Wed, 09 Jan 2019 05:09:52 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
	1M1ZQT-1gjduU25Kl-0038Hc; Wed, 09 Jan 2019 11:09:45 +0100
To: Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, ehabkost@redhat.com, marcel.apfelbaum@gmail.com
References: <20181224154922.3338-1-wainersm@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
	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
Message-ID: <f2dae419-462b-71c3-5918-ebee55397b5f@vivier.eu>
Date: Wed, 9 Jan 2019 11:09:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20181224154922.3338-1-wainersm@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:XSPDvE61cjgZCFFseAsCe5szNB3jGjCXYOojSghhQPIb+zS+8Wt
	rj/sH9lcUaEtNshHCuNu5m1eEdgPNUo36bJF9gjD6Ov2hr8OZ7AjuM+iAmLw/bI6ddoeHu3
	WqRnk5jHQaBCp+pEfPbsOOWK/n9J1qPENi9cwBUo7PEFUlnJCticiMYh/b6hLWk6bFcBpGd
	PKfaRruIkJuC+N4HYqDQw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:835tdni5vdE=:kXRz75njN29ZgiH76XcvS7
	SS0TkGuROSo+LQLRaZcu3AxSDwKLvYw2u49IVcp7+jaKBohFpv/398n9SPLDiex94GSE/gG9j
	pyN3G7Y/+rU0KMrCjFvgCsKCJl9UWRmn9MwW1JemMeYHF37kS5aaL/Fdsh251vZ8RBaPJUYzW
	7pk6vkyRMwerkXJYHxMnNKTeVwo4QmwzRqgXm2PpanmP+K7WNncQ0QPBbI+0+b81dGzfbl0TE
	NBjhMSXETgbTdiR1HPdFPZTUxl9+H/NybI8oTDW5laM0BeJOhg2k0ars9qHpol9hUxBrWykzG
	RbQWvlhRrlRb94qwadIx6/jyPsiOfm8RAl69DwnWIIvG8LaF7W5Yz3Tr7qp8lbqSmpwXcjEaS
	/TSXXQPib5q+u9OME7t3G1A/zq4Te/C7nDpi+5F4GHWrgWPW7pQAyaGBphHXbZZL2uDeFyrp0
	F/jswTQGwbHFeRBGcLtXYE5VxcgUuEZFtD6p2uTKissA6EBn4ZOhpIssdk0Ae9tA9RRFH3gpE
	8UB9mxPA0O+Sm8QYl9876l51kEhwBKP7rP42wuwC5H/osgBofmT3cOqkv9iR4KXU8qUhacNAD
	1U6Hox4ws4kpJ3VWfRmKjherVHGBQ90By7yt2Ad9cbu0vvwd+/xanEvd0fN0rAUo6ibazzAfR
	8JKvPnMICdgm1SbxV4LuBXhN6ifNhZvsRmUmW/lCAndgpL7zhJpsh63lzmadVk1Moupzsh+OC
	TdwgwNldiiLbyLfDSMB9unbexWdys5pbKtupz+it+baMGJFPC9SPNWeu3tk=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.73
Subject: Re: [Qemu-trivial] [PATCH] hw/core: fix whitespace in a sentence
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
X-List-Received-Date: Wed, 09 Jan 2019 10:09:55 -0000

On 24/12/2018 16:49, Wainer dos Santos Moschetta wrote:
> Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> ---
>  hw/core/machine.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 4439ea663f..a0beeeb2a9 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -591,7 +591,7 @@ static void machine_class_init(ObjectClass *oc, void *data)
>      object_class_property_add_bool(oc, "dump-guest-core",
>          machine_get_dump_guest_core, machine_set_dump_guest_core, &error_abort);
>      object_class_property_set_description(oc, "dump-guest-core",
> -        "Include guest memory in  a core dump", &error_abort);
> +        "Include guest memory in a core dump", &error_abort);
>  
>      object_class_property_add_bool(oc, "mem-merge",
>          machine_get_mem_merge, machine_set_mem_merge, &error_abort);
> 


Applied to my trivial-patches branch.

Thanks,
Laurent

