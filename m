Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i7N7b-0003Q1-PI
	for mharc-qemu-trivial@gnu.org; Mon, 09 Sep 2019 13:06:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44558)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1i7N7Y-0003Ow-9A
 for qemu-trivial@nongnu.org; Mon, 09 Sep 2019 13:06:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1i7N7W-0004BY-PN
 for qemu-trivial@nongnu.org; Mon, 09 Sep 2019 13:06:32 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40638)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1i7N7W-0004B1-Fy
 for qemu-trivial@nongnu.org; Mon, 09 Sep 2019 13:06:30 -0400
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 73AAC2A09DA
 for <qemu-trivial@nongnu.org>; Mon,  9 Sep 2019 17:06:29 +0000 (UTC)
Received: by mail-wr1-f70.google.com with SMTP id n6so7608301wrm.20
 for <qemu-trivial@nongnu.org>; Mon, 09 Sep 2019 10:06:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XSSdM9KT2oajzK5ijUyK3GTBXTtvAVX9VykuiUNjnD8=;
 b=GTVNmf4fbtEdAPvkToN7epMmDgFaqT0wKPg7xGIaePQIxDS0RtjlzwDTetzNDY9d5x
 mejmCPmbRvq1Il8h09rvTDWiVwvSXx/yv3M4q/Vv4ljBucXiGcREhZp2U94nIW1R8icL
 gBnFx48ZCltq9cncTYOsPZgncblRxSmG2EJ/NBXpVn7+c216BJKNO7WuopJVSw1W3hBO
 /q0m9jCn4BfnzXliPr4l4MKgQVJjgR51IGjF3N+HRg+tu0Z0z8hRpFrb2t1NEQhm4mEc
 tH1YAlmNNkvFSx94s1T4GGE9SxEWoCetSYJIdXyLkgO5O2NmeUXaMYz9JLLTS/DZC+Eb
 IADw==
X-Gm-Message-State: APjAAAUnw5EHvk9KLx69Q/xs7lg7QNGCmOcmxEBp83mcBCChiP2OZ+RW
 xi59E+uhgjSh+vREt6Es9eSbT7UNWzaOn26Nuoef4wjzr3DiDdZphL4jBQI/469wpu0/8SrjOHF
 X54HzJD2eEieN2Y1Kmw==
X-Received: by 2002:adf:c504:: with SMTP id q4mr17275639wrf.266.1568048787831; 
 Mon, 09 Sep 2019 10:06:27 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyd5naG1BHNZZo+P+bI/6rWNV4zPHl0AHllq9DqQoty/hBStMOL8MXnHMdKXnBHXY6oF5yDng==
X-Received: by 2002:adf:c504:: with SMTP id q4mr17275613wrf.266.1568048787550; 
 Mon, 09 Sep 2019 10:06:27 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:4580:a289:2f55:eec1?
 ([2001:b07:6468:f312:4580:a289:2f55:eec1])
 by smtp.gmail.com with ESMTPSA id i9sm19149065wrb.18.2019.09.09.10.06.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Sep 2019 10:06:27 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20190904052739.22123-1-thuth@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <5e8d67e5-842f-7cea-28a5-f07050615c38@redhat.com>
Date: Mon, 9 Sep 2019 19:06:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190904052739.22123-1-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] Replace '-machine accel=xyz' with
 '-accel xyz'
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
X-List-Received-Date: Mon, 09 Sep 2019 17:06:34 -0000

