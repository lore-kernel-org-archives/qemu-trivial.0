Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1boQ5D-0003uf-T7
	for mharc-qemu-trivial@gnu.org; Mon, 26 Sep 2016 03:12:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58188)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1boQ5B-0003qi-Lb
	for qemu-trivial@nongnu.org; Mon, 26 Sep 2016 03:12:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1boQ55-0000rE-MX
	for qemu-trivial@nongnu.org; Mon, 26 Sep 2016 03:12:07 -0400
Received: from mail-wm0-f68.google.com ([74.125.82.68]:33396)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1boQ55-0000qc-FQ; Mon, 26 Sep 2016 03:12:03 -0400
Received: by mail-wm0-f68.google.com with SMTP id w84so12577533wmg.0;
	Mon, 26 Sep 2016 00:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=4/E9v0BfeyXn+rctA2r18CKfPzGYqqnkcNjV2N3YgL4=;
	b=Z67dEwenegGLUDc5cZAK/CgFwFyJqxn7yu/CkKl5vI18FskZCUDyvh2EKjIY5zvUNd
	kA3EgZ+l8cT/SKFvER4lfd3L2CTLucslCNYfwjDNEL6ZUsjI3yt9DJzE+Bgse8wM9Nkb
	W3cLTEsyCh/E6Ens9KlXWGGKeyOeA4qJIvCoe97w1eZ4g3LJoxD0xaEJHYS9JKmXPbFm
	MAnqv7sycvhUDM7rfF/xiC7i2VrVA6zVOuQhHeW1qV1nnDHBXTKpaw4htoovmZwFMF1/
	akyxtFBto3NiGZb0GVVqFQ/hhf7mSmDR0KC81/qP0j3vrlkIqc34WhUvZ+qnV7hQ74v5
	titQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=4/E9v0BfeyXn+rctA2r18CKfPzGYqqnkcNjV2N3YgL4=;
	b=SZilysTTwtBpOqaLzQWgX0Naiesg9A15GfzNfPmPh0oqr4ACoEuuICGsxVH23cHeD8
	lqNmrFs/Tr/cVU+tNxX2gKM3Hquv9M9vO8+kM3bHnbY0F4Zmaz67oXSelxvQGtx/rePl
	DytVExuH6hHTkhOVA/X2h2zkSNU81Pdcgqrnqj0JN9ecnrUKCbW4QIznUQVF9d5ealvO
	FYfeYqWhejn4SPIt4hijyiBpP/tUiHG+khrxcP55ScWvLa41d7LFLS6v+voF1briw4XB
	Y98/HkvYzl6j0KYHk6ayJvW1Hn7OLcwN959+v3oTup7aGksuMsoH2Zxa1z47B/EtaWC9
	l4fQ==
X-Gm-Message-State: AA6/9RnxqhDjh5VZ7AKqfbQqEzljUn66wCFwpuIQYdY4YmV8cgrVX8JsYignnamEvWmBcw==
X-Received: by 10.194.242.36 with SMTP id wn4mr7661439wjc.85.1474873862794;
	Mon, 26 Sep 2016 00:11:02 -0700 (PDT)
Received: from [192.168.10.165] (94-39-176-182.adsl-ull.clienti.tiscali.it.
	[94.39.176.182]) by smtp.googlemail.com with ESMTPSA id
	u185sm9551527wmu.20.2016.09.26.00.11.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Sep 2016 00:11:02 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org
References: <20160925205748.6280-1-marcandre.lureau@redhat.com>
	<20160925205748.6280-2-marcandre.lureau@redhat.com>
Cc: qemu-trivial@nongnu.org
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <978346da-fdbe-945c-5cfc-1cc7cd9c6d8e@redhat.com>
Date: Mon, 26 Sep 2016 09:11:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <20160925205748.6280-2-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 74.125.82.68
Subject: Re: [Qemu-trivial] [PATCH 2/2] build-sys: put glib_cflags in
 QEMU_CFLAGS
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
X-List-Received-Date: Mon, 26 Sep 2016 07:12:10 -0000



On 25/09/2016 22:57, Marc-André Lureau wrote:
> This way, overriding CFLAGS on make command line keeps glib-cflags
> and doesn't break the build.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  configure | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/configure b/configure
> index c831600..5412d4f 100755
> --- a/configure
> +++ b/configure
> @@ -2933,7 +2933,7 @@ for i in $glib_modules; do
>      if $pkg_config --atleast-version=$glib_req_ver $i; then
>          glib_cflags=$($pkg_config --cflags $i)
>          glib_libs=$($pkg_config --libs $i)
> -        CFLAGS="$glib_cflags $CFLAGS"
> +        QEMU_CFLAGS="$glib_cflags $QEMU_CFLAGS"
>          LIBS="$glib_libs $LIBS"
>          libs_qga="$glib_libs $libs_qga"
>      else
> 

Queued both, thanks.

Paolo

