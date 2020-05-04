Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jVWr8-0002oo-Lu
	for mharc-qemu-trivial@gnu.org; Mon, 04 May 2020 04:53:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jVWr7-0002me-6C
 for qemu-trivial@nongnu.org; Mon, 04 May 2020 04:53:41 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:59446
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jVWr5-0005zH-TK
 for qemu-trivial@nongnu.org; Mon, 04 May 2020 04:53:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588582418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AiV45Drb4vmdOfyZO+CBNsIVr4o8z1r0gqK1jwwJD3A=;
 b=bUUNa7n3A3vdEDkJb8OEWqti7FJjK2G4Pe7qSGSd4wvwRuA5z3BCg7RRlvkZPfx0pJHtvN
 hX8yPYUGTqbXb8ygQJvrBE65Bc+KwODfCKxCj7BCLdOvMV46UhcxNJJyN7iIg2nxWMRKQN
 Du/9vqSeZeDYYLovuI7IGoOipfSDFQ8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-Fafa-eUbOuiupibO2lN90g-1; Mon, 04 May 2020 04:53:36 -0400
X-MC-Unique: Fafa-eUbOuiupibO2lN90g-1
Received: by mail-wr1-f72.google.com with SMTP id p2so10379184wrx.12
 for <qemu-trivial@nongnu.org>; Mon, 04 May 2020 01:53:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZTIWm+4rGoQj9HloUe/4gXvUmWQl/GhrBvhEeMdtrKA=;
 b=n12A4wMfztM+B8z6zzBaGdBWBgZV1peV3Q3SYuJJNonpixUrMvdBVJe1mQUs5yzKs4
 ZL6DbmCPlTcFiIZoJ6n9GGOp7C98xLEWToUgMJhiMoaZP+IgyX7V49X5g31oc0GRBFlr
 0ppsdJTfy/OM6hR+mPBpyZduL9cFbTBIjiKtHnYHUouRMeXQu0cnCFY0IyWTRCIf26iN
 /2erra/2nVT18TnXfLVQcBa1G0INpKCoPdy13dOfYSvpLydaBx1Zt+H5NVSqIr9x+43L
 9O2hOVGXs4O6ZPdVNgHmHzPJlB0Gw90lqYJsIyBMEsTV3hSsC4sI7TESDSQs9GrQx+OP
 X4TQ==
X-Gm-Message-State: AGi0PuZS8yBpKUTjWO1C5+hwmXGPbqCbQJJbX3terFt0pV5spBJSfGMM
 jg/nx7gAsTTTwpdvwzxHYYeAs407XPERCM6FN0TJAgcBSdy4X4Gy0cCcwJKfkGrDbbyi7jwwZo/
 zrVYCk6ZU7SbCA+XS8w==
X-Received: by 2002:adf:bb4e:: with SMTP id x14mr17608045wrg.63.1588582415617; 
 Mon, 04 May 2020 01:53:35 -0700 (PDT)
X-Google-Smtp-Source: APiQypKenlG4d6hygxmXmx0dGjck2qMd6hulX2xnqmb+X6P3xT56biw35tddc683PJorYjQSZoZzHg==
X-Received: by 2002:adf:bb4e:: with SMTP id x14mr17608029wrg.63.1588582415382; 
 Mon, 04 May 2020 01:53:35 -0700 (PDT)
Received: from [192.168.1.39] (26.red-88-21-207.staticip.rima-tde.net.
 [88.21.207.26])
 by smtp.gmail.com with ESMTPSA id y70sm13102943wmc.36.2020.05.04.01.53.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 May 2020 01:53:34 -0700 (PDT)
Subject: Re: [PATCH] Makefile: Let the 'help' target list the helper targets
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20200423104345.5092-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <62f0ddc4-cd26-91e2-e588-20a4b9813e0f@redhat.com>
Date: Mon, 4 May 2020 10:53:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200423104345.5092-1-philmd@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/04 01:21:32
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Mon, 04 May 2020 08:53:41 -0000

Ping?

