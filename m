Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1f47Bo-0007aJ-MA
	for mharc-qemu-trivial@gnu.org; Thu, 05 Apr 2018 11:52:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37443)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1f47Bm-0007Yn-Kz
	for qemu-trivial@nongnu.org; Thu, 05 Apr 2018 11:52:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1f47Bj-0003tD-KO
	for qemu-trivial@nongnu.org; Thu, 05 Apr 2018 11:52:38 -0400
Received: from mail-wr0-x244.google.com ([2a00:1450:400c:c0c::244]:34524)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
	id 1f47Bj-0003sq-9x; Thu, 05 Apr 2018 11:52:35 -0400
Received: by mail-wr0-x244.google.com with SMTP id d17so13847289wre.1;
	Thu, 05 Apr 2018 08:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=KAV4vyMyEWA29EZcL/JqEhJdZQZ5KKM5m7bSykPwMxk=;
	b=CRt4gT9hQRwPjNEc3tkN6WETJz/qQbm41iKR/k1Y65vFGFcxJSW+xVcKXrqgIk0W0+
	uVBQSX16GT8GIilHLoUCCNrl2v52VlLnrEHosZyzi39j+h89/P2PuNZIuMWMsYW/0N5C
	Wyupn9lAPw5vmkc0nJwSborChMZSi0MYemobcRj1gy4TUobT7VlEdqsPqi+zkgd6WqJ6
	tlpRTcW+hLu3/ie7HuwrVRn9tEbUWsUIRpaVSVTcDcidwyff8H3UHz9JB+2sS0JTNsc5
	xX6hjcvGO3Y36XNA04fVf7W40gFkSu5x5y/kvWEa1ahrqMeRClsMdujzdJAP58dKdFbR
	4ifQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=KAV4vyMyEWA29EZcL/JqEhJdZQZ5KKM5m7bSykPwMxk=;
	b=ePcUGAbHKoVWG0fBAjqwyP55gY8WnQqWLLbrEoQewmdlHSLyEbzRO1nfI+c8Ao0UzD
	VfKl8Yyo732WEdwkSww3uE39wVFIWtpZYoz7pz1BAvH8kuWPwqWp/PSLAEoXgnRP8+Fb
	x6ZN+thPWHEOKEoudew42Cc2f16xL5x/nkNz5TrY1/7AVDpf+rBpJfu/CJcYploXnjGI
	1TBYfSeBEiNjFmxpJ4M/zql5pNslczWKV3J9WQltZvHAAxN69hCBzWiZHK47Lc5mQhfH
	q+CQKtVNCwpFhgA/d7oYtXH1qavMyS60bycOKE/VtEOF/4hAbwVCh8o5/SrpBDSK5kff
	O1ig==
X-Gm-Message-State: AElRT7F5Q1bIJGpLqKyn8Tec0DjPV/apGyMoUJGxEDacY0f/qwONgkPR
	Fb/aITisX3d/RDHdnJJz16E=
X-Google-Smtp-Source: AIpwx48Ik3R9CkQzJpGZjhdTi1JOs7EiP4iwk9UTGZyifGnaLxr20CSdVZbM54DleMr+5wejSo6AVQ==
X-Received: by 10.223.209.132 with SMTP id h4mr17362027wri.12.1522943554098;
	Thu, 05 Apr 2018 08:52:34 -0700 (PDT)
Received: from [192.168.10.150] (94-36-194-48.adsl-ull.clienti.tiscali.it.
	[94.36.194.48]) by smtp.googlemail.com with ESMTPSA id
	n49sm7971706wrn.50.2018.04.05.08.52.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Apr 2018 08:52:33 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <1522163370-18544-1-git-send-email-thuth@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=pbonzini@redhat.com; keydata=
	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
Message-ID: <2b988a68-3e2b-f762-7e81-53c0bff2522c@redhat.com>
Date: Thu, 5 Apr 2018 17:52:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1522163370-18544-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::244
Subject: Re: [Qemu-trivial] [PATCH] configure: Add missing configure options
 to help text
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
X-List-Received-Date: Thu, 05 Apr 2018 15:52:39 -0000

On 27/03/2018 17:09, Thomas Huth wrote:
> We forgot to mention --with-git, --libexecdir and --with-pkgversion
> so far.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  configure | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/configure b/configure
> index 4d0e92c..a473609 100755
> --- a/configure
> +++ b/configure
> @@ -1497,16 +1497,19 @@ Advanced options (experts only):
>    --install=INSTALL        use specified install [$install]
>    --python=PYTHON          use specified python [$python]
>    --smbd=SMBD              use specified smbd [$smbd]
> +  --with-git=GIT           use specified git [$git]
>    --static                 enable static build [$static]
>    --mandir=PATH            install man pages in PATH
>    --datadir=PATH           install firmware in PATH$confsuffix
>    --docdir=PATH            install documentation in PATH$confsuffix
>    --bindir=PATH            install binaries in PATH
>    --libdir=PATH            install libraries in PATH
> +  --libexecdir=PATH        install helper binaries in PATH
>    --sysconfdir=PATH        install config in PATH$confsuffix
>    --localstatedir=PATH     install local state in PATH (set at runtime on win32)
>    --firmwarepath=PATH      search PATH for firmware files
>    --with-confsuffix=SUFFIX suffix for QEMU data inside datadir/libdir/sysconfdir [$confsuffix]
> +  --with-pkgversion=VERS   use specified string as sub-version of the package
>    --enable-debug           enable common debug build options
>    --enable-sanitizers      enable default sanitizers
>    --disable-strip          disable stripping binaries
> 

Queued, thanks.

Paolo


