Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YyN9z-0007IX-9c
	for mharc-qemu-trivial@gnu.org; Fri, 29 May 2015 12:29:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50802)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1YyN9w-0007Fi-F6
	for qemu-trivial@nongnu.org; Fri, 29 May 2015 12:29:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1YyN9v-00087J-Hy
	for qemu-trivial@nongnu.org; Fri, 29 May 2015 12:29:24 -0400
Received: from mail-wi0-x234.google.com ([2a00:1450:400c:c05::234]:34629)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1YyN9r-00086e-CJ; Fri, 29 May 2015 12:29:19 -0400
Received: by wicmc15 with SMTP id mc15so20709647wic.1;
	Fri, 29 May 2015 09:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=trLl/cOUy3hm0tRSJVlfg4OJfvk6gZChfDKKkuF2nPw=;
	b=XKLkewxGO4YH3o8kEkUQMHiFSnUwSmUg5XfTqX5Gxrku5gX1nykKSA8s+IY8AFevOg
	3k2aQH8ZA2IsWpAiDFjvhQneblOszTB1+MpEgsoRYacJ/DV2XP0bbWHhUT3+NObsp59n
	pK5mzYXrXj0c/oIOZxpXsBtXT1HwbMoGRHNjZXbVsK9bWmP0SrpriEQMR8qJtI5q/lEr
	FMadnaviE/9Irc38kvfO5VTQaBcw24autsPmJuUhzsGJyNXhlTs2fnOacCEkCP4Ta8y9
	/kYIWlvz3wpEJMR3yD6K3XlWY8EksTxTiloPZgnFp8IXeBgLzN8lbKmNlHue1Itgjp0A
	65BA==
X-Received: by 10.194.79.225 with SMTP id m1mr17032415wjx.8.1432916958687;
	Fri, 29 May 2015 09:29:18 -0700 (PDT)
Received: from [192.168.10.165] (dynamic-adsl-94-39-199-114.clienti.tiscali.it.
	[94.39.199.114])
	by mx.google.com with ESMTPSA id ex5sm3847221wib.2.2015.05.29.09.29.16
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 29 May 2015 09:29:16 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <556893DB.9030502@redhat.com>
Date: Fri, 29 May 2015 18:29:15 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
References: <1432897012-1423-1-git-send-email-alex.bennee@linaro.org>	<55684995.3070205@redhat.com>
	<877frrii83.fsf@linaro.org>
In-Reply-To: <877frrii83.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::234
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] configure: don't apply -O2 if
	extra-cflags sets -O
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
X-List-Received-Date: Fri, 29 May 2015 16:29:25 -0000



On 29/05/2015 16:14, Alex Bennée wrote:
> You mean just do:
> 
> diff --git a/configure b/configure
> index b707429..f13831a 100755
> --- a/configure
> +++ b/configure
> @@ -353,7 +353,7 @@ for opt do
>    ;;
>    --cpu=*) cpu="$optarg"
>    ;;
> -  --extra-cflags=*) QEMU_CFLAGS="$optarg $QEMU_CFLAGS"
> +  --extra-cflags=*) QEMU_CFLAGS="$QEMU_CFLAGS $optarg"
>                      EXTRA_CFLAGS="$optarg"
>    ;;
>    --extra-ldflags=*) LDFLAGS="$optarg $LDFLAGS"
> 
> I guess at the time I was trying to be clean and avoiding multiple -O
> calls. But I guess that will have the same effect.

Yes, that.  Most other QEMU_CFLAGS assignments add at the beginning, so
I guess the remaining ones (including the --extra-cflags one) should too.

Paolo

