Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hT6rV-000516-19
	for mharc-qemu-trivial@gnu.org; Tue, 21 May 2019 11:39:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59686)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hT6rS-0004zd-Pf
	for qemu-trivial@nongnu.org; Tue, 21 May 2019 11:39:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hT6rR-0001mf-Vg
	for qemu-trivial@nongnu.org; Tue, 21 May 2019 11:39:30 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:52850)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hT6rR-0001lZ-QD
	for qemu-trivial@nongnu.org; Tue, 21 May 2019 11:39:29 -0400
Received: by mail-wm1-f65.google.com with SMTP id y3so3478520wmm.2
	for <qemu-trivial@nongnu.org>; Tue, 21 May 2019 08:39:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=qU1eEJVdW2BV/uEUHxMc2REJsuTq6/6KZx0N9xfMUq4=;
	b=d/uyY1dTSe/oV//3ZbaKgEMJmrCL1J0MDbKhCUnlOjwmwjjieAAM8FrV2Kj0p19JWr
	s0viMewFSu2I5CHq++DieOLwfWqU1Ezpm8fdVCBU9yb57VBGhYjpSWTK4P0AYLD32f4Z
	Pw9vNY8E1+fmu+0gTIgl+6D2Svzl4vOrSTYVqxjo2K84Rqufw08QrtR6ytNP1zVLgFh/
	kkNgaFiCEsZAri7h2vAp9qj+bI7ap5FVFM3Nl6qLD1jSGtp363CcgvOWCCPbmOsa5FwP
	1wJbbxDDSbDfDGdZSrpgBhfXP1ti38sIEZUQ9HrKg21Q7V/SaCoc5AaTVK3V/4rs5fu9
	ao7A==
X-Gm-Message-State: APjAAAV7bKNmCE6oK0WABykMxoLwiVn99gqpcmPud6GtKyqQ/XsRWgHp
	NtuNnPtl22yrN5Sl5+QSNnRw4w==
X-Google-Smtp-Source: APXvYqzo9CZ2zH4wywcSxQYj2A6QbZKXmJqGHfIDHWUGxRyYzT3s1oIxhhnWY4B2ZzDlpy/G7zwasQ==
X-Received: by 2002:a1c:2dc2:: with SMTP id t185mr4109598wmt.52.1558453168694; 
	Tue, 21 May 2019 08:39:28 -0700 (PDT)
Received: from [192.168.1.38] (228.red-83-52-173.dynamicip.rima-tde.net.
	[83.52.173.228]) by smtp.gmail.com with ESMTPSA id
	h14sm20503457wrt.11.2019.05.21.08.39.27
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 May 2019 08:39:28 -0700 (PDT)
To: Li Qiang <liq3ea@163.com>, alex.williamson@redhat.com, lvivier@redhat.com
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, liq3ea@gmail.com
References: <20190521151543.92274-1-liq3ea@163.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <5e361877-a360-78b4-da08-a40be675df63@redhat.com>
Date: Tue, 21 May 2019 17:39:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190521151543.92274-1-liq3ea@163.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.65
Subject: Re: [Qemu-trivial] [PATCH v2 0/4] hw: vfio: some trivial fix
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
X-List-Received-Date: Tue, 21 May 2019 15:39:31 -0000

On 5/21/19 5:15 PM, Li Qiang wrote:
> These patchset fix some trivial issues,
> The first patch makes the code more QOMConventions.
> The second decouples VMStateDescription's name with
> QOM TypeInfo's name.
> The third fixes a typo.
> The fourth reduce duplicated code.
> 
> Change since v1:
> Add more commit message.
> 
> Li Qiang (4):
>   vfio: pci: make "vfio-pci-nohotplug" as MACRO
>   hw: vfio: drop TYPE_FOO MACRO in VMStateDescription
>   vfio: platform: fix a typo
>   pci: msix: move 'MSIX_CAP_LENGTH' to header file

Series:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