On 4/23/20 12:43 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> List the name of the helper targets when calling 'make help',
> along with the tool targets:
>=20
>    $ make help
>    [...]
>=20
>    Helper targets:
>      fsdev/virtfs-proxy-helper      - Build virtfs-proxy-helper
>      scsi/qemu-pr-helper            - Build qemu-pr-helper
>      qemu-bridge-helper             - Build qemu-bridge-helper
>      vhost-user-gpu                 - Build vhost-user-gpu
>      virtiofsd                      - Build virtiofsd
>=20
>    Tools targets:
>      qemu-ga                        - Build qemu-ga tool
>      qemu-keymap                    - Build qemu-keymap tool
>      elf2dmp                        - Build elf2dmp tool
>      ivshmem-client                 - Build ivshmem-client tool
>      ivshmem-server                 - Build ivshmem-server tool
>      qemu-nbd                       - Build qemu-nbd tool
>      qemu-storage-daemon            - Build qemu-storage-daemon tool
>      qemu-img                       - Build qemu-img tool
>      qemu-io                        - Build qemu-io tool
>      qemu-edid                      - Build qemu-edid tool
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>   configure | 5 +++--
>   Makefile  | 9 +++++++--
>   2 files changed, 10 insertions(+), 4 deletions(-)
>=20
> diff --git a/configure b/configure
> index 23b5e93752..caf880c38e 100755
> --- a/configure
> +++ b/configure
> @@ -6374,7 +6374,7 @@ if test "$softmmu" =3D yes ; then
>     if test "$linux" =3D yes; then
>       if test "$virtfs" !=3D no && test "$cap_ng" =3D yes && test "$attr"=
 =3D yes ; then
>         virtfs=3Dyes
> -      tools=3D"$tools fsdev/virtfs-proxy-helper\$(EXESUF)"
> +      helpers=3D"$helpers fsdev/virtfs-proxy-helper\$(EXESUF)"
>       else
>         if test "$virtfs" =3D yes; then
>           error_exit "VirtFS requires libcap-ng devel and libattr devel"
> @@ -6389,7 +6389,7 @@ if test "$softmmu" =3D yes ; then
>         fi
>         mpath=3Dno
>       fi
> -    tools=3D"$tools scsi/qemu-pr-helper\$(EXESUF)"
> +    helpers=3D"$helpers scsi/qemu-pr-helper\$(EXESUF)"
>     else
>       if test "$virtfs" =3D yes; then
>         error_exit "VirtFS is supported only on Linux"
> @@ -7630,6 +7630,7 @@ else
>     QEMU_INCLUDES=3D"-iquote \$(SRC_PATH)/tcg/\$(ARCH) $QEMU_INCLUDES"
>   fi
>  =20
> +echo "HELPERS=3D$helpers" >> $config_host_mak
>   echo "TOOLS=3D$tools" >> $config_host_mak
>   echo "ROMS=3D$roms" >> $config_host_mak
>   echo "MAKE=3D$make" >> $config_host_mak
> diff --git a/Makefile b/Makefile
> index 8a9113e666..021a0cd491 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -336,9 +336,9 @@ $(call set-vpath, $(SRC_PATH))
>   LIBS+=3D-lz $(LIBS_TOOLS)
>  =20
>   vhost-user-json-y =3D
> -HELPERS-y =3D
> +HELPERS-y =3D $(HELPERS)
>  =20
> -HELPERS-$(call land,$(CONFIG_SOFTMMU),$(CONFIG_LINUX)) =3D qemu-bridge-h=
elper$(EXESUF)
> +HELPERS-$(call land,$(CONFIG_SOFTMMU),$(CONFIG_LINUX)) +=3D qemu-bridge-=
helper$(EXESUF)
>  =20
>   ifeq ($(CONFIG_LINUX)$(CONFIG_VIRGL)$(CONFIG_GBM)$(CONFIG_TOOLS),yyyy)
>   HELPERS-y +=3D vhost-user-gpu$(EXESUF)
> @@ -1255,6 +1255,11 @@ endif
>   =09=09$(foreach t, $(TARGET_DIRS), \
>   =09=09$(call print-help-run,$(t)/all,Build for $(t));) \
>   =09=09echo '')
> +=09@$(if $(HELPERS-y), \
> +=09=09echo 'Helper targets:'; \
> +=09=09$(foreach t, $(HELPERS-y), \
> +=09=09$(call print-help-run,$(t),Build $(shell basename $(t)));) \
> +=09=09echo '')
>   =09@$(if $(TOOLS), \
>   =09=09echo 'Tools targets:'; \
>   =09=09$(foreach t, $(TOOLS), \
>=20