On 04/09/19 07:27, Thomas Huth wrote:
> We've got a separate option to configure the accelerator nowadays, which
> is shorter to type and the preferred way of specifying an accelerator.
> Use it in the source and examples to show that it is the favored option.
> (However, do not touch the places yet which also specify other machine
> options or multiple accelerators - these are currently still better
> handled with one single "-machine" statement instead)
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  python/qemu/qtest.py                | 2 +-
>  qemu-deprecated.texi                | 3 +--
>  qemu-options.hx                     | 2 +-
>  tests/libqtest.c                    | 2 +-
>  tests/migration/guestperf/engine.py | 2 +-
>  tests/qemu-iotests/172              | 2 +-
>  6 files changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/python/qemu/qtest.py b/python/qemu/qtest.py
> index eebcc233ed..3f1d2cb325 100644
> --- a/python/qemu/qtest.py
> +++ b/python/qemu/qtest.py
> @@ -96,7 +96,7 @@ class QEMUQtestMachine(QEMUMachine):
>      def _base_args(self):
>          args = super(QEMUQtestMachine, self)._base_args()
>          args.extend(['-qtest', 'unix:path=' + self._qtest_path,
> -                     '-machine', 'accel=qtest'])
> +                     '-accel', 'qtest'])
>          return args
>  
>      def _pre_launch(self):
> diff --git a/qemu-deprecated.texi b/qemu-deprecated.texi
> index 00a4b6f350..0982e41698 100644
> --- a/qemu-deprecated.texi
> +++ b/qemu-deprecated.texi
> @@ -26,8 +26,7 @@ The @option{enforce-config-section} parameter is replaced by the
>  
>  @subsection -no-kvm (since 1.3.0)
>  
> -The ``-no-kvm'' argument is now a synonym for setting
> -``-machine accel=tcg''.
> +The ``-no-kvm'' argument is now a synonym for setting ``-accel tcg''.
>  
>  @subsection -usbdevice (since 2.10.0)
>  
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 09e6439646..e0bba2abd1 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -4156,7 +4156,7 @@ STEXI
>  Enable FIPS 140-2 compliance mode.
>  ETEXI
>  
> -HXCOMM Deprecated by -machine accel=tcg property
> +HXCOMM Deprecated by -accel tcg
>  DEF("no-kvm", 0, QEMU_OPTION_no_kvm, "", QEMU_ARCH_I386)
>  
>  DEF("msg", HAS_ARG, QEMU_OPTION_msg,
> diff --git a/tests/libqtest.c b/tests/libqtest.c
> index 2713b86cf7..67e39c59e7 100644
> --- a/tests/libqtest.c
> +++ b/tests/libqtest.c
> @@ -238,7 +238,7 @@ QTestState *qtest_init_without_qmp_handshake(const char *extra_args)
>                                "-qtest-log %s "
>                                "-chardev socket,path=%s,id=char0 "
>                                "-mon chardev=char0,mode=control "
> -                              "-machine accel=qtest "
> +                              "-accel qtest "
>                                "-display none "
>                                "%s", qemu_binary, socket_path,
>                                getenv("QTEST_LOG") ? "/dev/fd/2" : "/dev/null",
> diff --git a/tests/migration/guestperf/engine.py b/tests/migration/guestperf/engine.py
> index f13dbea800..1dd04ce33b 100644
> --- a/tests/migration/guestperf/engine.py
> +++ b/tests/migration/guestperf/engine.py
> @@ -287,7 +287,7 @@ class Engine(object):
>              cmdline = "'" + cmdline + "'"
>  
>          argv = [
> -            "-machine", "accel=kvm",
> +            "-accel", "kvm",
>              "-cpu", "host",
>              "-kernel", self._kernel,
>              "-initrd", self._initrd,
> diff --git a/tests/qemu-iotests/172 b/tests/qemu-iotests/172
> index ba7dad9057..d67997e5f6 100755
> --- a/tests/qemu-iotests/172
> +++ b/tests/qemu-iotests/172
> @@ -55,7 +55,7 @@ do_run_qemu()
>              done
>          fi
>          echo quit
> -    ) | $QEMU -machine accel=qtest -nographic -monitor stdio -serial none "$@"
> +    ) | $QEMU -accel qtest -nographic -monitor stdio -serial none "$@"
>      echo
>  }
>  
> 

Acked-by: Paolo Bonzini <pbonzini@redhat.com>

Thanks.  While "-accel kvm:tcg" is not going to be supported, the above
replacement are all good.

Paolo

