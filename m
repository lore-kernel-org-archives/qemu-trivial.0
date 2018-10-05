Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1g8S6o-0007Ft-EQ
	for mharc-qemu-trivial@gnu.org; Fri, 05 Oct 2018 11:33:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37167)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1g8RB1-0001uY-88
	for qemu-trivial@nongnu.org; Fri, 05 Oct 2018 10:33:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1g8RAw-0000Q9-1H
	for qemu-trivial@nongnu.org; Fri, 05 Oct 2018 10:33:59 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:39340)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1g8RAv-0000PD-PD
	for qemu-trivial@nongnu.org; Fri, 05 Oct 2018 10:33:53 -0400
Received: by mail-wr1-f68.google.com with SMTP id 61-v6so13049074wrb.6
	for <qemu-trivial@nongnu.org>; Fri, 05 Oct 2018 07:33:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=NfFuqYRGjfk17x9d8uS3s/Xar1aWxMat/oIUagAHw8g=;
	b=PqaoyDY6XJ5ETW9LfR6zMnPuQtmEmVgeFNQQwWsd4qabgDrl1hq45mdpPKFjOrTdF7
	oBkqf/D1pjawCBA8faIIKgfZh+f6yD/sCEOb3m1wl0pgM3AhZLFnKZtFdb6VsQSoIO/m
	jSiFlsZZ4xZOumbx9nY1YlTQweO3qWWvCjrOzT34IlRx+7Q67+yq+q2y+/uEFHczKR1i
	UYdTc1JDVhgrf2ZMtby7/jZHiusvI/A+BHi3FAAFwwStDma9sUtm1isfayY6eAOLXa2/
	eLxIzgCASAJBq5W34CLgORtccN8A2UxLwTSb5MXvhILDoX+ZJY1MpcE/HETnmV0hwNFs
	Z2ZQ==
X-Gm-Message-State: ABuFfohmlNxbtNvGaUw/E6c2egZcGasS17rAwYFL4DIw8kVCkl5zxF/k
	ji5OWp+zAKq1fSJK9toNGP4ntg==
X-Google-Smtp-Source: ACcGV63058rFvd2hkTR5oxmT0fuYPTxzc/hIW/ASKnMPj63KlkDCmd66Tp6pBGi4rBa6I1n5VoHLnw==
X-Received: by 2002:a5d:5002:: with SMTP id
	e2-v6mr8871731wrt.210.1538750032748; 
	Fri, 05 Oct 2018 07:33:52 -0700 (PDT)
Received: from [192.168.2.33] (26.red-83-32-208.dynamicip.rima-tde.net.
	[83.32.208.26]) by smtp.gmail.com with ESMTPSA id
	y4-v6sm9384719wrd.25.2018.10.05.07.33.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 05 Oct 2018 07:33:52 -0700 (PDT)
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, kraxel@redhat.com
References: <20181004140522.945682-1-eblake@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e454e2ea-6ee6-4605-50ad-16112ef6f5cc@redhat.com>
Date: Fri, 5 Oct 2018 16:33:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20181004140522.945682-1-eblake@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.68
X-Mailman-Approved-At: Fri, 05 Oct 2018 11:33:39 -0400
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] edid: Ignore built binary
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
X-List-Received-Date: Fri, 05 Oct 2018 14:34:00 -0000

On 04/10/2018 16:05, Eric Blake wrote:
> Added in commit 72d277a7.
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  .gitignore | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/.gitignore b/.gitignore
> index 5668d027824..64efdfd9292 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -107,6 +107,7 @@
>  /qemu-doc.html
>  /qemu-doc.info
>  /qemu-doc.txt
> +/qemu-edid
>  /qemu-img
>  /qemu-nbd
>  /qemu-options.def
> 

