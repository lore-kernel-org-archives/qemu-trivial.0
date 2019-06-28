Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hgrsm-00051S-GJ
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jun 2019 10:29:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40871)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hgrsj-0004wf-3s
 for qemu-trivial@nongnu.org; Fri, 28 Jun 2019 10:29:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hgrsh-0007Jq-SL
 for qemu-trivial@nongnu.org; Fri, 28 Jun 2019 10:29:41 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:35939)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hgrsh-0007H2-I0
 for qemu-trivial@nongnu.org; Fri, 28 Jun 2019 10:29:39 -0400
Received: by mail-wm1-f68.google.com with SMTP id u8so9188745wmm.1
 for <qemu-trivial@nongnu.org>; Fri, 28 Jun 2019 07:29:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kzyDs37IHkXapkdFzVROwyva8sAh39D6I+iSdvtITHE=;
 b=I806pGfpgE2avL77sehFQtrDq6eBZJoCR7TyqkfqMiNtdPBuP2ovMRdkzBjjRrIX7d
 IDfMOsp9etp8EiuhLCqUYri0bAhBRP5RMTx5FDGgoEo7i3IjirBDb2O5avfUEeTEoa5E
 Sbs0Z5L7lwq43OMCf3AuXwdCbihH49YwGITDg64ChtCen9Aj2Vnn09Iq/THDKsK4TqRu
 c8Ja/xaKaPo1N+i1B7JfKS6pWhEPoAr6nYli57oRXm1nnwTVuIFGebjGLjB7ihGKVflm
 63kUYg1S+o21ADDkoWH6Lsnz6XTsEBQiP3DiT9ZxckmeGR37YcNz8TbQIvfdnn5/TWKo
 E2nQ==
X-Gm-Message-State: APjAAAUIbEOsceYZIaDZl4gpKY1n6QUI7iFKVeb4FrUGNj4eyoAxsDtF
 MlpMG56dwEU8oIYjaHjFbpN0/w==
X-Google-Smtp-Source: APXvYqzy+X3cX8o+7lOJXg84BtnZfQ53sSdApCH7vMn1fxSCNSxZGa/et8u/SL4Y7RTfL5ItyVxA9g==
X-Received: by 2002:a1c:f319:: with SMTP id q25mr7170520wmq.129.1561732176670; 
 Fri, 28 Jun 2019 07:29:36 -0700 (PDT)
Received: from [192.168.1.38] (183.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.183])
 by smtp.gmail.com with ESMTPSA id q12sm3935422wrp.50.2019.06.28.07.29.35
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Fri, 28 Jun 2019 07:29:36 -0700 (PDT)
To: Liam Merwick <liam.merwick@oracle.com>, qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org
References: <1561727317-30655-1-git-send-email-liam.merwick@oracle.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <bc12ed80-a2d2-d03e-2cf0-f066a214a344@redhat.com>
Date: Fri, 28 Jun 2019 16:29:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1561727317-30655-1-git-send-email-liam.merwick@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.68
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] docs/devel/testing: Fix
 typo in dockerfile path
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
X-List-Received-Date: Fri, 28 Jun 2019 14:29:43 -0000

On 6/28/19 3:08 PM, Liam Merwick wrote:
> Signed-off-by: Liam Merwick <liam.merwick@oracle.com>
> ---
>  docs/devel/testing.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
> index da2d0fc9646f..3ef50a61db4d 100644
> --- a/docs/devel/testing.rst
> +++ b/docs/devel/testing.rst
> @@ -327,7 +327,7 @@ Images
>  ------
>  
>  Along with many other images, the ``min-glib`` image is defined in a Dockerfile
> -in ``tests/docker/dockefiles/``, called ``min-glib.docker``. ``make docker``
> +in ``tests/docker/dockerfiles/``, called ``min-glib.docker``. ``make docker``
>  command will list all the available images.
>  
>  To add a new image, simply create a new ``.docker`` file under the
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

