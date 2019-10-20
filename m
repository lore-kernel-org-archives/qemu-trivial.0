Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iM64W-0008Ql-Mw
	for mharc-qemu-trivial@gnu.org; Sun, 20 Oct 2019 03:56:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53915)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1iM64T-0008OL-76
 for qemu-trivial@nongnu.org; Sun, 20 Oct 2019 03:56:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1iM64Q-0004dI-1b
 for qemu-trivial@nongnu.org; Sun, 20 Oct 2019 03:56:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37236)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1iM64P-0004by-Pb
 for qemu-trivial@nongnu.org; Sun, 20 Oct 2019 03:56:09 -0400
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7CCAD4E925
 for <qemu-trivial@nongnu.org>; Sun, 20 Oct 2019 07:56:07 +0000 (UTC)
Received: by mail-wr1-f69.google.com with SMTP id 4so1130604wrf.19
 for <qemu-trivial@nongnu.org>; Sun, 20 Oct 2019 00:56:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Kzn9xp5Ymr5oQ03MJbxPKi60njCDV3XzJWvh1m9afR0=;
 b=fXUjwbw/Z2BjIkDAISG/WhPz4YeDMdnvTrJGMdORyncAqyXNUjn/n8sekCP++H3CDI
 kMDbzJbpVbEl6kFTMFOU7jwBclrwPnhMacqqPVmX39PczhuvIweI9N4bdO+LQEFKoNCN
 4ECGE1dqEQAtfVGlG5ulCCOv9YX9H+jnoy7/CciXmG7oxLMTrPA5vjTkW4ki9wo2WmDn
 PV65TywdbiPKlHlcqob4YsrBIYEHvaONDB3Sdmv80W1OndBksJmatrR/5W/ejVPpbYNT
 OMrAmyeLhxynP/zIB8764/E9wkAEcWhYKlBt17LGSpBgPSmd/LY4qJQBkHF+8ZfU++4O
 k8NA==
X-Gm-Message-State: APjAAAXxUT+zFro5IhbZCFM88YGzCCuVO+vRbvK4Wgc9u5sJ8AAFbqax
 b6bQYjqyJgzLvPFdX9DU1XVHXJJdF6IX3k26sbgqGogJc9s+eDKjdjhH2ZDGXpCYbszBvPUa9Vu
 CvFpcRV1KI9v3ZDMsvA==
X-Received: by 2002:a5d:4dd2:: with SMTP id f18mr3582278wru.4.1571558166037;
 Sun, 20 Oct 2019 00:56:06 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyA/4jyUawARtVBR0DBCDg7UbWb30msmWHMQPHZXc8ptjINqNT25Rr2twnkwI1oAisqwtbtgQ==
X-Received: by 2002:a5d:4dd2:: with SMTP id f18mr3582246wru.4.1571558165679;
 Sun, 20 Oct 2019 00:56:05 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:3c27:92d2:4f4f:2b85?
 ([2001:b07:6468:f312:3c27:92d2:4f4f:2b85])
 by smtp.gmail.com with ESMTPSA id 79sm16877704wmb.7.2019.10.20.00.56.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 20 Oct 2019 00:56:05 -0700 (PDT)
Subject: Re: [PATCH 1/1] Updated Bulgarian translation (19) - 4.1.0
To: Alexander Shopov <ash@kambanaria.org>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Amos Kong <akong@redhat.com>,
 Anthony Liguori <aliguori@us.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Dongsheng Song <songdongsheng@live.cn>, Eric Blake <eblake@redhat.com>,
 Fam Zheng <famz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Pino Toscano <ptoscano@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Thomas Huth <thuth@redhat.com>,
 Wei Huang <wehuang@redhat.com>
References: <20191019120534.27479-1-ash@kambanaria.org>
 <20191019120534.27479-2-ash@kambanaria.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <a5871615-dd94-afb4-4936-9326c6ac35df@redhat.com>
Date: Sun, 20 Oct 2019 09:56:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191019120534.27479-2-ash@kambanaria.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
X-List-Received-Date: Sun, 20 Oct 2019 07:56:14 -0000

On 19/10/19 14:05, Alexander Shopov wrote:
> Signed-off-by: Alexander Shopov <ash@kambanaria.org>
> ---
>  po/bg.po | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/po/bg.po b/po/bg.po
> index 3d8c353372..98c57e5b22 100644
> --- a/po/bg.po
> +++ b/po/bg.po
> @@ -1,14 +1,14 @@
>  # Bulgarian translation of qemu po-file.
> -# Copyright (C) 2016 Alexander Shopov <ash@kambanaria.org>
> +# Copyright (C) 2016, 2019 Alexander Shopov <ash@kambanaria.org>
>  # This file is distributed under the same license as the qemu package.
> -# Alexander Shopov <ash@kambanaria.org>, 2016.
> +# Alexander Shopov <ash@kambanaria.org>, 2016, 2019.
>  #
>  msgid ""
>  msgstr ""
> -"Project-Id-Version: QEMU 2.6.50\n"
> +"Project-Id-Version: QEMU 4.1.0\n"
>  "Report-Msgid-Bugs-To: qemu-devel@nongnu.org\n"
>  "POT-Creation-Date: 2018-07-18 07:56+0200\n"
> -"PO-Revision-Date: 2016-06-09 15:54+0300\n"
> +"PO-Revision-Date: 2019-10-19 13:14+0200\n"
>  "Last-Translator: Alexander Shopov <ash@kambanaria.org>\n"
>  "Language-Team: Bulgarian <dict@ludost.net>\n"
>  "Language: bg\n"
> @@ -66,7 +66,7 @@ msgid "Detach Tab"
>  msgstr "=D0=9A=D1=8A=D0=BC =D1=81=D0=B0=D0=BC=D0=BE=D1=81=D1=82=D0=BE=D1=
=8F=D1=82=D0=B5=D0=BB=D0=B5=D0=BD =D0=BF=D0=BE=D0=B4=D0=BF=D1=80=D0=BE=D0=
=B7=D0=BE=D1=80=D0=B5=D1=86"
> =20
>  msgid "Show Menubar"
> -msgstr ""
> +msgstr "=D0=9B=D0=B5=D0=BD=D1=82=D0=B0 =D0=B7=D0=B0 =D0=BC=D0=B5=D0=BD=
=D1=8E=D1=82=D0=BE"
> =20
>  msgid "_Machine"
>  msgstr "_=D0=9C=D0=B0=D1=88=D0=B8=D0=BD=D0=B0"
>=20

Queued, thanks.

Paolo

