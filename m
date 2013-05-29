Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UhgG6-0001ov-Cp
	for mharc-qemu-trivial@gnu.org; Wed, 29 May 2013 09:17:42 -0400
Received: from eggs.gnu.org ([208.118.235.92]:54749)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1UhgFu-0001Zt-Hw
	for qemu-trivial@nongnu.org; Wed, 29 May 2013 09:17:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1UhgFr-00036F-P3
	for qemu-trivial@nongnu.org; Wed, 29 May 2013 09:17:30 -0400
Received: from mail-ob0-x229.google.com ([2607:f8b0:4003:c01::229]:37279)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1UhgFr-00035l-Gm
	for qemu-trivial@nongnu.org; Wed, 29 May 2013 09:17:27 -0400
Received: by mail-ob0-f169.google.com with SMTP id up14so4011787obb.0
	for <qemu-trivial@nongnu.org>; Wed, 29 May 2013 06:17:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:in-reply-to:references:user-agent:date
	:message-id:mime-version:content-type:x-gm-message-state;
	bh=EXE+pJyCZY0Im4ZY1VnsH8tH81zfbyPkOdJepKUAZZM=;
	b=U7kOxn5yg7GHgY1Nt0fzcQcqqE7CMa5ozinbUFDabNc5HYsdwksh46HTTCzv1rPelr
	CaWojG/xi0FmxLsh27BOefl2OLInOWUfDnZpDSLgd3j6hm9Hf56Sjo3YQ1LOTZha0Q+B
	wa3h+9vDIJqE8K32rQHBMu+nynspU4daqeCvSMor4uuwObiZI42dZANtAVoEw5LJjJ+h
	pFtjWruDpT7XEfyCbEnir6WreIkpVxZYnsr8n11Ma8KFF2ZdsQ0rJ7jhlZzdkmJpvvOm
	kqAYSQhx/jlTbu5pQHYTGTkOA87lu/8CwkRvAOt9Sg4SQGPJbDMLT0Zwf7i3jrsfFuAG
	pdJw==
X-Received: by 10.182.111.199 with SMTP id ik7mr1571674obb.44.1369833446872;
	Wed, 29 May 2013 06:17:26 -0700 (PDT)
Received: from titi.smtp.gmail.com (cpe-70-112-157-87.austin.res.rr.com.
	[70.112.157.87])
	by mx.google.com with ESMTPSA id h4sm40774969oel.2.2013.05.29.06.17.25
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 29 May 2013 06:17:26 -0700 (PDT)
From: Anthony Liguori <anthony@codemonkey.ws>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
In-Reply-To: <1369698583-32533-1-git-send-email-aik@ozlabs.ru>
References: <1369698254-32350-1-git-send-email-aik@ozlabs.ru>
	<1369698583-32533-1-git-send-email-aik@ozlabs.ru>
User-Agent: Notmuch/0.15.2+77~g661dcf8 (http://notmuchmail.org) Emacs/23.3.1
	(x86_64-pc-linux-gnu)
Date: Wed, 29 May 2013 08:17:21 -0500
Message-ID: <87fvx653j2.fsf@codemonkey.ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
X-Gm-Message-State: ALoCoQk6gM8XzKthUP4vO56C21wnkn2lVAEXt8LrxDioJK3qGd6/FEdNzm1qA6PiDtNCGWbvwEe7
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4003:c01::229
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3] qemu: fix out of tree
	cross compile
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
X-List-Received-Date: Wed, 29 May 2013 13:17:39 -0000

Alexey Kardashevskiy <aik@ozlabs.ru> writes:

> The symlink to "asm" platform linux headers is made in the build tree by
> the configure script but gcc is not told to look for them there.
>
> The patch fixes this.
>
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---
>
> The previous patch did not remove the old line adding includes. Early morning,
> lack of focus :)

Please repost as a top level patch.

Regards,

Anthony Liguori



>
> ---
>  configure |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/configure b/configure
> index 5ae7e4a..eca2a20 100755
> --- a/configure
> +++ b/configure
> @@ -547,7 +547,7 @@ Haiku)
>    if [ "$cpu" = "i386" -o "$cpu" = "x86_64" ] ; then
>      audio_possible_drivers="$audio_possible_drivers fmod"
>    fi
> -  QEMU_INCLUDES="-I\$(SRC_PATH)/linux-headers $QEMU_INCLUDES"
> +  QEMU_INCLUDES="-I\$(SRC_PATH)/linux-headers -I$(pwd)/linux-headers $QEMU_INCLUDES"
>  ;;
>  esac
>  
> -- 
> 1.7.10.4

