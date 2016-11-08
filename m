Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c46wq-0002WM-Fu
	for mharc-qemu-trivial@gnu.org; Tue, 08 Nov 2016 09:00:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50695)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1c46wo-0002U3-08
	for qemu-trivial@nongnu.org; Tue, 08 Nov 2016 09:00:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1c46wj-0006tG-1e
	for qemu-trivial@nongnu.org; Tue, 08 Nov 2016 09:00:22 -0500
Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244]:35119)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
	id 1c46wi-0006sy-RM; Tue, 08 Nov 2016 09:00:16 -0500
Received: by mail-wm0-x244.google.com with SMTP id a20so12041448wme.2;
	Tue, 08 Nov 2016 06:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=TfBoLjhRhf7M6khAxZFt2Rh4eZQKeN0MVHc6ayOHsNs=;
	b=nJIUv5RtQWD8rnzXZ0JJTKB4+2Fl/JBT3b2HMlkA7DLUA0Fb+f1P06rwFhsVzLuL0q
	VM3v2IDn3dJGHQ/tAHaIae2oF92ORUM9Rj8fiuY/1mZIQyXfxf1XeEUr0T5L5QLEXb5s
	z7YqTW6aJ3bG0x+K7Y0/kqNeEvAISspynIbEaeWIuUCxvLjrb+bg7OQh5J2bfZFkfYKu
	iSn14ZrS2F6pWon06Sea252OrSFgTrDGrRsrMTnEcoE5VmVjh/eWS5D2eGOGPSP/R/Bi
	L7YVWEhAdIwjwckzc+v4Hpq4FQ2uEyl+VQqXxTK3EIR90ak3j4wnHKdniFxBtJoZfZaZ
	y6nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=TfBoLjhRhf7M6khAxZFt2Rh4eZQKeN0MVHc6ayOHsNs=;
	b=W0HoOhjMH3nex4wqzzfDAYo+X4C/A+IIX059J3wXONN0tx+HYfyzKyZVVfsolzlnXg
	JLhooMOuulKfSe3uPUd1KV2jbBooBDKRsJaYYA7qsq44s7WAKj8XdD/e/tJvxtIpxeB+
	Afdu1vASq0rJC0nn38+ontkbWLJ3Bql4PTbxO/30xeKWyprv8Vv/aHJ9uE/YOwmKC5Aa
	sBMTKWXUL7jwE/F/oV51LZk17n5ZE1UWi13BZQs2Ng0fKfctQbDTzgdHdrjWgP5KNY8i
	cquTKnxx6APCBbcbiLa6S7TNOMeGDIIqkicSYAqiW85SXwLnVuHBnpia5evm9rVsqCcX
	s84g==
X-Gm-Message-State: ABUngvdG6tgcu+1/dfbXs7yAEy9+NLo53Ebc339A9CyPXw+lGv+E1zyj9aGV+gxHQZ79PA==
X-Received: by 10.28.1.135 with SMTP id 129mr16641941wmb.108.1478613615487;
	Tue, 08 Nov 2016 06:00:15 -0800 (PST)
Received: from [192.168.10.150] (dynamic-adsl-78-12-246-178.clienti.tiscali.it.
	[78.12.246.178]) by smtp.googlemail.com with ESMTPSA id
	ba10sm30149546wjb.32.2016.11.08.06.00.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Nov 2016 06:00:14 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org
References: <20161108070513.30274-1-marcandre.lureau@redhat.com>
Cc: qemu-trivial@nongnu.org, mjt@tls.msk.ru
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <9935dd70-5617-b50c-ceff-89c6a5de4180@redhat.com>
Date: Tue, 8 Nov 2016 15:00:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20161108070513.30274-1-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::244
Subject: Re: [Qemu-trivial] [PATCHv2] build-sys: remove libtool left-over
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
X-List-Received-Date: Tue, 08 Nov 2016 14:00:23 -0000



