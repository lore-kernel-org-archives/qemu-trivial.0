Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dUtFr-0003jk-8u
	for mharc-qemu-trivial@gnu.org; Tue, 11 Jul 2017 07:22:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41008)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1dUtFo-0003ge-EW
	for qemu-trivial@nongnu.org; Tue, 11 Jul 2017 07:22:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1dUtFl-0002eL-9s
	for qemu-trivial@nongnu.org; Tue, 11 Jul 2017 07:22:56 -0400
Received: from mail-wr0-f172.google.com ([209.85.128.172]:36513)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1dUtFl-0002e6-3x
	for qemu-trivial@nongnu.org; Tue, 11 Jul 2017 07:22:53 -0400
Received: by mail-wr0-f172.google.com with SMTP id c11so179057939wrc.3
	for <qemu-trivial@nongnu.org>; Tue, 11 Jul 2017 04:22:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=YxqxaisepsqjkZEfz5/5LCNz0kDznDjkX/sIXiZJLks=;
	b=P1/A79N+QlX7e9m0/BI6BrV24JrOAShYLIX8yP1so4J+kvJU7Mw4kCORufdo/g5vAr
	LKAgUoieWnqmd1JHdyrrvSKXnW0NLAYij9iq0BZ2EHSjba5P935GR2E7O9BF1bw7gunc
	ZkyiJSUA+meDlEgmLjNy842I1fUNr9GsFHe+WKai9RhQS0bGUjHZUILTEBPNNd0F0PkY
	btLYYHrB+jaNagPxE8urBAcMoZq8eyWEunyCC47pEgoXbm3Tu2FJxF9XDk60Vt3VrX3m
	Cg4cOAjoQdPNIt+RpjzShl3e6tcR3ob3rWLgywGGJ9EW6ldkadxJ4RRSp4USzXVpbRbT
	bN6w==
X-Gm-Message-State: AIVw113rRPCogCmD8RakzreiU3qneNDiz3qRo0e33smEtqYSY4cQ4Nof
	0uJVnsewdpHBlY0HaKHsgQ==
X-Received: by 10.28.137.146 with SMTP id l140mr11261849wmd.101.1499772171857; 
	Tue, 11 Jul 2017 04:22:51 -0700 (PDT)
Received: from [192.168.10.165] (94-39-191-51.adsl-ull.clienti.tiscali.it.
	[94.39.191.51]) by smtp.gmail.com with ESMTPSA id
	z101sm21062311wrb.41.2017.07.11.04.22.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Jul 2017 04:22:51 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>
Cc: qemu-trivial@nongnu.org
References: <20170629150308.22766-1-f4bug@amsat.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <406b3f5e-34f1-f121-a85e-26ba57ab9923@redhat.com>
Date: Tue, 11 Jul 2017 13:22:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <20170629150308.22766-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.172
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 0/5] MAINTAINERS: update
 TCG/KVM/Xen/TCI/Unimplemented device
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
X-List-Received-Date: Tue, 11 Jul 2017 11:22:57 -0000

On 29/06/2017 17:03, Philippe Mathieu-Daudé wrote:
> As requested by Thomas Huth, I separated these patches from my previous series
> "removal of tci (tcg interpreter)".
> 
> TCG/KVM/Xen/TCI related files were moved in commits a9ded601..244f1441, update
> MAINTAINERS to match the new paths.
> 
> Also add an entry for the "Unimplemented" device and voluntary myself as
> reviewer.
> 
> Regards,
> 
> Phil.

Queued, thanks.

Paolo

> v2:
> - fix inaccurate Xen commit message (review feedback from Anthony PERARD)
> - add "Unimplemented" device
> 
> v1:
> - update TCG/KVM/Xen/TCI entries
> 
> Philippe Mathieu-Daudé (5):
>   MAINTAINERS: update TCG entries
>   MAINTAINERS: update KVM entries
>   MAINTAINERS: update Xen entries
>   MAINTAINERS: update TCI entry
>   MAINTAINERS: add entry for "Unimplemented" device
> 
>  MAINTAINERS | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
> 


