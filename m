Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jEygI-0001F5-Mo
	for mharc-qemu-trivial@gnu.org; Thu, 19 Mar 2020 13:10:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58580)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jEygG-0001Ae-F1
 for qemu-trivial@nongnu.org; Thu, 19 Mar 2020 13:10:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jEygF-0002S1-EG
 for qemu-trivial@nongnu.org; Thu, 19 Mar 2020 13:10:04 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:38363)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jEygF-0002R3-An
 for qemu-trivial@nongnu.org; Thu, 19 Mar 2020 13:10:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584637803;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d0AD3md2JrKuoXzgHTQ6a6blYLaLqpMNpIstDJfJZ2A=;
 b=AY2DRdEhH0kXiwN8rBO0j3po0mJRnQmb6+foCZB1XuS+fCvdoMvKYAVrhRCtxwDvsy5Z7q
 NjmP7eFefURRnpzGgNCWk55oNIWmLr9bRgg/9vrKHHi2i76H5jilYziUDD9/dHaxEWDogo
 /UWkUgS7HHQvBVWKl1DpLbD1/zSIUss=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-482-bPE4cLU7PDKTo2sck2rwGQ-1; Thu, 19 Mar 2020 13:09:59 -0400
X-MC-Unique: bPE4cLU7PDKTo2sck2rwGQ-1
Received: by mail-ed1-f71.google.com with SMTP id i25so2548727edx.12
 for <qemu-trivial@nongnu.org>; Thu, 19 Mar 2020 10:09:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=itBaS7TTJpDr6mA42Crb/kFQ0RZRvY5MneNOmacld7U=;
 b=Zbkk4bbhlHuDmzOIDQzbTSqs6qiPPsAf2FDR7e19R/Ah1QdXKYaK8r4o+ogyUQEl+N
 jlkXbT/O6YitzJJDUNMMcb9B/N+ET6EDwrSh73SR7RmvjwnTJ4pQDht42Lx9rQYk4Fxk
 OyAWa5wgKlkuXp65TvCndVh4vLTs1+VmcAO4MlNYRzqbZT/HREE5JRVrwHFP2o1y0qL4
 BzzfhB7+yTrzxiRG/oOqAPOqK5m1wDfM4XAewFWBq2Kc7fSwSStn1SzELylR+DIvy8Yd
 mK9/x5A52oyc5+Wu2Aum+GpVLsbigb7kH4lolmw9ZGjf9plRpu4BZfg2+tRnhD9z6kb8
 HB+w==
X-Gm-Message-State: ANhLgQ1pOj20W0LApgAYA9cvfK2JHx6SkmwI/E/pzxOdNvLq7iaO9iik
 GuQWTQN8QVAtCKa9opRnDWFX8peC88+UoX5FArNSTn6d3ucD1USrk8ibWPC+6IiDDCa5dicVwV0
 WjAusxwoLyhb0hj3O1g==
X-Received: by 2002:a50:e041:: with SMTP id g1mr3920680edl.118.1584637797978; 
 Thu, 19 Mar 2020 10:09:57 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuv/w4KLaobmd1S8C+GPx3zHqyPigMMA31mYRDgoSwpWvdbRrxsCiHJ1QQBXg4J+2wjdU+UYQ==
X-Received: by 2002:a50:e041:: with SMTP id g1mr3920654edl.118.1584637797713; 
 Thu, 19 Mar 2020 10:09:57 -0700 (PDT)
Received: from [192.168.1.35] (37.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.37])
 by smtp.gmail.com with ESMTPSA id dj4sm2313edb.91.2020.03.19.10.09.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Mar 2020 10:09:56 -0700 (PDT)
Subject: Re: [PATCH v1] configure: record sphinx output
To: Olaf Hering <olaf@aepfle.de>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20200319143954.25694-1-olaf@aepfle.de>
Cc: Peter Maydell <peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <64f7658b-556d-6bbc-b486-487f3822f64d@redhat.com>
Date: Thu, 19 Mar 2020 18:09:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200319143954.25694-1-olaf@aepfle.de>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 63.128.21.74
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
X-List-Received-Date: Thu, 19 Mar 2020 17:10:05 -0000

On 3/19/20 3:39 PM, Olaf Hering wrote:
> If configure fails to run due to errors in the expected sphinx
> environment no helpful message is recorded. Write all of the output to
> config.log to assist with debugging.
>=20
> Signed-off-by: Olaf Hering <olaf@aepfle.de>
> ---
>   configure | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/configure b/configure
> index 12dbb0c76b..55086b0280 100755
> --- a/configure
> +++ b/configure
> @@ -4908,7 +4908,7 @@ has_sphinx_build() {
>       # sphinx-build doesn't exist at all or if it is too old.
>       mkdir -p "$TMPDIR1/sphinx"
>       touch "$TMPDIR1/sphinx/index.rst"
> -    "$sphinx_build" -c "$source_path/docs" -b html "$TMPDIR1/sphinx" "$T=
MPDIR1/sphinx/out" >/dev/null 2>&1
> +    "$sphinx_build" -c "$source_path/docs" -b html "$TMPDIR1/sphinx" "$T=
MPDIR1/sphinx/out" >> config.log 2>&1
>   }
>  =20
>   # Check if tools are available to build documentation.
>=20
Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>