On 08/11/2016 08:05, Marc-André Lureau wrote:
> Libtool support was removed in commit e999ee44349, there is a few
> left-over.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
> 
> v2:
>  - remove .pc and .libs from gitignore
>  - some libtool removal in make clean rule
> 
>  Makefile      | 9 +++------
>  Makefile.objs | 1 -
>  .gitignore    | 4 ----
>  configure     | 2 --
>  4 files changed, 3 insertions(+), 13 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index a84582c..56f3a94 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -236,12 +236,10 @@ ALL_SUBDIRS=$(TARGET_DIRS) $(patsubst %,pc-bios/%, $(ROMS))
>  
>  recurse-all: $(SUBDIR_RULES) $(ROMSUBDIR_RULES)
>  
> -$(BUILD_DIR)/version.o: $(SRC_PATH)/version.rc config-host.h | $(BUILD_DIR)/version.lo
> +$(BUILD_DIR)/version.o: $(SRC_PATH)/version.rc config-host.h
>  	$(call quiet-command,$(WINDRES) -I$(BUILD_DIR) -o $@ $<,"RC","version.o")
> -$(BUILD_DIR)/version.lo: $(SRC_PATH)/version.rc config-host.h
> -	$(call quiet-command,$(WINDRES) -I$(BUILD_DIR) -o $@ $<,"RC","version.lo")
>  
> -Makefile: $(version-obj-y) $(version-lobj-y)
> +Makefile: $(version-obj-y)
>  
>  ######################################################################
>  # Build libraries
> @@ -363,10 +361,9 @@ clean:
>  	rm -f config.mak op-i386.h opc-i386.h gen-op-i386.h op-arm.h opc-arm.h gen-op-arm.h
>  	rm -f qemu-options.def
>  	rm -f *.msi
> -	find . \( -name '*.l[oa]' -o -name '*.so' -o -name '*.dll' -o -name '*.mo' -o -name '*.[oda]' \) -type f -exec rm {} +
> +	find . \( -name '*.so' -o -name '*.dll' -o -name '*.mo' -o -name '*.[oda]' \) -type f -exec rm {} +
>  	rm -f $(filter-out %.tlb,$(TOOLS)) $(HELPERS-y) qemu-ga TAGS cscope.* *.pod *~ */*~
>  	rm -f fsdev/*.pod
> -	rm -rf .libs */.libs
>  	rm -f qemu-img-cmds.h
>  	rm -f ui/shader/*-vert.h ui/shader/*-frag.h
>  	@# May not be present in GENERATED_HEADERS
> diff --git a/Makefile.objs b/Makefile.objs
> index 06f74b8..0d7acd4 100644
> --- a/Makefile.objs
> +++ b/Makefile.objs
> @@ -97,7 +97,6 @@ common-obj-y += disas/
>  ######################################################################
>  # Resource file for Windows executables
>  version-obj-$(CONFIG_WIN32) += $(BUILD_DIR)/version.o
> -version-lobj-$(CONFIG_WIN32) += $(BUILD_DIR)/version.lo
>  
>  ######################################################################
>  # tracing
> diff --git a/.gitignore b/.gitignore
> index 3d7848c..e43c304 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -82,10 +82,6 @@
>  *.d
>  !/scripts/qemu-guest-agent/fsfreeze-hook.d
>  *.o
> -*.lo
> -*.la
> -*.pc
> -.libs
>  .sdk
>  *.gcda
>  *.gcno
> diff --git a/configure b/configure
> index fd6f898..3194a98 100755
> --- a/configure
> +++ b/configure
> @@ -28,8 +28,6 @@ TMPB="qemu-conf"
>  TMPC="${TMPDIR1}/${TMPB}.c"
>  TMPO="${TMPDIR1}/${TMPB}.o"
>  TMPCXX="${TMPDIR1}/${TMPB}.cxx"
> -TMPL="${TMPDIR1}/${TMPB}.lo"
> -TMPA="${TMPDIR1}/lib${TMPB}.la"
>  TMPE="${TMPDIR1}/${TMPB}.exe"
>  TMPMO="${TMPDIR1}/${TMPB}.mo"
>  
> 

Looks good, but 2.9 only.

Paolo

