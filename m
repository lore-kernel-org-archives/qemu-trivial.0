Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iIWbn-00085B-Kg
	for mharc-qemu-trivial@gnu.org; Thu, 10 Oct 2019 07:27:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49339)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iIWbk-0007zn-Oz
 for qemu-trivial@nongnu.org; Thu, 10 Oct 2019 07:27:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iIWbj-0003fH-PB
 for qemu-trivial@nongnu.org; Thu, 10 Oct 2019 07:27:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58268)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iIWbj-0003es-Is
 for qemu-trivial@nongnu.org; Thu, 10 Oct 2019 07:27:47 -0400
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9E861121D
 for <qemu-trivial@nongnu.org>; Thu, 10 Oct 2019 11:27:46 +0000 (UTC)
Received: by mail-wr1-f71.google.com with SMTP id l12so2615414wrm.6
 for <qemu-trivial@nongnu.org>; Thu, 10 Oct 2019 04:27:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EVSp01GFizitQoFeA2vkC5QK0111TnbIGqgfspWggfo=;
 b=So0m787UDsW2DfG4I3xg0Nc89/s7gvarfpOSFbHZw1fgAbAG8jiyEbcF64WMBnZM3g
 gfo+DfjkNp+EcllS36drXQetKweXxN9YrxkArtAvlv4YqUF64O3U2oL6IjfO/PqbBqF+
 nNhvQXi6St+SR52oBK+DgGSguek+RB32QLWJHiT/vbMQcE3u1BC39kGW+8yRZs/cC+RY
 F0USgHcqiHeJNmxRYRoPUzxpUl+0t4pJqdP/Ya4IelF1gcmAAHsFPGjCYBsgoa1JpqsS
 ipIKTqXBRTMkv5XwCBMNII4vVngCdY+lsfiKc+uFVy/8a1QWVTTeaFbfWB1YoLE/jnYr
 x86g==
X-Gm-Message-State: APjAAAXU7XEjkC7t1NeeTGTsOSPTdm0OvwvrC7XJbE73rHsu0leQugQ1
 K537Go9c2+2Z6yDsTC7kxWnnOcxAa4DVc7GiUx8hUfSb6ADvGuJFLDhQk/LGd7DTxL6Rd89Lomt
 OPfAiBRxVnXbzPAsWdQ==
X-Received: by 2002:adf:fe8d:: with SMTP id l13mr8200065wrr.365.1570706865387; 
 Thu, 10 Oct 2019 04:27:45 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyXSSlogHBllkS+Hbg2Lphoz3Ms22KjTAN3aH95rRegy01YkQHwl/4AXdBNBwah+764eK4hYg==
X-Received: by 2002:adf:fe8d:: with SMTP id l13mr8200047wrr.365.1570706865222; 
 Thu, 10 Oct 2019 04:27:45 -0700 (PDT)
Received: from [192.168.1.35] (46.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.46])
 by smtp.gmail.com with ESMTPSA id 36sm8028973wrp.30.2019.10.10.04.27.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Oct 2019 04:27:44 -0700 (PDT)
Subject: Re: [PATCH v2 3/4] qemu-iotests: 044: pass is actually a noop, so
 remove it
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>
References: <20191009194740.8079-1-crosa@redhat.com>
 <20191009194740.8079-4-crosa@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d7a92123-569e-05be-c5d4-f24358e605eb@redhat.com>
Date: Thu, 10 Oct 2019 13:27:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20191009194740.8079-4-crosa@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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
X-List-Received-Date: Thu, 10 Oct 2019 11:27:50 -0000

On 10/9/19 9:47 PM, Cleber Rosa wrote:
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>   tests/qemu-iotests/044 | 3 ---
>   1 file changed, 3 deletions(-)
>=20
> diff --git a/tests/qemu-iotests/044 b/tests/qemu-iotests/044
> index 8b2afa2a11..aa2a00ceed 100755
> --- a/tests/qemu-iotests/044
> +++ b/tests/qemu-iotests/044
> @@ -102,17 +102,14 @@ class TestRefcountTableGrowth(iotests.QMPTestCase=
):
>       def setUp(self):
>           qemu_img('create', '-f', iotests.imgfmt, '-o', 'cluster_size=3D=
512', test_img, '16G')
>           self.preallocate(test_img)
> -        pass
>  =20
>  =20
>       def tearDown(self):
>           os.remove(test_img)
> -        pass
>  =20
>       def test_grow_refcount_table(self):
>           qemu_io('-c', 'write 3800M 1M', test_img)
>           qemu_img_verbose('check' , test_img)
> -        pass
>  =20
>   if __name__ =3D=3D '__main__':
>       iotests.main(supported_fmts=3D['qcow2'],
>=20

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

