Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gtxKz-0008Qa-5c
	for mharc-qemu-trivial@gnu.org; Wed, 13 Feb 2019 11:24:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40862)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gtxKx-0008OS-4v
	for qemu-trivial@nongnu.org; Wed, 13 Feb 2019 11:24:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gtxKr-000232-VY
	for qemu-trivial@nongnu.org; Wed, 13 Feb 2019 11:24:37 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:35944)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gtxKf-0001pC-P0
	for qemu-trivial@nongnu.org; Wed, 13 Feb 2019 11:24:24 -0500
Received: by mail-wm1-f68.google.com with SMTP id j125so3090512wmj.1
	for <qemu-trivial@nongnu.org>; Wed, 13 Feb 2019 08:24:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=kaR3SBxKQ7aFSUOR/5ytaxCgi3OedtpRecogbKGc0HA=;
	b=aIXBy1Ryzhnj5Gu3E2wJ5zK9QsHvHJAXfcV+rzoWAt8FzRfiIF2N7AiyTMz6KZ971s
	cQgcUT9QXVCIkulwD9I6oRXua4DPBXh51EhsDhbWs7ZuthHV5eCQd3GxjNw8bEbBgK74
	mW3D4P2L+90LyVlycWK8gF7vu7jKqHLAknqy9HOZiuHODgH7TZ5obyb8RtmQhEnAk2dG
	ybrDNP2AdImn5CFENZAR+7pcqs+qwWh8vazAhFr8c7fWUMg7TmprUrZxR4eq0IQLN29y
	DtDViTox/LwqlW4LNilL7mY8xCBwtuYnZoNlhMuHuHqgCSCZgYrnJxcIWSgMzuXvyjVD
	J+Sg==
X-Gm-Message-State: AHQUAubIBKqT70+5bkQjAcYP1sRnWuHBdE8SUp6C0P252uKX3NuTX9IE
	hOcrKXwr5ir8wN4J4/vAiHPBiC5ZnCM=
X-Google-Smtp-Source: AHgI3IZSreEKFw+riOWC349EdMYJ8Fi5GmrwFTLIRmpFCtX35FgwrjbE8v6+m0QTviAdL9kXgMxfbg==
X-Received: by 2002:a1c:c303:: with SMTP id t3mr912183wmf.94.1550075054124;
	Wed, 13 Feb 2019 08:24:14 -0800 (PST)
Received: from [192.168.1.103] (10.red-83-35-153.dynamicip.rima-tde.net.
	[83.35.153.10]) by smtp.gmail.com with ESMTPSA id
	j124sm8028831wmb.48.2019.02.13.08.24.13
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Feb 2019 08:24:13 -0800 (PST)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
	=?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-trivial@nongnu.org
References: <1550073299-3647-1-git-send-email-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <1cbe8721-ea9e-f17f-f27d-910fece2858d@redhat.com>
Date: Wed, 13 Feb 2019 17:24:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <1550073299-3647-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.68
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] crypto: Fix LGPL
 information in the file headers
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
X-List-Received-Date: Wed, 13 Feb 2019 16:24:40 -0000

On 2/13/19 4:54 PM, Thomas Huth wrote:
> It's either "GNU *Library* General Public License version 2" or "GNU
> Lesser General Public License version *2.1*", but there was no "version
> 2.0" of the "Lesser" license. So assume that version 2.1 is meant here.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  crypto/block-luks.c           | 2 +-
>  crypto/block-luks.h           | 2 +-
>  crypto/block-qcow.c           | 2 +-
>  crypto/block-qcow.h           | 2 +-
>  crypto/block.c                | 2 +-
>  crypto/blockpriv.h            | 2 +-
>  crypto/cipher-builtin.c       | 2 +-
>  crypto/cipher-gcrypt.c        | 2 +-
>  crypto/cipher-nettle.c        | 2 +-
>  crypto/cipher.c               | 2 +-
>  crypto/hash-gcrypt.c          | 2 +-
>  crypto/hash-glib.c            | 2 +-
>  crypto/hash-nettle.c          | 2 +-
>  crypto/hash.c                 | 2 +-
>  crypto/init.c                 | 2 +-
>  crypto/ivgen-essiv.c          | 2 +-
>  crypto/ivgen-essiv.h          | 2 +-
>  crypto/ivgen-plain.c          | 2 +-
>  crypto/ivgen-plain.h          | 2 +-
>  crypto/ivgen-plain64.c        | 2 +-
>  crypto/ivgen-plain64.h        | 2 +-
>  crypto/ivgen.c                | 2 +-
>  crypto/ivgenpriv.h            | 2 +-
>  crypto/pbkdf-gcrypt.c         | 2 +-
>  crypto/pbkdf-nettle.c         | 2 +-
>  crypto/pbkdf-stub.c           | 2 +-
>  crypto/pbkdf.c                | 2 +-
>  crypto/random-gcrypt.c        | 2 +-
>  crypto/random-gnutls.c        | 2 +-
>  crypto/random-platform.c      | 2 +-
>  crypto/secret.c               | 2 +-
>  crypto/tlscreds.c             | 2 +-
>  crypto/tlscredsanon.c         | 2 +-
>  crypto/tlscredspriv.h         | 2 +-
>  crypto/tlscredspsk.c          | 2 +-
>  crypto/tlscredsx509.c         | 2 +-
>  crypto/tlssession.c           | 2 +-
>  crypto/xts.c                  | 2 +-
>  include/crypto/block.h        | 2 +-
>  include/crypto/cipher.h       | 2 +-
>  include/crypto/hash.h         | 2 +-
>  include/crypto/init.h         | 2 +-
>  include/crypto/ivgen.h        | 2 +-
>  include/crypto/pbkdf.h        | 2 +-
>  include/crypto/random.h       | 2 +-
>  include/crypto/secret.h       | 2 +-
>  include/crypto/tlscreds.h     | 2 +-
>  include/crypto/tlscredsanon.h | 2 +-
>  include/crypto/tlscredspsk.h  | 2 +-
>  include/crypto/tlscredsx509.h | 2 +-
>  include/crypto/tlssession.h   | 2 +-
>  include/crypto/xts.h          | 2 +-
>  52 files changed, 52 insertions(+), 52 deletions(-)

Still not convinced to use SPDX-License-Identifiers?

