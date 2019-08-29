Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i3My6-0003Fj-5M
	for mharc-qemu-trivial@gnu.org; Thu, 29 Aug 2019 12:08:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36894)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1i3My2-0003AO-SO
 for qemu-trivial@nongnu.org; Thu, 29 Aug 2019 12:08:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1i3My0-0004ZL-TF
 for qemu-trivial@nongnu.org; Thu, 29 Aug 2019 12:08:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51371)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1i3My0-0004YN-Ol
 for qemu-trivial@nongnu.org; Thu, 29 Aug 2019 12:08:08 -0400
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id EED3E85542
 for <qemu-trivial@nongnu.org>; Thu, 29 Aug 2019 16:08:07 +0000 (UTC)
Received: by mail-wm1-f71.google.com with SMTP id 10so1398458wmi.8
 for <qemu-trivial@nongnu.org>; Thu, 29 Aug 2019 09:08:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7WP6VtFAxTtheR4ssGOO+dTmQnwcnAA/AlFcKxktReo=;
 b=c38xGq8un5HM9ZbWcjAQTIlWrZC4I6CAaZ1T3f1GgA68mxp2+j2Dln26XBePj0f9aB
 G8gTT683viwpix1o+7SJVOCwji6Fld8klHXkFDtDGPG3QUE9KGN1xeu/kIsx9TV/2ITt
 gxJKWvkw7HWHcLYowrPGkaMBjT+23zrdbTuIQtg2v0iCW+J+xtsGfdjWeDV8VReFQDkc
 Vk5Wekq+TxEXLmk28EpzQ3dszaCgws+zW2UfQDuRyTp2KoBZxgfMhpn93az6GeiiVIEy
 RFFNU4Fd5Typ7/C3rofocDoAF0H2WsDKsKd0n1POr5izbXU8XG6X7pM9NlsQIpuptcEk
 ml9Q==
X-Gm-Message-State: APjAAAXo/ro70iusQHaNp56s+3opZT5YMAS3va64BJSTeqHK5tZq+h4x
 iz0RNYXzvIUabdK/oD6McJNpY7VR7ArEcEvtdmmyA0MSxPzWaNMY02GcrFfaapMqaOG236twteF
 AHsjctR4XanvnDBwOVw==
X-Received: by 2002:a05:600c:2411:: with SMTP id
 17mr11605023wmp.171.1567094886301; 
 Thu, 29 Aug 2019 09:08:06 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzj3ouTb9A5JmFHFaUQ+WnX5zZAAH9DK32HQq4pKm92ouvlMAGSamfqUEOFzYDbgkknszD8Uw==
X-Received: by 2002:a05:600c:2411:: with SMTP id
 17mr11604990wmp.171.1567094886076; 
 Thu, 29 Aug 2019 09:08:06 -0700 (PDT)
Received: from [192.168.1.41] (251.red-88-10-102.dynamicip.rima-tde.net.
 [88.10.102.251])
 by smtp.gmail.com with ESMTPSA id t14sm3262446wrv.12.2019.08.29.09.08.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Aug 2019 09:08:05 -0700 (PDT)
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, QEMU Trivial <qemu-trivial@nongnu.org>
References: <20190829100521.12143-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <e198cc91-bb53-e817-1145-4a4d2ec822b0@redhat.com>
Date: Thu, 29 Aug 2019 18:08:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190829100521.12143-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH 0/2] git.orderfile: Order Python/shell
 scripts before unordered files
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
X-List-Received-Date: Thu, 29 Aug 2019 16:08:12 -0000

Oops Cc'ing qemu-trivial@nongnu.org

On 8/29/19 12:05 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> This series update the git.orderfile to order Python and shell
> scripts before unordered files.
> This is particularly useful for changes in tests/qemu-iotests.
>=20
> Regards,
>=20
> Phil.
>=20
> Philippe Mathieu-Daud=C3=A9 (2):
>   scripts/git.orderfile: Order Python files before unordered ones
>   scripts/git.orderfile: Order shell scripts before unordered files
>=20
>  scripts/git.orderfile | 5 +++++
>  1 file changed, 5 insertions(+)

